@implementation NSCoder(Sanitization)

- (uint64_t)fp_checkProviderIdentifier:()Sanitization
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "fp_sanitizer");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_3;
  v6 = (void *)v5;
  objc_msgSend(v4, "fp_toProviderID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fp_sanitizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "providerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fp_toProviderID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[NSCoder(Sanitization) fp_checkProviderIdentifier:].cold.1((uint64_t)v4, a1, v13);

    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "fp_sanitizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "providerIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Got invalid provider identifier %@ from coder for extension %@"), v4, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB28A8];
    v23 = *MEMORY[0x1E0CB2938];
    v24[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 4101, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "failWithError:", v21);

    v12 = 0;
  }
  else
  {
LABEL_3:
    v12 = 1;
  }

  return v12;
}

- (id)fp_sanitizer
{
  void *v2;
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("FPXPCSanitizerKey"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)fp_checkProviderIdentifier:()Sanitization .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_sanitizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Got invalid provider identifier %@ from coder for extension %@", (uint8_t *)&v7, 0x16u);

}

@end
