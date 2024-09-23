@implementation EQKitHBox

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  y = a4.y;
  x = a4.x;
  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EQKitHBox;
  -[EQKitBox renderIntoContext:offset:](&v18, sel_renderIntoContext_offset_, v7, x, y);
  if (v7)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[EQKitCompoundBox childBoxes](self, "childBoxes", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v12, "renderIntoContext:offset:", v7, x, y);
          objc_msgSend(v12, "width");
          x = x + v13;
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  BOOL v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  y = a4.y;
  x = a4.x;
  v36 = *MEMORY[0x24BDAC8D0];
  v8 = *((_DWORD *)a3 + 6);
  if (v8 == 2)
  {
    -[EQKitCompoundBox width](self, "width");
    v16 = v15;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[EQKitCompoundBox childBoxes](self, "childBoxes", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = x + v16;
      v20 = *(_QWORD *)v27;
LABEL_14:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v9);
        v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v21);
        objc_msgSend(v22, "width");
        v19 = v19 - v23;
        if ((objc_msgSend(v22, "appendOpticalAlignToSpec:offset:", a3, v19, y) & 1) != 0)
          goto LABEL_21;
        if (v18 == ++v21)
        {
          v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v18)
            goto LABEL_14;
          break;
        }
      }
    }
  }
  else
  {
    if (v8)
      return 0;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[EQKitCompoundBox childBoxes](self, "childBoxes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v31;
LABEL_5:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v12);
        if ((objc_msgSend(v13, "appendOpticalAlignToSpec:offset:", a3, x, y) & 1) != 0)
          break;
        objc_msgSend(v13, "width");
        x = x + v14;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          if (v10)
            goto LABEL_5;
          goto LABEL_20;
        }
      }
LABEL_21:
      v24 = 1;
      goto LABEL_22;
    }
  }
LABEL_20:
  v24 = 0;
LABEL_22:

  return v24;
}

- (id)hitTest:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a3.y;
  x = a3.x;
  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[EQKitCompoundBox childBoxes](self, "childBoxes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    v9 = x;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "hitTest:", v9, y);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {

          return v12;
        }
        objc_msgSend(v11, "width");
        v9 = v9 - v13;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  v15.receiver = self;
  v15.super_class = (Class)EQKitHBox;
  -[EQKitBox hitTest:](&v15, sel_hitTest_, x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  return v12;
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  EQKitHBox *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v18;
  CGAffineTransform v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (EQKitHBox *)a4;
  if (v6 == self)
  {
    v14 = 1;
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[EQKitCompoundBox childBoxes](self, "childBoxes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v21;
      v10 = 0.0;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v12, "p_getTransform:fromDescendant:", a3, v6))
          {
            v15 = *(_OWORD *)&a3->c;
            *(_OWORD *)&v18.a = *(_OWORD *)&a3->a;
            *(_OWORD *)&v18.c = v15;
            *(_OWORD *)&v18.tx = *(_OWORD *)&a3->tx;
            CGAffineTransformTranslate(&v19, &v18, v10, 0.0);
            v16 = *(_OWORD *)&v19.c;
            *(_OWORD *)&a3->a = *(_OWORD *)&v19.a;
            *(_OWORD *)&a3->c = v16;
            *(_OWORD *)&a3->tx = *(_OWORD *)&v19.tx;
            v14 = 1;
            goto LABEL_12;
          }
          objc_msgSend(v12, "width");
          v10 = v10 + v13;
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_12:

  }
  return v14;
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  void *v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  *a5 = 0.0;
  *a3 = 0.0;
  *a4 = 0.0;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[EQKitCompoundBox childBoxes](self, "childBoxes", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v22;
    v11 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "vsize");
        if (v14 != 0.0)
        {
          if ((v11 & 1) != 0)
          {
            objc_msgSend(v13, "height");
            *(_QWORD *)a3 = v15;
            objc_msgSend(v13, "depth");
          }
          else
          {
            v17 = *a3;
            objc_msgSend(v13, "height");
            if (v17 >= v18)
              v18 = v17;
            *a3 = v18;
            v19 = *a4;
            objc_msgSend(v13, "depth");
            if (v19 >= v16)
              v16 = v19;
          }
          v11 = 0;
          *a4 = v16;
        }
        objc_msgSend(v13, "width");
        *a5 = v20 + *a5;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

}

- (CGRect)p_cacheErasableBounds
{
  double x;
  CGFloat height;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat y;
  CGFloat v25;
  CGFloat width;
  CGFloat v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;
  CGRect v38;

  v33 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF090];
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[EQKitCompoundBox childBoxes](self, "childBoxes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v29;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v9, "erasableBounds", *(_QWORD *)&y, *(_QWORD *)&width);
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        objc_msgSend(v9, "width");
        v19 = v18;
        v34.origin.x = x;
        v34.origin.y = v25;
        v34.size.width = v27;
        v34.size.height = height;
        if (CGRectIsEmpty(v34))
        {
          y = v13;
          width = v15;
          x = v7 + v11;
          height = v17;
        }
        else
        {
          v35.origin.x = x;
          v35.origin.y = v25;
          v35.size.width = v27;
          v35.size.height = height;
          v38.origin.y = v13;
          v38.size.width = v15;
          v38.size.height = v17;
          v38.origin.x = v7 + v11;
          v36 = CGRectUnion(v35, v38);
          y = v36.origin.y;
          width = v36.size.width;
          x = v36.origin.x;
          height = v36.size.height;
        }
        v7 = v7 + v19;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }

  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

@end
