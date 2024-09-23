@implementation HDConceptIndexState

- (HDConceptIndexState)init
{
  return -[HDConceptIndexState initWithGeneration:anchor:](self, "initWithGeneration:anchor:", 0, 0);
}

+ (id)stateWithGeneration:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithGeneration:anchor:", a3, 0);
}

- (HDConceptIndexState)initWithGeneration:(int64_t)a3 anchor:(id)a4
{
  id v6;
  HDConceptIndexState *v7;
  HDConceptIndexState *v8;
  uint64_t v9;
  HKQueryAnchor *anchor;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDConceptIndexState;
  v7 = -[HDConceptIndexState init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_generation = a3;
    v9 = objc_msgSend(v6, "copy");
    anchor = v8->_anchor;
    v8->_anchor = (HKQueryAnchor *)v9;

  }
  return v8;
}

- (id)copyWithAnchor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGeneration:anchor:", self->_generation, v4);

  return v5;
}

- (unint64_t)hash
{
  int64_t generation;

  generation = self->_generation;
  return -[HKQueryAnchor hash](self->_anchor, "hash") ^ generation;
}

- (BOOL)isEqual:(id)a3
{
  HDConceptIndexState *v4;
  HDConceptIndexState *v5;
  HKQueryAnchor *anchor;
  HKQueryAnchor *v7;
  BOOL v8;

  v4 = (HDConceptIndexState *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v8 = 0;
      if (self->_generation == v5->_generation)
      {
        anchor = self->_anchor;
        v7 = v5->_anchor;
        if (anchor == v7 || v7 && -[HKQueryAnchor isEqual:](anchor, "isEqual:"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDConceptIndexState)initWithCoder:(id)a3
{
  id v4;
  HDConceptIndexState *v5;
  uint64_t v6;
  HKQueryAnchor *anchor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDConceptIndexState;
  v5 = -[HDConceptIndexState init](&v9, sel_init);
  if (v5)
  {
    v5->_generation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Generation"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Anchor"));
    v6 = objc_claimAutoreleasedReturnValue();
    anchor = v5->_anchor;
    v5->_anchor = (HKQueryAnchor *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t generation;
  id v5;

  generation = self->_generation;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", generation, CFSTR("Generation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_anchor, CFSTR("Anchor"));

}

- (int64_t)generation
{
  return self->_generation;
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end
