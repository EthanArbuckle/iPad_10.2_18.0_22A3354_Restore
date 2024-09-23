@implementation CCUILayoutOptions

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (double)itemEdgeSize
{
  return self->_itemEdgeSize;
}

- (CCUILayoutOptions)init
{
  return (CCUILayoutOptions *)-[CCUILayoutOptions _initWithLayoutOptions:](self, "_initWithLayoutOptions:", 0);
}

- (id)_initWithLayoutOptions:(id)a3
{
  id v4;
  CCUILayoutOptions *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUILayoutOptions;
  v5 = -[CCUILayoutOptions init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "itemEdgeSize");
    v5->_itemEdgeSize = v6;
    objc_msgSend(v4, "itemSpacing");
    v5->_itemSpacing = v7;
  }

  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUILayoutOptions itemEdgeSize](self, "itemEdgeSize");
  v4 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("Item Edge Size"));
  -[CCUILayoutOptions itemSpacing](self, "itemSpacing");
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("Item Spacing"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUILayoutOptions itemEdgeSize](self, "itemEdgeSize");
  v4 = (id)objc_msgSend(v3, "appendCGFloat:");
  -[CCUILayoutOptions itemSpacing](self, "itemSpacing");
  v5 = (id)objc_msgSend(v3, "appendCGFloat:");
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CCUILayoutOptions *v4;
  CCUILayoutOptions *v5;
  BOOL v6;

  v4 = (CCUILayoutOptions *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[CCUILayoutOptions itemEdgeSize](self, "itemEdgeSize");
      -[CCUILayoutOptions itemEdgeSize](v5, "itemEdgeSize");
      if (BSCompareFloats())
      {
        v6 = 0;
      }
      else
      {
        -[CCUILayoutOptions itemSpacing](self, "itemSpacing");
        -[CCUILayoutOptions itemSpacing](v5, "itemSpacing");
        v6 = BSCompareFloats() == 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CCUILayoutOptions _initWithLayoutOptions:]([CCUIMutableLayoutOptions alloc], "_initWithLayoutOptions:", self);
}

@end
