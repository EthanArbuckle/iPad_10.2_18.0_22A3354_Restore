@implementation MPPConditionalPredicate

- (void)dealloc
{
  objc_super v3;

  -[MPPConditionalPredicate setConditionalPredicate:](self, "setConditionalPredicate:", 0);
  -[MPPConditionalPredicate setThenPredicate:](self, "setThenPredicate:", 0);
  -[MPPConditionalPredicate setElsePredicate:](self, "setElsePredicate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MPPConditionalPredicate;
  -[MPPConditionalPredicate dealloc](&v3, sel_dealloc);
}

- (BOOL)hasConditionalPredicate
{
  return self->_conditionalPredicate != 0;
}

- (BOOL)hasThenPredicate
{
  return self->_thenPredicate != 0;
}

- (BOOL)hasElsePredicate
{
  return self->_elsePredicate != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MPPConditionalPredicate;
  -[MPPConditionalPredicate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPConditionalPredicate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MPPMediaPredicate *conditionalPredicate;
  void *v5;
  MPPMediaPredicate *thenPredicate;
  void *v7;
  MPPMediaPredicate *elsePredicate;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  conditionalPredicate = self->_conditionalPredicate;
  if (conditionalPredicate)
  {
    -[MPPMediaPredicate dictionaryRepresentation](conditionalPredicate, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("conditionalPredicate"));

  }
  thenPredicate = self->_thenPredicate;
  if (thenPredicate)
  {
    -[MPPMediaPredicate dictionaryRepresentation](thenPredicate, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("thenPredicate"));

  }
  elsePredicate = self->_elsePredicate;
  if (elsePredicate)
  {
    -[MPPMediaPredicate dictionaryRepresentation](elsePredicate, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("elsePredicate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MPPConditionalPredicateReadFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  if (self->_conditionalPredicate)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D82B98]);
    -[MPPMediaPredicate writeTo:](self->_conditionalPredicate, "writeTo:", v4);
    objc_msgSend(v4, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:forTag:", v5, 1);

  }
  if (self->_thenPredicate)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D82B98]);
    -[MPPMediaPredicate writeTo:](self->_thenPredicate, "writeTo:", v6);
    objc_msgSend(v6, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:forTag:", v7, 2);

  }
  if (self->_elsePredicate)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D82B98]);
    -[MPPMediaPredicate writeTo:](self->_elsePredicate, "writeTo:", v8);
    objc_msgSend(v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:forTag:", v9, 3);

  }
}

- (void)copyTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[MPPConditionalPredicate hasConditionalPredicate](self, "hasConditionalPredicate"))
  {
    -[MPPConditionalPredicate conditionalPredicate](self, "conditionalPredicate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConditionalPredicate:", v4);

  }
  if (-[MPPConditionalPredicate hasThenPredicate](self, "hasThenPredicate"))
  {
    -[MPPConditionalPredicate thenPredicate](self, "thenPredicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setThenPredicate:", v5);

  }
  if (-[MPPConditionalPredicate hasElsePredicate](self, "hasElsePredicate"))
  {
    -[MPPConditionalPredicate elsePredicate](self, "elsePredicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setElsePredicate:", v6);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MPPMediaPredicate copyWithZone:](self->_conditionalPredicate, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[MPPMediaPredicate copyWithZone:](self->_thenPredicate, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[MPPMediaPredicate copyWithZone:](self->_elsePredicate, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  MPPMediaPredicate *conditionalPredicate;
  MPPMediaPredicate *thenPredicate;
  MPPMediaPredicate *elsePredicate;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((conditionalPredicate = self->_conditionalPredicate, !((unint64_t)conditionalPredicate | v4[1]))
     || -[MPPMediaPredicate isEqual:](conditionalPredicate, "isEqual:"))
    && ((thenPredicate = self->_thenPredicate, !((unint64_t)thenPredicate | v4[3]))
     || -[MPPMediaPredicate isEqual:](thenPredicate, "isEqual:")))
  {
    elsePredicate = self->_elsePredicate;
    if ((unint64_t)elsePredicate | v4[2])
      v8 = -[MPPMediaPredicate isEqual:](elsePredicate, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[MPPMediaPredicate hash](self->_conditionalPredicate, "hash");
  v4 = -[MPPMediaPredicate hash](self->_thenPredicate, "hash") ^ v3;
  return v4 ^ -[MPPMediaPredicate hash](self->_elsePredicate, "hash");
}

- (MPPMediaPredicate)conditionalPredicate
{
  return self->_conditionalPredicate;
}

- (void)setConditionalPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_conditionalPredicate, a3);
}

- (MPPMediaPredicate)thenPredicate
{
  return self->_thenPredicate;
}

- (void)setThenPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_thenPredicate, a3);
}

- (MPPMediaPredicate)elsePredicate
{
  return self->_elsePredicate;
}

- (void)setElsePredicate:(id)a3
{
  objc_storeStrong((id *)&self->_elsePredicate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thenPredicate, 0);
  objc_storeStrong((id *)&self->_elsePredicate, 0);
  objc_storeStrong((id *)&self->_conditionalPredicate, 0);
}

@end
