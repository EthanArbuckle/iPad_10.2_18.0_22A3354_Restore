@implementation MIContainerToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIContainerToken)initWithContainer:(id)a3
{
  id v4;
  MIContainerToken *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSString *personaUniqueString;
  uint64_t v11;
  void *serializedContainerRepresentation;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MIContainerToken;
  v5 = -[MIContainerToken init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "rawContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "identifier");
      v7 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v7;

      objc_msgSend(v4, "personaUniqueString");
      v9 = objc_claimAutoreleasedReturnValue();
      personaUniqueString = v5->_personaUniqueString;
      v5->_personaUniqueString = (NSString *)v9;

      v5->_isTransient = objc_msgSend(v4, "isTransient");
      v5->_containerClass = objc_msgSend(v4, "containerClass");
      objc_msgSend(v6, "serializedContainerRepresentation");
      v11 = objc_claimAutoreleasedReturnValue();
      serializedContainerRepresentation = v5->_serializedContainerRepresentation;
      v5->_serializedContainerRepresentation = (NSData *)v11;
    }
    else
    {
      objc_msgSend(v4, "containerURL");
      v13 = objc_claimAutoreleasedReturnValue();
      serializedContainerRepresentation = v5->_containerURL;
      v5->_containerURL = (NSURL *)v13;
    }

  }
  return v5;
}

- (MIContainerToken)initWithCoder:(id)a3
{
  id v4;
  MIContainerToken *v5;
  uint64_t v6;
  NSURL *containerURL;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSString *personaUniqueString;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSData *serializedContainerRepresentation;
  MIContainerToken *v19;
  void *v20;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MIContainerToken;
  v5 = -[MIContainerToken init](&v23, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("containerURL")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerURL"));
      v6 = objc_claimAutoreleasedReturnValue();
      containerURL = v5->_containerURL;
      v5->_containerURL = (NSURL *)v6;

      if (!v5->_containerURL)
      {
        v9 = CFSTR("Serialized container did not encode containerURL");
        v10 = 52;
LABEL_12:
        _CreateAndLogError((uint64_t)"-[MIContainerToken initWithCoder:]", v10, CFSTR("MIInstallerErrorDomain"), 186, 0, 0, v9, v8, v22);
        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
      v11 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v11;

      if (!v5->_identifier)
      {
        v9 = CFSTR("Serialized container did not encode an identifier");
        v10 = 58;
        goto LABEL_12;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personaUniqueString"));
      v13 = objc_claimAutoreleasedReturnValue();
      personaUniqueString = v5->_personaUniqueString;
      v5->_personaUniqueString = (NSString *)v13;

      v5->_isTransient = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTransient"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerClass"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_containerClass = objc_msgSend(v15, "unsignedLongLongValue");

      if (v5->_containerClass - 15 <= 0xFFFFFFFFFFFFFFF1)
      {
        _CreateAndLogError((uint64_t)"-[MIContainerToken initWithCoder:]", 70, CFSTR("MIInstallerErrorDomain"), 186, 0, 0, CFSTR("Serialized container encoded invalid class: %llu"), v16, v5->_containerClass);
LABEL_13:
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "failWithError:", v20);

        v19 = 0;
        goto LABEL_14;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serializedContainerRepresentation"));
      v17 = objc_claimAutoreleasedReturnValue();
      serializedContainerRepresentation = v5->_serializedContainerRepresentation;
      v5->_serializedContainerRepresentation = (NSData *)v17;

      if (!v5->_serializedContainerRepresentation)
      {
        v9 = CFSTR("Serialized container did not encode the MobileContainerManager serialization of the container");
        v10 = 76;
        goto LABEL_12;
      }
    }
  }
  v19 = v5;
LABEL_14:

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[MIContainerToken serializedContainerRepresentation](self, "serializedContainerRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MIContainerToken identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

    -[MIContainerToken personaUniqueString](self, "personaUniqueString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("personaUniqueString"));

    objc_msgSend(v4, "encodeBool:forKey:", -[MIContainerToken isTransient](self, "isTransient"), CFSTR("isTransient"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MIContainerToken containerClass](self, "containerClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("containerClass"));

    -[MIContainerToken serializedContainerRepresentation](self, "serializedContainerRepresentation");
  }
  else
  {
    -[MIContainerToken containerURL](self, "containerURL");
  }
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:");

}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  -[MIContainerToken identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MIContainerToken personaUniqueString](self, "personaUniqueString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MIContainerToken isTransient](self, "isTransient");
    v9 = -[MIContainerToken containerClass](self, "containerClass");
    v10 = 78;
    if (v8)
      v10 = 89;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ identity:%@/%@ isTransient:%c containerClass:%llu>"), v6, v3, v7, v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MIContainerToken containerURL](self, "containerURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ containerPath:%@>"), v6, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (BOOL)isTransient
{
  return self->_isTransient;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (NSData)serializedContainerRepresentation
{
  return self->_serializedContainerRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedContainerRepresentation, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
