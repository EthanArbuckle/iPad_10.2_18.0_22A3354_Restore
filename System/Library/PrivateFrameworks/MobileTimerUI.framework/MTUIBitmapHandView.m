@implementation MTUIBitmapHandView

+ (id)partInfoWithName:(id)a3
{
  return (id)objc_msgSend(a1, "partInfoWithName:offset:maintainsOrientation:", a3, 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

+ (id)partInfoWithName:(id)a3 offset:(CGPoint)a4 maintainsOrientation:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v15[3] = *MEMORY[0x24BDAC8D0];
  v15[0] = a3;
  v14[0] = CFSTR("MTUIBitmapClockHandPartNameKey");
  v14[1] = CFSTR("MTUIBitmapClockHandPartOffsetKey");
  v8 = (void *)MEMORY[0x24BDD1968];
  v9 = a3;
  objc_msgSend(v8, "valueWithCGPoint:", x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  v14[2] = CFSTR("MTUIBitmapClockHandPartMaintainsOrientationKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (MTUIBitmapHandView)initWithBundle:(id)a3 resourcePath:(id)a4 partInfoList:(id)a5 rotationalCenter:(CGPoint)a6
{
  id v9;
  double y;
  double x;
  double height;
  double width;
  MTUIBitmapHandView *v14;
  MTUIBitmapHandView *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  void *v45;
  id *v46;
  id v48;
  void *v50;
  id obj;
  id *p_isa;
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v67 = *MEMORY[0x24BDAC8D0];
  v55 = a3;
  v54 = a4;
  v9 = a5;
  v64.receiver = self;
  v64.super_class = (Class)MTUIBitmapHandView;
  x = *MEMORY[0x24BDBF090];
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  v14 = -[MTUIBitmapHandView initWithFrame:](&v64, sel_initWithFrame_, *MEMORY[0x24BDBF090], y, width, height);
  v15 = v14;
  if (v14)
  {
    p_isa = (id *)&v14->super.super.super.isa;
    v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v48 = v9;
    obj = v9;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v61 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("MTUIBitmapClockHandPartNameKey"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringByAppendingPathComponent:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_alloc(MEMORY[0x24BDF6AE8]);
          objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", v22, v55);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v23, "initWithImage:", v24);

          objc_msgSend(v53, "addObject:", v25);
          objc_msgSend(p_isa, "addSubview:", v25);
          objc_msgSend(v25, "frame");
          v27 = v26;
          v29 = v28;
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("MTUIBitmapClockHandPartOffsetKey"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "CGPointValue");
          v32 = v31;
          v34 = v33;

          objc_msgSend(v25, "setFrame:", v32, v34, v27, v29);
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("MTUIBitmapClockHandPartMaintainsOrientationKey"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v30) = objc_msgSend(v35, "BOOLValue");

          if ((_DWORD)v30)
            objc_msgSend(v50, "addObject:", v25);

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v17);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v36 = v53;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v57;
      v9 = v48;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v57 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * j), "frame");
          v70.origin.x = v41;
          v70.origin.y = v42;
          v70.size.width = v43;
          v70.size.height = v44;
          v68.origin.x = x;
          v68.origin.y = y;
          v68.size.width = width;
          v68.size.height = height;
          v69 = CGRectUnion(v68, v70);
          x = v69.origin.x;
          y = v69.origin.y;
          width = v69.size.width;
          height = v69.size.height;
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      }
      while (v38);
    }
    else
    {
      v9 = v48;
    }

    v15 = (MTUIBitmapHandView *)p_isa;
    objc_msgSend(p_isa, "setBounds:", x, y, width, height);
    objc_msgSend(p_isa, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAnchorPoint:", a6.x, a6.y);

    objc_storeStrong(p_isa + 52, v53);
    if (objc_msgSend(v50, "count"))
      objc_storeStrong(p_isa + 53, v50);
    v46 = p_isa;

  }
  return v15;
}

- (MTUIBitmapHandView)initWithImage:(id)a3 rotationalCenter:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  MTUIBitmapHandView *v12;
  NSArray *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *partViews;
  MTUIBitmapHandView *v18;
  objc_super v20;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  objc_msgSend(v7, "size");
  v20.receiver = self;
  v20.super_class = (Class)MTUIBitmapHandView;
  v12 = -[MTUIBitmapHandView initWithFrame:](&v20, sel_initWithFrame_, v8, v9, v10, v11);
  if (v12)
  {
    v13 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v7);
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsEdgeAntialiasing:", 1);

    -[NSArray addObject:](v13, "addObject:", v14);
    -[MTUIBitmapHandView addSubview:](v12, "addSubview:", v14);
    -[MTUIBitmapHandView layer](v12, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAnchorPoint:", x, y);

    partViews = v12->_partViews;
    v12->_partViews = v13;

    v18 = v12;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partViewsMaintainingOrientation, 0);
  objc_storeStrong((id *)&self->_partViews, 0);
}

@end
