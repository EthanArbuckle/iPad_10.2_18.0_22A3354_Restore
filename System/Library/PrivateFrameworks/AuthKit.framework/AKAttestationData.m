@implementation AKAttestationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAttestationData)initWithDictionary:(id)a3
{
  id v4;
  AKAttestationData *v5;
  uint64_t v6;
  NSDictionary *attestationHeaders;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAttestationData;
  v5 = -[AKAttestationData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    attestationHeaders = v5->_attestationHeaders;
    v5->_attestationHeaders = (NSDictionary *)v6;

  }
  return v5;
}

- (AKAttestationData)initWithCoder:(id)a3
{
  id v4;
  AKAttestationData *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *attestationHeaders;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AKAttestationData;
  v5 = -[AKAttestationData init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_attestationHeaders"));
    v11 = objc_claimAutoreleasedReturnValue();
    attestationHeaders = v5->_attestationHeaders;
    v5->_attestationHeaders = (NSDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_attestationHeaders, CFSTR("_attestationHeaders"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSDictionary copy](self->_attestationHeaders, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary allKeys](self->_attestationHeaders, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)attestationHeaders
{
  return self->_attestationHeaders;
}

- (void)setAttestationHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attestationHeaders, 0);
}

@end
