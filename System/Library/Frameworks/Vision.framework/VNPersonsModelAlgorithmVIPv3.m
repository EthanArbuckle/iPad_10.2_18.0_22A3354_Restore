@implementation VNPersonsModelAlgorithmVIPv3

- (Class)faceModelClass
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  const __CFString *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)VNPersonsModelAlgorithmVIPv3;
  -[VNPersonsModelAlgorithm description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  v6 = -[VNPersonsModelAlgorithmVIPv3 indexType](self, "indexType");
  if (!v6)
  {
    v7 = CFSTR(" K-means");
    goto LABEL_5;
  }
  if (v6 == 1)
  {
    v7 = CFSTR(" single mean");
LABEL_5:
    objc_msgSend(v5, "appendString:", v7);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VNPersonsModelAlgorithmVIPv3 *v4;
  VNPersonsModelAlgorithmVIPv3 *v5;
  int64_t v6;
  BOOL v7;

  v4 = (VNPersonsModelAlgorithmVIPv3 *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNPersonsModelAlgorithmVIPv3 indexType](self, "indexType");
      v7 = v6 == -[VNPersonsModelAlgorithmVIPv3 indexType](v5, "indexType");

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNPersonsModelAlgorithmVIPv3;
  -[VNPersonsModelAlgorithm encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_indexType, CFSTR("indexType"));

}

- (VNPersonsModelAlgorithmVIPv3)initWithCoder:(id)a3
{
  id v4;
  VNPersonsModelAlgorithmVIPv3 *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VNPersonsModelAlgorithmVIPv3;
  v5 = -[VNPersonsModelAlgorithm initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_indexType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("indexType"));

  return v5;
}

- (int64_t)indexType
{
  return self->_indexType;
}

- (void)setIndexType:(int64_t)a3
{
  self->_indexType = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
