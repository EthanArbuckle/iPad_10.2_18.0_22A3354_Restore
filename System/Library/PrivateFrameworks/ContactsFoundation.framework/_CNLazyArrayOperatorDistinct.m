@implementation _CNLazyArrayOperatorDistinct

- (_CNLazyArrayOperatorDistinct)initWithInput:(id)a3
{
  _CNLazyArrayOperatorDistinct *v3;
  uint64_t v4;
  NSMutableSet *seenValues;
  _CNLazyArrayOperatorDistinct *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CNLazyArrayOperatorDistinct;
  v3 = -[_CNLazyArrayOperator initWithInput:](&v8, sel_initWithInput_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    seenValues = v3->_seenValues;
    v3->_seenValues = (NSMutableSet *)v4;

    v6 = v3;
  }

  return v3;
}

- (id)nextObject
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[_CNLazyArrayOperator input](self, "input");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    while (-[NSMutableSet containsObject:](self->_seenValues, "containsObject:", v4))
    {
      -[_CNLazyArrayOperator input](self, "input");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nextObject");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
      if (!v6)
        return v4;
    }
    -[NSMutableSet addObject:](self->_seenValues, "addObject:", v4);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seenValues, 0);
}

@end
