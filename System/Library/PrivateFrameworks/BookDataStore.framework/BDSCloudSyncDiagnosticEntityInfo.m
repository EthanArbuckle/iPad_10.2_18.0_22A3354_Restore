@implementation BDSCloudSyncDiagnosticEntityInfo

- (BDSCloudSyncDiagnosticEntityInfo)initWithName:(id)a3 enabledSync:(BOOL)a4 dirtyCloudDataInfos:(id)a5
{
  id v9;
  id v10;
  BDSCloudSyncDiagnosticEntityInfo *v11;
  BDSCloudSyncDiagnosticEntityInfo *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BDSCloudSyncDiagnosticEntityInfo;
  v11 = -[BDSCloudSyncDiagnosticEntityInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_enabledSync = a4;
    objc_storeStrong((id *)&v12->_dirtyCloudDataInfos, a5);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isEqualToArray;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int isEqual;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;

  if (self != a3)
  {
    v4 = a3;
    objc_opt_class();
    BUDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    isEqualToArray = 0;
    if (!self || !v5)
      goto LABEL_15;
    objc_msgSend_name(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v5, v12, v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v11 == (void *)v16)
    {

    }
    else
    {
      v21 = (void *)v16;
      objc_msgSend_name(self, v17, v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v5, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v22, v28, (uint64_t)v27, v29, v30);

      if (!isEqual)
      {
LABEL_10:
        isEqualToArray = 0;
LABEL_15:

        return isEqualToArray;
      }
    }
    v36 = objc_msgSend_enabledSync(self, v32, v33, v34, v35);
    if (v36 == objc_msgSend_enabledSync(v5, v37, v38, v39, v40))
    {
      objc_msgSend_dirtyCloudDataInfos(self, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dirtyCloudDataInfos(v5, v46, v47, v48, v49);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45 == v54)
      {
        isEqualToArray = 1;
      }
      else
      {
        objc_msgSend_dirtyCloudDataInfos(self, v50, v51, v52, v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dirtyCloudDataInfos(v5, v56, v57, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToArray = objc_msgSend_isEqualToArray_(v55, v61, (uint64_t)v60, v62, v63);

      }
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCloudSyncDiagnosticEntityInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BDSCloudSyncDiagnosticEntityInfo *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *name;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *dirtyCloudDataInfos;

  v4 = a3;
  v9 = (BDSCloudSyncDiagnosticEntityInfo *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v9)
  {
    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("name"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    name = v9->_name;
    v9->_name = (NSString *)v13;

    v9->_enabledSync = objc_msgSend_decodeBoolForKey_(v4, v15, (uint64_t)CFSTR("enabledSync"), v16, v17);
    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend_setWithObjects_(v18, v21, v19, v22, v23, v20, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v25, (uint64_t)v24, (uint64_t)CFSTR("dirtyCloudDataInfos"), v26);
    v27 = objc_claimAutoreleasedReturnValue();
    dirtyCloudDataInfos = v9->_dirtyCloudDataInfos;
    v9->_dirtyCloudDataInfos = (NSArray *)v27;

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  id v25;

  v4 = a3;
  objc_msgSend_name(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("name"), v11);

  v16 = objc_msgSend_enabledSync(self, v12, v13, v14, v15);
  objc_msgSend_encodeBool_forKey_(v4, v17, v16, (uint64_t)CFSTR("enabledSync"), v18);
  objc_msgSend_dirtyCloudDataInfos(self, v19, v20, v21, v22);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v25, (uint64_t)CFSTR("dirtyCloudDataInfos"), v24);

}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BDSCloudSyncDiagnosticEntityInfo *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;

  v8 = objc_alloc_init(BDSCloudSyncDiagnosticEntityInfo);
  if (v8)
  {
    objc_msgSend_name(self, v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend_copy(v9, v10, v11, v12, v13);
    objc_msgSend_setName_(v8, v15, (uint64_t)v14, v16, v17);

    v22 = objc_msgSend_enabledSync(self, v18, v19, v20, v21);
    objc_msgSend_setEnabledSync_(v8, v23, v22, v24, v25);
    objc_msgSend_dirtyCloudDataInfos(self, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend_copy(v30, v31, v32, v33, v34);
    objc_msgSend_setDirtyCloudDataInfos_(v8, v36, (uint64_t)v35, v37, v38);

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend_name(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_enabledSync(self, v10, v11, v12, v13);
  objc_msgSend_dirtyCloudDataInfos(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v19, v20, v21, v22, v23);
  objc_msgSend_dirtyCloudDataInfos(self, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v30, (uint64_t)CFSTR("<%@: name:%@, enabledSync:%d, dirtyInfos(count=%lu):%@>"), v31, v32, v4, v9, v14, v24, v29);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (NSDictionary)stateForLog
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_name(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, (uint64_t)CFSTR("name"), v10);

  v11 = (void *)MEMORY[0x24BDD16E0];
  v16 = objc_msgSend_enabledSync(self, v12, v13, v14, v15);
  objc_msgSend_numberWithBool_(v11, v17, v16, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, (uint64_t)CFSTR("enabledSync"), v22);

  objc_msgSend_dirtyCloudDataInfos(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend_dirtyCloudDataInfos(self, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForKey_(v32, v33, (uint64_t)CFSTR("stateForLog"), v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v37, (uint64_t)v36, (uint64_t)CFSTR("dirtyCloudDataInfos"), v38);

  }
  return (NSDictionary *)v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)enabledSync
{
  return self->_enabledSync;
}

- (void)setEnabledSync:(BOOL)a3
{
  self->_enabledSync = a3;
}

- (NSArray)dirtyCloudDataInfos
{
  return self->_dirtyCloudDataInfos;
}

- (void)setDirtyCloudDataInfos:(id)a3
{
  objc_storeStrong((id *)&self->_dirtyCloudDataInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyCloudDataInfos, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
