@implementation CTLazuliOperationResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", didSucceed = %d"), -[CTLazuliOperationResult didSucceed](self, "didSucceed"));
  -[CTLazuliOperationResult error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", error = %@"), v4);

  -[CTLazuliOperationResult operation](self, "operation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", operation = %@"), v5);

  -[CTLazuliOperationResult errorParameter](self, "errorParameter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", errorParameter = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliOperationResult:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  int v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;

  v6 = a3;
  v7 = -[CTLazuliOperationResult didSucceed](self, "didSucceed");
  if (v7 != objc_msgSend(v6, "didSucceed"))
  {
    v8 = 0;
    goto LABEL_19;
  }
  -[CTLazuliOperationResult error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v6, "error"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliOperationResult error](self, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqual:", v4) & 1) == 0)
    {

      v8 = 0;
      goto LABEL_16;
    }
    v19 = 1;
  }
  else
  {
    v18 = 0;
    v19 = 0;
  }
  -[CTLazuliOperationResult operation](self, "operation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "operation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToCTLazuliOperationID:", v11))
  {
    -[CTLazuliOperationResult errorParameter](self, "errorParameter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || (objc_msgSend(v6, "errorParameter"), (v17 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliOperationResult errorParameter](self, "errorParameter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorParameter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v13, "isEqualToCTLazuliOperationError:", v14);

      if (v12)
      {

        goto LABEL_23;
      }
      v16 = (void *)v17;
    }
    else
    {
      v16 = 0;
      v8 = 1;
    }

LABEL_23:
    if ((v19 & 1) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }

  v8 = 0;
  if (v19)
  {
LABEL_15:

  }
LABEL_16:
  if (!v9)

LABEL_19:
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliOperationResult *v4;
  CTLazuliOperationResult *v5;
  BOOL v6;

  v4 = (CTLazuliOperationResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliOperationResult isEqualToCTLazuliOperationResult:](self, "isEqualToCTLazuliOperationResult:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliOperationResult *v4;

  v4 = +[CTLazuliOperationResult allocWithZone:](CTLazuliOperationResult, "allocWithZone:", a3);
  -[CTLazuliOperationResult setDidSucceed:](v4, "setDidSucceed:", self->_didSucceed);
  -[CTLazuliOperationResult setError:](v4, "setError:", self->_error);
  -[CTLazuliOperationResult setOperation:](v4, "setOperation:", self->_operation);
  -[CTLazuliOperationResult setErrorParameter:](v4, "setErrorParameter:", self->_errorParameter);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_didSucceed, CFSTR("kDidSucceedKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_error, CFSTR("kErrorKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_operation, CFSTR("kOperationKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_errorParameter, CFSTR("kErrorParameterKey"));

}

- (CTLazuliOperationResult)initWithCoder:(id)a3
{
  id v4;
  CTLazuliOperationResult *v5;
  NSError *error;
  uint64_t v7;
  CTLazuliOperationID *operation;
  uint64_t v9;
  CTLazuliOperationError *errorParameter;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliOperationResult;
  v5 = -[CTLazuliOperationResult init](&v12, sel_init);
  if (v5)
  {
    v5->_didSucceed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kDidSucceedKey"));
    error = v5->_error;
    v5->_error = 0;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kOperationKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    operation = v5->_operation;
    v5->_operation = (CTLazuliOperationID *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kErrorParameterKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    errorParameter = v5->_errorParameter;
    v5->_errorParameter = (CTLazuliOperationError *)v9;

  }
  return v5;
}

- (CTLazuliOperationResult)initWithReflection:(const void *)a3
{
  CTLazuliOperationResult *v4;
  CTLazuliOperationResult *v5;
  NSError *error;
  CTLazuliOperationID *v7;
  CTLazuliOperationID *operation;
  CTLazuliOperationError *v9;
  uint64_t v10;
  CTLazuliOperationError *errorParameter;
  CTLazuliOperationResult *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CTLazuliOperationResult;
  v4 = -[CTLazuliOperationResult init](&v13, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  v4->_didSucceed = *(_BYTE *)a3;
  error = v4->_error;
  v4->_error = 0;

  v7 = -[CTLazuliOperationID initWithReflection:]([CTLazuliOperationID alloc], "initWithReflection:", (char *)a3 + 16);
  operation = v5->_operation;
  v5->_operation = v7;

  if (!*((_BYTE *)a3 + 44))
  {
    errorParameter = v5->_errorParameter;
    v5->_errorParameter = 0;
    goto LABEL_6;
  }
  v9 = [CTLazuliOperationError alloc];
  if (*((_BYTE *)a3 + 44))
  {
    v10 = -[CTLazuliOperationError initWithReflection:](v9, "initWithReflection:", (char *)a3 + 40);
    errorParameter = v5->_errorParameter;
    v5->_errorParameter = (CTLazuliOperationError *)v10;
LABEL_6:

    return v5;
  }
  result = (CTLazuliOperationResult *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CTLazuliOperationID)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CTLazuliOperationError)errorParameter
{
  return self->_errorParameter;
}

- (void)setErrorParameter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorParameter, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
