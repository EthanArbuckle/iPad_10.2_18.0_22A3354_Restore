@implementation BRGeometry

+ (void)initialize
{
  id v3;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    objc_msgSend((id)objc_opt_class(), "br_setGatherBehaviour:", 2);
    objc_msgSend(MEMORY[0x24BDF6F90], "br_setGatherBehaviour:forClassesNamed:", 1, &unk_24E449B28);
    objc_msgSend(MEMORY[0x24BDF6F90], "br_setGatherBehaviour:forClassesNamed:", 2, &unk_24E449B40);
    objc_msgSend(MEMORY[0x24BDF6F90], "br_setGatherBehaviour:forClassesNamed:", 3, &unk_24E449B58);
  }
}

- (BRGeometry)initWithView:(id)a3
{
  id v4;
  BRGeometry *v5;

  v4 = a3;
  v5 = -[BRGeometry initWithView:rootView:](self, "initWithView:rootView:", v4, v4);
  if (v5)
    objc_msgSend(v4, "br_setLayerNames");

  return v5;
}

- (id)gatherSubviews:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "br_gatherBehaviour") == 2)
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v5 = (void *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          if (objc_msgSend((id)objc_opt_class(), "br_gatherBehaviour") == 3)
          {
            -[BRGeometry gatherSubviews:](self, "gatherSubviews:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObjectsFromArray:", v12);

          }
          else
          {
            objc_msgSend(v5, "addObject:", v11);
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (BRGeometry)initWithView:(id)a3 rootView:(id)a4
{
  id v6;
  id v7;
  BRGeometry *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  BRGeometry *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BRGeometry;
  v8 = -[BRGeometry init](&v26, sel_init);
  if (v8)
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRGeometry setName:](v8, "setName:", v10);

    objc_msgSend(v6, "bounds");
    objc_msgSend(v7, "convertRect:fromView:", v6);
    -[BRGeometry setAbsoluteFrame:](v8, "setAbsoluteFrame:");
    -[BRGeometry setHasAmbiguousLayout:](v8, "setHasAmbiguousLayout:", objc_msgSend(v6, "hasAmbiguousLayout"));
    -[BRGeometry setIsClipped:](v8, "setIsClipped:", objc_msgSend(v6, "br_viewIsClipped"));
    objc_msgSend(v6, "br_contentDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRGeometry setContentDescription:](v8, "setContentDescription:", v11);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend((id)objc_opt_class(), "br_gatherBehaviour");
    if ((unint64_t)(v13 - 1) >= 3)
    {
      if (v13)
      {
LABEL_16:
        -[BRGeometry setSubitems:](v8, "setSubitems:", v12);

        goto LABEL_17;
      }
    }
    else
    {
      NSLog(CFSTR("Initializing geometry from ignored view %@"), v6);
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[BRGeometry gatherSubviews:](v8, "gatherSubviews:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((objc_msgSend(v19, "isHidden") & 1) == 0 && objc_msgSend((id)objc_opt_class(), "br_gatherBehaviour") != 1)
          {
            v20 = -[BRGeometry initWithView:rootView:]([BRGeometry alloc], "initWithView:rootView:", v19, v7);
            objc_msgSend(v12, "addObject:", v20);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v16);
    }

    goto LABEL_16;
  }
LABEL_17:

  return v8;
}

- (BRGeometry)initWithCoder:(id)a3
{
  id v4;
  BRGeometry *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRGeometry;
  v5 = -[BRGeometry init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("frm"));
    -[BRGeometry setAbsoluteFrame:](v5, "setAbsoluteFrame:");
    -[BRGeometry setHasAmbiguousLayout:](v5, "setHasAmbiguousLayout:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("amb")));
    -[BRGeometry setIsClipped:](v5, "setIsClipped:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("clp")));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sub"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRGeometry setSubitems:](v5, "setSubitems:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nam"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRGeometry setName:](v5, "setName:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cdn"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRGeometry setContentDescription:](v5, "setContentDescription:", v11);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[BRGeometry absoluteFrame](self, "absoluteFrame");
  objc_msgSend(v4, "encodeCGRect:forKey:", CFSTR("frm"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BRGeometry hasAmbiguousLayout](self, "hasAmbiguousLayout"), CFSTR("amb"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BRGeometry isClipped](self, "isClipped"), CFSTR("clp"));
  -[BRGeometry subitems](self, "subitems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sub"));

  -[BRGeometry name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("nam"));

  -[BRGeometry contentDescription](self, "contentDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cdn"));

}

- (id)recursiveDescription
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x2207C9CBC]();
  appendDescription(self, v3, 0);
  objc_autoreleasePoolPop(v4);
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BRGeometry name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRGeometry absoluteFrame](self, "absoluteFrame");
  v6 = v5;
  -[BRGeometry absoluteFrame](self, "absoluteFrame");
  v8 = v7;
  -[BRGeometry absoluteFrame](self, "absoluteFrame");
  v10 = v9;
  -[BRGeometry absoluteFrame](self, "absoluteFrame");
  v12 = v11;
  if (-[BRGeometry hasAmbiguousLayout](self, "hasAmbiguousLayout"))
    v13 = CFSTR(" - AMBIGUOUS");
  else
    v13 = &stru_24E43B9D8;
  if (-[BRGeometry isClipped](self, "isClipped"))
    v14 = CFSTR(" - CLIPPED");
  else
    v14 = &stru_24E43B9D8;
  -[BRGeometry contentDescription](self, "contentDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" - \"%@\"), self->_contentDescription);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - {{%g, %g}, {%g, %g}}%@%@%@"), v4, v6, v8, v10, v12, v13, v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - {{%g, %g}, {%g, %g}}%@%@%@"), v4, v6, v8, v10, v12, v13, v14, &stru_24E43B9D8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (BOOL)isEqualToTemplate:(id)a3 diagnostic:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char appended;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x2207C9CBC]();
  appended = appendComparison(self, v6, v7, 0);
  objc_autoreleasePoolPop(v8);
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return appended ^ 1;
}

- (BOOL)isValidForGeometryValidation:(unint64_t)a3 offendingGeometry:(id *)a4
{
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 1) != 0 && -[BRGeometry isClipped](self, "isClipped"))
  {
    if (a4)
    {
LABEL_4:
      v7 = 0;
      *a4 = objc_retainAutorelease(self);
      return v7;
    }
    return 0;
  }
  if ((a3 & 2) != 0 && -[BRGeometry hasAmbiguousLayout](self, "hasAmbiguousLayout"))
  {
    if (a4)
      goto LABEL_4;
    return 0;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[BRGeometry subitems](self, "subitems", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "isValidForGeometryValidation:offendingGeometry:", a3, a4))
        {
          v7 = 0;
          goto LABEL_19;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_19:

  return v7;
}

- (id)data
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:", self);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGRect)absoluteFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_absoluteFrame.origin.x;
  y = self->_absoluteFrame.origin.y;
  width = self->_absoluteFrame.size.width;
  height = self->_absoluteFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAbsoluteFrame:(CGRect)a3
{
  self->_absoluteFrame = a3;
}

- (BOOL)hasAmbiguousLayout
{
  return self->_hasAmbiguousLayout;
}

- (void)setHasAmbiguousLayout:(BOOL)a3
{
  self->_hasAmbiguousLayout = a3;
}

- (BOOL)isClipped
{
  return self->_isClipped;
}

- (void)setIsClipped:(BOOL)a3
{
  self->_isClipped = a3;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (void)setContentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)subitems
{
  return self->_subitems;
}

- (void)setSubitems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subitems, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
