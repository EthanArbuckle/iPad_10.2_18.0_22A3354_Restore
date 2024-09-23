@implementation VSFailable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_object, 0);
}

- (void)unwrapObject:(id)a3 error:(id)a4
{
  _QWORD *v6;
  int64_t v7;
  void *v8;
  void (*v9)(void);
  _QWORD *v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The objectHandler parameter must not be nil."));
    if (v6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The errorHandler parameter must not be nil."));
LABEL_3:
  v7 = -[VSFailable kind](self, "kind");
  if (v7 == 1)
  {
    -[VSFailable error](self, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void (*)(void))v6[2];
    goto LABEL_9;
  }
  if (!v7)
  {
    -[VSFailable object](self, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void (*)(void))v10[2];
LABEL_9:
    v9();

  }
}

- (id)object
{
  return self->_object;
}

- (int64_t)kind
{
  return self->_kind;
}

+ (id)failableWithObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", v4);

  return v5;
}

- (VSFailable)initWithObject:(id)a3
{
  id v5;
  VSFailable *v6;
  VSFailable *v7;
  objc_super v9;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The object parameter must not be nil."));
  v9.receiver = self;
  v9.super_class = (Class)VSFailable;
  v6 = -[VSFailable init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_kind = 0;
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  VSRequireKeyedCoder(v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[VSFailable kind](self, "kind"), CFSTR("VSFailableKindKey"));
  -[VSFailable object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("VSFailableObjectKey"));

  -[VSFailable error](self, "error");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("VSFailableErrorKey"));

}

- (VSFailable)initWithCoder:(id)a3
{
  id v4;
  VSFailable *v5;
  void *v6;
  uint64_t v7;
  id object;
  void *v9;
  uint64_t v10;
  NSError *error;
  objc_super v13;

  v4 = a3;
  VSRequireKeyedCoder(v4);
  v13.receiver = self;
  v13.super_class = (Class)VSFailable;
  v5 = -[VSFailable init](&v13, sel_init);
  if (v5)
  {
    v5->_kind = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("VSFailableKindKey"));
    objc_msgSend((id)objc_opt_class(), "decodableClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("VSFailableObjectKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    object = v5->_object;
    v5->_object = (id)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VSFailableErrorKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    error = v5->_error;
    v5->_error = (NSError *)v10;

  }
  return v5;
}

- (NSError)error
{
  return self->_error;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)decodableClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
}

+ (id)failableWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithError:", v4);

  return v5;
}

- (VSFailable)initWithError:(id)a3
{
  id v4;
  VSFailable *v5;
  VSFailable *v6;
  uint64_t v7;
  NSError *error;
  objc_super v10;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The error parameter must not be nil."));
  v10.receiver = self;
  v10.super_class = (Class)VSFailable;
  v5 = -[VSFailable init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_kind = 1;
    v7 = objc_msgSend(v4, "copy");
    error = v6->_error;
    v6->_error = (NSError *)v7;

  }
  return v6;
}

- (VSFailable)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (id)unwrappedWithError:(id *)a3
{
  id v3;
  _QWORD v5[5];
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  v5[4] = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__VSFailable_unwrappedWithError___block_invoke;
  v6[3] = &unk_1E939F458;
  v6[4] = &v7;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__VSFailable_unwrappedWithError___block_invoke_2;
  v5[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  -[VSFailable unwrapObject:error:](self, "unwrapObject:error:", v6, v5);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __33__VSFailable_unwrappedWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id __33__VSFailable_unwrappedWithError___block_invoke_2(uint64_t a1, id a2)
{
  id result;

  result = objc_retainAutorelease(a2);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

- (id)description
{
  id v3;
  int64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[VSFailable kind](self, "kind");
  if (v4 == 1)
    v5 = CFSTR("error");
  else
    v5 = 0;
  if (!v4)
    v5 = CFSTR("object");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("kind"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[VSFailable object](self, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("object"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[VSFailable error](self, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("error"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)MEMORY[0x1E0CB3940];
  v18.receiver = self;
  v18.super_class = (Class)VSFailable;
  -[VSFailable description](&v18, sel_description);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@ %@>"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
