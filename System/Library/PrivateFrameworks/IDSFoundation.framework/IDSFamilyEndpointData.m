@implementation IDSFamilyEndpointData

- (IDSFamilyEndpointData)initWithDeviceName:(id)a3 privateDeviceData:(id)a4
{
  id v7;
  id v8;
  IDSFamilyEndpointData *v9;
  IDSFamilyEndpointData *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  double v18;
  uint64_t v19;
  NSString *deviceColor;
  const char *v21;
  double v22;
  uint64_t v23;
  NSString *buildVersion;
  const char *v25;
  double v26;
  uint64_t v27;
  NSString *productVersion;
  const char *v29;
  double v30;
  uint64_t v31;
  NSString *deviceUniqueID;
  objc_super v34;

  v7 = a3;
  v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)IDSFamilyEndpointData;
  v9 = -[IDSFamilyEndpointData init](&v34, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceName, a3);
    objc_msgSend_objectForKey_(v8, v11, (uint64_t)CFSTR("dt"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_deviceType = objc_msgSend_integerValue(v13, v14, v15, v16);

    objc_msgSend__stringForKey_(v8, v17, (uint64_t)CFSTR("c"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    deviceColor = v10->_deviceColor;
    v10->_deviceColor = (NSString *)v19;

    objc_msgSend__stringForKey_(v8, v21, (uint64_t)CFSTR("pb"), v22);
    v23 = objc_claimAutoreleasedReturnValue();
    buildVersion = v10->_buildVersion;
    v10->_buildVersion = (NSString *)v23;

    objc_msgSend__stringForKey_(v8, v25, (uint64_t)CFSTR("pv"), v26);
    v27 = objc_claimAutoreleasedReturnValue();
    productVersion = v10->_productVersion;
    v10->_productVersion = (NSString *)v27;

    objc_msgSend__stringForKey_(v8, v29, (uint64_t)CFSTR("u"), v30);
    v31 = objc_claimAutoreleasedReturnValue();
    deviceUniqueID = v10->_deviceUniqueID;
    v10->_deviceUniqueID = (NSString *)v31;

  }
  return v10;
}

- (IDSFamilyEndpointData)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  IDSFamilyEndpointData *v6;
  double v7;
  uint64_t v8;
  NSString *deviceName;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  double v17;
  uint64_t v18;
  NSString *deviceColor;
  const char *v20;
  double v21;
  uint64_t v22;
  NSString *buildVersion;
  const char *v24;
  double v25;
  uint64_t v26;
  NSString *productVersion;
  const char *v28;
  double v29;
  uint64_t v30;
  NSString *deviceUniqueID;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)IDSFamilyEndpointData;
  v6 = -[IDSFamilyEndpointData init](&v33, sel_init);
  if (v6)
  {
    objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("FamilyDeviceNameKey"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    deviceName = v6->_deviceName;
    v6->_deviceName = (NSString *)v8;

    objc_msgSend_objectForKey_(v4, v10, (uint64_t)CFSTR("FamilyDeviceTypeKey"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_deviceType = objc_msgSend_integerValue(v12, v13, v14, v15);

    objc_msgSend_objectForKey_(v4, v16, (uint64_t)CFSTR("FamilyDeviceColorKey"), v17);
    v18 = objc_claimAutoreleasedReturnValue();
    deviceColor = v6->_deviceColor;
    v6->_deviceColor = (NSString *)v18;

    objc_msgSend_objectForKey_(v4, v20, (uint64_t)CFSTR("FamilyDeviceBuildVersionKey"), v21);
    v22 = objc_claimAutoreleasedReturnValue();
    buildVersion = v6->_buildVersion;
    v6->_buildVersion = (NSString *)v22;

    objc_msgSend_objectForKey_(v4, v24, (uint64_t)CFSTR("FamilyDeviceProductVersionKey"), v25);
    v26 = objc_claimAutoreleasedReturnValue();
    productVersion = v6->_productVersion;
    v6->_productVersion = (NSString *)v26;

    objc_msgSend_objectForKey_(v4, v28, (uint64_t)CFSTR("FamilyDeviceUniqueIDKey"), v29);
    v30 = objc_claimAutoreleasedReturnValue();
    deviceUniqueID = v6->_deviceUniqueID;
    v6->_deviceUniqueID = (NSString *)v30;

  }
  return v6;
}

- (id)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  double v5;
  __CFDictionary *v6;
  NSString *deviceName;
  void *v8;
  NSString *deviceColor;
  NSString *buildVersion;
  NSString *deviceUniqueID;
  NSString *productVersion;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v3;
  deviceName = self->_deviceName;
  if (deviceName)
    CFDictionarySetValue(v3, CFSTR("FamilyDeviceNameKey"), deviceName);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v4, self->_deviceType, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    CFDictionarySetValue(v6, CFSTR("FamilyDeviceTypeKey"), v8);

  deviceColor = self->_deviceColor;
  if (deviceColor)
    CFDictionarySetValue(v6, CFSTR("FamilyDeviceColorKey"), deviceColor);
  buildVersion = self->_buildVersion;
  if (buildVersion)
    CFDictionarySetValue(v6, CFSTR("FamilyDeviceBuildVersionKey"), buildVersion);
  deviceUniqueID = self->_deviceUniqueID;
  if (deviceUniqueID)
    CFDictionarySetValue(v6, CFSTR("FamilyDeviceUniqueIDKey"), deviceUniqueID);
  productVersion = self->_productVersion;
  if (productVersion)
    CFDictionarySetValue(v6, CFSTR("FamilyDeviceProductVersionKey"), productVersion);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSFamilyEndpointData)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  __CFDictionary *v9;
  uint64_t v10;
  const char *v11;
  double v12;
  void *v13;
  void *v14;
  const char *v15;
  double v16;
  uint64_t v17;
  const char *v18;
  double v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  double v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  double v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  IDSFamilyEndpointData *v35;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("FamilyDeviceNameKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, v12, CFSTR("FamilyDeviceColorKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    CFDictionarySetValue(v9, CFSTR("c"), v13);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  v17 = objc_msgSend_decodeIntegerForKey_(v4, v15, (uint64_t)CFSTR("FamilyDeviceTypeKey"), v16);
  objc_msgSend_numberWithInteger_(v14, v18, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    CFDictionarySetValue(v9, CFSTR("dt"), v20);

  v21 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, v23, CFSTR("FamilyDeviceBuildVersionKey"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    CFDictionarySetValue(v9, CFSTR("pb"), v24);

  v25 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, v27, CFSTR("FamilyDeviceUniqueIDKey"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    CFDictionarySetValue(v9, CFSTR("u"), v28);

  v29 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, v31, CFSTR("FamilyDeviceProductVersionKey"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    CFDictionarySetValue(v9, CFSTR("pv"), v32);

  v35 = (IDSFamilyEndpointData *)objc_msgSend_initWithDeviceName_privateDeviceData_(self, v33, (uint64_t)v8, v34, v9);
  return v35;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceName;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  id v17;

  deviceName = self->_deviceName;
  v17 = a3;
  objc_msgSend_encodeObject_forKey_(v17, v5, (uint64_t)deviceName, v6, CFSTR("FamilyDeviceNameKey"));
  objc_msgSend_encodeInteger_forKey_(v17, v7, self->_deviceType, v8, CFSTR("FamilyDeviceTypeKey"));
  objc_msgSend_encodeObject_forKey_(v17, v9, (uint64_t)self->_deviceColor, v10, CFSTR("FamilyDeviceColorKey"));
  objc_msgSend_encodeObject_forKey_(v17, v11, (uint64_t)self->_buildVersion, v12, CFSTR("FamilyDeviceBuildVersionKey"));
  objc_msgSend_encodeObject_forKey_(v17, v13, (uint64_t)self->_deviceUniqueID, v14, CFSTR("FamilyDeviceUniqueIDKey"));
  objc_msgSend_encodeObject_forKey_(v17, v15, (uint64_t)self->_productVersion, v16, CFSTR("FamilyDeviceProductVersionKey"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualTo;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isEqualTo = objc_msgSend_isEqualTo_(self, v5, (uint64_t)v4, v6);
  else
    isEqualTo = 0;

  return isEqualTo;
}

- (BOOL)isEqualTo:(id)a3
{
  void *v3;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  char isEqualToString;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  const char *v40;
  uint64_t v41;
  char v42;
  double v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  double v52;
  const char *v53;
  double v54;
  const char *v55;
  uint64_t v56;
  double v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  double v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  const char *v67;
  double v68;
  const char *v69;
  uint64_t v70;
  char v71;
  double v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  double v76;
  void *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  double v81;
  void *v82;
  const char *v83;
  double v84;
  const char *v85;
  uint64_t v86;
  double v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  double v91;
  void *v92;
  void *v94;
  id v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  char v101;
  char v102;
  void *v103;
  void *v104;

  v5 = a3;
  objc_msgSend_deviceName(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceName(v5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v9, v14, (uint64_t)v13, v15);
  if ((isEqualToString & 1) == 0)
  {
    objc_msgSend_deviceName(self, v16, v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceName(v5, v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    if (v20 != (void *)v24)
    {
      v3 = (void *)v24;
      v25 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v3 = v20;
  }
  v26 = objc_msgSend_deviceType(self, v16, v17, v19);
  if (v26 != objc_msgSend_deviceType(v5, v27, v28, v29))
  {
    v25 = 0;
    goto LABEL_29;
  }
  objc_msgSend_deviceColor(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceColor(v5, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_isEqualToString_(v33, v38, (uint64_t)v37, v39);
  if ((v42 & 1) == 0)
  {
    objc_msgSend_deviceColor(self, v40, v41, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceColor(v5, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44 != v48)
    {
      v25 = 0;
LABEL_27:

      goto LABEL_28;
    }
    v98 = v44;
  }
  objc_msgSend_buildVersion(self, v40, v41, v43);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_buildVersion(v5, v50, v51, v52);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v49;
  v102 = objc_msgSend_isEqualToString_(v49, v53, (uint64_t)v103, v54);
  if ((v102 & 1) != 0)
  {
LABEL_15:
    v101 = v42;
    objc_msgSend_deviceUniqueID(self, v55, v56, v57);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceUniqueID(v5, v64, v65, v66);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v63;
    v71 = objc_msgSend_isEqualToString_(v63, v67, (uint64_t)v99, v68);
    if ((v71 & 1) == 0)
    {
      objc_msgSend_deviceUniqueID(self, v69, v70, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceUniqueID(v5, v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (v73 != v77)
      {
        v25 = 0;
        goto LABEL_23;
      }
      v95 = v73;
    }
    v97 = v37;
    objc_msgSend_productVersion(self, v69, v70, v72);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_productVersion(v5, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v78, v83, (uint64_t)v82, v84) & 1) != 0)
    {

      v25 = 1;
    }
    else
    {
      objc_msgSend_productVersion(self, v85, v86, v87);
      v94 = v33;
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_productVersion(v5, v89, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v88 == v92;

      v33 = v94;
    }
    v77 = v95;
    v73 = v95;
    v37 = v97;
    if ((v71 & 1) != 0)
    {
LABEL_24:

      v62 = v96;
      v58 = v96;
      v42 = v101;
      if ((v102 & 1) != 0)
        goto LABEL_26;
      goto LABEL_25;
    }
LABEL_23:

    goto LABEL_24;
  }
  objc_msgSend_buildVersion(self, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_buildVersion(v5, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58 == v62)
  {
    v96 = v58;
    goto LABEL_15;
  }
  v25 = 0;
LABEL_25:

LABEL_26:
  v48 = v98;
  v44 = v98;
  if ((v42 & 1) == 0)
    goto LABEL_27;
LABEL_28:

LABEL_29:
  v20 = v3;
  if ((isEqualToString & 1) == 0)
    goto LABEL_30;
LABEL_31:

  return v25;
}

- (id)debugDescription
{
  uint64_t v2;
  double v3;
  void *v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  double v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  void *v49;
  const char *v50;
  double v51;
  void *v52;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_deviceName(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("device-name = %@"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_msgSend_deviceType(self, v11, v12, v13);
  objc_msgSend_stringWithFormat_(v10, v15, (uint64_t)CFSTR("device-type = %ld"), v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_deviceColor(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v18, v23, (uint64_t)CFSTR("device-color = %@"), v24, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_buildVersion(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v26, v31, (uint64_t)CFSTR("device-build-version = %@"), v32, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_deviceUniqueID(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v34, v39, (uint64_t)CFSTR("device-unique-id = %@"), v40, v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_productVersion(self, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v42, v47, (uint64_t)CFSTR("device-product-version = %@"), v48, v46);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v50, (uint64_t)CFSTR("%@\n%@\n%@\n%@\n%@\n%@\n"), v51, v9, v17, v25, v33, v49, v41);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceColor, a3);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (NSString)deviceUniqueID
{
  return self->_deviceUniqueID;
}

- (void)setDeviceUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUniqueID, a3);
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
