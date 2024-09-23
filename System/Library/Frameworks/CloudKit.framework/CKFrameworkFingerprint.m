@implementation CKFrameworkFingerprint

- (CKFrameworkFingerprint)init
{
  CKFrameworkFingerprint *v2;
  const mach_header *v3;
  const mach_header *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  objc_super v35;
  uint8_t buf[4];
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)CKFrameworkFingerprint;
  v2 = -[CKFrameworkFingerprint init](&v35, sel_init);
  if (v2)
  {
    v3 = CKHeaderForLibraryName(CFSTR("CloudKit"));
    if (v3)
    {
      v4 = v3;
      v40[0] = 0;
      v40[1] = 0;
      if ((_dyld_get_image_uuid() & 1) != 0)
      {
        v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
        v8 = (void *)objc_msgSend_initWithUUIDBytes_(v5, v6, (uint64_t)v40, v7);
        objc_msgSend_setUuid_(v2, v9, (uint64_t)v8, v10);

      }
      else
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v17 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v37 = (const __CFString *)v4;
          v38 = 2112;
          v39 = CFSTR("CloudKit");
          _os_log_error_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_ERROR, "Failed to get image uuid for header %p in library name %@", buf, 0x16u);
        }
      }
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v11, v4->cputype, v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCpuType_(v2, v19, (uint64_t)v18, v20);

      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v21, v4->cpusubtype, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCpuSubtype_(v2, v24, (uint64_t)v23, v25);

    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v13 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = CFSTR("CloudKit");
        _os_log_error_impl(&dword_18A5C5000, v13, OS_LOG_TYPE_ERROR, "Couldn't get mach_header for library name %@", buf, 0xCu);
      }
    }
    v26 = (const char *)objc_msgSend_UTF8String(CFSTR("CloudKit"), v14, v15, v16);
    v27 = NSVersionOfRunTimeLibrary(v26);
    if ((_DWORD)v27 == -1)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v33 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = CFSTR("CloudKit");
        _os_log_error_impl(&dword_18A5C5000, v33, OS_LOG_TYPE_ERROR, "Couldn't get runtime version for library name %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v28, v27, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setVersion_(v2, v31, (uint64_t)v30, v32);

    }
  }
  return v2;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setCpuType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setCpuSubtype:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isLikelyEqual:(id)a3
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
  char isEqual;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;

  v4 = a3;
  objc_msgSend_uuid(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uuid(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14);

  if ((isEqual & 1) != 0)
  {
    LOBYTE(v19) = 1;
  }
  else
  {
    objc_msgSend_version(self, v16, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(v4, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_isEqual_(v20, v25, (uint64_t)v24, v26);

    if (v27)
    {
      objc_msgSend_cpuType(self, v28, v29, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        objc_msgSend_cpuSubtype(self, v31, v32, v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          objc_msgSend_cpuType(self, v35, v36, v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_cpuType(v4, v40, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqual_(v39, v44, (uint64_t)v43, v45))
          {
            objc_msgSend_cpuSubtype(self, v46, v47, v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_cpuSubtype(v4, v50, v51, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend_isEqual_(v49, v54, (uint64_t)v53, v55) ^ 1;

          }
          else
          {
            LOBYTE(v19) = 1;
          }

        }
        else
        {
          LOBYTE(v19) = 0;
        }

      }
      else
      {
        LOBYTE(v19) = 0;
      }

    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }

  return v19;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpuSubtype, 0);
  objc_storeStrong((id *)&self->_cpuType, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (CKFrameworkFingerprint)initWithCoder:(id)a3
{
  id v4;
  CKFrameworkFingerprint *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSUUID *uuid;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSNumber *version;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSNumber *cpuType;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSNumber *cpuSubtype;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CKFrameworkFingerprint;
  v5 = -[CKFrameworkFingerprint init](&v27, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_uuid);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v9;

    v11 = objc_opt_class();
    NSStringFromSelector(sel_version);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, (uint64_t)v12);
    v14 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSNumber *)v14;

    v16 = objc_opt_class();
    NSStringFromSelector(sel_cpuType);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v16, (uint64_t)v17);
    v19 = objc_claimAutoreleasedReturnValue();
    cpuType = v5->_cpuType;
    v5->_cpuType = (NSNumber *)v19;

    v21 = objc_opt_class();
    NSStringFromSelector(sel_cpuSubtype);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v21, (uint64_t)v22);
    v24 = objc_claimAutoreleasedReturnValue();
    cpuSubtype = v5->_cpuSubtype;
    v5->_cpuSubtype = (NSNumber *)v24;

  }
  return v5;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  id v28;

  v4 = a3;
  objc_msgSend_uuid(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_uuid);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v8, (uint64_t)v9);

  objc_msgSend_version(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_version);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);

  objc_msgSend_cpuType(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_cpuType);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v20, (uint64_t)v21);

  objc_msgSend_cpuSubtype(self, v23, v24, v25);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_cpuSubtype);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v28, (uint64_t)v26);

}

- (NSNumber)cpuType
{
  return self->_cpuType;
}

- (NSNumber)cpuSubtype
{
  return self->_cpuSubtype;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  cpu_type_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  cpu_subtype_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  unsigned __int8 v51;
  const char *v52;
  uint64_t v53;
  void *v54;

  v4 = self;
  objc_msgSend_cpuType(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_cpuSubtype(v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend_cpuType(v4, v5, v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend_intValue(v10, v11, v12, v13);
      objc_msgSend_cpuSubtype(v4, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend_intValue(v18, v19, v20, v21);
      v8 = (void *)macho_arch_name_for_cpu_type(v14, v22);

      if (v8)
      {
        objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v5, (uint64_t)v8, 4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = 0;
    }
  }
  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_uuid(v4, v5, v6, v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend_version(v4, v24, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v30 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_version(v4, v24, v29, v26);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend_unsignedIntValue(v31, v32, v33, v34) >> 16;
      objc_msgSend_version(v4, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = ((unsigned __int16)objc_msgSend_unsignedIntValue(v39, v40, v41, v42) >> 8);
      objc_msgSend_version(v4, v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend_unsignedIntValue(v47, v48, v49, v50);
      objc_msgSend_stringWithFormat_(v30, v52, (uint64_t)CFSTR("%u.%u.%u"), v53, v35, v43, v51);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_stringWithFormat_(v23, v24, (uint64_t)CFSTR("%@, %@, %@"), v26, v27, v4, v8);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  return v54;
}

@end
