@implementation DKDiagnosticParameters

+ (id)diagnosticParametersWithDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

- (DKDiagnosticParameters)initWithDictionary:(id)a3
{
  id v4;
  DKDiagnosticParameters *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *parameters;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DKDiagnosticParameters;
  v5 = -[DKDiagnosticParameters init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("predicates"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v6 = (void *)MEMORY[0x24BDBD1B8];
    }
    objc_storeStrong((id *)&v5->_predicates, v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("specifications"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v7 = (void *)MEMORY[0x24BDBD1B8];
    }
    objc_storeStrong((id *)&v5->_specifications, v7);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameters"));
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v8 = (NSDictionary *)MEMORY[0x24BDBD1B8];
    }
    parameters = v5->_parameters;
    v5->_parameters = v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DKDiagnosticParameters)initWithCoder:(id)a3
{
  id v4;
  DKDiagnosticParameters *v5;
  DKDiagnosticParameters *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *predicates;
  void *v10;
  uint64_t v11;
  NSDictionary *specifications;
  void *v13;
  uint64_t v14;
  NSDictionary *parameters;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DKDiagnosticParameters;
  v5 = -[DKDiagnosticParameters init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    -[DKDiagnosticParameters _decoderClasses](v5, "_decoderClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("predicates"));
    v8 = objc_claimAutoreleasedReturnValue();
    predicates = v6->_predicates;
    v6->_predicates = (NSDictionary *)v8;

    -[DKDiagnosticParameters _decoderClasses](v6, "_decoderClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("specifications"));
    v11 = objc_claimAutoreleasedReturnValue();
    specifications = v6->_specifications;
    v6->_specifications = (NSDictionary *)v11;

    -[DKDiagnosticParameters _decoderClasses](v6, "_decoderClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("parameters"));
    v14 = objc_claimAutoreleasedReturnValue();
    parameters = v6->_parameters;
    v6->_parameters = (NSDictionary *)v14;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *predicates;
  id v5;

  predicates = self->_predicates;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", predicates, CFSTR("predicates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_specifications, CFSTR("specifications"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("parameters"));

}

- (id)_decoderClasses
{
  if (_decoderClasses_onceToken_0 != -1)
    dispatch_once(&_decoderClasses_onceToken_0, &__block_literal_global_4);
  return (id)_decoderClasses_decoderClasses_0;
}

void __41__DKDiagnosticParameters__decoderClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_decoderClasses_decoderClasses_0;
  _decoderClasses_decoderClasses_0 = v7;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDictionary copyWithZone:](self->_predicates, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSDictionary copyWithZone:](self->_specifications, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSDictionary copyWithZone:](self->_parameters, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (NSDictionary)predicates
{
  return self->_predicates;
}

- (NSDictionary)specifications
{
  return self->_specifications;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_specifications, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
}

@end
