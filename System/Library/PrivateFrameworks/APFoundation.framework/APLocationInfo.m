@implementation APLocationInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
}

- (void)setSubAdministrativeArea:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setPostalCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setLocality:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setIsoCountryCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setAdministrativeArea:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)isEmpty
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;

  objc_msgSend_locality(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend_administrativeArea(self, v5, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend_subAdministrativeArea(self, v10, v11, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend_isoCountryCode(self, v14, v15, v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v9 = 0;
        }
        else
        {
          objc_msgSend_postalCode(self, v18, v19, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v22 == 0;

        }
      }

    }
  }

  return v9;
}

- (APLocationInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  APLocationInfo *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSString *locality;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSString *administrativeArea;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  NSString *subAdministrativeArea;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  NSString *isoCountryCode;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  NSString *postalCode;

  v4 = a3;
  v8 = (APLocationInfo *)objc_msgSend_init(self, v5, v6, v7);
  if (v8)
  {
    v9 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, (uint64_t)CFSTR("locality"));
    v11 = objc_claimAutoreleasedReturnValue();
    locality = v8->_locality;
    v8->_locality = (NSString *)v11;

    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("administrativeArea"));
    v15 = objc_claimAutoreleasedReturnValue();
    administrativeArea = v8->_administrativeArea;
    v8->_administrativeArea = (NSString *)v15;

    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("subAdministrativeArea"));
    v19 = objc_claimAutoreleasedReturnValue();
    subAdministrativeArea = v8->_subAdministrativeArea;
    v8->_subAdministrativeArea = (NSString *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("isoCountryCode"));
    v23 = objc_claimAutoreleasedReturnValue();
    isoCountryCode = v8->_isoCountryCode;
    v8->_isoCountryCode = (NSString *)v23;

    v25 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, (uint64_t)CFSTR("postalCode"));
    v27 = objc_claimAutoreleasedReturnValue();
    postalCode = v8->_postalCode;
    v8->_postalCode = (NSString *)v27;

  }
  return v8;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  int v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_locality(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v5, v10, (uint64_t)v9, (uint64_t)CFSTR("locality"));

  objc_msgSend_administrativeArea(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v5, v15, (uint64_t)v14, (uint64_t)CFSTR("administrativeArea"));

  objc_msgSend_subAdministrativeArea(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v5, v20, (uint64_t)v19, (uint64_t)CFSTR("subAdministrativeArea"));

  objc_msgSend_isoCountryCode(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v5, v25, (uint64_t)v24, (uint64_t)CFSTR("isoCountryCode"));

  objc_msgSend_postalCode(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v5, v30, (uint64_t)v29, (uint64_t)CFSTR("postalCode"));

  APLogForCategory(0x19uLL);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_jsonString(v5, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138477827;
    v38 = v35;
    _os_log_impl(&dword_1CF251000, v31, OS_LOG_TYPE_DEFAULT, "Current Location: (%{private}@).", (uint8_t *)&v37, 0xCu);

  }
  return CFSTR("<redacted>");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  id v29;

  v4 = a3;
  objc_msgSend_locality(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, (uint64_t)CFSTR("locality"));

  objc_msgSend_administrativeArea(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, (uint64_t)CFSTR("administrativeArea"));

  objc_msgSend_subAdministrativeArea(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v18, (uint64_t)CFSTR("subAdministrativeArea"));

  objc_msgSend_isoCountryCode(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("isoCountryCode"));

  objc_msgSend_postalCode(self, v25, v26, v27);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)v29, (uint64_t)CFSTR("postalCode"));

}

- (NSString)locality
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)subAdministrativeArea
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)postalCode
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)isoCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)administrativeArea
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)jsonRepresentationWithOptions:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v37;
  uint8_t buf[4];
  void *v39;
  _QWORD v40[5];
  _QWORD v41[6];

  v41[5] = *MEMORY[0x1E0C80C00];
  v40[0] = CFSTR("locality");
  objc_msgSend_locality(self, a2, a3, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v5;
  if (!v5)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v6, v7, v8);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v5;
  v41[0] = v5;
  v40[1] = CFSTR("administrativeArea");
  objc_msgSend_administrativeArea(self, v6, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[1] = v14;
  v40[2] = CFSTR("subAdministrativeArea");
  objc_msgSend_subAdministrativeArea(self, v10, v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[2] = v19;
  v40[3] = CFSTR("isoCountryCode");
  objc_msgSend_isoCountryCode(self, v15, v16, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v23)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v20, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[3] = v24;
  v40[4] = CFSTR("postalCode");
  objc_msgSend_postalCode(self, v20, v21, v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (!v28)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v25, v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[4] = v29;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)v41, (uint64_t)v40, 5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)

  if (!v23)
  if (!v18)

  if (!v13)
  if (!v9)

  APLogForCategory(0x19uLL);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_description(v30, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v39 = v35;
    _os_log_impl(&dword_1CF251000, v31, OS_LOG_TYPE_DEFAULT, "Current Location: (%{private}@).", buf, 0xCu);

  }
  return CFSTR("<redacted>");
}

- (BOOL)isEqualToAPLocationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  char isEqualToString;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_description(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v4, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v8, v13, (uint64_t)v12, v14);

  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

@end
