@implementation LNAvailabilityAnnotation

- (LNAvailabilityAnnotation)initWithIntroducedVersion:(id)a3 deprecatedVersion:(id)a4 obsoletedVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  LNAvailabilityAnnotation *v11;
  uint64_t v12;
  NSString *introducedVersion;
  uint64_t v14;
  NSString *deprecatedVersion;
  uint64_t v16;
  NSString *obsoletedVersion;
  LNAvailabilityAnnotation *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)LNAvailabilityAnnotation;
  v11 = -[LNAvailabilityAnnotation init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    introducedVersion = v11->_introducedVersion;
    v11->_introducedVersion = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    deprecatedVersion = v11->_deprecatedVersion;
    v11->_deprecatedVersion = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    obsoletedVersion = v11->_obsoletedVersion;
    v11->_obsoletedVersion = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obsoletedVersion, 0);
  objc_storeStrong((id *)&self->_deprecatedVersion, 0);
  objc_storeStrong((id *)&self->_introducedVersion, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNAvailabilityAnnotation introducedVersion](self, "introducedVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("introducedVersion"));

  -[LNAvailabilityAnnotation deprecatedVersion](self, "deprecatedVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("deprecatedVersion"));

  -[LNAvailabilityAnnotation obsoletedVersion](self, "obsoletedVersion");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("obsoletedVersion"));

}

- (NSString)obsoletedVersion
{
  return self->_obsoletedVersion;
}

- (NSString)introducedVersion
{
  return self->_introducedVersion;
}

- (NSString)deprecatedVersion
{
  return self->_deprecatedVersion;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNAvailabilityAnnotation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  LNAvailabilityAnnotation *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("introducedVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deprecatedVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("obsoletedVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[LNAvailabilityAnnotation initWithIntroducedVersion:deprecatedVersion:obsoletedVersion:](self, "initWithIntroducedVersion:deprecatedVersion:obsoletedVersion:", v5, v6, v7);
  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAvailabilityAnnotation introducedVersion](self, "introducedVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAvailabilityAnnotation deprecatedVersion](self, "deprecatedVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAvailabilityAnnotation obsoletedVersion](self, "obsoletedVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, introduced: %@, deprecated: %@, obsoleted: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[LNAvailabilityAnnotation introducedVersion](self, "introducedVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNAvailabilityAnnotation deprecatedVersion](self, "deprecatedVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNAvailabilityAnnotation obsoletedVersion](self, "obsoletedVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  LNAvailabilityAnnotation *v4;
  LNAvailabilityAnnotation *v5;
  LNAvailabilityAnnotation *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v4 = (LNAvailabilityAnnotation *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    -[LNAvailabilityAnnotation introducedVersion](self, "introducedVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAvailabilityAnnotation introducedVersion](v6, "introducedVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_25;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    -[LNAvailabilityAnnotation deprecatedVersion](self, "deprecatedVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAvailabilityAnnotation deprecatedVersion](v6, "deprecatedVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v12 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v12)
        goto LABEL_25;
    }
    -[LNAvailabilityAnnotation obsoletedVersion](self, "obsoletedVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAvailabilityAnnotation obsoletedVersion](v6, "obsoletedVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23)
        LOBYTE(v12) = objc_msgSend(v20, "isEqualToString:", v23);
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

+ (id)available
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithIntroducedVersion:deprecatedVersion:obsoletedVersion:", CFSTR("*"), 0, 0);
}

+ (id)deprecated
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithIntroducedVersion:deprecatedVersion:obsoletedVersion:", 0, CFSTR("*"), 0);
}

+ (id)unavailable
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithIntroducedVersion:deprecatedVersion:obsoletedVersion:", 0, 0, CFSTR("*"));
}

- (LNAvailabilityAnnotation)initWithIntroducedVersion:(id)a3 deprecatedVersion:(id)a4 available:(BOOL)a5 deprecated:(BOOL)a6
{
  return -[LNAvailabilityAnnotation initWithIntroducedVersion:deprecatedVersion:obsoletedVersion:](self, "initWithIntroducedVersion:deprecatedVersion:obsoletedVersion:", a3, a4, 0, a6);
}

@end
