@implementation CKQuadTreeNode

- (CKQuadTreeNode)init
{
  return -[CKQuadTreeNode initWithBounds:](self, "initWithBounds:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
}

- (CKQuadTreeNode)initWithBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  CKQuadTreeNode *v10;
  CKQuadTreeNode *v11;
  uint64_t v12;
  NSMutableDictionary *userInfo;
  void *v15;
  void *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKQuadTree.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!CGRectIsNull(bounds)"));

  }
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v9 = CGRectGetHeight(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  if (v9 != CGRectGetWidth(v19))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKQuadTree.m"), 29, CFSTR("The bounds must be square"));

  }
  v17.receiver = self;
  v17.super_class = (Class)CKQuadTreeNode;
  v10 = -[CKQuadTreeNode init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_bounds.origin.x = x;
    v10->_bounds.origin.y = y;
    v10->_bounds.size.width = width;
    v10->_bounds.size.height = height;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    userInfo = v11->_userInfo;
    v11->_userInfo = (NSMutableDictionary *)v12;

  }
  return v11;
}

- (id)description
{
  NSValue *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  CGPoint v13;

  v3 = self->_point;
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[NSValue CGPointValue](v3, "CGPointValue");
    NSStringFromCGPoint(v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR(", point: %@"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_24E343BE0;
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_bounds);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p, bounds: %@%@>"), v9, self, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)debugDescriptionWithLevel:(int64_t)a3
{
  int64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[6];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3 + 1;
  -[CKQuadTreeNode debugDescriptionWithLevel:](self->_topRight, "debugDescriptionWithLevel:", a3 + 1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v5;
  v34[0] = v5;
  -[CKQuadTreeNode debugDescriptionWithLevel:](self->_topLeft, "debugDescriptionWithLevel:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[1] = v8;
  -[CKQuadTreeNode debugDescriptionWithLevel:](self->_bottomLeft, "debugDescriptionWithLevel:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[2] = v10;
  -[CKQuadTreeNode debugDescriptionWithLevel:](self->_bottomRight, "debugDescriptionWithLevel:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (!v11)
  if (!v9)

  if (!v7)
  if (!v6)

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObject:", v15);

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("\n"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 0x8000000000000000) == 0)
  {
    v18 = a3 + 1;
    do
    {
      objc_msgSend(v17, "appendString:", CFSTR("  | "));
      --v18;
    }
    while (v18);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v19 = v14;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v16, "appendFormat:", CFSTR("%@%@"), v17, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v21);
  }

  -[CKQuadTreeNode description](self, "description");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringByAppendingString:", v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)debugDescription
{
  return -[CKQuadTreeNode debugDescriptionWithLevel:](self, "debugDescriptionWithLevel:", 0);
}

- (NSArray)nodes
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", self->_topRight, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_topLeft)
    objc_msgSend(v3, "addObject:");
  if (self->_bottomLeft)
    objc_msgSend(v4, "addObject:");
  if (self->_bottomRight)
    objc_msgSend(v4, "addObject:");
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

- (BOOL)isLeaf
{
  return !self->_topLeft && !self->_topRight && !self->_bottomLeft && self->_bottomRight == 0;
}

- (id)nodeForPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CKQuadTreeNode **p_topRight;
  CKQuadTreeNode *v10;
  CKQuadTreeNode *topRight;
  CKQuadTreeNode *v12;
  CKQuadTreeNode *v13;
  double v14;
  double v15;
  double width;
  double height;
  CKQuadTreeNode *topLeft;
  CKQuadTreeNode *bottomLeft;
  CKQuadTreeNode *bottomRight;
  CKQuadTreeNode *v21;
  CGRect v23;
  CGRect v24;
  CGRect slice;
  CGRect remainder;
  CGPoint v27;
  CGPoint v28;
  CGPoint v29;
  CGPoint v30;

  y = a3.y;
  x = a3.x;
  memset(&remainder, 0, sizeof(remainder));
  memset(&slice, 0, sizeof(slice));
  memset(&v24, 0, sizeof(v24));
  memset(&v23, 0, sizeof(v23));
  v6 = CGRectGetWidth(self->_bounds) * 0.5;
  CGRectDivide(self->_bounds, &slice, &remainder, v6, CGRectMinXEdge);
  v7 = CGRectGetHeight(self->_bounds) * 0.5;
  CGRectDivide(slice, &slice, &v24, v7, CGRectMinYEdge);
  v8 = CGRectGetHeight(self->_bounds) * 0.5;
  CGRectDivide(remainder, &remainder, &v23, v8, CGRectMinYEdge);
  v27.x = x;
  v27.y = y;
  if (CGRectContainsPoint(remainder, v27))
  {
    topRight = self->_topRight;
    p_topRight = &self->_topRight;
    v10 = topRight;
    v12 = topRight;
    if (topRight)
      goto LABEL_14;
    v13 = [CKQuadTreeNode alloc];
    v14 = remainder.origin.x;
    v15 = remainder.origin.y;
    width = remainder.size.width;
    height = remainder.size.height;
    goto LABEL_13;
  }
  v28.x = x;
  v28.y = y;
  if (CGRectContainsPoint(slice, v28))
  {
    topLeft = self->_topLeft;
    p_topRight = &self->_topLeft;
    v10 = topLeft;
    v12 = topLeft;
    if (topLeft)
      goto LABEL_14;
    v13 = [CKQuadTreeNode alloc];
    v14 = slice.origin.x;
    v15 = slice.origin.y;
    width = slice.size.width;
    height = slice.size.height;
    goto LABEL_13;
  }
  v29.x = x;
  v29.y = y;
  if (CGRectContainsPoint(v24, v29))
  {
    bottomLeft = self->_bottomLeft;
    p_topRight = &self->_bottomLeft;
    v10 = bottomLeft;
    v12 = bottomLeft;
    if (bottomLeft)
      goto LABEL_14;
    v13 = [CKQuadTreeNode alloc];
    v14 = v24.origin.x;
    v15 = v24.origin.y;
    width = v24.size.width;
    height = v24.size.height;
    goto LABEL_13;
  }
  v30.x = x;
  v30.y = y;
  if (!CGRectContainsPoint(v23, v30))
  {
    v21 = 0;
    return v21;
  }
  bottomRight = self->_bottomRight;
  p_topRight = &self->_bottomRight;
  v10 = bottomRight;
  v12 = bottomRight;
  if (!bottomRight)
  {
    v13 = [CKQuadTreeNode alloc];
    v15 = v23.origin.y;
    v14 = v23.origin.x;
    height = v23.size.height;
    width = v23.size.width;
LABEL_13:
    v12 = -[CKQuadTreeNode initWithBounds:](v13, "initWithBounds:", v14, v15, width, height, *(_OWORD *)&v23.origin, *(_OWORD *)&v23.size);
  }
LABEL_14:
  objc_storeStrong((id *)p_topRight, v12);
  v21 = v12;
  if (!v10)

  return v21;
}

- (void)insertPoint:(CGPoint)a3
{
  double y;
  double x;
  NSValue *point;
  NSValue *v8;
  NSValue *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  NSValue *v15;
  void *v16;
  NSValue *v17;

  y = a3.y;
  x = a3.x;
  if (!CGRectContainsPoint(self->_bounds, a3))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKQuadTree.m"), 99, CFSTR("You can only insert points within the calculated bounds"));

  }
  point = self->_point;
  if (!point)
  {
    if (-[CKQuadTreeNode isLeaf](self, "isLeaf"))
    {
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, y);
      v8 = (NSValue *)objc_claimAutoreleasedReturnValue();
      v9 = self->_point;
      self->_point = v8;
      goto LABEL_11;
    }
    point = self->_point;
  }
  -[NSValue CGPointValue](point, "CGPointValue");
  v11 = v10;
  v13 = v12;
  if (-[CKQuadTreeNode isLeaf](self, "isLeaf") && vabdd_f64(x, v11) + vabdd_f64(y, v13) > 0.00999999978)
  {
    -[CKQuadTreeNode nodeForPoint:](self, "nodeForPoint:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertPoint:", v11, v13);

    v15 = self->_point;
    self->_point = 0;

  }
  -[CKQuadTreeNode nodeForPoint:](self, "nodeForPoint:", x, y);
  v17 = (NSValue *)objc_claimAutoreleasedReturnValue();
  -[NSValue insertPoint:](v17, "insertPoint:", x, y);
  v9 = v17;
LABEL_11:

}

- (void)visit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && ((*((uint64_t (**)(id, CKQuadTreeNode *))v4 + 2))(v4, self) & 1) == 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[CKQuadTreeNode nodes](self, "nodes", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "visit:", v5);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_userInfo, "setObject:forKey:", a3, a4);
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_userInfo, "objectForKey:", a3);
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSValue)point
{
  return self->_point;
}

- (void)setPoint:(id)a3
{
  objc_storeStrong((id *)&self->_point, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_point, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_bottomRight, 0);
  objc_storeStrong((id *)&self->_bottomLeft, 0);
  objc_storeStrong((id *)&self->_topLeft, 0);
  objc_storeStrong((id *)&self->_topRight, 0);
}

@end
