@implementation IDSRegisteredDevice

+ (id)registeredDeviceFromDependentRegistrationDictionary:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  const char *v14;
  double v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  const char *v28;
  void *v29;
  const char *v30;
  double v31;
  uint64_t v32;
  const char *v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  id v40;
  IDSURI *v41;
  const char *v42;
  double v43;
  const char *v44;
  void *v45;
  double v46;
  IDSRegisteredDevice *v47;
  void *v48;
  const char *v49;
  double v50;
  id v52;
  id v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("device-name"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend_objectForKeyedSubscript_(v3, v9, (uint64_t)CFSTR("hardware-version"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v16 = 0;
  if (v8)
    v17 = v13 == 0;
  else
    v17 = 1;
  if (!v17)
  {
    v54 = (uint64_t)v8;
    objc_msgSend_objectForKeyedSubscript_(v3, v14, (uint64_t)CFSTR("push-token"), v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v53 = v19;

    objc_msgSend_objectForKeyedSubscript_(v3, v20, (uint64_t)CFSTR("client-data"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)CFSTR("public-message-identity-key"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v52 = v26;

    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend_objectForKeyedSubscript_(v3, v28, (uint64_t)CFSTR("identities"), 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v55, v31, v59, 16);
    if (v32)
    {
      v35 = v32;
      v36 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v56 != v36)
            objc_enumerationMutation(v29);
          objc_msgSend_objectForKeyedSubscript_(*(void **)(*((_QWORD *)&v55 + 1) + 8 * i), v33, (uint64_t)CFSTR("uri"), v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v39 = v38;
          else
            v39 = 0;
          v40 = v39;

          if (v40)
          {
            v41 = [IDSURI alloc];
            v45 = (void *)objc_msgSend_initWithPrefixedURI_(v41, v42, (uint64_t)v40, v43);
            if (v45)
              objc_msgSend_addObject_(v27, v44, (uint64_t)v45, v46);

          }
        }
        v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v33, (uint64_t)&v55, v34, v59, 16);
      }
      while (v35);
    }

    v8 = (id)v54;
    if (v53)
    {
      v47 = [IDSRegisteredDevice alloc];
      v48 = v52;
      v16 = (void *)objc_msgSend_initWithName_hardwareVersion_pushToken_URIs_publicDeviceIdentity_(v47, v49, v54, v50, v13, v53, v27, v52);
    }
    else
    {
      v16 = 0;
      v48 = v52;
    }

  }
  return v16;
}

- (IDSRegisteredDevice)initWithName:(id)a3 hardwareVersion:(id)a4 pushToken:(id)a5 URIs:(id)a6 publicDeviceIdentity:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  IDSRegisteredDevice *v19;
  double v20;
  uint64_t v21;
  NSString *name;
  const char *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  NSString *hardwareVersion;
  const char *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  NSData *pushToken;
  const char *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  NSArray *URIs;
  const char *v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  NSData *publicDeviceIdentity;
  objc_super v44;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)IDSRegisteredDevice;
  v19 = -[IDSRegisteredDevice init](&v44, sel_init);
  if (v19)
  {
    v21 = objc_msgSend_copy(v12, v17, v18, v20);
    name = v19->_name;
    v19->_name = (NSString *)v21;

    v26 = objc_msgSend_copy(v13, v23, v24, v25);
    hardwareVersion = v19->_hardwareVersion;
    v19->_hardwareVersion = (NSString *)v26;

    v31 = objc_msgSend_copy(v14, v28, v29, v30);
    pushToken = v19->_pushToken;
    v19->_pushToken = (NSData *)v31;

    v36 = objc_msgSend_copy(v15, v33, v34, v35);
    URIs = v19->_URIs;
    v19->_URIs = (NSArray *)v36;

    v41 = objc_msgSend_copy(v16, v38, v39, v40);
    publicDeviceIdentity = v19->_publicDeviceIdentity;
    v19->_publicDeviceIdentity = (NSData *)v41;

  }
  return v19;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_name(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hardwareVersion(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pushToken(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicDeviceIdentity(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicDeviceIdentity(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionForData_options_(IDSLogFormatter, v25, (uint64_t)v24, v26, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v28, (uint64_t)CFSTR("<%@: %p name: %@, hardwareVersion: %@, pushToken: %@, identities: %@, publicKey: %@>"), v29, v4, self, v8, v12, v16, v20, v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  IDSRegisteredDevice *v4;
  const char *v5;
  double v6;
  char isEqualToRegisteredDevice;

  v4 = (IDSRegisteredDevice *)a3;
  if (self == v4)
  {
    isEqualToRegisteredDevice = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      isEqualToRegisteredDevice = objc_msgSend_isEqualToRegisteredDevice_(self, v5, (uint64_t)v4, v6);
    else
      isEqualToRegisteredDevice = 0;
  }

  return isEqualToRegisteredDevice;
}

- (BOOL)isEqualToRegisteredDevice:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  IDSRegisteredDevice *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  IDSRegisteredDevice *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  const char *v24;
  double v25;
  char isEqual;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  const char *v38;
  double v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  double v43;
  const char *v44;
  uint64_t v45;
  double v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  const char *v51;
  double v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  double v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  double v60;
  const char *v61;
  uint64_t v62;
  double v63;
  const char *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  double v75;
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  double v80;
  void *v81;
  void *v82;
  const char *v83;
  double v84;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;

  v7 = (IDSRegisteredDevice *)a3;
  v11 = v7;
  if (self == v7)
  {
    isEqual = 1;
  }
  else
  {
    if (v7)
    {
      objc_msgSend_name(self, v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v11, v13, v14, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 != v18)
      {
        objc_msgSend_name(self, v16, v17, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v11, v21, v22, v23);
        v96 = v20;
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v20, v24, (uint64_t)v97, v25))
        {
          isEqual = 0;
          goto LABEL_31;
        }
      }
      objc_msgSend_hardwareVersion(self, v16, v17, v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_hardwareVersion(v11, v28, v29, v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27 != v33)
      {
        objc_msgSend_hardwareVersion(self, v31, v32, v34);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_hardwareVersion(v11, v35, v36, v37);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v5, v38, (uint64_t)v3, v39))
        {
          isEqual = 0;
LABEL_29:

LABEL_30:
          if (v12 == v18)
          {
LABEL_32:

            goto LABEL_33;
          }
LABEL_31:

          goto LABEL_32;
        }
      }
      objc_msgSend_pushToken(self, v31, v32, v34);
      v40 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_pushToken(v11, v41, v42, v43);
      v94 = objc_claimAutoreleasedReturnValue();
      v95 = (void *)v40;
      if (v40 == v94)
      {
        v91 = v3;
      }
      else
      {
        objc_msgSend_pushToken(self, v44, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pushToken(v11, v48, v49, v50);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = v47;
        if (!objc_msgSend_isEqual_(v47, v51, (uint64_t)v92, v52))
        {
          isEqual = 0;
          v67 = (void *)v94;
          v66 = v95;
LABEL_27:

LABEL_28:
          if (v27 == v33)
            goto LABEL_30;
          goto LABEL_29;
        }
        v91 = v3;
      }
      objc_msgSend_URIs(self, v44, v45, v46);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URIs(v11, v54, v55, v56);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v53 == v59)
      {
        v88 = v5;
        v89 = v33;
      }
      else
      {
        objc_msgSend_URIs(self, v57, v58, v60);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_URIs(v11, v61, v62, v63);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v4, v64, (uint64_t)v90, v65))
        {
          isEqual = 0;
          goto LABEL_25;
        }
        v88 = v5;
        v89 = v33;
      }
      objc_msgSend_publicDeviceIdentity(self, v57, v58, v60);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_publicDeviceIdentity(v11, v69, v70, v71);
      v72 = objc_claimAutoreleasedReturnValue();
      if (v68 == (void *)v72)
      {

        isEqual = 1;
      }
      else
      {
        v76 = (void *)v72;
        objc_msgSend_publicDeviceIdentity(self, v73, v74, v75);
        v86 = v4;
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_publicDeviceIdentity(v11, v78, v79, v80);
        v87 = v27;
        v81 = v53;
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v77, v83, (uint64_t)v82, v84);

        v53 = v81;
        v27 = v87;

        v4 = v86;
      }
      v5 = v88;
      v33 = v89;
      if (v53 == v59)
      {
LABEL_26:

        v67 = (void *)v94;
        v66 = v95;
        v3 = v91;
        if (v95 == (void *)v94)
          goto LABEL_28;
        goto LABEL_27;
      }
LABEL_25:

      goto LABEL_26;
    }
    isEqual = 0;
  }
LABEL_33:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  unint64_t v25;

  objc_msgSend_name(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_hardwareVersion(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_pushToken(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSRegisteredDevice)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  IDSRegisteredDevice *v36;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("IDSRegisteredDeviceNameKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, CFSTR("IDSRegisteredDeviceHardwareVersionKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, v15, CFSTR("IDSRegisteredDevicePushTokenKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend_setWithObjects_(v17, v20, v18, v21, v19, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, v24, CFSTR("IDSRegisteredDeviceURIsKey"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0C99E60];
  v27 = objc_opt_class();
  objc_msgSend_setWithObjects_(v26, v28, v27, v29, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v30, v32, CFSTR("IDSRegisteredDevicePublicDeviceIdentityKey"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (IDSRegisteredDevice *)objc_msgSend_initWithName_hardwareVersion_pushToken_URIs_publicDeviceIdentity_(self, v34, (uint64_t)v8, v35, v12, v16, v25, v33);
  return v36;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  const char *v32;
  double v33;
  id v34;

  v4 = a3;
  objc_msgSend_name(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, CFSTR("IDSRegisteredDeviceNameKey"));

  objc_msgSend_hardwareVersion(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, v16, CFSTR("IDSRegisteredDeviceHardwareVersionKey"));

  objc_msgSend_pushToken(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, v22, CFSTR("IDSRegisteredDevicePushTokenKey"));

  objc_msgSend_URIs(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v26, v28, CFSTR("IDSRegisteredDeviceURIsKey"));

  objc_msgSend_publicDeviceIdentity(self, v29, v30, v31);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v34, v33, CFSTR("IDSRegisteredDevicePublicDeviceIdentityKey"));

}

- (NSString)name
{
  return self->_name;
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (NSArray)URIs
{
  return self->_URIs;
}

- (NSData)publicDeviceIdentity
{
  return self->_publicDeviceIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicDeviceIdentity, 0);
  objc_storeStrong((id *)&self->_URIs, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
