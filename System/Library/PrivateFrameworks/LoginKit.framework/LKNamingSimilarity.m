@implementation LKNamingSimilarity

+ (id)namingSimilarityWithSimilarity:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setSimilarity:", a3);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LKNamingSimilarity)initWithCoder:(id)a3
{
  id v4;
  LKNamingSimilarity *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LKNamingSimilarity;
  v5 = -[LKNamingSimilarity init](&v7, sel_init);
  if (v5)
    -[LKNamingSimilarity setSimilarity:](v5, "setSimilarity:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("similarity")));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LKNamingSimilarity similarity](self, "similarity"), CFSTR("similarity"));

}

- (BOOL)isEqual:(id)a3
{
  LKNamingSimilarity *v4;
  LKNamingSimilarity *v5;
  BOOL v6;

  v4 = (LKNamingSimilarity *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[LKNamingSimilarity isEqualToLKNamingSimilarity:](self, "isEqualToLKNamingSimilarity:", v5);

  return v6;
}

- (BOOL)isEqualToLKNamingSimilarity:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[LKNamingSimilarity similarity](self, "similarity");
  v6 = objc_msgSend(v4, "similarity");

  return v5 == v6;
}

- (LKNamingSimilarity)init
{
  LKNamingSimilarity *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LKNamingSimilarity;
  result = -[LKNamingSimilarity init](&v3, sel_init);
  if (result)
    result->_similarity = 2;
  return result;
}

- (void)setSimilarity:(unint64_t)a3
{
  if (self->_similarity != a3)
    self->_similarity = a3;
}

- (unint64_t)similarity
{
  return self->_similarity;
}

@end
