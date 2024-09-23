@implementation ASDExternalManifestResponse

- (ASDExternalManifestResponse)init
{
  void *v3;
  ASDExternalManifestResponse *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ASDExternalManifestResponse initWithResults:](self, "initWithResults:", v3);

  return v4;
}

- (ASDExternalManifestResponse)initWithResults:(id)a3
{
  id v4;
  ASDExternalManifestResponse *v5;
  uint64_t v6;
  NSArray *results;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDExternalManifestResponse;
  v5 = -[ASDExternalManifestResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v4, 1);
    results = v5->_results;
    v5->_results = (NSArray *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDExternalManifestResponse *v5;
  void *v6;
  void *v7;

  v5 = -[ASDExternalManifestResponse initWithResults:](+[ASDExternalManifestResponse allocWithZone:](ASDExternalManifestResponse, "allocWithZone:"), "initWithResults:", self->_results);
  -[ASDRequestResponse setSuccess:](v5, "setSuccess:", -[ASDRequestResponse success](self, "success"));
  -[ASDRequestResponse error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[ASDRequestResponse setError:](v5, "setError:", v7);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDExternalManifestResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  ASDExternalManifestResponse *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("results"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ASDExternalManifestResponse initWithResults:](self, "initWithResults:", v8);
  if (v9)
  {
    -[ASDRequestResponse setSuccess:](v9, "setSuccess:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("success")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDRequestResponse setError:](v9, "setError:", v10);

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSArray *results;
  id v9;
  id v10;
  id v11;

  v4 = a3;
  -[ASDRequestResponse error](self, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASDRequestResponse error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ASDErrorWithSafeUserInfo(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    +[ASDCoding securelyEncodeObject:forKey:withCoder:error:](ASDCoding, "securelyEncodeObject:forKey:withCoder:error:", v7, CFSTR("error"), v4, &v11);
    v5 = v11;

  }
  results = self->_results;
  v10 = v5;
  +[ASDCoding securelyEncodeObject:forKey:withCoder:error:](ASDCoding, "securelyEncodeObject:forKey:withCoder:error:", results, CFSTR("results"), v4, &v10);
  v9 = v10;

  if (v9)
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("error"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDRequestResponse success](self, "success"), CFSTR("success"));

}

- (NSArray)results
{
  return self->_results;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

@end
