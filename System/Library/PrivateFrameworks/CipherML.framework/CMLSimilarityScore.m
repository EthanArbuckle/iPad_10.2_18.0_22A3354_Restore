@implementation CMLSimilarityScore

- (CMLSimilarityScore)initWithIdentifier:(unint64_t)a3 score:(float)a4 metadata:(id)a5
{
  id v9;
  CMLSimilarityScore *v10;
  CMLSimilarityScore *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CMLSimilarityScore;
  v10 = -[CMLSimilarityScore init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_identifier = a3;
    v10->_score = a4;
    objc_storeStrong((id *)&v10->_metadata, a5);
  }

  return v11;
}

+ (id)scoreWithIdentifier:(unint64_t)a3 score:(float)a4
{
  id v6;
  double v7;

  v6 = objc_alloc((Class)objc_opt_class());
  *(float *)&v7 = a4;
  return (id)objc_msgSend(v6, "initWithIdentifier:score:metadata:", a3, 0, v7);
}

+ (id)scoreWithIdentifier:(unint64_t)a3 score:(float)a4 metadata:(id)a5
{
  id v7;
  id v8;
  double v9;
  void *v10;

  v7 = a5;
  v8 = objc_alloc((Class)objc_opt_class());
  *(float *)&v9 = a4;
  v10 = (void *)objc_msgSend(v8, "initWithIdentifier:score:metadata:", a3, v7, v9);

  return v10;
}

- (BOOL)isEqualToSimilarityScore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  unint64_t v10;
  float v11;
  float v12;
  float v13;
  BOOL v14;

  v4 = a3;
  -[CMLSimilarityScore metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    -[CMLSimilarityScore metadata](self, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    goto LABEL_5;
  }
  objc_msgSend(v4, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
  v9 = 1;
LABEL_5:
  v10 = -[CMLSimilarityScore identifier](self, "identifier");
  if (v10 == objc_msgSend(v4, "identifier"))
  {
    -[CMLSimilarityScore score](self, "score");
    v12 = v11;
    objc_msgSend(v4, "score");
    if (v12 == v13)
      v14 = v9;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  CMLSimilarityScore *v4;
  CMLSimilarityScore *v5;
  BOOL v6;

  v4 = (CMLSimilarityScore *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CMLSimilarityScore isEqualToSimilarityScore:](self, "isEqualToSimilarityScore:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", -[CMLSimilarityScore identifier](self, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[CMLSimilarityScore score](self, "score");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v4;
  -[CMLSimilarityScore metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLSimilarityScore)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  double v9;
  CMLSimilarityScore *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("identifier"));
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("score"));
  v7 = v6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = v7;
  v10 = -[CMLSimilarityScore initWithIdentifier:score:metadata:](self, "initWithIdentifier:score:metadata:", v5, v8, v9);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[CMLSimilarityScore identifier](self, "identifier"), CFSTR("identifier"));
  -[CMLSimilarityScore score](self, "score");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("score"));
  -[CMLSimilarityScore metadata](self, "metadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("metadata"));

}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
