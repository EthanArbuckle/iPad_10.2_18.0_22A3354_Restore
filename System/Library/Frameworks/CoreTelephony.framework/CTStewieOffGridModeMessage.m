@implementation CTStewieOffGridModeMessage

- (CTStewieOffGridModeMessage)initWithOffGridModeKey:(id)a3 error:(id *)p_isa
{
  id v7;
  void *v8;
  CTStewieOffGridModeMessage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!v7)
  {
    if (!p_isa)
      goto LABEL_12;
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("offGridModeKey is missing");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v11);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    p_isa = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(v7, "length") && objc_msgSend(v8, "length") != 16)
  {
    if (!p_isa)
      goto LABEL_12;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    v17 = CFSTR("offGridModeKey size is incorrect.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v13);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v15.receiver = self;
  v15.super_class = (Class)CTStewieOffGridModeMessage;
  v9 = -[CTStewieOffGridModeMessage init](&v15, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_offGridModeKey, a3);
    self = p_isa;
    p_isa = (id *)&self->super.isa;
  }
  else
  {
    self = 0;
  }
LABEL_12:

  return (CTStewieOffGridModeMessage *)p_isa;
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTStewieOffGridModeMessage offGridModeKey](self, "offGridModeKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", offGridModeKey size=%lu"), objc_msgSend(v4, "length"));

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isEqualToOther:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CTStewieOffGridModeMessage offGridModeKey](self, "offGridModeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "offGridModeKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[CTStewieOffGridModeMessage offGridModeKey](self, "offGridModeKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "offGridModeKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieOffGridModeMessage *v4;
  BOOL v5;

  v4 = (CTStewieOffGridModeMessage *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieOffGridModeMessage isEqualToOther:](self, "isEqualToOther:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTStewieOffGridModeMessage offGridModeKey](self, "offGridModeKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setOffGridModeKey:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTStewieOffGridModeMessage offGridModeKey](self, "offGridModeKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("offGridModeKey"));

}

- (CTStewieOffGridModeMessage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CTStewieOffGridModeMessage *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offGridModeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CTStewieOffGridModeMessage initWithOffGridModeKey:error:](self, "initWithOffGridModeKey:error:", v5, 0);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)offGridModeKey
{
  return self->_offGridModeKey;
}

- (void)setOffGridModeKey:(id)a3
{
  objc_storeStrong((id *)&self->_offGridModeKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offGridModeKey, 0);
}

@end
