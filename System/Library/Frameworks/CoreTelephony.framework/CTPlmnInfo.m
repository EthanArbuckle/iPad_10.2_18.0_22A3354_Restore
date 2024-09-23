@implementation CTPlmnInfo

- (CTPlmnInfo)initWithMcc:(MCC *)a3 mnc:
{
  MNC *v3;
  MNC *v4;
  CTPlmnInfo *v6;
  uint64_t v7;
  NSString *mcc;
  void *v9;
  _BOOL4 isThreeDigit;
  unsigned int IntValue;
  const __CFString *v12;
  uint64_t v13;
  NSString *mnc;
  objc_super v16;

  v4 = v3;
  v16.receiver = self;
  v16.super_class = (Class)CTPlmnInfo;
  v6 = -[CTPlmnInfo init](&v16, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%03d"), MCC::getIntValue(a3));
    v7 = objc_claimAutoreleasedReturnValue();
    mcc = v6->_mcc;
    v6->_mcc = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E0CB3940];
    isThreeDigit = MNC::isThreeDigit(v4);
    IntValue = MCC::getIntValue((MCC *)v4);
    if (isThreeDigit)
      v12 = CFSTR("%03d");
    else
      v12 = CFSTR("%02d");
    objc_msgSend(v9, "stringWithFormat:", v12, IntValue);
    v13 = objc_claimAutoreleasedReturnValue();
    mnc = v6->_mnc;
    v6->_mnc = (NSString *)v13;

  }
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTPlmnInfo mcc](self, "mcc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", mcc=%@"), v4);

  -[CTPlmnInfo mnc](self, "mnc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", mnc=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTPlmnInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (CTPlmnInfo *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTPlmnInfo mcc](self, "mcc");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTPlmnInfo mcc](v4, "mcc");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v6))
      {
        -[CTPlmnInfo mnc](self, "mnc");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlmnInfo mnc](v4, "mnc");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToString:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTPlmnInfo mcc](self, "mcc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMcc:", v6);

  -[CTPlmnInfo mnc](self, "mnc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setMnc:", v8);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CTPlmnInfo mcc](self, "mcc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("mcc"));

  -[CTPlmnInfo mnc](self, "mnc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("mnc"));

}

- (CTPlmnInfo)initWithCoder:(id)a3
{
  id v4;
  CTPlmnInfo *v5;
  uint64_t v6;
  NSString *mcc;
  uint64_t v8;
  NSString *mnc;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTPlmnInfo;
  v5 = -[CTPlmnInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mcc"));
    v6 = objc_claimAutoreleasedReturnValue();
    mcc = v5->_mcc;
    v5->_mcc = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mnc"));
    v8 = objc_claimAutoreleasedReturnValue();
    mnc = v5->_mnc;
    v5->_mnc = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)mcc
{
  return self->_mcc;
}

- (NSString)mnc
{
  return self->_mnc;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mnc, 0);
  objc_storeStrong((id *)&self->_mcc, 0);
}

@end
