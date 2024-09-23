@implementation EQKitVBox

- (EQKitVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4
{
  id v6;
  EQKitVBox *v7;
  unint64_t v8;
  unint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EQKitVBox;
  v7 = -[EQKitCompoundBox initWithChildBoxes:](&v11, sel_initWithChildBoxes_, v6);
  if (v7)
  {
    v8 = objc_msgSend(v6, "count");
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 > a4)
      v9 = a4;
    v7->_pivotIndex = v9;
  }

  return v7;
}

- (EQKitVBox)initWithChildBoxes:(id)a3
{
  return -[EQKitVBox initWithChildBoxes:pivotIndex:](self, "initWithChildBoxes:pivotIndex:", a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EQKitCompoundBox childBoxes](self, "childBoxes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithChildBoxes:pivotIndex:", v5, -[EQKitVBox pivotIndex](self, "pivotIndex"));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EQKitVBox;
  if (-[EQKitCompoundBox isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[EQKitVBox pivotIndex](self, "pivotIndex");
    v7 = v6 == objc_msgSend(v5, "pivotIndex");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  y = a4.y;
  x = a4.x;
  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EQKitVBox;
  -[EQKitBox renderIntoContext:offset:](&v23, sel_renderIntoContext_offset_, v7, x, y);
  if (v7)
  {
    -[EQKitCompoundBox height](self, "height");
    v9 = v8;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[EQKitCompoundBox childBoxes](self, "childBoxes", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = y - v9;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v15, "layoutHeight");
          v17 = v12 + v16;
          objc_msgSend(v15, "renderIntoContext:offset:", v7, x, v17);
          objc_msgSend(v15, "layoutDepth");
          v12 = v17 + v18;
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v11);
    }

  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  double v8;
  double v9;
  void *v10;
  char v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  char v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  y = a4.y;
  x = a4.x;
  v27 = *MEMORY[0x24BDAC8D0];
  -[EQKitCompoundBox height](self, "height");
  if ((*((_DWORD *)a3 + 6) | 2) == 2)
  {
    v9 = v8;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[EQKitCompoundBox childBoxes](self, "childBoxes", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = y - v9;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v16, "layoutHeight");
          v18 = v13 + v17;
          v19 = objc_msgSend(v16, "appendOpticalAlignToSpec:offset:", a3, x, v18);
          objc_msgSend(v16, "layoutDepth");
          v11 |= v19;
          v13 = v18 + v20;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

  }
  else
  {
    v11 = 0;
  }
  return v11 & 1;
}

- (id)hitTest:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  void *v15;
  double v16;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  y = a3.y;
  x = a3.x;
  v24 = *MEMORY[0x24BDAC8D0];
  -[EQKitCompoundBox height](self, "height");
  v7 = v6;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[EQKitCompoundBox childBoxes](self, "childBoxes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v7 - y;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "height");
        objc_msgSend(v13, "hitTest:", x, v14 - v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {

          return v15;
        }
        objc_msgSend(v13, "vsize");
        v10 = v10 - v16;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }

  v18.receiver = self;
  v18.super_class = (Class)EQKitVBox;
  -[EQKitBox hitTest:](&v18, sel_hitTest_, x, y);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  return v15;
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  EQKitVBox *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  CGAffineTransform v22;
  CGAffineTransform v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = (EQKitVBox *)a4;
  if (v6 == self)
  {
    v18 = 1;
  }
  else
  {
    -[EQKitCompoundBox height](self, "height");
    v8 = v7;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[EQKitCompoundBox childBoxes](self, "childBoxes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = -v8;
      v12 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v14, "layoutHeight");
          v16 = v11 + v15;
          if (objc_msgSend(v14, "p_getTransform:fromDescendant:", a3, v6))
          {
            v19 = *(_OWORD *)&a3->c;
            *(_OWORD *)&v22.a = *(_OWORD *)&a3->a;
            *(_OWORD *)&v22.c = v19;
            *(_OWORD *)&v22.tx = *(_OWORD *)&a3->tx;
            CGAffineTransformTranslate(&v23, &v22, 0.0, v16);
            v20 = *(_OWORD *)&v23.c;
            *(_OWORD *)&a3->a = *(_OWORD *)&v23.a;
            *(_OWORD *)&a3->c = v20;
            *(_OWORD *)&a3->tx = *(_OWORD *)&v23.tx;
            v18 = 1;
            goto LABEL_12;
          }
          objc_msgSend(v14, "layoutDepth");
          v11 = v16 + v17;
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v10)
          continue;
        break;
      }
    }
    v18 = 0;
LABEL_12:

  }
  return v18;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitCompoundBox height](self, "height");
  v6 = v5;
  -[EQKitCompoundBox depth](self, "depth");
  v8 = v7;
  -[EQKitCompoundBox width](self, "width");
  v10 = v9;
  -[EQKitCompoundBox childBoxes](self, "childBoxes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f childBoxes=%@ pivotIndex=%lu"), v4, self, v6, v8, v10, v11, -[EQKitVBox pivotIndex](self, "pivotIndex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  id v21;

  *a3 = 0.0;
  *a4 = 0.0;
  *a5 = 0.0;
  if (-[EQKitVBox pivotIndex](self, "pivotIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EQKitCompoundBox childBoxes](self, "childBoxes");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v21, "count");
    if (v9)
    {
      v10 = -[EQKitVBox pivotIndex](self, "pivotIndex");
      v11 = v10;
      v12 = 0;
      if (v10 >= v9 - 1)
        v13 = v9 - 1;
      else
        v13 = v10;
      do
      {
        objc_msgSend(v21, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v12 >= v13)
        {
          if (v12 <= v13)
          {
            if (v13)
              objc_msgSend(v14, "layoutHeight");
            else
              objc_msgSend(v14, "height");
            *a3 = v18 + *a3;
            if (v9 - 1 <= v11)
              objc_msgSend(v15, "depth");
            else
              objc_msgSend(v15, "layoutDepth");
          }
          else
          {
            objc_msgSend(v14, "layoutVSize");
          }
          v17 = a4;
        }
        else
        {
          objc_msgSend(v14, "layoutVSize");
          v17 = a3;
        }
        *v17 = v16 + *v17;
        v19 = *a5;
        objc_msgSend(v15, "width");
        if (v19 >= v20)
          v20 = v19;
        *a5 = v20;

        ++v12;
      }
      while (v9 != v12);
    }

  }
}

- (CGRect)p_cacheErasableBounds
{
  CGFloat height;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat x;
  double y;
  CGFloat rect;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;
  CGRect v42;

  v37 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF090];
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  rect = *(double *)(MEMORY[0x24BDBF090] + 16);
  -[EQKitCompoundBox height](self, "height");
  v5 = v4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[EQKitCompoundBox childBoxes](self, "childBoxes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = -v5;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v11, "layoutHeight");
        v13 = v12;
        objc_msgSend(v11, "erasableBounds");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        objc_msgSend(v11, "layoutDepth");
        v23 = v22;
        v38.origin.x = x;
        v38.origin.y = y;
        v38.size.width = rect;
        v38.size.height = height;
        v24 = v8 + v13;
        if (CGRectIsEmpty(v38))
        {
          y = v24 + v17;
          rect = v19;
          x = v15;
          height = v21;
        }
        else
        {
          v39.origin.x = x;
          v39.origin.y = y;
          v39.size.width = rect;
          v39.size.height = height;
          v42.origin.x = v15;
          v42.size.width = v19;
          v42.size.height = v21;
          v42.origin.y = v24 + v17;
          v40 = CGRectUnion(v39, v42);
          x = v40.origin.x;
          y = v40.origin.y;
          rect = v40.size.width;
          height = v40.size.height;
        }
        v8 = v24 + v23;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v7);
  }

  v25 = x;
  v26 = y;
  v27 = rect;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (unint64_t)pivotIndex
{
  return self->_pivotIndex;
}

@end
