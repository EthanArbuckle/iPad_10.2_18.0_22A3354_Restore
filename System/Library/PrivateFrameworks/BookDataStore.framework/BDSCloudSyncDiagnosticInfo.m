@implementation BDSCloudSyncDiagnosticInfo

- (BDSCloudSyncDiagnosticInfo)initWithEnabledSync:(BOOL)a3 accountStatus:(int64_t)a4 container:(id)a5 gettingAccountInfo:(BOOL)a6 privateDatabaseInfo:(id)a7 privateDatabaseSyncEngineInfo:(id)a8 entityInfos:(id)a9
{
  id v15;
  id v16;
  id v17;
  BDSCloudSyncDiagnosticInfo *v18;
  BDSCloudSyncDiagnosticInfo *v19;
  id v22;
  objc_super v23;

  v22 = a5;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)BDSCloudSyncDiagnosticInfo;
  v18 = -[BDSCloudSyncDiagnosticInfo init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_enabledSync = a3;
    v18->_accountStatus = a4;
    objc_storeStrong((id *)&v18->_container, a5);
    v19->_gettingAccountInfo = a6;
    objc_storeStrong((id *)&v19->_privateDatabaseInfo, a7);
    objc_storeStrong((id *)&v19->_privateDatabaseSyncEngineInfo, a8);
    objc_storeStrong((id *)&v19->_entityInfos, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCloudSyncDiagnosticInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  BDSCloudSyncDiagnosticInfo *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *container;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  BDSCloudSyncDiagnosticDatabaseInfo *privateDatabaseInfo;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  BDSCloudSyncDiagnosticSyncEngineInfo *privateDatabaseSyncEngineInfo;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSArray *entityInfos;

  v4 = a3;
  v12 = (BDSCloudSyncDiagnosticInfo *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v12)
  {
    v12->_enabledSync = objc_msgSend_decodeBoolForKey_(v4, v9, (uint64_t)CFSTR("enabledSync"), v10, v11);
    v12->_accountStatus = objc_msgSend_decodeIntegerForKey_(v4, v13, (uint64_t)CFSTR("accountStatus"), v14, v15);
    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("container"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    container = v12->_container;
    v12->_container = (NSString *)v19;

    v12->_gettingAccountInfo = objc_msgSend_decodeBoolForKey_(v4, v21, (uint64_t)CFSTR("gettingAccountInfo"), v22, v23);
    v24 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, (uint64_t)CFSTR("privateDatabaseInfo"), v26);
    v27 = objc_claimAutoreleasedReturnValue();
    privateDatabaseInfo = v12->_privateDatabaseInfo;
    v12->_privateDatabaseInfo = (BDSCloudSyncDiagnosticDatabaseInfo *)v27;

    v29 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, (uint64_t)CFSTR("privateDatabaseSyncEngineInfo"), v31);
    v32 = objc_claimAutoreleasedReturnValue();
    privateDatabaseSyncEngineInfo = v12->_privateDatabaseSyncEngineInfo;
    v12->_privateDatabaseSyncEngineInfo = (BDSCloudSyncDiagnosticSyncEngineInfo *)v32;

    v34 = (void *)MEMORY[0x24BDBCF20];
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    objc_msgSend_setWithObjects_(v34, v37, v35, v38, v39, v36, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v41, (uint64_t)v40, (uint64_t)CFSTR("entityInfos"), v42);
    v43 = objc_claimAutoreleasedReturnValue();
    entityInfos = v12->_entityInfos;
    v12->_entityInfos = (NSArray *)v43;

  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  id v53;

  v4 = a3;
  v9 = objc_msgSend_enabledSync(self, v5, v6, v7, v8);
  objc_msgSend_encodeBool_forKey_(v4, v10, v9, (uint64_t)CFSTR("enabledSync"), v11);
  v16 = objc_msgSend_accountStatus(self, v12, v13, v14, v15);
  objc_msgSend_encodeInteger_forKey_(v4, v17, v16, (uint64_t)CFSTR("accountStatus"), v18);
  objc_msgSend_container(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("container"), v25);

  v30 = objc_msgSend_gettingAccountInfo(self, v26, v27, v28, v29);
  objc_msgSend_encodeBool_forKey_(v4, v31, v30, (uint64_t)CFSTR("gettingAccountInfo"), v32);
  objc_msgSend_privateDatabaseInfo(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, (uint64_t)CFSTR("privateDatabaseInfo"), v39);

  objc_msgSend_privateDatabaseSyncEngineInfo(self, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, (uint64_t)CFSTR("privateDatabaseSyncEngineInfo"), v46);

  objc_msgSend_entityInfos(self, v47, v48, v49, v50);
  v53 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v51, (uint64_t)v53, (uint64_t)CFSTR("entityInfos"), v52);

}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BDSCloudSyncDiagnosticInfo *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;

  v8 = objc_alloc_init(BDSCloudSyncDiagnosticInfo);
  if (v8)
  {
    v9 = objc_msgSend_enabledSync(self, v4, v5, v6, v7);
    objc_msgSend_setEnabledSync_(v8, v10, v9, v11, v12);
    v17 = objc_msgSend_accountStatus(self, v13, v14, v15, v16);
    objc_msgSend_setAccountStatus_(v8, v18, v17, v19, v20);
    objc_msgSend_container(self, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainer_(v8, v26, (uint64_t)v25, v27, v28);

    v33 = objc_msgSend_gettingAccountInfo(self, v29, v30, v31, v32);
    objc_msgSend_setGettingAccountInfo_(v8, v34, v33, v35, v36);
    objc_msgSend_privateDatabaseInfo(self, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend_copy(v41, v42, v43, v44, v45);
    objc_msgSend_setPrivateDatabaseInfo_(v8, v47, (uint64_t)v46, v48, v49);

    objc_msgSend_privateDatabaseSyncEngineInfo(self, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend_copy(v54, v55, v56, v57, v58);
    objc_msgSend_setPrivateDatabaseSyncEngineInfo_(v8, v60, (uint64_t)v59, v61, v62);

    objc_msgSend_entityInfos(self, v63, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)objc_msgSend_copy(v67, v68, v69, v70, v71);
    objc_msgSend_setEntityInfos_(v8, v73, (uint64_t)v72, v74, v75);

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
  unsigned int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v9 = objc_msgSend_enabledSync(self, v5, v6, v7, v8);
  v14 = objc_msgSend_accountStatus(self, v10, v11, v12, v13);
  objc_msgSend_container(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_gettingAccountInfo(self, v20, v21, v22, v23);
  objc_msgSend_privateDatabaseInfo(self, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateDatabaseSyncEngineInfo(self, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entityInfos(self, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v40, (uint64_t)CFSTR("<%@: enabledSync:%d, accountStatus:%ld, container:%@, gettingAccountInfo:%d, privateDatabase:%@, privateDatabaseSyncEngine:%@, entities:%@>"), v41, v42, v4, v9, v14, v19, v24, v29, v34, v39);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (NSDictionary)stateForLog
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend_enabledSync(self, v5, v6, v7, v8);
  objc_msgSend_numberWithBool_(v4, v10, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("enabledSync"), v15);

  v16 = (void *)MEMORY[0x24BDD16E0];
  v21 = objc_msgSend_accountStatus(self, v17, v18, v19, v20);
  objc_msgSend_numberWithInteger_(v16, v22, v21, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v26, (uint64_t)v25, (uint64_t)CFSTR("accountStatus"), v27);

  objc_msgSend_container(self, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v32, (uint64_t)CFSTR("container"), v34);

  v35 = (void *)MEMORY[0x24BDD16E0];
  v40 = objc_msgSend_gettingAccountInfo(self, v36, v37, v38, v39);
  objc_msgSend_numberWithBool_(v35, v41, v40, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v45, (uint64_t)v44, (uint64_t)CFSTR("gettingAccountInfo"), v46);

  objc_msgSend_privateDatabaseInfo(self, v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stateForLog(v51, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v57, (uint64_t)v56, (uint64_t)CFSTR("privateDatabaseInfo"), v58);

  objc_msgSend_privateDatabaseSyncEngineInfo(self, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stateForLog(v63, v64, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v69, (uint64_t)v68, (uint64_t)CFSTR("privateDatabaseSyncEngineInfo"), v70);

  objc_msgSend_entityInfos(self, v71, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    objc_msgSend_entityInfos(self, v76, v77, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForKey_(v80, v81, (uint64_t)CFSTR("stateForLog"), v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v85, (uint64_t)v84, (uint64_t)CFSTR("entityInfos"), v86);

  }
  return (NSDictionary *)v3;
}

- (BOOL)enabledSync
{
  return self->_enabledSync;
}

- (void)setEnabledSync:(BOOL)a3
{
  self->_enabledSync = a3;
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)gettingAccountInfo
{
  return self->_gettingAccountInfo;
}

- (void)setGettingAccountInfo:(BOOL)a3
{
  self->_gettingAccountInfo = a3;
}

- (BDSCloudSyncDiagnosticDatabaseInfo)privateDatabaseInfo
{
  return self->_privateDatabaseInfo;
}

- (void)setPrivateDatabaseInfo:(id)a3
{
  objc_storeStrong((id *)&self->_privateDatabaseInfo, a3);
}

- (BDSCloudSyncDiagnosticSyncEngineInfo)privateDatabaseSyncEngineInfo
{
  return self->_privateDatabaseSyncEngineInfo;
}

- (void)setPrivateDatabaseSyncEngineInfo:(id)a3
{
  objc_storeStrong((id *)&self->_privateDatabaseSyncEngineInfo, a3);
}

- (NSArray)entityInfos
{
  return self->_entityInfos;
}

- (void)setEntityInfos:(id)a3
{
  objc_storeStrong((id *)&self->_entityInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityInfos, 0);
  objc_storeStrong((id *)&self->_privateDatabaseSyncEngineInfo, 0);
  objc_storeStrong((id *)&self->_privateDatabaseInfo, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
