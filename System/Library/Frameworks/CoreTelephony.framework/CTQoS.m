@implementation CTQoS

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTQoS qci](self, "qci");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTQoS qci](self, "qci");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", qci=%@"), v5);

  }
  -[CTQoS bitRateMax](self, "bitRateMax");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTQoS bitRateMax](self, "bitRateMax");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", bitRateMax=%@"), v7);

  }
  -[CTQoS bitRateMin](self, "bitRateMin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CTQoS bitRateMin](self, "bitRateMin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", bitRateMin=%@"), v9);

  }
  -[CTQoS filters](self, "filters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CTQoS filters](self, "filters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", filters=%@"), v11);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTQoS qci](self, "qci");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setQci:", v6);

  -[CTQoS bitRateMax](self, "bitRateMax");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setBitRateMax:", v8);

  -[CTQoS bitRateMin](self, "bitRateMin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setBitRateMin:", v10);

  -[CTQoS filters](self, "filters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setFilters:", v12);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CTQoS qci](self, "qci");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("qci"));

  -[CTQoS bitRateMax](self, "bitRateMax");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bitRateMax"));

  -[CTQoS bitRateMin](self, "bitRateMin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("bitRateMin"));

  -[CTQoS filters](self, "filters");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("filters"));

}

- (CTQoS)initWithCoder:(id)a3
{
  id v4;
  CTQoS *v5;
  uint64_t v6;
  NSNumber *qci;
  uint64_t v8;
  NSNumber *bitRateMax;
  uint64_t v10;
  NSNumber *bitRateMin;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *filters;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CTQoS;
  v5 = -[CTQoS init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("qci"));
    v6 = objc_claimAutoreleasedReturnValue();
    qci = v5->_qci;
    v5->_qci = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bitRateMax"));
    v8 = objc_claimAutoreleasedReturnValue();
    bitRateMax = v5->_bitRateMax;
    v5->_bitRateMax = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bitRateMin"));
    v10 = objc_claimAutoreleasedReturnValue();
    bitRateMin = v5->_bitRateMin;
    v5->_bitRateMin = (NSNumber *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("filters"));
    v15 = objc_claimAutoreleasedReturnValue();
    filters = v5->_filters;
    v5->_filters = (NSArray *)v15;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)gbr
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  char v7;
  void *v8;

  -[CTQoS qci](self, "qci");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_9;
  -[CTQoS qci](self, "qci");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  v6 = 1;
  v7 = v5 - 65;
  if ((v5 - 65) > 0x14)
  {
LABEL_5:
    if ((v5 - 5) < 5)
      goto LABEL_6;
    if ((v5 - 1) < 4)
      goto LABEL_8;
LABEL_9:
    v8 = 0;
    return (NSNumber *)v8;
  }
  if (((1 << v7) & 0xFC7) == 0)
  {
    if (((1 << v7) & 0x1EC030) != 0)
    {
LABEL_6:
      v6 = 0;
      goto LABEL_8;
    }
    goto LABEL_5;
  }
LABEL_8:
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v6);
  return (NSNumber *)v8;
}

- (NSNumber)qci
{
  return self->_qci;
}

- (void)setQci:(id)a3
{
  objc_storeStrong((id *)&self->_qci, a3);
}

- (NSNumber)bitRateMax
{
  return self->_bitRateMax;
}

- (void)setBitRateMax:(id)a3
{
  objc_storeStrong((id *)&self->_bitRateMax, a3);
}

- (NSNumber)bitRateMin
{
  return self->_bitRateMin;
}

- (void)setBitRateMin:(id)a3
{
  objc_storeStrong((id *)&self->_bitRateMin, a3);
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_bitRateMin, 0);
  objc_storeStrong((id *)&self->_bitRateMax, 0);
  objc_storeStrong((id *)&self->_qci, 0);
}

@end
