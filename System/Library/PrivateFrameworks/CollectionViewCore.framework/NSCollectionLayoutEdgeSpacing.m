@implementation NSCollectionLayoutEdgeSpacing

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottom, 0);
  objc_storeStrong((id *)&self->_trailing, 0);
  objc_storeStrong((id *)&self->_top, 0);
  objc_storeStrong((id *)&self->_leading, 0);
}

- (CVCDirectionalEdgeInsets)edgeOutsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CVCDirectionalEdgeInsets result;

  -[NSCollectionLayoutSpacing spacing](self->_top, "spacing");
  v4 = v3;
  -[NSCollectionLayoutSpacing spacing](self->_leading, "spacing");
  v6 = v5;
  -[NSCollectionLayoutSpacing spacing](self->_bottom, "spacing");
  v8 = v7;
  -[NSCollectionLayoutSpacing spacing](self->_trailing, "spacing");
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.trailing = v10;
  result.bottom = v13;
  result.leading = v12;
  result.top = v11;
  return result;
}

- (BOOL)isSpacingFlexibleForEdge:(unint64_t)a3
{
  void *v3;
  char v4;

  -[NSCollectionLayoutEdgeSpacing _spacingForEdge:](self, "_spacingForEdge:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFlexibleSpacing");

  return v4;
}

- (double)spacingForEdge:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[NSCollectionLayoutEdgeSpacing _spacingForEdge:](self, "_spacingForEdge:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spacing");
  v5 = v4;

  return v5;
}

- (id)_spacingForEdge:(unint64_t)a3
{
  unint64_t v3;
  id v4;

  v3 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v3) & 1) != 0)
    v4 = *(id *)((char *)&self->super.isa + qword_1DD7865F8[v3]);
  else
    v4 = 0;
  return v4;
}

- (NSCollectionLayoutEdgeSpacing)initWithLeading:(id)a3 top:(id)a4 trailing:(id)a5 bottom:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSCollectionLayoutEdgeSpacing *v15;
  NSCollectionLayoutEdgeSpacing *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NSCollectionLayoutEdgeSpacing;
  v15 = -[NSCollectionLayoutEdgeSpacing init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_leading, a3);
    objc_storeStrong((id *)&v16->_top, a4);
    objc_storeStrong((id *)&v16->_trailing, a5);
    objc_storeStrong((id *)&v16->_bottom, a6);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLeading:top:trailing:bottom:", self->_leading, self->_top, self->_trailing, self->_bottom);
}

- (BOOL)isEqual:(id)a3
{
  NSCollectionLayoutEdgeSpacing *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (NSCollectionLayoutEdgeSpacing *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    -[NSCollectionLayoutEdgeSpacing leading](self, "leading");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCollectionLayoutEdgeSpacing leading](v4, "leading");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = __objectEqual(v5, v6);

    if (!v7)
      goto LABEL_7;
    -[NSCollectionLayoutEdgeSpacing top](self, "top");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCollectionLayoutEdgeSpacing top](v4, "top");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = __objectEqual(v8, v9);

    if (!v10)
      goto LABEL_7;
    -[NSCollectionLayoutEdgeSpacing bottom](self, "bottom");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCollectionLayoutEdgeSpacing bottom](v4, "bottom");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = __objectEqual(v11, v12);

    if (v13)
    {
      -[NSCollectionLayoutEdgeSpacing trailing](self, "trailing");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCollectionLayoutEdgeSpacing trailing](v4, "trailing");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = __objectEqual(v14, v15);

    }
    else
    {
LABEL_7:
      v16 = 0;
    }
  }

  return v16;
}

- (NSCollectionLayoutSpacing)trailing
{
  return self->_trailing;
}

- (NSCollectionLayoutSpacing)top
{
  return self->_top;
}

- (NSCollectionLayoutSpacing)leading
{
  return self->_leading;
}

- (NSCollectionLayoutSpacing)bottom
{
  return self->_bottom;
}

- (BOOL)_hasSpacing
{
  return -[NSCollectionLayoutSpacing _hasSpacing](self->_leading, "_hasSpacing")
      || -[NSCollectionLayoutSpacing _hasSpacing](self->_trailing, "_hasSpacing")
      || -[NSCollectionLayoutSpacing _hasSpacing](self->_top, "_hasSpacing")
      || -[NSCollectionLayoutSpacing _hasSpacing](self->_bottom, "_hasSpacing");
}

+ (id)defaultSpacing
{
  void *v3;
  void *v4;

  +[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLeading:top:trailing:bottom:", v3, v3, v3, v3);

  return v4;
}

- (id)description
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  NSCollectionLayoutSpacing *trailing;
  NSCollectionLayoutSpacing *bottom;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;

  -[NSCollectionLayoutEdgeSpacing edgeOutsets](self, "edgeOutsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v18 = *(_OWORD *)&self->_leading;
  trailing = self->_trailing;
  bottom = self->_bottom;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<leading=%@; top=%@; trailing=%@; bottom=%@; outsets=@{%@,%@,%@,%@}>"),
    v18,
    trailing,
    bottom,
    v12,
    v13,
    v14,
    v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_externalDescription
{
  double v3;
  double v4;
  double v5;
  double v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (-[NSCollectionLayoutSpacing isFixedSpacing](self->_leading, "isFixedSpacing")
    && (-[NSCollectionLayoutSpacing spacing](self->_leading, "spacing"), v3 == 0.0)
    && -[NSCollectionLayoutSpacing isFixedSpacing](self->_top, "isFixedSpacing")
    && (-[NSCollectionLayoutSpacing spacing](self->_top, "spacing"), v4 == 0.0)
    && -[NSCollectionLayoutSpacing isFixedSpacing](self->_trailing, "isFixedSpacing")
    && (-[NSCollectionLayoutSpacing spacing](self->_trailing, "spacing"), v5 == 0.0)
    && -[NSCollectionLayoutSpacing isFixedSpacing](self->_bottom, "isFixedSpacing")
    && (-[NSCollectionLayoutSpacing spacing](self->_bottom, "spacing"), v6 == 0.0))
  {
    v7 = CFSTR("0");
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[NSCollectionLayoutSpacing _externalDescription](self->_leading, "_externalDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCollectionLayoutSpacing _externalDescription](self->_top, "_externalDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCollectionLayoutSpacing _externalDescription](self->_trailing, "_externalDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCollectionLayoutSpacing _externalDescription](self->_bottom, "_externalDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<leading=%@; top=%@; trailing=%@; bottom=%@>"), v9, v10, v11, v12);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)flexibleSpacing:(double)a3
{
  void *v4;
  void *v5;

  +[NSCollectionLayoutSpacing flexibleSpacing:](NSCollectionLayoutSpacing, "flexibleSpacing:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLeading:top:trailing:bottom:", v4, v4, v4, v4);

  return v5;
}

+ (id)fixedSpacing:(double)a3
{
  void *v4;
  void *v5;

  +[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLeading:top:trailing:bottom:", v4, v4, v4, v4);

  return v5;
}

+ (NSCollectionLayoutEdgeSpacing)spacingForLeading:(NSCollectionLayoutSpacing *)leading top:(NSCollectionLayoutSpacing *)top trailing:(NSCollectionLayoutSpacing *)trailing bottom:(NSCollectionLayoutSpacing *)bottom
{
  NSCollectionLayoutSpacing *v10;
  NSCollectionLayoutSpacing *v11;
  NSCollectionLayoutSpacing *v12;
  NSCollectionLayoutSpacing *v13;
  void *v14;

  v10 = bottom;
  v11 = trailing;
  v12 = top;
  v13 = leading;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLeading:top:trailing:bottom:", v13, v12, v11, v10);

  return (NSCollectionLayoutEdgeSpacing *)v14;
}

- (BOOL)isSpacingFixedForEdge:(unint64_t)a3
{
  void *v3;
  char v4;

  -[NSCollectionLayoutEdgeSpacing _spacingForEdge:](self, "_spacingForEdge:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFixedSpacing");

  return v4;
}

@end
