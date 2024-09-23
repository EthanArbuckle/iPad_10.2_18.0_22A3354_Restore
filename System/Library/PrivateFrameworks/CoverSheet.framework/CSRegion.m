@implementation CSRegion

+ (id)regionForCoordinateSpace:(id)a3
{
  id v4;
  id v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc((Class)a1);
    objc_msgSend(v4, "bounds");
    v6 = (void *)objc_msgSend(v5, "initWithCoordinateSpace:withExtent:role:", v4, 0);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)regionForCoordinateSpace:(id)a3 withExtent:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;

  if (a3)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v9 = a3;
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCoordinateSpace:withExtent:role:", v9, 0, x, y, width, height);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (CSRegion)initWithCoordinateSpace:(id)a3 withExtent:(CGRect)a4 role:(int64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  CSRegion *v12;
  CSRegion *v13;
  id v14;
  CGSize v15;
  uint64_t v16;
  NSString *identifier;
  objc_super v19;
  CGRect v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSRegion;
  v12 = -[CSRegion init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_role = a5;
    v14 = objc_storeWeak((id *)&v12->_identity, v11);
    objc_storeWeak((id *)&v13->_coordinateSpace, v14);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    if (CGRectIsEmpty(v20))
    {
      v15 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      v13->_extent.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v13->_extent.size = v15;
    }
    else
    {
      v13->_extent.origin.x = x;
      v13->_extent.origin.y = y;
      v13->_extent.size.width = width;
      v13->_extent.size.height = height;
    }
    objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v11);
    v16 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

  }
  return v13;
}

- (id)regionForCoordinateSpace:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  int64_t v18;
  CSRegion *v19;

  v4 = a3;
  -[CSRegion coordinateSpace](self, "coordinateSpace");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v19 = self;
  }
  else
  {
    -[CSRegion extent](self, "extent");
    -[CSRegion convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v4);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[CSRegion identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSRegion identity](self, "identity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSRegion provider](self, "provider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CSRegion isReservedForHorizontalScrolling](self, "isReservedForHorizontalScrolling");
    v18 = -[CSRegion role](self, "role");
    +[CSRegion regionForCoordinateSpace:withExtent:](CSRegion, "regionForCoordinateSpace:withExtent:", v4, v7, v9, v11, v13);
    v19 = (CSRegion *)objc_claimAutoreleasedReturnValue();
    -[CSRegion setRole:](v19, "setRole:", v18);
    -[CSRegion setIdentifier:](v19, "setIdentifier:", v14);
    -[CSRegion setIdentity:](v19, "setIdentity:", v15);
    -[CSRegion setProvider:](v19, "setProvider:", v16);
    -[CSRegion setReservedForHorizontalScrolling:](v19, "setReservedForHorizontalScrolling:", v17);

  }
  return v19;
}

- (id)role:(int64_t)a3
{
  -[CSRegion setRole:](self, "setRole:", a3);
  return self;
}

- (BOOL)intersectsCoordinateSpace:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id WeakRetained;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGRect v27;
  CGRect v28;

  v4 = a3;
  if (-[CSRegion isHidden](self, "isHidden")
    || (-[CSRegion identity](self, "identity"), v5 = (id)objc_claimAutoreleasedReturnValue(), v5, v5 == v4)
    || CGRectIsNull(self->_extent))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fixedCoordinateSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "bounds");
    objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v4);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
    objc_msgSend(v9, "convertRect:fromCoordinateSpace:", WeakRetained, self->_extent.origin.x, self->_extent.origin.y, self->_extent.size.width, self->_extent.size.height);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v27.origin.x = v20;
    v27.origin.y = v22;
    v27.size.width = v24;
    v27.size.height = v26;
    v28.origin.x = v11;
    v28.origin.y = v13;
    v28.size.width = v15;
    v28.size.height = v17;
    v6 = CGRectIntersectsRect(v27, v28);

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CSRegion *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CSRegion *v10;
  void *v11;
  void *v12;

  v4 = [CSRegion alloc];
  -[CSRegion coordinateSpace](self, "coordinateSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSRegion extent](self, "extent");
  v10 = -[CSRegion initWithCoordinateSpace:withExtent:role:](v4, "initWithCoordinateSpace:withExtent:role:", v5, -[CSRegion role](self, "role"), v6, v7, v8, v9);

  -[CSRegion identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSRegion setIdentifier:](v10, "setIdentifier:", v11);

  -[CSRegion identity](self, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSRegion setIdentity:](v10, "setIdentity:", v12);

  -[CSRegion setReservedForHorizontalScrolling:](v10, "setReservedForHorizontalScrolling:", -[CSRegion isReservedForHorizontalScrolling](self, "isReservedForHorizontalScrolling"));
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CSRegion *v4;
  int64_t role;
  _BOOL4 hidden;
  _BOOL4 reservedForHorizontalScrolling;
  NSString *identifier;
  void *v9;
  id WeakRetained;
  void *v11;
  int v12;
  id v13;
  void *v14;
  char v15;

  v4 = (CSRegion *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    if (!-[CSRegion isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
      goto LABEL_10;
    role = self->_role;
    if (role != -[CSRegion role](v4, "role"))
      goto LABEL_10;
    hidden = self->_hidden;
    if (hidden != -[CSRegion isHidden](v4, "isHidden"))
      goto LABEL_10;
    -[CSRegion extent](v4, "extent");
    if (!BSRectEqualToRect())
      goto LABEL_10;
    reservedForHorizontalScrolling = self->_reservedForHorizontalScrolling;
    if (reservedForHorizontalScrolling != -[CSRegion isReservedForHorizontalScrolling](v4, "isReservedForHorizontalScrolling"))goto LABEL_10;
    identifier = self->_identifier;
    -[CSRegion identifier](v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(identifier) = -[NSString isEqualToString:](identifier, "isEqualToString:", v9);

    if (!(_DWORD)identifier)
      goto LABEL_10;
    WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
    -[CSRegion coordinateSpace](v4, "coordinateSpace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(WeakRetained, "isEqual:", v11);

    if (v12)
    {
      v13 = objc_loadWeakRetained((id *)&self->_identity);
      -[CSRegion identity](v4, "identity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

    }
    else
    {
LABEL_10:
      v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  return self->_role;
}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t role;
  const __CFString *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  role = self->_role;
  if (role > 3)
    v6 = CFSTR("(unknown)");
  else
    v6 = off_1E8E2FE20[role];
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("role"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[CSRegion isHidden](self, "isHidden"), CFSTR("hidden"), 1);
  if (!CGRectIsEmpty(self->_extent))
    v9 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("extent"), self->_extent.origin.x, self->_extent.origin.y, self->_extent.size.width, self->_extent.size.height);
  v10 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[CSRegion isReservedForHorizontalScrolling](self, "isReservedForHorizontalScrolling"), CFSTR("reservedForHorizontalScrolling"), 1);
  v11 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_identifier, CFSTR("identifier"), 1);
  objc_msgSend(v4, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  double y;
  double x;
  UICoordinateSpace **p_coordinateSpace;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  p_coordinateSpace = &self->_coordinateSpace;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_coordinateSpace);
  objc_msgSend(WeakRetained, "convertPoint:toCoordinateSpace:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  double y;
  double x;
  UICoordinateSpace **p_coordinateSpace;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  p_coordinateSpace = &self->_coordinateSpace;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_coordinateSpace);
  objc_msgSend(WeakRetained, "convertPoint:fromCoordinateSpace:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  UICoordinateSpace **p_coordinateSpace;
  id v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_coordinateSpace = &self->_coordinateSpace;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_coordinateSpace);
  objc_msgSend(WeakRetained, "convertRect:toCoordinateSpace:", v9, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  UICoordinateSpace **p_coordinateSpace;
  id v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_coordinateSpace = &self->_coordinateSpace;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_coordinateSpace);
  objc_msgSend(WeakRetained, "convertRect:fromCoordinateSpace:", v9, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGRect)extent
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_extent.origin.x;
  y = self->_extent.origin.y;
  width = self->_extent.size.width;
  height = self->_extent.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (UICoordinateSpace)coordinateSpace
{
  return (UICoordinateSpace *)objc_loadWeakRetained((id *)&self->_coordinateSpace);
}

- (UICoordinateSpace)identity
{
  return (UICoordinateSpace *)objc_loadWeakRetained((id *)&self->_identity);
}

- (void)setIdentity:(id)a3
{
  objc_storeWeak((id *)&self->_identity, a3);
}

- (id)provider
{
  return objc_loadWeakRetained(&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak(&self->_provider, a3);
}

- (BOOL)isReservedForHorizontalScrolling
{
  return self->_reservedForHorizontalScrolling;
}

- (void)setReservedForHorizontalScrolling:(BOOL)a3
{
  self->_reservedForHorizontalScrolling = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_provider);
  objc_destroyWeak((id *)&self->_identity);
  objc_destroyWeak((id *)&self->_coordinateSpace);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
