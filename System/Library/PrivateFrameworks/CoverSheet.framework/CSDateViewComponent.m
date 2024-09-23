@implementation CSDateViewComponent

- (CSDateViewComponent)init
{
  CSDateViewComponent *v2;
  CSDateViewComponent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSDateViewComponent;
  v2 = -[CSComponent init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSComponent setType:](v2, "setType:", 1);
    -[CSDateViewComponent setVibrantAndCentered:](v3, "setVibrantAndCentered:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v3;
}

- (id)pageIndex:(id)a3
{
  -[CSDateViewComponent setPageIndex:](self, "setPageIndex:", a3);
  return self;
}

- (id)vibrantAndCentered:(int64_t)a3
{
  -[CSDateViewComponent setVibrantAndCentered:](self, "setVibrantAndCentered:", a3);
  return self;
}

- (id)hidesTime:(BOOL)a3
{
  -[CSDateViewComponent setHidesTime:](self, "setHidesTime:", a3);
  return self;
}

- (void)setPageIndex:(id)a3
{
  void *v4;
  char v5;
  uint64_t v6;
  char v8;
  id v9;

  v9 = a3;
  -[CSDateViewComponent pageIndex](self, "pageIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    if (self)
    {
      v6 = objc_msgSend(v9, "integerValue");
      if ((unint64_t)(v6 - 2) < 0xFFFFFFFFFFFFFFFDLL || v9 == 0)
        v8 = 0;
      else
        v8 = v6 + 2;
    }
    else
    {
      v8 = 0;
    }
    -[CSDateViewComponent _setValueForInternalPageIndex:hidesTime:](self, v8, -[CSDateViewComponent hidesTime](self, "hidesTime"));
  }

}

- (uint64_t)_internalPageIndexForPageIndex:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = objc_msgSend(a2, "integerValue");
    if ((unint64_t)(v3 - 2) < 0xFFFFFFFFFFFFFFFDLL || a2 == 0)
      return 0;
    else
      return v3 + 2;
  }
  return result;
}

- (void)_setValueForInternalPageIndex:(int)a3 hidesTime:
{
  uint64_t v4;
  id v5;

  if (a1)
  {
    if (a3)
      v4 = 4;
    else
      v4 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4 & 0xFFFFFFFFFFFFFFFCLL | a2 & 3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:", v5);

  }
}

- (void)setHidesTime:(BOOL)a3
{
  _BOOL4 v3;
  char v5;

  v3 = a3;
  if (-[CSDateViewComponent hidesTime](self, "hidesTime") != a3
    || !-[CSComponent hasValueForProperty:](self, "hasValueForProperty:", 4))
  {
    v5 = -[CSDateViewComponent _internalPageIndex](self);
    -[CSDateViewComponent _setValueForInternalPageIndex:hidesTime:](self, v5, v3);
  }
}

- (void)_internalPageIndex
{
  void *v1;
  char v2;

  if (result)
  {
    objc_msgSend(result, "value");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "unsignedIntegerValue");

    return (void *)(v2 & 3);
  }
  return result;
}

- (void)setVibrantAndCentered:(int64_t)a3
{
  if (-[CSComponent flag](self, "flag") != a3)
    -[CSComponent setFlag:](self, "setFlag:", a3);
}

- (NSNumber)pageIndex
{
  void *v3;

  v3 = -[CSDateViewComponent _internalPageIndex](self);
  return (NSNumber *)-[CSDateViewComponent _pageIndexForInternalPageIndex:]((uint64_t)self, (uint64_t)v3);
}

- (id)_pageIndexForInternalPageIndex:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v3;
  void *v5;

  v5 = 0;
  if (a1 && (unint64_t)(a2 - 4) >= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2 - 2, v2, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)hidesTime
{
  void *v2;
  unint64_t v3;

  -[CSComponent value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (v3 >> 2) & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSDateViewComponent;
  v4 = -[CSComponent copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setStretch:", -[CSDateViewComponent stretch](self, "stretch"));
  return v4;
}

- (BOOL)stretch
{
  return self->_stretch;
}

- (void)setStretch:(BOOL)a3
{
  self->_stretch = a3;
}

@end
