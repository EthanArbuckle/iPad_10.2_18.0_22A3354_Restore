@implementation _FEFocusItemRegion

- (_FEFocusItemRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  return -[_FEFocusItemRegion initWithFrame:coordinateSpace:item:focusSystem:](self, "initWithFrame:coordinateSpace:item:focusSystem:", a4, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_FEFocusItemRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4 item:(id)a5 focusSystem:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  _FEFocusItemRegion *v15;
  _FEFocusItemRegion *v16;
  _FEFocusItemRegion *v17;
  id v18;
  id v19;
  char IsEligibleForFocusOcclusion;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  objc_class *v26;
  void *v27;
  __CFString *v28;
  char flags;
  char v30;
  id v32;
  objc_super v33;
  unsigned __int8 v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a5;
  v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)_FEFocusItemRegion;
  v15 = -[_FEFocusRegion initWithFrame:coordinateSpace:](&v33, sel_initWithFrame_coordinateSpace_, a4, x, y, width, height);
  v16 = v15;
  if (v15)
  {
    v17 = v15;
    v18 = v13;
    v19 = v14;
    objc_storeWeak((id *)&v17->_item, v18);
    v34 = 0;
    if (v18)
    {
      IsEligibleForFocusOcclusion = _FEFocusEnvironmentIsEligibleForFocusOcclusion(v18, &v34);
      v21 = v34;
    }
    else
    {
      v21 = 0;
      IsEligibleForFocusOcclusion = 0;
    }
    *(_BYTE *)&v17->_flags = *(_BYTE *)&v17->_flags & 0xFE | IsEligibleForFocusOcclusion;
    if (!v19 && v21)
    {
      +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _CommonInit(_FEFocusItemRegion *__strong, id<_FEFocusItem>  _Nullable __strong, _FEFocusSystem *__strong)");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v24 = (void *)MEMORY[0x24BDD17C8];
        v32 = v13;
        v25 = v19;
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@: %p>"), v27, v25);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v13 = v32;
      }
      else
      {
        v28 = CFSTR("(nil)");
      }
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("_FEFocusItemRegion.m"), 45, CFSTR("_FEFocusItemRegion got called with a nil focus system. Inferring focus system found %@"), v28);

      v21 = v34;
    }
    if (v21)
    {
      if (_FEFocusItemCanBecomeFocused(v18, v19))
        LOBYTE(v21) = 2;
      else
        LOBYTE(v21) = 0;
    }
    *(_BYTE *)&v17->_flags = *(_BYTE *)&v17->_flags & 0xFD | v21;
    flags = (char)v17->_flags;
    if ((flags & 2) != 0)
    {
      v30 = 0;
    }
    else
    {
      if (_FEFocusItemIsTransparentFocusItem(v18))
        v30 = 4;
      else
        v30 = 0;
      flags = (char)v17->_flags;
    }
    *(_BYTE *)&v17->_flags = flags & 0xFB | v30;

  }
  return v16;
}

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  uint64_t v5;
  id WeakRetained;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_FEFocusItemRegion;
  -[_FEFocusRegion _focusRegionWithAdjustedFrame:coordinateSpace:](&v8, sel__focusRegionWithAdjustedFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_storeWeak((id *)(v5 + 56), WeakRetained);

  *($4C59EE55ECBB4E4B9AB7F9871DE0ED47 *)(v5 + 48) = self->_flags;
  return (id)v5;
}

- (id)_descriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  __CFString *v8;
  id v9;
  id v10;
  id v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_FEFocusItemRegion;
  -[_FEFocusRegion _descriptionBuilder](&v13, sel__descriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FEFocusItemRegion item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("(nil)");
  }
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("item"));

  v10 = (id)objc_msgSend(v3, "appendBool:withName:", (*(_BYTE *)&self->_flags >> 1) & 1, CFSTR("focusable"));
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", (*(_BYTE *)&self->_flags >> 2) & 1, CFSTR("transparent"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  int v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_FEFocusItemRegion;
  if (-[_FEFocusRegion isEqual:](&v15, sel_isEqual_, v4))
  {
    v5 = (id *)v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_item);
    v7 = objc_loadWeakRetained(v5 + 7);
    v8 = WeakRetained;
    v9 = v7;
    v10 = v9;
    if (v8 != v9)
    {
      if (v8)
        v11 = v9 == 0;
      else
        v11 = 1;
      if (v11)
      {

      }
      else
      {
        v13 = objc_msgSend(v8, "isEqual:", v9);

        if (v13)
          goto LABEL_12;
      }
      v12 = 0;
LABEL_16:

      goto LABEL_17;
    }

LABEL_12:
    v12 = ((*((_BYTE *)v5 + 48) ^ *(_BYTE *)&self->_flags) & 3) == 0
       && ((*((_BYTE *)v5 + 48) ^ *(_BYTE *)&self->_flags) & 4) == 0;
    goto LABEL_16;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)_canOccludeRegionsBelow
{
  return (*(_BYTE *)&self->_flags & 5) == 1;
}

- (BOOL)_canBeOccludedByRegionsAbove
{
  BOOL v2;
  void *v3;

  if ((*(_BYTE *)&self->_flags & 2) == 0)
    return 0;
  -[_FEFocusItemRegion item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 != 0;

  return v2;
}

- (id)_defaultFocusItem
{
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    return 0;
  -[_FEFocusItemRegion item](self, "item");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)_focusableBoundaries
{
  void *v3;
  _BOOL4 v4;

  if ((*(_BYTE *)&self->_flags & 2) == 0)
    return 0;
  -[_FEFocusItemRegion item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return 32 * v4;
}

- (int64_t)_preferredDistanceComparisonType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_FEFocusItemRegion;
  return -[_FEFocusRegion _preferredDistanceComparisonType](&v3, sel__preferredDistanceComparisonType);
}

- (id)_debugAssociatedObject
{
  return objc_loadWeakRetained((id *)&self->_item);
}

- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3
{
  void *v4;

  v4 = -[_FEFocusItemRegion _focusableBoundaries](self, "_focusableBoundaries", a3);
  if (v4)
  {
    +[_FEFocusRegionDebugDrawingConfiguration itemConfigurationForRegion:](_FEFocusRegionDebugDrawingConfiguration, "itemConfigurationForRegion:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (_FEFocusItem)item
{
  return (_FEFocusItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
}

@end
