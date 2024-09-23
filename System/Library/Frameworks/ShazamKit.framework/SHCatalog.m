@implementation SHCatalog

- (SHCatalog)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  SHCatalog *v13;
  SHCatalog *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  objc_super v27;

  v6 = a3;
  v7 = objc_opt_class();
  objc_msgSend(v6, "installationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend((id)v7, "_validateInstallationID:", v8);

  if ((v7 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x24BDBCE88];
    v17 = *MEMORY[0x24BDBCAB8];
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "installationID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ is not a valid installation ID"), v19);
LABEL_10:
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v26, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
    objc_exception_throw(v24);
  }
  objc_msgSend(v6, "streamingBufferDuration");
  if (v9 <= 0.0)
  {
    v20 = (void *)MEMORY[0x24BDBCE88];
    v21 = *MEMORY[0x24BDBCAB8];
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "streamingBufferDuration");
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%f is not a valid buffer duration"), v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v6, "signatureDurationRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowerBound");
  v12 = v11;

  if (v12 <= 0.0)
  {
    v16 = (void *)MEMORY[0x24BDBCE88];
    v17 = *MEMORY[0x24BDBCAB8];
    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "signatureDurationRange");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ is not a valid signature duration range"), v19);
    goto LABEL_10;
  }
  v27.receiver = self;
  v27.super_class = (Class)SHCatalog;
  v13 = -[SHCatalog init](&v27, sel_init);
  v14 = v13;
  if (v13)
    objc_storeStrong((id *)&v13->__configuration, a3);

  return v14;
}

- (NSTimeInterval)minimumQuerySignatureDuration
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SHCatalog _configuration](self, "_configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signatureDurationRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowerBound");
  v5 = v4;

  return v5;
}

- (NSTimeInterval)maximumQuerySignatureDuration
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SHCatalog _configuration](self, "_configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signatureDurationRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "upperBound");
  v5 = v4;

  return v5;
}

- (id)_createMatcher
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)_createSessionDriver
{
  SHStreamingSessionDriver *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  SHStreamingSessionDriver *v10;

  v3 = [SHStreamingSessionDriver alloc];
  -[SHCatalog minimumQuerySignatureDuration](self, "minimumQuerySignatureDuration");
  v5 = v4;
  -[SHCatalog maximumQuerySignatureDuration](self, "maximumQuerySignatureDuration");
  v7 = v6;
  -[SHCatalog _configuration](self, "_configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "streamingBufferDuration");
  v10 = -[SHStreamingSessionDriver initWithMinimumSignatureDuration:maximumSignatureDuration:bufferDuration:](v3, "initWithMinimumSignatureDuration:maximumSignatureDuration:bufferDuration:", v5, v7, v9);

  return v10;
}

+ (BOOL)_validateInstallationID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "length") != 0;
  return (char)v4;
}

- (SHCatalogConfiguration)_configuration
{
  return self->__configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__configuration, 0);
}

@end
