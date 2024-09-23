@implementation NAIdentityCharacteristic

- (int64_t)role
{
  return self->_role;
}

- (id)retrievalBlock
{
  return self->_retrievalBlock;
}

- (id)hashBlock
{
  return self->_hashBlock;
}

- (id)comparisonBlock
{
  return self->_comparisonBlock;
}

- (void)setRetrievalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NAIdentityCharacteristic)init
{
  NAIdentityCharacteristic *v2;
  NAIdentityCharacteristic *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NAIdentityCharacteristic;
  v2 = -[NAIdentityCharacteristic init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NAIdentityCharacteristic setComparisonBlock:](v2, "setComparisonBlock:", &__block_literal_global_3);
    -[NAIdentityCharacteristic setHashBlock:](v3, "setHashBlock:", &__block_literal_global_9);
    -[NAIdentityCharacteristic setRole:](v3, "setRole:", 3);
  }
  return v3;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (void)setHashBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setComparisonBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NAIdentityCharacteristic retrievalBlock](self, "retrievalBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRetrievalBlock:", v5);

  -[NAIdentityCharacteristic comparisonBlock](self, "comparisonBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setComparisonBlock:", v6);

  -[NAIdentityCharacteristic hashBlock](self, "hashBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHashBlock:", v7);

  objc_msgSend(v4, "setRole:", -[NAIdentityCharacteristic role](self, "role"));
  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NAIdentityCharacteristic retrievalBlock](self, "retrievalBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  NAIdentityCharacteristic *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (NAIdentityCharacteristic *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NAIdentityCharacteristic retrievalBlock](v4, "retrievalBlock");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NAIdentityCharacteristic retrievalBlock](self, "retrievalBlock");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
      {
        -[NAIdentityCharacteristic hashBlock](v4, "hashBlock");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NAIdentityCharacteristic hashBlock](self, "hashBlock");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v9)
        {
          -[NAIdentityCharacteristic comparisonBlock](v4, "comparisonBlock");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NAIdentityCharacteristic comparisonBlock](self, "comparisonBlock");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v10 == v11;

        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  +[NADescriptionBuilder builderWithObject:](NADescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAIdentityCharacteristic retrievalBlock](self, "retrievalBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1B5E0F7A8]();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("retrievalBlock"));

  -[NAIdentityCharacteristic comparisonBlock](self, "comparisonBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1B5E0F7A8]();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("comparisonBlock"));

  -[NAIdentityCharacteristic hashBlock](self, "hashBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1B5E0F7A8]();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("hashBlock"));

  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hashBlock, 0);
  objc_storeStrong(&self->_comparisonBlock, 0);
  objc_storeStrong(&self->_retrievalBlock, 0);
}

@end
