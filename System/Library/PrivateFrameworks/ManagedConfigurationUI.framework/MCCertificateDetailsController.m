@implementation MCCertificateDetailsController

+ (id)_dateFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_dateFormatter_sFormatter;
  if (!_dateFormatter_sFormatter)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = (void *)_dateFormatter_sFormatter;
    _dateFormatter_sFormatter = (uint64_t)v3;

    objc_msgSend((id)_dateFormatter_sFormatter, "setDateStyle:", 1);
    objc_msgSend((id)_dateFormatter_sFormatter, "setTimeStyle:", 1);
    v2 = (void *)_dateFormatter_sFormatter;
  }
  return v2;
}

- (id)_propertiesFromTrust:(__SecTrust *)a3
{
  int CertificateCount;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CFErrorRef error;

  if (!a3)
    goto LABEL_10;
  error = 0;
  if (!SecTrustEvaluateWithError(a3, &error))
    NSLog(CFSTR("SecTrust %@ not trusted with error: %@"), a3, error);
  if (error)
    CFRelease(error);
  CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount >= 1)
  {
    v5 = 0;
    v6 = 0;
    v7 = CertificateCount;
    do
    {
      v8 = (void *)SecTrustCopyDetailedPropertiesAtIndex();
      v9 = (void *)objc_msgSend(v8, "copy");

      ++v5;
      v6 = v9;
    }
    while (v7 != v5);
  }
  else
  {
LABEL_10:
    v9 = 0;
  }
  return v9;
}

- (id)valueForSpecifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id HexStringForBytes;
  id v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = *MEMORY[0x1E0D80990];
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x1E0D80990]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    HexStringForBytes = v5;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v5;
      +[MCCertificateDetailsController _dateFormatter](MCCertificateDetailsController, "_dateFormatter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringFromDate:", v7);
      HexStringForBytes = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        HexStringForBytes = 0;
        goto LABEL_9;
      }
      v9 = objc_retainAutorelease(v5);
      objc_msgSend(v9, "bytes");
      objc_msgSend(v9, "length");

      HexStringForBytes = (id)_CreateHexStringForBytes();
    }
    objc_msgSend(v3, "setProperty:forKey:", HexStringForBytes, v4);
  }
LABEL_9:

  return HexStringForBytes;
}

- (id)specifiersFromCertificateProperties:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void *v22;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v3;
  v5 = objc_msgSend(v3, "count");
  if (v5 >= 1)
  {
    v6 = 0;
    v20 = *MEMORY[0x1E0CD6FD0];
    v7 = *MEMORY[0x1E0CD6FD8];
    v8 = *MEMORY[0x1E0CD6FE8];
    v9 = *MEMORY[0x1E0CD6FE0];
    v19 = *MEMORY[0x1E0D80990];
    v10 = v5;
    do
    {
      objc_msgSend(v22, "objectAtIndex:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v8);

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v15);

        objc_msgSend(v11, "objectForKey:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCCertificateDetailsController specifiersFromCertificateProperties:](self, "specifiersFromCertificateProperties:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v17);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, sel_valueForSpecifier_, 0, 4, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setProperty:forKey:", v17, v19);
        objc_msgSend(v4, "addObject:", v16);
      }

      ++v6;
    }
    while (v10 != v6);
  }

  return v4;
}

- (id)specifiersFromTrust:(__SecTrust *)a3
{
  void *v4;
  void *v5;

  -[MCCertificateDetailsController _propertiesFromTrust:](self, "_propertiesFromTrust:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCCertificateDetailsController specifiersFromCertificateProperties:](self, "specifiersFromCertificateProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)specifiers
{
  uint64_t v2;
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  objc_class *v14;
  void *v15;

  v2 = (int)*MEMORY[0x1E0D80590];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (!v3)
  {
    MCUILocalizedString(CFSTR("CERT_DETAILS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCCertificateDetailsController setTitle:](self, "setTitle:", v5);

    -[MCCertificateDetailsController specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "propertyForKey:", CFSTR("kMCCertificateDetailsTrustRefKey"));

    if (v7)
    {
      -[MCCertificateDetailsController specifiersFromTrust:](self, "specifiersFromTrust:", v7);
      v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = v8;

    }
    else
    {
      -[MCCertificateDetailsController specifier](self, "specifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "propertyForKey:", CFSTR("kMCCertificateDetailsCertificateRefKey"));

      if (v11)
      {
        v12 = SecCertificateCopyProperties();
        if (v12)
        {
          v13 = (const void *)v12;
          -[MCCertificateDetailsController specifiersFromCertificateProperties:](self, "specifiersFromCertificateProperties:", v12);
          v14 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
          *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = v14;

          CFRelease(v13);
        }
      }
    }
    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    if (!v3)
    {
      *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)MEMORY[0x1E0C9AA60];

      v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
