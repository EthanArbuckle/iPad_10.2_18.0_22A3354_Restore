@implementation HDRedactedFHIRResourceObject

- (id)_initWithResourceType:(id)a3 sourceURL:(id)a4 FHIRVersion:(id)a5 JSONObject:(id)a6
{
  id v10;
  HDRedactedFHIRResourceObject *v11;
  uint64_t v12;
  NSString *resourceType;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDRedactedFHIRResourceObject;
  v11 = -[HDFHIRJSONObject initWithJSONObject:sourceURL:FHIRVersion:](&v15, sel_initWithJSONObject_sourceURL_FHIRVersion_, a6, a4, a5);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    resourceType = v11->_resourceType;
    v11->_resourceType = (NSString *)v12;

  }
  return v11;
}

+ (id)resourceObjectWithFHIRJSONObject:(id)a3 redactedJSONObject:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "detectedResourceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "hk_safeStringForKeyPath:error:", CFSTR("id"), a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 3, CFSTR("Redacted FHIR resource cannot contain \"id\" in JSON"));
      v12 = 0;
    }
    else
    {
      v13 = objc_alloc((Class)a1);
      objc_msgSend(v8, "sourceURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "FHIRVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v13, "_initWithResourceType:sourceURL:FHIRVersion:JSONObject:", v10, v14, v15, v9);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDRedactedFHIRResourceObject;
  v4 = a3;
  -[HDFHIRJSONObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HDRedactedFHIRResourceObject resourceType](self, "resourceType", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ResourceType"));

}

- (HDRedactedFHIRResourceObject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HDRedactedFHIRResourceObject *v6;
  HDRedactedFHIRResourceObject *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ResourceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)HDRedactedFHIRResourceObject;
    v6 = -[HDFHIRJSONObject initWithCoder:](&v9, sel_initWithCoder_, v4);

    if (v6)
      objc_storeStrong((id *)&v6->_resourceType, v5);
    self = v6;
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");

    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *resourceType;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  resourceType = self->_resourceType;
  -[HDFHIRJSONObject FHIRVersion](self, "FHIRVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@, %@>"), v5, resourceType, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)resourceType
{
  return self->_resourceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceType, 0);
}

@end
