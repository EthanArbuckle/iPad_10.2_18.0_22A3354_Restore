@implementation CKDContainerServerInfo

- (NSURL)publicShareServiceURL
{
  return self->_publicShareServiceURL;
}

- (NSURL)publicMetricsServiceURL
{
  return self->_publicMetricsServiceURL;
}

- (NSURL)publicDeviceServiceURL
{
  return self->_publicDeviceServiceURL;
}

- (NSURL)publicCodeServiceURL
{
  return self->_publicCodeServiceURL;
}

- (NSURL)publicCloudDBURL
{
  return self->_publicCloudDBURL;
}

- (int64_t)environment
{
  return self->_environment;
}

- (NSString)orgAdminUserID
{
  return self->_orgAdminUserID;
}

- (NSString)containerScopedUserID
{
  return self->_containerScopedUserID;
}

- (CKDContainerServerInfo)init
{
  CKDContainerServerInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDContainerServerInfo;
  result = -[CKDContainerServerInfo init](&v3, sel_init);
  if (result)
    result->_environment = -1;
  return result;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_publicCloudDBURL(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicShareServiceURL(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicDeviceServiceURL(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicCodeServiceURL(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicMetricsServiceURL(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerScopedUserID(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orgAdminUserID(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_environment(self, v24, v25);
  CKStringFromServerEnvironment();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v27, (uint64_t)CFSTR("publicCloudDBURL=%@, publicShareServiceURL=%@, publicDeviceServiceURL=%@, publicCodeServiceURL=%@, publicMetricsServiceURL=%@, containerScopedUserID=%@, orgAdminUserID=%@, environment=%@"), v5, v8, v11, v14, v17, v20, v23, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDContainerServerInfo *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (BOOL)isEqual:(id)a3
{
  CKDContainerServerInfo *v4;
  CKDContainerServerInfo *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  int v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  int v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  int v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  int v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  BOOL v60;

  v4 = (CKDContainerServerInfo *)a3;
  if (self == v4)
  {
    v60 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_publicCloudDBURL(self, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_publicCloudDBURL(v5, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CKObjectsAreBothNilOrEqual();

      if (!v12)
        goto LABEL_13;
      objc_msgSend_publicShareServiceURL(self, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_publicShareServiceURL(v5, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CKObjectsAreBothNilOrEqual();

      if (!v19)
        goto LABEL_13;
      objc_msgSend_publicDeviceServiceURL(self, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_publicDeviceServiceURL(v5, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CKObjectsAreBothNilOrEqual();

      if (!v26)
        goto LABEL_13;
      objc_msgSend_publicCodeServiceURL(self, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_publicCodeServiceURL(v5, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CKObjectsAreBothNilOrEqual();

      if (!v33)
        goto LABEL_13;
      objc_msgSend_publicMetricsServiceURL(self, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_publicMetricsServiceURL(v5, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CKObjectsAreBothNilOrEqual();

      if (!v40)
        goto LABEL_13;
      objc_msgSend_containerScopedUserID(self, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerScopedUserID(v5, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CKObjectsAreBothNilOrEqual();

      if (!v47)
        goto LABEL_13;
      objc_msgSend_orgAdminUserID(self, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_orgAdminUserID(v5, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = CKObjectsAreBothNilOrEqual();

      if (v54)
      {
        v57 = objc_msgSend_environment(self, v55, v56);
        v60 = v57 == objc_msgSend_environment(v5, v58, v59);
      }
      else
      {
LABEL_13:
        v60 = 0;
      }

    }
    else
    {
      v60 = 0;
    }
  }

  return v60;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  unint64_t v46;

  objc_msgSend_publicCloudDBURL(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);
  objc_msgSend_publicShareServiceURL(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;
  objc_msgSend_publicDeviceServiceURL(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_hash(v16, v17, v18);
  objc_msgSend_publicCodeServiceURL(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v13 ^ v19 ^ objc_msgSend_hash(v22, v23, v24);
  objc_msgSend_publicMetricsServiceURL(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_hash(v28, v29, v30);
  objc_msgSend_containerScopedUserID(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v31 ^ objc_msgSend_hash(v34, v35, v36);
  objc_msgSend_orgAdminUserID(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v25 ^ v37 ^ objc_msgSend_hash(v40, v41, v42);
  v46 = v43 ^ objc_msgSend_environment(self, v44, v45);

  return v46;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_publicCloudDBURL(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_copy(v7, v8, v9);
  v11 = (void *)v4[1];
  v4[1] = v10;

  objc_msgSend_publicShareServiceURL(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_copy(v14, v15, v16);
  v18 = (void *)v4[2];
  v4[2] = v17;

  objc_msgSend_publicDeviceServiceURL(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_copy(v21, v22, v23);
  v25 = (void *)v4[3];
  v4[3] = v24;

  objc_msgSend_publicCodeServiceURL(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_copy(v28, v29, v30);
  v32 = (void *)v4[4];
  v4[4] = v31;

  objc_msgSend_publicMetricsServiceURL(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_copy(v35, v36, v37);
  v39 = (void *)v4[5];
  v4[5] = v38;

  objc_msgSend_containerScopedUserID(self, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend_copy(v42, v43, v44);
  v46 = (void *)v4[6];
  v4[6] = v45;

  objc_msgSend_orgAdminUserID(self, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_copy(v49, v50, v51);
  v53 = (void *)v4[7];
  v4[7] = v52;

  v4[8] = objc_msgSend_environment(self, v54, v55);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDContainerServerInfo)initWithCoder:(id)a3
{
  id v4;
  CKDContainerServerInfo *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSURL *publicCloudDBURL;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSURL *publicShareServiceURL;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSURL *publicDeviceServiceURL;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSURL *publicCodeServiceURL;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSURL *publicMetricsServiceURL;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSString *containerScopedUserID;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  NSString *orgAdminUserID;
  const char *v35;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CKDContainerServerInfo;
  v5 = -[CKDContainerServerInfo init](&v37, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1C3B83E24]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("PublicCloudDBURL"));
    v9 = objc_claimAutoreleasedReturnValue();
    publicCloudDBURL = v5->_publicCloudDBURL;
    v5->_publicCloudDBURL = (NSURL *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, CFSTR("PublicShareServiceURL"));
    v13 = objc_claimAutoreleasedReturnValue();
    publicShareServiceURL = v5->_publicShareServiceURL;
    v5->_publicShareServiceURL = (NSURL *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, CFSTR("PublicDeviceServiceURL"));
    v17 = objc_claimAutoreleasedReturnValue();
    publicDeviceServiceURL = v5->_publicDeviceServiceURL;
    v5->_publicDeviceServiceURL = (NSURL *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, CFSTR("PublicCodeServiceURL"));
    v21 = objc_claimAutoreleasedReturnValue();
    publicCodeServiceURL = v5->_publicCodeServiceURL;
    v5->_publicCodeServiceURL = (NSURL *)v21;

    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, CFSTR("PublicMetricsServiceURL"));
    v25 = objc_claimAutoreleasedReturnValue();
    publicMetricsServiceURL = v5->_publicMetricsServiceURL;
    v5->_publicMetricsServiceURL = (NSURL *)v25;

    v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, CFSTR("ContainerScopedUserID"));
    v29 = objc_claimAutoreleasedReturnValue();
    containerScopedUserID = v5->_containerScopedUserID;
    v5->_containerScopedUserID = (NSString *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, CFSTR("OrgAdminUserID"));
    v33 = objc_claimAutoreleasedReturnValue();
    orgAdminUserID = v5->_orgAdminUserID;
    v5->_orgAdminUserID = (NSString *)v33;

    v5->_environment = objc_msgSend_decodeIntegerForKey_(v4, v35, (uint64_t)CFSTR("Environment"));
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  id v37;

  v37 = a3;
  v4 = (void *)MEMORY[0x1C3B83E24]();
  objc_msgSend_publicCloudDBURL(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v8, (uint64_t)v7, CFSTR("PublicCloudDBURL"));

  objc_msgSend_publicShareServiceURL(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v12, (uint64_t)v11, CFSTR("PublicShareServiceURL"));

  objc_msgSend_publicDeviceServiceURL(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v16, (uint64_t)v15, CFSTR("PublicDeviceServiceURL"));

  objc_msgSend_publicCodeServiceURL(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v20, (uint64_t)v19, CFSTR("PublicCodeServiceURL"));

  objc_msgSend_publicMetricsServiceURL(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v24, (uint64_t)v23, CFSTR("PublicMetricsServiceURL"));

  objc_msgSend_containerScopedUserID(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v28, (uint64_t)v27, CFSTR("ContainerScopedUserID"));

  objc_msgSend_orgAdminUserID(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v32, (uint64_t)v31, CFSTR("OrgAdminUserID"));

  v35 = objc_msgSend_environment(self, v33, v34);
  objc_msgSend_encodeInteger_forKey_(v37, v36, v35, CFSTR("Environment"));
  objc_autoreleasePoolPop(v4);

}

- (void)setPublicCloudDBURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setPublicShareServiceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setPublicDeviceServiceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setPublicCodeServiceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setPublicMetricsServiceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setContainerScopedUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setOrgAdminUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setEnvironment:(int64_t)a3
{
  self->_environment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orgAdminUserID, 0);
  objc_storeStrong((id *)&self->_containerScopedUserID, 0);
  objc_storeStrong((id *)&self->_publicMetricsServiceURL, 0);
  objc_storeStrong((id *)&self->_publicCodeServiceURL, 0);
  objc_storeStrong((id *)&self->_publicDeviceServiceURL, 0);
  objc_storeStrong((id *)&self->_publicShareServiceURL, 0);
  objc_storeStrong((id *)&self->_publicCloudDBURL, 0);
}

@end
