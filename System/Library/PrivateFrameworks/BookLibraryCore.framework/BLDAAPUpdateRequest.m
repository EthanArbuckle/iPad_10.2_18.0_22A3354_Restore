@implementation BLDAAPUpdateRequest

- (BLDAAPUpdateRequest)initWithDSID:(id)a3 reason:(int64_t)a4 sessionID:(id)a5 localVersion:(id)a6
{
  id v10;
  id v11;
  BLDAAPUpdateRequest *v12;
  BLDAAPUpdateRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BLDAAPUpdateRequest;
  v12 = -[BLDAAPURLRequest initWithDSID:reason:](&v20, sel_initWithDSID_reason_, a3, a4);
  v13 = v12;
  if (v12)
  {
    -[BLDAAPURLRequest setDaapURL:](v12, "setDaapURL:", CFSTR("update"));
    v14 = (void *)MEMORY[0x24BDBCF48];
    v21[0] = CFSTR("session-id");
    objc_msgSend(v10, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = CFSTR("revision-number");
    v22[0] = v15;
    v22[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bu_queryStringForDictionary:escapedValues:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataUsingEncoding:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDAAPURLRequest setBody:](v13, "setBody:", v18);

  }
  return v13;
}

@end
