@implementation BLDAAPDatabasesRequest

- (BLDAAPDatabasesRequest)initWithDSID:(id)a3 reason:(int64_t)a4 sessionID:(id)a5 revisionNumber:(id)a6 delta:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BLDAAPDatabasesRequest *v16;
  BLDAAPDatabasesRequest *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BLDAAPDatabasesRequest *v24;
  NSObject *v25;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  _QWORD v39[3];
  _QWORD v40[4];

  v40[3] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)BLDAAPDatabasesRequest;
  v16 = -[BLDAAPURLRequest initWithDSID:reason:](&v28, sel_initWithDSID_reason_, v12, a4);
  v17 = v16;
  if (!v16)
    goto LABEL_8;
  if (v12 && a4 && v13 && v14 && v15)
  {
    -[BLDAAPURLRequest setDaapURL:](v16, "setDaapURL:", CFSTR("databases"));
    -[BLDAAPURLRequest setContentType:](v17, "setContentType:", 1);
    -[BLDAAPDatabasesRequest setDelta:](v17, "setDelta:", v15);
    v18 = (void *)MEMORY[0x24BDBCF48];
    v39[0] = CFSTR("session-id");
    objc_msgSend(v13, "stringValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v27;
    v39[1] = CFSTR("revision-number");
    objc_msgSend(v14, "stringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v19;
    v39[2] = CFSTR("delta");
    objc_msgSend(v15, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bu_queryStringForDictionary:escapedValues:", v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dataUsingEncoding:", 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDAAPURLRequest setBody:](v17, "setBody:", v23);

LABEL_8:
    v24 = v17;
    goto LABEL_12;
  }
  BLJaliscoLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413314;
    v30 = v12;
    v31 = 2048;
    v32 = a4;
    v33 = 2114;
    v34 = v13;
    v35 = 2114;
    v36 = v14;
    v37 = 2114;
    v38 = v15;
    _os_log_impl(&dword_212C78000, v25, OS_LOG_TYPE_ERROR, "BLDAAPDatabasesRequest init failed: Missing a parameter type. dsid:(%@) reason:(%ld) sessionID: %{public}@ revisionNumber:%{public}@ delta:%{public}@", buf, 0x34u);
  }

  v24 = 0;
LABEL_12:

  return v24;
}

- (NSNumber)delta
{
  return self->_delta;
}

- (void)setDelta:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delta, 0);
}

@end
