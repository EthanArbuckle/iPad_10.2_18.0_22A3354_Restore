@implementation MOPersonRelationship

- (MOPersonRelationship)initWithRelationship:(unint64_t)a3 score:(double)a4 source:(id)a5
{
  id v8;
  MOPersonRelationship *v9;
  MOPersonRelationship *v10;
  uint64_t v11;
  NSString *source;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MOPersonRelationship;
  v9 = -[MOPersonRelationship init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_relationship = a3;
    v9->_score = a4;
    v11 = objc_msgSend(v8, "copy");
    source = v10->_source;
    v10->_source = (NSString *)v11;

  }
  return v10;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[MOPersonRelationship relationship](self, "relationship");
  -[MOPersonRelationship score](self, "score");
  v6 = v5;
  -[MOPersonRelationship source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MOPersonRelationship relationship , %lu, score , %.1f, source, %@>"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t relationship;
  id v5;

  relationship = self->_relationship;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", relationship, CFSTR("relationship"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("score"), self->_score);
  objc_msgSend(v5, "encodeObject:forKey:", self->_source, CFSTR("source"));

}

- (MOPersonRelationship)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  MOPersonRelationship *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("relationship"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("score"));
  v7 = v6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[MOPersonRelationship initWithRelationship:score:source:](self, "initWithRelationship:score:source:", v5, v8, v7);
  return v9;
}

- (unint64_t)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(unint64_t)a3
{
  self->_relationship = a3;
}

- (double)score
{
  return self->_score;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

@end
