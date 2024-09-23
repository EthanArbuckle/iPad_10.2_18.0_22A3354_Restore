@implementation DMFEndTransactionRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4850;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFEndTransactionRequest)initWithCoder:(id)a3
{
  id v4;
  DMFEndTransactionRequest *v5;
  void *v6;
  uint64_t v7;
  NSUUID *UUID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFEndTransactionRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("UUID"));
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFEndTransactionRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFEndTransactionRequest UUID](self, "UUID", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UUID"));

}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
