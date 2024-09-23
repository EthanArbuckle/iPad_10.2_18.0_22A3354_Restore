@implementation ASDIAPInfoResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iaps, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)iaps
{
  return self->_iaps;
}

- (ASDIAPInfoResponse)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ASDIAPInfoResponse *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("ASDIAPInfoResponseIAPsCodingKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ASDIAPInfoResponse initWithIAPs:](self, "initWithIAPs:", v8);
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ASDIAPInfoResponse;
  v5 = -[ASDRequestResponse copyWithZone:](&v9, sel_copyWithZone_);
  v6 = -[NSDictionary copyWithZone:](self->_iaps, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (ASDIAPInfoResponse)initWithIAPs:(id)a3
{
  id v5;
  ASDIAPInfoResponse *v6;
  ASDIAPInfoResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDIAPInfoResponse;
  v6 = -[ASDIAPInfoResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_iaps, a3);

  return v7;
}

- (ASDIAPInfoResponse)init
{
  return -[ASDIAPInfoResponse initWithIAPs:](self, "initWithIAPs:", MEMORY[0x1E0C9AA70]);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_iaps, CFSTR("ASDIAPInfoResponseIAPsCodingKey"));
}

@end
