@implementation SGPSInteractionLookup

- (SGPSInteractionLookup)initWithDetail:(id)a3
{
  id v4;
  SGPSInteractionLookup *v5;
  uint64_t v6;
  NSString *detail;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGPSInteractionLookup;
  v5 = -[SGPSInteractionLookup init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    detail = v5->_detail;
    v5->_detail = (NSString *)v6;

  }
  return v5;
}

- (SGPSInteractionLookup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SGPSInteractionLookup *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detail"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SGPSInteractionLookup initWithDetail:](self, "initWithDetail:", v5);
  return v6;
}

- (id)interactionInformation
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)interactionString
{
  return CFSTR("PeopleSuggester: Interaction Information compiled out");
}

- (id)resolveAppNameForBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "applicationIsInstalled:", v3);

  if ((v6 & 1) == 0)
  {
    objc_autoreleasePoolPop(v4);
LABEL_7:
    v12 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v12);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CA5870], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v3, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v7, "localizedShortName");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_autoreleasePoolPop(v4);
  if (!v11)
    goto LABEL_7;
LABEL_8:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_detail, CFSTR("detail"));
}

- (unint64_t)hash
{
  return -[NSString hash](self->_detail, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SGPSInteractionLookup *v4;
  SGPSInteractionLookup *v5;
  BOOL v6;

  v4 = (SGPSInteractionLookup *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGPSInteractionLookup isEqualToPSInteractionLookup:](self, "isEqualToPSInteractionLookup:", v5);

  return v6;
}

- (BOOL)isEqualToPSInteractionLookup:(id)a3
{
  _QWORD *v4;
  NSString *v5;
  NSString *v6;
  char v7;

  v4 = a3;
  if (v4)
  {
    v5 = self->_detail;
    v6 = v5;
    if (v5 == (NSString *)v4[1])
      v7 = 1;
    else
      v7 = -[NSString isEqual:](v5, "isEqual:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3;
  NSString *detail;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  detail = self->_detail;
  -[SGPSInteractionLookup interactionString](self, "interactionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGPSInteractionLookup detail:%@\n interactionString: %@\n>"), detail, v5);

  return v6;
}

- (id)resourceBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", *MEMORY[0x1E0D19D88]);
}

- (NSString)detail
{
  return self->_detail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
