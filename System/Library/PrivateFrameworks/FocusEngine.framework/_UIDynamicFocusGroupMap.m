@implementation _UIDynamicFocusGroupMap

- (_UIDynamicFocusGroupMap)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("-init is not a valid initializer for %@"), v6);

  return 0;
}

- (_UIDynamicFocusGroupMap)initWithCoordinateSpace:(id)a3
{
  id v4;
  _UIDynamicFocusGroupMap *v5;
  _FEFocusGroupMap *v6;
  uint64_t v7;
  _FEFocusGroupMap *impl;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIDynamicFocusGroupMap;
  v5 = -[_UIDynamicFocusGroupMap init](&v10, sel_init);
  if (v5)
  {
    v6 = [_FEFocusGroupMap alloc];
    v7 = -[_FEFocusGroupMap initWithItems:coordinateSpace:](v6, "initWithItems:coordinateSpace:", MEMORY[0x24BDBD1A8], v4);
    impl = v5->_impl;
    v5->_impl = (_FEFocusGroupMap *)v7;

  }
  return v5;
}

- (_UIDynamicFocusGroupMap)initWithBackingFocusGroupMap:(id)a3
{
  id v4;
  _UIDynamicFocusGroupMap *v5;
  uint64_t v6;
  _FEFocusGroupMap *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDynamicFocusGroupMap;
  v5 = -[_UIDynamicFocusGroupMap init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    impl = v5->_impl;
    v5->_impl = (_FEFocusGroupMap *)v6;

  }
  return v5;
}

- (id)focusGroupIdentifierForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_FEFocusGroupMap focusGroupForItem:](self->_impl, "focusGroupForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[_FEFocusGroupMap _indexEnvironment:](self->_impl, "_indexEnvironment:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
