@implementation VSOptional

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

+ (VSOptional)optionalWithObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", v4);

  return (VSOptional *)v5;
}

- (VSOptional)initWithObject:(id)a3
{
  id v5;
  VSOptional *v6;
  VSOptional *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSOptional;
  v6 = -[VSOptional init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_object, a3);

  return v7;
}

- (id)unwrapWithFallback:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The fallback parameter must not be nil."));
  -[VSOptional object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = v4;
    if (v4)
    {
      v5 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The objectOrNil parameter must not be nil."));
      v5 = 0;
    }
  }

  return v5;
}

- (id)object
{
  return self->_object;
}

+ (id)decodableClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  v23 = objc_opt_class();
  v22 = objc_opt_class();
  v21 = objc_opt_class();
  v20 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  return (id)objc_msgSend(v25, "setWithObjects:", v24, v23, v22, v21, v20, v19, v18, v17, v16, v15, v14, v13, v2, v3, v4, v5, v6,
               v7,
               v8,
               v9,
               v10,
               v11,
               objc_opt_class(),
               0);
}

- (VSOptional)init
{
  return -[VSOptional initWithObject:](self, "initWithObject:", 0);
}

- (void)conditionallyUnwrapObject:(id)a3
{
  -[VSOptional conditionallyUnwrapObject:otherwise:](self, "conditionallyUnwrapObject:otherwise:", a3, 0);
}

- (void)conditionallyUnwrapObject:(id)a3 otherwise:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  v6 = (void (**)(_QWORD))a4;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The conditionalBlock parameter must not be nil."));
  -[VSOptional object](self, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8[2](v8, v7);
  }
  else if (v6)
  {
    v6[2](v6);
  }

}

- (id)forceUnwrapObject
{
  void *v3;
  id result;
  NSObject *v5;

  -[VSOptional object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    return v3;
  VSErrorLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[VSOptional forceUnwrapObject].cold.1((uint64_t)self, v5);

  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  VSRequireKeyedCoder(v4);
  -[VSOptional object](self, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("VSOptionalObject"));

}

- (VSOptional)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VSOptional *v7;

  v4 = a3;
  VSRequireKeyedCoder(v4);
  objc_msgSend((id)objc_opt_class(), "decodableClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("VSOptionalObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[VSOptional initWithObject:](self, "initWithObject:", v6);
  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VSOptional object](self, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[VSOptional object](self, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      v11 = 1;
    }
    else
    {
      v11 = 0;
      if (v8 && v9)
        v11 = objc_msgSend(v8, "isEqual:", v9);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VSOptional;
  -[VSOptional description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSOptional object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ object=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (void)forceUnwrapObject
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Failed to force unwrap optional %p.", (uint8_t *)&v2, 0xCu);
}

@end
