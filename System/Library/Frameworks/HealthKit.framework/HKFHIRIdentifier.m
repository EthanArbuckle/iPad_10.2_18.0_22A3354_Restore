@implementation HKFHIRIdentifier

+ (HKFHIRIdentifier)FHIRIdentifierWithString:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  id v17;
  void *v18;

  v7 = a3;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("failed to parse FHIR identifier; nil identifier"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_9;
    if (!a4)
      goto LABEL_5;
LABEL_8:
    v10 = objc_retainAutorelease(v10);
    v11 = 0;
    *a4 = v10;
    v12 = v10;
    goto LABEL_22;
  }
  v9 = objc_msgSend(v7, "rangeOfString:", CFSTR("/"));
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("failed to parse FHIR identifier; invalid format"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_9:
      v11 = 0;
      v12 = v10;
      goto LABEL_22;
    }
    if (!a4)
    {
LABEL_5:
      _HKLogDroppedError(v10);
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v13 = v9;
  objc_msgSend(v8, "substringToIndex:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "substringFromIndex:", v13 + 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 && objc_msgSend(v12, "length"))
  {
    if (v10 && objc_msgSend(v10, "length"))
    {
      v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResourceType:identifier:", v12, v10);
      goto LABEL_22;
    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = objc_opt_class();
    v16 = CFSTR("failed to parse FHIR identifier; missing identifier");
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = objc_opt_class();
    v16 = CFSTR("failed to parse FHIR identifier; missing resource type");
  }
  objc_msgSend(v14, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v15, a2, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v17);
    else
      _HKLogDroppedError(v17);
  }

  v11 = 0;
LABEL_22:

  return (HKFHIRIdentifier *)v11;
}

- (HKFHIRIdentifier)initWithResourceType:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  HKFHIRIdentifier *v8;
  uint64_t v9;
  NSString *resourceType;
  uint64_t v11;
  NSString *identifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKFHIRIdentifier;
  v8 = -[HKFHIRIdentifier init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    resourceType = v8->_resourceType;
    v8->_resourceType = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v11;

  }
  return v8;
}

- (HKFHIRIdentifier)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (NSString)stringValue
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@%@"), self->_resourceType, CFSTR("/"), self->_identifier);
}

- (id)identifierForContainedResourceWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  HKFHIRIdentifier *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HKFHIRIdentifier *v16;
  void *v17;

  v6 = a3;
  if (-[NSString containsString:](self->_identifier, "containsString:", CFSTR("#")))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("trying to create a contained resource identifier by containing in an already contained resource: %@"), self);
  }
  else
  {
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsString:", CFSTR("#"));

    if (!v8)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      -[HKFHIRIdentifier stringValue](self, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@%@%@"), v13, CFSTR("#"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = [HKFHIRIdentifier alloc];
      objc_msgSend(v6, "resourceType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HKFHIRIdentifier initWithResourceType:identifier:](v16, "initWithResourceType:identifier:", v17, v15);

      goto LABEL_7;
    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    HKSensitiveLogItem(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_assignError:code:format:", a4, 3, CFSTR("trying to create a contained resource identifier by containing an already contained resource: %@"), v10);

  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (id)parentResourceIdentifierWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *resourceType;

  if (-[NSString containsString:](self->_identifier, "containsString:", CFSTR("#")))
  {
    -[NSString componentsSeparatedByString:](self->_identifier, "componentsSeparatedByString:", CFSTR("#"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 2)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKFHIRIdentifier FHIRIdentifierWithString:error:](HKFHIRIdentifier, "FHIRIdentifierWithString:error:", v6, a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      resourceType = self->_resourceType;
      HKSensitiveLogItem(self->_identifier);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hk_assignError:code:format:", a3, 3, CFSTR("invalid FHIR identifier on %@: %@"), resourceType, v6);
      v7 = 0;
    }

  }
  else
  {
    v7 = (void *)-[HKFHIRIdentifier copy](self, "copy");
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKFHIRIdentifier resourceType](self, "resourceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ResourceType"));

  -[HKFHIRIdentifier identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Identifier"));

}

- (HKFHIRIdentifier)initWithCoder:(id)a3
{
  id v4;
  HKFHIRIdentifier *v5;
  uint64_t v6;
  NSString *resourceType;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKFHIRIdentifier;
  v5 = -[HKFHIRIdentifier init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ResourceType"));
    v6 = objc_claimAutoreleasedReturnValue();
    resourceType = v5->_resourceType;
    v5->_resourceType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  objc_super v23;

  v4 = a3;
  v5 = objc_opt_class();
  v23.receiver = self;
  v23.super_class = (Class)HKFHIRIdentifier;
  if (-[HKFHIRIdentifier isKindOfClass:](&v23, sel_isKindOfClass_, v5))
  {
    v6 = v4;
    -[HKFHIRIdentifier resourceType](self, "resourceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resourceType");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      objc_msgSend(v6, "resourceType");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_12;
      v11 = (void *)v10;
      -[HKFHIRIdentifier resourceType](self, "resourceType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resourceType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (!v14)
        goto LABEL_13;
    }
    -[HKFHIRIdentifier identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v16)
    {

LABEL_15:
      v15 = 1;
      goto LABEL_16;
    }
    v9 = (void *)v16;
    objc_msgSend(v6, "identifier");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      -[HKFHIRIdentifier identifier](self, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToString:", v20);

      if ((v21 & 1) != 0)
        goto LABEL_15;
LABEL_13:
      v15 = 0;
LABEL_16:

      goto LABEL_17;
    }
LABEL_12:

    goto LABEL_13;
  }
  v15 = 0;
LABEL_17:

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HKFHIRIdentifier resourceType](self, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKFHIRIdentifier identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v2;
  NSString *resourceType;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  resourceType = self->_resourceType;
  HKSensitiveLogItem(self->_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@(%@)"), resourceType, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)resourceType
{
  return self->_resourceType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_resourceType, 0);
}

@end
