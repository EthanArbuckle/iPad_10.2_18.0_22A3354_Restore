@implementation CAIAANodeContainer

+ (void)initialize
{
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"), "userInterfaceIdiom"))
  {
    v2 = 0x4053000000000000;
  }
  else
  {
    v2 = 0x404E000000000000;
  }
  _minWidth = v2;
}

- (CAIAANodeContainer)initWithFrame:(CGRect)a3
{
  CAIAANodeContainer *v3;
  CAIAANodeContainer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAIAANodeContainer;
  v3 = -[CAIAANodeContainer initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAIAANodeContainer setNumPages:](v3, "setNumPages:", 1);
    -[CAIAANodeContainer setShowsHorizontalScrollIndicator:](v4, "setShowsHorizontalScrollIndicator:", 0);
    -[CAIAANodeContainer setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
    -[CAIAANodeContainer setPagingEnabled:](v4, "setPagingEnabled:", 1);
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  unint64_t v16;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  double v29;
  float v30;
  double v31;
  double v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)CAIAANodeContainer;
  -[CAIAANodeContainer layoutSubviews](&v43, sel_layoutSubviews);
  v3 = (void *)-[CAIAANodeContainer subviews](self, "subviews");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v9);
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v6);
  }
  v10 = *(double *)&_minWidth + 12.0;
  v11 = (double)(unint64_t)objc_msgSend(v4, "count");
  v12 = (double)(unint64_t)(3 * objc_msgSend(v4, "count") - 3) + v10 * v11;
  -[CAIAANodeContainer frame](self, "frame");
  if (v13 - v12 + -6.0 >= 0.0)
  {
    -[CAIAANodeContainer setNumPages:](self, "setNumPages:", 1);
    -[CAIAANodeContainer frame](self, "frame");
    -[CAIAANodeContainer setContentSize:](self, "setContentSize:", v20, v21);
    v16 = objc_msgSend(v4, "count");
  }
  else
  {
    -[CAIAANodeContainer frame](self, "frame");
    v15 = (v14 + -20.0 - (*(double *)&_minWidth + 12.0)) / (*(double *)&_minWidth + 6.0);
    v16 = vcvtms_u32_f32(v15);
    v17 = (double)(unint64_t)objc_msgSend(v4, "count") / (double)v16;
    -[CAIAANodeContainer setNumPages:](self, "setNumPages:", vcvtps_s32_f32(v17));
    -[CAIAANodeContainer frame](self, "frame");
    -[CAIAANodeContainer setContentSize:](self, "setContentSize:", v18 * (double)-[CAIAANodeContainer numPages](self, "numPages"), v19);
  }
  if (-[CAIAANodeContainer numPages](self, "numPages"))
  {
    v22 = 0;
    v23 = 0;
    v24 = 0.0;
    do
    {
      if (v23 == -[CAIAANodeContainer numPages](self, "numPages") - 1)
        v16 = objc_msgSend(v4, "count") - v22;
      v25 = *(double *)&_minWidth;
      -[CAIAANodeContainer frame](self, "frame");
      if (v16)
      {
        v27 = v26 - ((double)(3 * v16 - 3) + (v25 + 12.0) * (double)v16) + -6.0;
        v28 = v27 / (double)v16 * 0.5;
        v29 = floorf(v28);
        if (v29 + v29 > 14.0)
          v29 = 14.0;
        v30 = (v27 + v29 * -2.0 * (double)v16) * 0.5;
        v31 = v24 + floorf(v30) + 3.0;
        v32 = v29 + 6.0;
        v33 = v22;
        v34 = v16;
        do
        {
          v35 = (void *)objc_msgSend(v4, "objectAtIndexedSubscript:", v33);
          v36 = *(double *)&_minWidth + v32 * 2.0;
          -[CAIAANodeContainer frame](self, "frame");
          objc_msgSend(v35, "setFrame:", v31, 0.0, v36);
          objc_msgSend(v35, "frame");
          v31 = v31 + v37 + 3.0;
          ++v33;
          --v34;
        }
        while (v34);
      }
      v22 += v16;
      -[CAIAANodeContainer frame](self, "frame");
      v24 = v24 + v38;
      ++v23;
    }
    while (v23 < -[CAIAANodeContainer numPages](self, "numPages"));
  }
}

- (double)contentWidth
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)-[CAIAANodeContainer subviews](self, "subviews");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  if (!objc_msgSend(v3, "count"))
    return 0.0;
  v9 = *(double *)&_minWidth + 12.0;
  v10 = (double)(unint64_t)objc_msgSend(v3, "count");
  return (double)(unint64_t)(3 * objc_msgSend(v3, "count") - 3) + v9 * v10;
}

- (double)minWidth
{
  return *(double *)&_minWidth;
}

- (int64_t)numPages
{
  return self->_numPages;
}

- (void)setNumPages:(int64_t)a3
{
  self->_numPages = a3;
}

@end
