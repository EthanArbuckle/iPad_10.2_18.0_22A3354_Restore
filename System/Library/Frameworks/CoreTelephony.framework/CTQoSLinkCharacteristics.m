@implementation CTQoSLinkCharacteristics

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTQoSLinkCharacteristics bitRateMaxUL](self, "bitRateMaxUL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", bitRateMaxUL=%@"), v4);

  -[CTQoSLinkCharacteristics bitRateMaxDL](self, "bitRateMaxDL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", bitRateMaxDL=%@"), v5);

  -[CTQoSLinkCharacteristics bitRateGuaranteedUL](self, "bitRateGuaranteedUL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", bitRateGuaranteedUL=%@"), v6);

  -[CTQoSLinkCharacteristics bitRateGuaranteedDL](self, "bitRateGuaranteedDL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", bitRateGuaranteedDL=%@"), v7);

  return v3;
}

- (CTQoSLinkCharacteristics)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CTQoSLinkCharacteristics;
  return -[CTQoSLinkCharacteristics init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTQoSLinkCharacteristics bitRateMaxUL](self, "bitRateMaxUL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setBitRateMaxUL:", v7);

  -[CTQoSLinkCharacteristics bitRateMaxDL](self, "bitRateMaxDL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setBitRateMaxDL:", v9);

  -[CTQoSLinkCharacteristics bitRateGuaranteedUL](self, "bitRateGuaranteedUL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setBitRateGuaranteedUL:", v11);

  -[CTQoSLinkCharacteristics bitRateGuaranteedDL](self, "bitRateGuaranteedDL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setBitRateGuaranteedDL:", v13);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CTQoSLinkCharacteristics bitRateMaxUL](self, "bitRateMaxUL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bitRateMaxUL"));

  -[CTQoSLinkCharacteristics bitRateMaxDL](self, "bitRateMaxDL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bitRateMaxDL"));

  -[CTQoSLinkCharacteristics bitRateGuaranteedUL](self, "bitRateGuaranteedUL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("bitRateGuaranteedUL"));

  -[CTQoSLinkCharacteristics bitRateGuaranteedDL](self, "bitRateGuaranteedDL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("bitRateGuaranteedDL"));

}

- (CTQoSLinkCharacteristics)initWithCoder:(id)a3
{
  id v4;
  CTQoSLinkCharacteristics *v5;
  uint64_t v6;
  NSNumber *bitRateMaxUL;
  uint64_t v8;
  NSNumber *bitRateMaxDL;
  uint64_t v10;
  NSNumber *bitRateGuaranteedUL;
  uint64_t v12;
  NSNumber *bitRateGuaranteedDL;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTQoSLinkCharacteristics;
  v5 = -[CTQoSLinkCharacteristics init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bitRateMaxUL"));
    v6 = objc_claimAutoreleasedReturnValue();
    bitRateMaxUL = v5->_bitRateMaxUL;
    v5->_bitRateMaxUL = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bitRateMaxDL"));
    v8 = objc_claimAutoreleasedReturnValue();
    bitRateMaxDL = v5->_bitRateMaxDL;
    v5->_bitRateMaxDL = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bitRateGuaranteedUL"));
    v10 = objc_claimAutoreleasedReturnValue();
    bitRateGuaranteedUL = v5->_bitRateGuaranteedUL;
    v5->_bitRateGuaranteedUL = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bitRateGuaranteedDL"));
    v12 = objc_claimAutoreleasedReturnValue();
    bitRateGuaranteedDL = v5->_bitRateGuaranteedDL;
    v5->_bitRateGuaranteedDL = (NSNumber *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)bitRateMaxUL
{
  return self->_bitRateMaxUL;
}

- (void)setBitRateMaxUL:(id)a3
{
  objc_storeStrong((id *)&self->_bitRateMaxUL, a3);
}

- (NSNumber)bitRateMaxDL
{
  return self->_bitRateMaxDL;
}

- (void)setBitRateMaxDL:(id)a3
{
  objc_storeStrong((id *)&self->_bitRateMaxDL, a3);
}

- (NSNumber)bitRateGuaranteedUL
{
  return self->_bitRateGuaranteedUL;
}

- (void)setBitRateGuaranteedUL:(id)a3
{
  objc_storeStrong((id *)&self->_bitRateGuaranteedUL, a3);
}

- (NSNumber)bitRateGuaranteedDL
{
  return self->_bitRateGuaranteedDL;
}

- (void)setBitRateGuaranteedDL:(id)a3
{
  objc_storeStrong((id *)&self->_bitRateGuaranteedDL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitRateGuaranteedDL, 0);
  objc_storeStrong((id *)&self->_bitRateGuaranteedUL, 0);
  objc_storeStrong((id *)&self->_bitRateMaxDL, 0);
  objc_storeStrong((id *)&self->_bitRateMaxUL, 0);
}

@end
