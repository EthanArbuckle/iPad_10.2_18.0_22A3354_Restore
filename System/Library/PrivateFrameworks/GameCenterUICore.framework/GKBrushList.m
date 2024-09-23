@implementation GKBrushList

+ (id)brushListWithBrushes:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setBrushList:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKBrushList;
  v4 = -[GKThemeBrush copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[GKBrushList brushList](self, "brushList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBrushList:", v5);

  return v4;
}

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v32 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[GKBrushList brushList](self, "brushList", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v17);
        -[GKBrushList drawRectForBrushAtIndex:fromRect:input:](self, "drawRectForBrushAtIndex:fromRect:input:", v15 + v17, v11, x, y, width, height);
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;
        -[GKBrushList willDrawRect:withBrushAtIndex:input:](self, "willDrawRect:withBrushAtIndex:input:", v15 + v17, v11);
        objc_msgSend(v18, "drawInRect:withContext:input:", a4, v11, v20, v22, v24, v26);
        -[GKBrushList didDrawRect:withBrushAtIndex:input:](self, "didDrawRect:withBrushAtIndex:input:", v15 + v17++, v11, v20, v22, v24, v26);
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v15 += v17;
    }
    while (v14);
  }

}

- (NSArray)brushList
{
  return self->_brushList;
}

- (void)setBrushList:(id)a3
{
  objc_storeStrong((id *)&self->_brushList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brushList, 0);
}

@end
