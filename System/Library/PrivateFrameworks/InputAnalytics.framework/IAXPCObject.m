@implementation IAXPCObject

- (IAXPCObject)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  IAXPCObject *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)IAXPCObject;
  v6 = -[IAXPCObject init](&v25, sel_init);
  if (v6)
  {
    objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundleIdentifier(v7, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAppBundleId_(v6, v13, (uint64_t)v12, v14, v15);

    objc_msgSend_now(MEMORY[0x24BDBCE60], v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTimestamp_(v6, v21, (uint64_t)v20, v22, v23);

  }
  return v6;
}

- (IAXPCObject)initWithTimestamp:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  IAXPCObject *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IAXPCObject;
  v9 = -[IAXPCObject init](&v23, sel_init);
  if (v9)
  {
    objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundleIdentifier(v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAppBundleId_(v9, v16, (uint64_t)v15, v17, v18);

    objc_msgSend_setTimestamp_(v9, v19, (uint64_t)v4, v20, v21);
  }

  return v9;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_textInputSessionId(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appSessionId(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appBundleId(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(self->timestamp, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v23, (uint64_t)CFSTR("textInputSessionId='%@', appSessionId='%@', appBundleId='%@', timestamp='%@'"), v24, v25, v7, v12, v17, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v26;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char isEqual;
  char v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
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
  char v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  char v83;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;
    objc_msgSend_textInputSessionId(self, v10, v11, v12, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18
      || (objc_msgSend_textInputSessionId(v9, v14, v15, v16, v17),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_textInputSessionId(self, v14, v15, v16, v17);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_textInputSessionId(v9, v19, v20, v21, v22);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v4, v23, (uint64_t)v5, v24, v25);

      if (v18)
      {
LABEL_12:

        objc_msgSend_appSessionId(self, v28, v29, v30, v31);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36
          || (objc_msgSend_appSessionId(v9, v32, v33, v34, v35),
              (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend_appSessionId(self, v32, v33, v34, v35);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appSessionId(v9, v37, v38, v39, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend_isEqual_(v5, v42, (uint64_t)v41, v43, v44);

          if (v36)
          {
LABEL_18:

            objc_msgSend_appBundleId(self, v46, v47, v48, v49);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (v54
              || (objc_msgSend_appBundleId(v9, v50, v51, v52, v53),
                  (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              objc_msgSend_appBundleId(self, v50, v51, v52, v53);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_appBundleId(v9, v56, v57, v58, v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = objc_msgSend_isEqual_(v55, v61, (uint64_t)v60, v62, v63);

              if (v54)
              {
LABEL_24:

                objc_msgSend_timestamp(self, v65, v66, v67, v68);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                if (v73
                  || (objc_msgSend_timestamp(v9, v69, v70, v71, v72),
                      (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                {
                  objc_msgSend_timestamp(self, v69, v70, v71, v72);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_timestamp(v9, v75, v76, v77, v78);
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  v83 = objc_msgSend_isEqual_(v74, v80, (uint64_t)v79, v81, v82);

                  if (v73)
                  {
LABEL_30:

                    v27 = isEqual & v45 & v64 & v83;
                    goto LABEL_31;
                  }
                }
                else
                {
                  v83 = 1;
                }

                goto LABEL_30;
              }
            }
            else
            {
              v64 = 1;
            }

            goto LABEL_24;
          }
        }
        else
        {
          v45 = 1;
        }

        goto LABEL_18;
      }
    }
    else
    {
      isEqual = 1;
    }

    goto LABEL_12;
  }
  v27 = 0;
LABEL_31:

  return v27;
}

- (IAXPCObject)initWithCoder:(id)a3
{
  id v4;
  IAXPCObject *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSUUID *textInputSessionId;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSUUID *appSessionId;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *appBundleId;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSDate *timestamp;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)IAXPCObject;
  v5 = -[IAXPCObject init](&v27, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("textInputSessionId"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    textInputSessionId = v5->textInputSessionId;
    v5->textInputSessionId = (NSUUID *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("appSessionId"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    appSessionId = v5->appSessionId;
    v5->appSessionId = (NSUUID *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("appBundleId"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    appBundleId = v5->appBundleId;
    v5->appBundleId = (NSString *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("timestamp"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->timestamp;
    v5->timestamp = (NSDate *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *textInputSessionId;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  textInputSessionId = self->textInputSessionId;
  v13 = a3;
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)textInputSessionId, (uint64_t)CFSTR("textInputSessionId"), v6);
  objc_msgSend_encodeObject_forKey_(v13, v7, (uint64_t)self->appSessionId, (uint64_t)CFSTR("appSessionId"), v8);
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)self->appBundleId, (uint64_t)CFSTR("appBundleId"), v10);
  objc_msgSend_encodeObject_forKey_(v13, v11, (uint64_t)self->timestamp, (uint64_t)CFSTR("timestamp"), v12);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)appBundleId
{
  return self->appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->appBundleId, a3);
}

- (NSUUID)appSessionId
{
  return self->appSessionId;
}

- (void)setAppSessionId:(id)a3
{
  objc_storeStrong((id *)&self->appSessionId, a3);
}

- (NSUUID)textInputSessionId
{
  return self->textInputSessionId;
}

- (void)setTextInputSessionId:(id)a3
{
  objc_storeStrong((id *)&self->textInputSessionId, a3);
}

- (NSDate)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->timestamp, 0);
  objc_storeStrong((id *)&self->textInputSessionId, 0);
  objc_storeStrong((id *)&self->appSessionId, 0);
  objc_storeStrong((id *)&self->appBundleId, 0);
}

@end
