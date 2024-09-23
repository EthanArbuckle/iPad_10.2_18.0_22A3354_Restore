@implementation PHCloudIdentifier

- (PHCloudIdentifier)initWithStringValue:(NSString *)stringValue
{
  NSString *v4;
  void *v5;
  PHCloudIdentifier *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  id v11;

  v4 = stringValue;
  -[NSString componentsSeparatedByString:](v4, "componentsSeparatedByString:", CFSTR(":"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") < 3)
    {
      v9 = &stru_1E35DFFF8;
    }
    else
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v6 = -[PHCloudIdentifier initWithLocalCloudIdentifier:identifierCode:fingerPrint:](self, "initWithLocalCloudIdentifier:identifierCode:fingerPrint:", v7, v8, v9);

  }
  else
  {
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("stringValue cannot be initialized as a PHCloudIdentifier"), 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v11);
    }
    v6 = 0;
    v7 = self;
  }

  return v6;
}

- (PHCloudIdentifier)initWithLocalCloudIdentifier:(id)a3 identifierCode:(id)a4 fingerPrint:(id)a5
{
  id v9;
  id v10;
  id v11;
  PHCloudIdentifier *v12;
  PHCloudIdentifier *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHCloudIdentifier;
  v12 = -[PHCloudIdentifier init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localCloudIdentifier, a3);
    objc_storeStrong((id *)&v13->_identifierCode, a4);
    objc_storeStrong((id *)&v13->_fingerPrint, a5);
    if (!-[NSString length](v13->_identifierCode, "length")
      || !-[NSString length](v13->_localCloudIdentifier, "length"))
    {

      v13 = 0;
    }
  }

  return v13;
}

- (id)initAsNotFoundIdentifier
{
  PHCloudIdentifier *v2;
  PHCloudIdentifier *v3;
  NSString *localCloudIdentifier;
  NSString *identifierCode;
  NSString *fingerPrint;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHCloudIdentifier;
  v2 = -[PHCloudIdentifier init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    localCloudIdentifier = v2->_localCloudIdentifier;
    v2->_localCloudIdentifier = (NSString *)&stru_1E35DFFF8;

    identifierCode = v3->_identifierCode;
    v3->_identifierCode = (NSString *)&stru_1E35DFFF8;

    fingerPrint = v3->_fingerPrint;
    v3->_fingerPrint = (NSString *)&stru_1E35DFFF8;

  }
  return v3;
}

- (NSString)stringValue
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "addObject:", self->_localCloudIdentifier);
  objc_msgSend(v3, "addObject:", self->_identifierCode);
  objc_msgSend(v3, "addObject:", self->_fingerPrint);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  PHCloudIdentifier *v4;
  PHCloudIdentifier *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PHCloudIdentifier *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PHCloudIdentifier stringValue](self, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHCloudIdentifier stringValue](v5, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PHCloudIdentifier stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PHCloudIdentifier stringValue](self, "stringValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("stringValue"));

}

- (PHCloudIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PHCloudIdentifier *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PHCloudIdentifier initWithStringValue:](self, "initWithStringValue:", v5);
  return v6;
}

- (NSString)localCloudIdentifier
{
  return self->_localCloudIdentifier;
}

- (NSString)identifierCode
{
  return self->_identifierCode;
}

- (NSString)fingerPrint
{
  return self->_fingerPrint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerPrint, 0);
  objc_storeStrong((id *)&self->_identifierCode, 0);
  objc_storeStrong((id *)&self->_localCloudIdentifier, 0);
}

+ (id)_notFoundIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PHCloudIdentifier__notFoundIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_notFoundIdentifier_onceToken != -1)
    dispatch_once(&_notFoundIdentifier_onceToken, block);
  return (id)_notFoundIdentifier_sNotFoundCloudIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __40__PHCloudIdentifier__notFoundIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initAsNotFoundIdentifier");
  v2 = (void *)_notFoundIdentifier_sNotFoundCloudIdentifier;
  _notFoundIdentifier_sNotFoundCloudIdentifier = v1;

}

@end
