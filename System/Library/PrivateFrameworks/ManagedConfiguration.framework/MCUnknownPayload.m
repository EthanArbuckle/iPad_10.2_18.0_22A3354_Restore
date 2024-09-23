@implementation MCUnknownPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.unknown");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MCUnknownPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  MCUnknownPayload *v5;
  void *v6;
  uint64_t v7;
  NSString *type;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCUnknownPayload;
  v5 = -[MCPayload initWithDictionary:profile:outError:](&v10, sel_initWithDictionary_profile_outError_, a3, a4, a5);
  if (v5)
  {
    +[MCUnknownPayload typeStrings](MCUnknownPayload, "typeStrings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    type = v5->super._type;
    v5->super._type = (NSString *)v7;

  }
  return v5;
}

- (MCUnknownPayload)initWithContentsOfPayload:(id)a3 profile:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MCUnknownPayload *v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("PayloadVersion");
  v6 = (objc_class *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithInteger:", objc_msgSend(v8, "version"));
  v18[0] = v9;
  v18[1] = CFSTR("com.apple.unknown");
  v17[1] = CFSTR("PayloadType");
  v17[2] = CFSTR("PayloadIdentifier");
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v10;
  v17[3] = CFSTR("PayloadUUID");
  objc_msgSend(v8, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v11;
  v17[4] = CFSTR("PayloadDisplayName");
  objc_msgSend(v8, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  v15 = -[MCUnknownPayload initWithDictionary:profile:outError:](self, "initWithDictionary:profile:outError:", v14, v7, 0);
  return v15;
}

- (id)verboseDescription
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  v6.receiver = self;
  v6.super_class = (Class)MCUnknownPayload;
  -[MCPayload verboseDescription](&v6, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appendFormat:", CFSTR("Unknown payload.\n"));
  return v4;
}

- (id)subtitle1Description
{
  void *v3;
  void *v4;

  -[MCPayload organization](self, "organization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[MCPayload organization](self, "organization");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
