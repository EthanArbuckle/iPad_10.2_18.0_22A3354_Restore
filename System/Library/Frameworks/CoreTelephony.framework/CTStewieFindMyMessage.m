@implementation CTStewieFindMyMessage

- (CTStewieFindMyMessage)initWithData:(id)a3 error:(id *)p_isa
{
  id v7;
  void *v8;
  CTStewieFindMyMessage *v9;
  void *v10;
  void *v11;
  objc_super v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
  {
    v13.receiver = self;
    v13.super_class = (Class)CTStewieFindMyMessage;
    v9 = -[CTStewieFindMyMessage init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_encryptedData, a3);
      self = p_isa;
      p_isa = (id *)&self->super.isa;
    }
    else
    {
      self = 0;
    }
  }
  else if (p_isa)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = CFSTR("Data provided is either nil or empty");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v11);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    p_isa = 0;
  }

  return (CTStewieFindMyMessage *)p_isa;
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTStewieFindMyMessage encryptedData](self, "encryptedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", encryptedData=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isEqualToFindMyMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTStewieFindMyMessage encryptedData](self, "encryptedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encryptedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToData:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieFindMyMessage *v4;
  BOOL v5;

  v4 = (CTStewieFindMyMessage *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieFindMyMessage isEqualToFindMyMessage:](self, "isEqualToFindMyMessage:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTStewieFindMyMessage encryptedData](self, "encryptedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEncryptedData:", v5);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTStewieFindMyMessage encryptedData](self, "encryptedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("encryptedData"));

}

- (CTStewieFindMyMessage)initWithCoder:(id)a3
{
  id v4;
  CTStewieFindMyMessage *v5;
  void *v6;
  CTStewieFindMyMessage *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTStewieFindMyMessage;
  v5 = -[CTStewieFindMyMessage init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptedData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTStewieFindMyMessage setEncryptedData:](v5, "setEncryptedData:", v6);

    v7 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void)setEncryptedData:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedData, 0);
}

@end
