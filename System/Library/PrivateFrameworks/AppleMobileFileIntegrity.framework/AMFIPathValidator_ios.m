@implementation AMFIPathValidator_ios

- (AMFIPathValidator_ios)initWithURL:(id)a3
{
  return -[AMFIPathValidator_ios initWithURL:withFileOffsetAsNumber:withFlags:](self, "initWithURL:withFileOffsetAsNumber:withFlags:", a3, 0, 0);
}

- (AMFIPathValidator_ios)initWithURL:(id)a3 withFlags:(int)a4
{
  return -[AMFIPathValidator_ios initWithURL:withFileOffsetAsNumber:withFlags:](self, "initWithURL:withFileOffsetAsNumber:withFlags:", a3, 0, *(_QWORD *)&a4);
}

- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffset:(unint64_t)a4
{
  return -[AMFIPathValidator_ios initWithURL:withFileOffset:withFlags:](self, "initWithURL:withFileOffset:withFlags:", a3, a4, 0);
}

- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffset:(unint64_t)a4 withFlags:(int)a5
{
  uint64_t v5;
  void *v8;
  id v9;
  void *v10;
  AMFIPathValidator_ios *v11;

  v5 = *(_QWORD *)&a5;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a3;
  objc_msgSend(v8, "numberWithUnsignedLongLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AMFIPathValidator_ios initWithURL:withFileOffsetAsNumber:withFlags:](self, "initWithURL:withFileOffsetAsNumber:withFlags:", v9, v10, v5);

  return v11;
}

- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffsetAsNumber:(id)a4 withFlags:(int)a5
{
  id v9;
  id v10;
  AMFIPathValidator_ios *v11;
  AMFIPathValidator_ios *v12;
  NSData *cdhash;
  NSData *profileData;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMFIPathValidator_ios;
  v11 = -[AMFIPathValidator_ios init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_url, a3);
    objc_storeStrong((id *)&v12->_offset, a4);
    v12->_bootargs = 0;
    v12->_flags = a5;
    v12->_isValid = 0;
    v12->_validated = 0;
    v12->_signerType = 0;
    v12->_areEntitlementsValidated = 0;
    cdhash = v12->_cdhash;
    v12->_cdhash = 0;

    profileData = v12->_profileData;
    v12->_profileData = 0;

    amfi_interface_query_bootarg_state(&v12->_bootargs);
  }

  return v12;
}

- (BOOL)computedCdHash:(unsigned __int8)a3[20]
{
  NSData *cdhash;

  if (!self->_validated)
    -[AMFIPathValidator_ios validateWithError:](self, "validateWithError:", 0);
  cdhash = self->_cdhash;
  if (cdhash)
    -[NSData getBytes:length:](cdhash, "getBytes:length:", a3, 20);
  return cdhash != 0;
}

- (BOOL)validateWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSNumber *offset;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  unint64_t v14;
  id v15;
  id *v16;
  void *v17;
  NSObject *v18;
  AMFIError *v19;
  NSError *error;
  AMFIError *v21;
  NSObject *v22;
  AMFIError *v23;
  NSError *v24;
  _BOOL4 isValid;
  NSObject *v26;
  void *v27;
  NSError *v28;
  BOOL v29;
  void *v31;
  void *v32;
  id *v33;
  _DWORD cf[3];
  __int16 v35;
  _BYTE v36[18];
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  self->_validated = 1;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x1E0DE7328]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, *MEMORY[0x1E0DE7300]);

  offset = self->_offset;
  if (offset)
    objc_msgSend(v5, "setObject:forKey:", offset, *MEMORY[0x1E0DE7318]);
  -[NSURL path](self->_url, "path", &self->_url);
  v9 = MISValidateSignatureAndCopyInfo();
  objc_msgSend(0, "objectForKey:", *MEMORY[0x1E0DE7270]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v14 = 0x1EA985000uLL;
  if ((_DWORD)v9)
  {
    v15 = v13;
    v16 = a3;
    v17 = (void *)MISCopyErrorStringForErrorCode();
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*v33, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      cf[0] = 138412802;
      *(_QWORD *)&cf[1] = v31;
      v35 = 1024;
      *(_DWORD *)v36 = (_DWORD)v9;
      *(_WORD *)&v36[4] = 2112;
      *(_QWORD *)&v36[6] = v17;
      _os_log_error_impl(&dword_1DF2FC000, v18, OS_LOG_TYPE_ERROR, "%@ not valid: 0x%x: %@", (uint8_t *)cf, 0x1Cu);

    }
    v19 = -[AMFIError initWithMISError:withURL:]([AMFIError alloc], "initWithMISError:withURL:", v9, self->_url);
    error = self->_error;
    self->_error = &v19->super;

    v14 = 0x1EA985000;
    a3 = v16;
    v13 = v15;
  }
  else
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*v33, "path");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      cf[0] = 138413058;
      *(_QWORD *)&cf[1] = v32;
      v35 = 2112;
      *(_QWORD *)v36 = v5;
      *(_WORD *)&v36[8] = 2112;
      *(_QWORD *)&v36[10] = 0;
      v37 = 2112;
      v38 = v13;
      _os_log_error_impl(&dword_1DF2FC000, v9, OS_LOG_TYPE_ERROR, "MIS Validation successful, but unexpected info? path: '%@', options: %@, info: %@, cdhash: %@", (uint8_t *)cf, 0x2Au);

    }
    v21 = -[AMFIError initWithAMFIErrorCode:withURL:]([AMFIError alloc], "initWithAMFIErrorCode:withURL:", -401, self->_url);
    LODWORD(v9) = 0;
    v17 = self->_error;
    self->_error = &v21->super;
  }

  if ((self->_flags & 1) != 0)
  {
    self->_isValid = 0;
    objc_msgSend(*(id *)(v14 + 3720), "generic");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[AMFIPathValidator_ios validateWithError:].cold.1(v33, v22);

    v23 = -[AMFIError initWithAMFIErrorCode:withURL:]([AMFIError alloc], "initWithAMFIErrorCode:withURL:", -430, self->_url);
    v24 = self->_error;
    self->_error = &v23->super;

  }
  isValid = self->_isValid;
  if (self->_isValid || (_DWORD)v9 == -402620388)
  {
LABEL_23:
    if (!a3)
      goto LABEL_26;
    goto LABEL_24;
  }
  if ((self->_bootargs & 6) != 0)
  {
    objc_msgSend(*(id *)(v14 + 3720), "generic");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*v33, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      cf[0] = 138412290;
      *(_QWORD *)&cf[1] = v27;
      _os_log_impl(&dword_1DF2FC000, v26, OS_LOG_TYPE_INFO, "boot-args allow process with invalid signature: %@", (uint8_t *)cf, 0xCu);

    }
    self->_isValid = 1;
    v28 = self->_error;
    self->_error = 0;

    isValid = self->_isValid;
    goto LABEL_23;
  }
  isValid = 0;
  if (!a3)
    goto LABEL_26;
LABEL_24:
  if (!isValid)
  {
    *a3 = objc_retainAutorelease(self->_error);
    isValid = self->_isValid;
  }
LABEL_26:
  v29 = isValid;

  return v29;
}

- (BOOL)isValid
{
  if (!self->_validated)
    -[AMFIPathValidator_ios validateWithError:](self, "validateWithError:", 0);
  return self->_isValid;
}

- (BOOL)areEntitlementsValidated
{
  if (!self->_validated)
    -[AMFIPathValidator_ios validateWithError:](self, "validateWithError:", 0);
  return self->_areEntitlementsValidated;
}

- (int)isSignerType
{
  if (!self->_validated)
    -[AMFIPathValidator_ios validateWithError:](self, "validateWithError:", 0);
  return self->_signerType;
}

- (NSData)profileData
{
  if (!self->_validated)
    -[AMFIPathValidator_ios validateWithError:](self, "validateWithError:", 0);
  return self->_profileData;
}

- (NSData)profileAuxSig
{
  if (!self->_validated)
    -[AMFIPathValidator_ios validateWithError:](self, "validateWithError:", 0);
  return self->_profileAuxSig;
}

- (NSError)error
{
  return self->_error;
}

- (unsigned)signerType
{
  return self->_signerType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileAuxSig, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_cdhash, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)validateWithError:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DF2FC000, a2, OS_LOG_TYPE_ERROR, "dyld_sim policy is not allowed on iOS: %@", (uint8_t *)&v4, 0xCu);

}

- (void)validateWithError:(NSObject *)a3 .cold.2(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1DF2FC000, a3, OS_LOG_TYPE_ERROR, "Unable to extract signer type? path: '%@', info: '%@'", (uint8_t *)&v6, 0x16u);

}

@end
