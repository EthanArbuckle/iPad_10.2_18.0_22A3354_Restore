@implementation MPMediaConditionalPredicate

- (MPMediaConditionalPredicate)initWithConditionPredicate:(id)a3 thenPredicate:(id)a4 elsePredicate:(id)a5
{
  id v9;
  id v10;
  id v11;
  MPMediaConditionalPredicate *v12;
  MPMediaConditionalPredicate *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MPMediaConditionalPredicate;
  v12 = -[MPMediaConditionalPredicate init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conditionPredicate, a3);
    objc_storeStrong((id *)&v13->_thenPredicate, a4);
    objc_storeStrong((id *)&v13->_elsePredicate, a5);
  }

  return v13;
}

- (MPMediaConditionalPredicate)initWithCoder:(id)a3
{
  id v4;
  MPMediaConditionalPredicate *v5;
  uint64_t v6;
  MPMediaPredicate *conditionPredicate;
  uint64_t v8;
  MPMediaPredicate *thenPredicate;
  uint64_t v10;
  MPMediaPredicate *elsePredicate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPMediaConditionalPredicate;
  v5 = -[MPMediaConditionalPredicate init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conditionPredicate"));
    v6 = objc_claimAutoreleasedReturnValue();
    conditionPredicate = v5->_conditionPredicate;
    v5->_conditionPredicate = (MPMediaPredicate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thenPredicate"));
    v8 = objc_claimAutoreleasedReturnValue();
    thenPredicate = v5->_thenPredicate;
    v5->_thenPredicate = (MPMediaPredicate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("elsePredicate"));
    v10 = objc_claimAutoreleasedReturnValue();
    elsePredicate = v5->_elsePredicate;
    v5->_elsePredicate = (MPMediaPredicate *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  MPMediaPredicate *conditionPredicate;
  id v5;

  conditionPredicate = self->_conditionPredicate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", conditionPredicate, CFSTR("conditionPredicate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thenPredicate, CFSTR("thenPredicate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_elsePredicate, CFSTR("elsePredicate"));

}

- (MPMediaConditionalPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  MPMediaConditionalPredicate *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  MPMediaPredicate *conditionPredicate;
  void *v14;
  uint64_t v15;
  MPMediaPredicate *thenPredicate;
  void *v17;
  uint64_t v18;
  MPMediaPredicate *elsePredicate;
  void *v21;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaQuery.m"), 1557, CFSTR("Cannot decode object of type %@"), objc_opt_class());

  }
  v22.receiver = self;
  v22.super_class = (Class)MPMediaConditionalPredicate;
  v9 = -[MPMediaConditionalPredicate init](&v22, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "conditionalPredicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasConditionalPredicate"))
    {
      objc_msgSend(v10, "conditionalPredicate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      MPPCreateMediaPredicateFromProtocolPredicateAndLibrary(v11, v8);
      v12 = objc_claimAutoreleasedReturnValue();
      conditionPredicate = v9->_conditionPredicate;
      v9->_conditionPredicate = (MPMediaPredicate *)v12;

    }
    if (objc_msgSend(v10, "hasThenPredicate"))
    {
      objc_msgSend(v10, "thenPredicate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      MPPCreateMediaPredicateFromProtocolPredicateAndLibrary(v14, v8);
      v15 = objc_claimAutoreleasedReturnValue();
      thenPredicate = v9->_thenPredicate;
      v9->_thenPredicate = (MPMediaPredicate *)v15;

    }
    if (objc_msgSend(v10, "hasElsePredicate"))
    {
      objc_msgSend(v10, "elsePredicate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      MPPCreateMediaPredicateFromProtocolPredicateAndLibrary(v17, v8);
      v18 = objc_claimAutoreleasedReturnValue();
      elsePredicate = v9->_elsePredicate;
      v9->_elsePredicate = (MPMediaPredicate *)v18;

    }
  }

  return v9;
}

- (id)protobufferEncodableObjectFromLibrary:(id)a3
{
  id v4;
  MPPConditionalPredicate *v5;
  void *v6;
  void *v7;
  void *v8;
  MPPMediaPredicate *v9;

  v4 = a3;
  v5 = objc_alloc_init(MPPConditionalPredicate);
  -[MPMediaPredicate protobufferEncodableObjectFromLibrary:](self->_conditionPredicate, "protobufferEncodableObjectFromLibrary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPConditionalPredicate setConditionalPredicate:](v5, "setConditionalPredicate:", v6);

  -[MPMediaPredicate protobufferEncodableObjectFromLibrary:](self->_thenPredicate, "protobufferEncodableObjectFromLibrary:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPConditionalPredicate setThenPredicate:](v5, "setThenPredicate:", v7);

  -[MPMediaPredicate protobufferEncodableObjectFromLibrary:](self->_elsePredicate, "protobufferEncodableObjectFromLibrary:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPPConditionalPredicate setElsePredicate:](v5, "setElsePredicate:", v8);
  v9 = objc_alloc_init(MPPMediaPredicate);
  -[MPPMediaPredicate setType:](v9, "setType:", 3);
  -[MPPMediaPredicate setConditionalPredicate:](v9, "setConditionalPredicate:", v5);

  return v9;
}

- (MPMediaPredicate)conditionPredicate
{
  return self->_conditionPredicate;
}

- (MPMediaPredicate)thenPredicate
{
  return self->_thenPredicate;
}

- (MPMediaPredicate)elsePredicate
{
  return self->_elsePredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elsePredicate, 0);
  objc_storeStrong((id *)&self->_thenPredicate, 0);
  objc_storeStrong((id *)&self->_conditionPredicate, 0);
}

+ (id)predicateWithConditionPredicate:(id)a3 thenPredicate:(id)a4 elsePredicate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConditionPredicate:thenPredicate:elsePredicate:", v9, v8, v7);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_ML3PredicateForEntityTypeSelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0D51228];
  -[MPMediaConditionalPredicate conditionPredicate](self, "conditionPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __80__MPMediaConditionalPredicate_ML3Additions___ML3PredicateForEntityTypeSelector___block_invoke(a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaConditionalPredicate thenPredicate](self, "thenPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __80__MPMediaConditionalPredicate_ML3Additions___ML3PredicateForEntityTypeSelector___block_invoke(a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaConditionalPredicate elsePredicate](self, "elsePredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __80__MPMediaConditionalPredicate_ML3Additions___ML3PredicateForEntityTypeSelector___block_invoke(a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithConditionPredicate:thenPredicate:elsePredicate:", v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)ML3PredicateForTrack
{
  return -[MPMediaConditionalPredicate _ML3PredicateForEntityTypeSelector:](self, "_ML3PredicateForEntityTypeSelector:", a2);
}

- (id)ML3PredicateForContainer
{
  return -[MPMediaConditionalPredicate _ML3PredicateForEntityTypeSelector:](self, "_ML3PredicateForEntityTypeSelector:", a2);
}

id __80__MPMediaConditionalPredicate_ML3Additions___ML3PredicateForEntityTypeSelector___block_invoke(const char *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  if (a2)
  {
    v3 = a2;
    NSStringFromSelector(a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
