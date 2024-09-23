@implementation _BCUCoverEffectsSeriesStack

- (_BCUCoverEffectsSeriesStack)initWithIdentifier:(id)a3 renderer:(id)a4
{
  id v7;
  id v8;
  _BCUCoverEffectsSeriesStack *v9;
  _BCUCoverEffectsSeriesStack *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_BCUCoverEffectsSeriesStack;
  v9 = -[_BCUCoverEffectsSeriesStack init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_renderer, a4);
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)newOperationWithImages:(id)a3 filters:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 waitForCPUSynchronization:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  CGFloat height;
  CGFloat width;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  _QWORD v35[4];
  _QWORD v36[4];
  __int128 v37;
  __int128 v38;

  v9 = a7;
  height = a5.height;
  width = a5.width;
  v15 = a3;
  v16 = a4;
  v17 = a8;
  if (objc_msgSend(v15, "count"))
  {
    v36[0] = 0;
    v36[1] = v36;
    v36[3] = &unk_2285869CE;
    v36[2] = 0x4010000000;
    v37 = BCUInsetsZero;
    v38 = *(_OWORD *)&qword_2285851C0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v35[3] = 0;
    -[_BCUCoverEffectsSeriesStack renderer](self, "renderer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = sub_228581BD8;
    v27[3] = &unk_24F113FA0;
    v27[4] = self;
    v28 = v15;
    v32 = width;
    v33 = height;
    v34 = a6;
    v29 = v16;
    v30 = v36;
    v31 = v35;
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = sub_228581C04;
    v23[3] = &unk_24F113FC8;
    v24 = v17;
    v25 = v36;
    v26 = v35;
    LODWORD(v20) = 1056964608;
    v21 = (void *)objc_msgSend(v18, "newOperationWithPriority:waitForCPUSynchronization:logKey:renderLayer:completion:", v9, 0, v27, v23, v20);

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v36, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, double, double, double, double))v17 + 2))(v17, 0, 0, 0, 0.0, 0.0, 0.0, 0.0);
    v21 = 0;
  }

  return v21;
}

- (double)_coverScaleForIndex:(unint64_t)a3
{
  double result;

  result = 1.0;
  if (a3 - 1 <= 3)
    return dbl_228585190[a3 - 1];
  return result;
}

- (CGPoint)_positionForImageAtIndex:(int64_t)a3 imageSetCount:(int64_t)a4 coverWidth:(double)a5 coverAreaWidth:(double)a6 isRTL:(BOOL)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  if (!a3)
  {
    v9 = a6 - a5;
    if (a7)
      v7 = v9;
    else
      v7 = 0.0;
    goto LABEL_23;
  }
  if (a4 - 1 == a3)
  {
    v7 = a6 * 0.0;
    v8 = a6 - a5;
  }
  else
  {
    if (a3 == 3)
    {
      v7 = a6 * 0.04;
      v10 = 0.96;
    }
    else
    {
      if (a3 == 2)
      {
        v11 = -a5;
        if (a4 == 4)
        {
          v7 = a6 * 0.09;
          v12 = 0.91;
        }
        else
        {
          v7 = a6 * 0.12;
          v12 = 0.88;
        }
        v8 = v11 + a6 * v12;
        goto LABEL_21;
      }
      v7 = 0.0;
      if (a3 != 1)
        goto LABEL_23;
      if (a4 == 4)
      {
        v7 = a6 * 0.24;
        v10 = 0.76;
      }
      else if (a4 == 3)
      {
        v7 = a6 * 0.17;
        v10 = 0.83;
      }
      else
      {
        v7 = a6 * 0.25;
        v10 = 0.75;
      }
    }
    v8 = -(a5 - a6 * v10);
  }
LABEL_21:
  if (!a7)
    v7 = v8;
LABEL_23:
  v13 = 0.0;
  v14 = v7;
  result.y = v13;
  result.x = v14;
  return result;
}

- (id)_stackLayerForHorizontalstyleWithImages:(id)a3 filters:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 insets:(UIEdgeInsets *)a7 path:(const CGPath *)a8 isRTL:(BOOL)a9
{
  _BOOL8 v9;
  double height;
  id v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGPath *Mutable;
  double v45;
  double v46;
  CGFloat x;
  CGFloat y;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double MaxX;
  double v53;
  double MaxY;
  double v55;
  void *v56;
  CGFloat v57;
  void *v58;
  CGPath *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v65;
  void *v66;
  uint64_t v67;
  double v69;
  void *v72;
  double width;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _QWORD v80[3];
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v9 = a9;
  width = a5.width;
  height = a5.height;
  v80[1] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", MEMORY[0x24BDBD1A8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "count");
  if (v17 >= 5)
    v18 = 5;
  else
    v18 = v17;
  if (v18)
  {
    v19 = 0;
    v21 = *MEMORY[0x24BDBF148];
    v20 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v22 = *MEMORY[0x24BDBEFB0];
    v23 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "objectAtIndexedSubscript:", v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BCUCoverEffectsSeriesStack _coverScaleForIndex:](self, "_coverScaleForIndex:", v19);
      v27 = v20;
      v28 = v21;
      if (v24)
      {
        v28 = sub_228580F84((CGImage *)v24, width * 0.536 * v26, height * v26, a6);
        v27 = v29;
      }
      objc_msgSend(v25, "coverLayerWithImage:size:contentsScale:", v24, v28, v27, a6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setAnchorPoint:", v22, v23);
      -[_BCUCoverEffectsSeriesStack _positionForImageAtIndex:imageSetCount:coverWidth:coverAreaWidth:isRTL:](self, "_positionForImageAtIndex:imageSetCount:coverWidth:coverAreaWidth:isRTL:", v19, v18, v9, v28, width);
      objc_msgSend(v30, "setPosition:");
      objc_msgSend(v16, "addObject:", v30);

      ++v19;
    }
    while (v18 != v19);
  }
  v31 = objc_msgSend(v16, "count");
  if (v31 - 1 >= 0)
  {
    v32 = v31;
    v33 = 0.0;
    v34 = 0.0;
    do
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", --v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32 == objc_msgSend(v16, "count") - 1)
      {
        objc_msgSend(v15, "addSublayer:", v35);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDE56D0], "layer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[_BCUCoverEffectsSeriesStack _coverScaleForIndex:](self, "_coverScaleForIndex:", v32);
        v38 = v37;
        objc_msgSend(v36, "setMasksToBounds:", 0);
        objc_msgSend(v36, "setShadowRadius:", v38 * 1.2);
        LODWORD(v39) = 0.5;
        objc_msgSend(v36, "setShadowOpacity:", v39);
        objc_msgSend(v36, "setShouldRasterize:", 1);
        objc_msgSend(v36, "setRasterizationScale:", 1.0);
        if (qword_25598A9E0 != -1)
          dispatch_once(&qword_25598A9E0, &unk_24F113FE8);
        objc_msgSend(v36, "setShadowColor:", qword_25598A9D8);
        objc_msgSend(v36, "setShadowOffset:", 0.0, 0.0);
        objc_msgSend(v35, "frame");
        v41 = v40;
        objc_msgSend(v35, "size");
        v43 = v41 + v42 + -0.5;
        Mutable = CGPathCreateMutable();
        v81.origin.x = v43;
        v81.origin.y = v33 + 1.0;
        v81.size.width = v38 * 4.0;
        v81.size.height = v34 + -2.0;
        CGPathAddRect(Mutable, 0, v81);
        objc_msgSend(v36, "setShadowPath:", Mutable);
        CGPathRelease(Mutable);
        objc_msgSend(v15, "addSublayer:", v36);
        objc_msgSend(v15, "addSublayer:", v35);

      }
      objc_msgSend(v35, "frame");
      v33 = v45;
      objc_msgSend(v35, "frame");
      v34 = v46;

    }
    while (v32 > 0);
  }
  v72 = v14;
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, width, height);
  v82.origin.x = sub_228582458(v15);
  x = v82.origin.x;
  y = v82.origin.y;
  v49 = v82.size.width;
  v50 = v82.size.height;
  v69 = fmax(0.0 - CGRectGetMinX(v82), 0.0);
  v83.origin.x = x;
  v83.origin.y = y;
  v83.size.width = v49;
  v83.size.height = v50;
  v51 = fmax(0.0 - CGRectGetMinY(v83), 0.0);
  v84.origin.x = x;
  v84.origin.y = y;
  v84.size.width = v49;
  v84.size.height = v50;
  MaxX = CGRectGetMaxX(v84);
  objc_msgSend(v15, "bounds");
  v53 = fmax(MaxX - CGRectGetMaxX(v85), 0.0);
  v86.origin.x = x;
  v86.origin.y = y;
  v86.size.width = v49;
  v86.size.height = v50;
  MaxY = CGRectGetMaxY(v86);
  objc_msgSend(v15, "bounds");
  v55 = fmax(MaxY - CGRectGetMaxY(v87), 0.0);
  objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v69;
  objc_msgSend(v56, "setFrame:", 0.0, 0.0, width + v69 + v53, height + v51 + v55);
  v80[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setSublayers:", v58);

  objc_msgSend(v15, "setPosition:", v69 + width * 0.5, v51 + height * 0.5);
  v59 = CGPathCreateMutable();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v15, "sublayers");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v76 != v63)
          objc_enumerationMutation(v60);
        v65 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_msgSend(v65, "bounds", *(_QWORD *)&v69);
        objc_msgSend(v65, "convertRect:toLayer:", v56);
        CGPathAddRect(v59, 0, v88);
      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
    }
    while (v62);
  }

  objc_msgSend(v15, "sublayers");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "count");

  if (!v67)
  {
    objc_msgSend(v56, "bounds");
    CGPathAddRect(v59, 0, v89);
  }
  if (a7)
  {
    a7->top = v51;
    a7->left = v57;
    a7->bottom = v55;
    a7->right = v53;
  }
  if (a8)
    *a8 = CGPathRetain(v59);
  CGPathRelease(v59);
  objc_msgSend(v56, "setRasterizationScale:", a6);

  return v56;
}

- (id)_stackLayerForDiagonalstyleWithImages:(id)a3 filters:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 insets:(UIEdgeInsets *)a7 path:(const CGPath *)a8
{
  double width;
  id v12;
  id v13;
  void *v14;
  double v15;
  CGImage *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  _BOOL4 v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  CGFloat x;
  CGFloat y;
  CGFloat v48;
  CGFloat v49;
  double v50;
  double v51;
  double MaxX;
  double v53;
  double MaxY;
  double v55;
  void *v56;
  void *v57;
  CGPath *Mutable;
  uint64_t v59;
  double v64;
  double v65;
  double v66;
  double v67;
  _BOOL4 v68;
  void *v69;
  const CGPath **v71;
  double v72;
  void *v73;
  void *v74;
  double height;
  double v76;
  CGAffineTransform v77;
  CGAffineTransform v78;
  CGAffineTransform v79;
  CGAffineTransform v80;
  CGAffineTransform v81;
  CGAffineTransform v82;
  CGAffineTransform v83;
  CGAffineTransform v84;
  _QWORD v85[3];
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  height = a5.height;
  width = a5.width;
  v85[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "count") <= 1)
    v15 = 1.0;
  else
    v15 = 0.85;
  v16 = (CGImage *)objc_msgSend(v12, "firstObject");
  if ((unint64_t)objc_msgSend(v12, "count") < 2)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v13, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v13, "count") < 2)
  {
    v74 = 0;
  }
  else
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v73 = v13;
  v72 = a6;
  v71 = a8;
  v69 = v18;
  if (v16)
  {
    v19 = sub_228580F84(v16, width, height, a6);
    v21 = v20;
    if (v17)
    {
      v22 = sub_228580F84((CGImage *)v17, width, height, a6);
      v24 = v23;
    }
    else
    {
      v22 = *MEMORY[0x24BDBF148];
      v24 = *(double *)(MEMORY[0x24BDBF148] + 8);
    }
    objc_msgSend(v18, "coverLayerWithImage:size:contentsScale:", v16, v19, v21, a6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(v18, "shadowLayerWithImage:size:contentsScale:kind:", v16, 0, v19, v21, a6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v30 = 0;
      v28 = 0;
      v31 = 1;
      if (v27)
LABEL_21:
        objc_msgSend(v14, "addSublayer:", v27);
LABEL_22:
      v68 = v29 != 0;
      if (v29)
      {
        if (v28)
          objc_msgSend(v29, "addSublayer:", v28);
        objc_msgSend(v14, "addSublayer:", v29);
      }
      v32 = v26 != 0;
      if (v26)
      {
        objc_msgSend(v14, "addSublayer:", v26);
        v33 = fmin(width, height) * (1.0 - v15);
        if ((v31 & 1) != 0)
        {
          v32 = 1;
LABEL_31:
          v34 = height;
          v35 = width;
          v65 = v33;
          v36 = v24;
LABEL_33:
          v37 = v33;
          goto LABEL_34;
        }
      }
      else
      {
        v33 = fmin(width, height) * (1.0 - v15);
        if ((v31 & 1) != 0)
        {
          v26 = 0;
          v32 = 0;
          goto LABEL_31;
        }
      }
      v65 = v33 + fmax(width * 0.1 - (v19 + v33 - v22), 0.0);
      v35 = fmax(v15 * v22, v65 + v19 * v15);
      v36 = v24;
      v34 = fmax(v15 * v24, v33 + v21 * v15);
      goto LABEL_33;
    }
    objc_msgSend(v18, "shadowLayerWithImage:size:contentsScale:kind:", v16, 1, v19, v21, a6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "shadowLayerWithImage:size:contentsScale:kind:", v16, 2, v19, v21, a6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
    objc_msgSend(v74, "coverLayerWithImage:size:contentsScale:", v17, v22, v24, a6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "shadowLayerWithImage:size:contentsScale:kind:", v17, 0, v22, v24, a6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      objc_msgSend(v14, "addSublayer:", v30);
    v31 = 0;
    if (v27)
      goto LABEL_21;
    goto LABEL_22;
  }
  v19 = *MEMORY[0x24BDBF148];
  v21 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v17)
  {
    v22 = sub_228580F84((CGImage *)v17, width, height, a6);
    v24 = v25;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    goto LABEL_18;
  }
  v68 = 0;
  v29 = 0;
  v30 = 0;
  v28 = 0;
  v27 = 0;
  v26 = 0;
  v32 = 0;
  v34 = height;
  v64 = width;
  v37 = fmin(width, height) * (1.0 - v15);
  v36 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v22 = *MEMORY[0x24BDBF148];
  v35 = v64;
  v65 = v37;
LABEL_34:
  v38 = v35;
  objc_msgSend(v14, "setBounds:", 0.0, 0.0, *(_QWORD *)&v65);
  v39 = v38;
  v67 = v38;
  v40 = v38 + v19 * -0.5 * v15;
  v41 = v34;
  v76 = v34;
  v42 = v34 + v21 * -0.5 * v15;
  v43 = v39 - v19 * v15 - v66 + v22 * 0.5 * v15;
  v44 = v41 - v37 + v36 * -0.5 * v15;
  CGAffineTransformMakeScale(&v84, v15, v15);
  v83 = v84;
  objc_msgSend(v27, "setAffineTransform:", &v83);
  CGAffineTransformMakeScale(&v82, v15, v15);
  v81 = v82;
  objc_msgSend(v30, "setAffineTransform:", &v81);
  CGAffineTransformMakeScale(&v80, v15, v15);
  v79 = v80;
  objc_msgSend(v26, "setAffineTransform:", &v79);
  CGAffineTransformMakeScale(&v78, v15, v15);
  v77 = v78;
  objc_msgSend(v29, "setAffineTransform:", &v77);
  objc_msgSend(v27, "setPosition:", v40, v42);
  objc_msgSend(v30, "setPosition:", v43, v44);
  objc_msgSend(v26, "setPosition:", v40, v42);
  objc_msgSend(v29, "setPosition:", v43, v44);
  objc_msgSend(v28, "superlayer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "convertPoint:fromLayer:", v14, v40, v42);
  objc_msgSend(v28, "setPosition:");

  v86.origin.x = sub_228582458(v14);
  x = v86.origin.x;
  y = v86.origin.y;
  v48 = v86.size.width;
  v49 = v86.size.height;
  v50 = fmax(0.0 - CGRectGetMinX(v86), 0.0);
  v87.origin.x = x;
  v87.origin.y = y;
  v87.size.width = v48;
  v87.size.height = v49;
  v51 = fmax(0.0 - CGRectGetMinY(v87), 0.0);
  v88.origin.x = x;
  v88.origin.y = y;
  v88.size.width = v48;
  v88.size.height = v49;
  MaxX = CGRectGetMaxX(v88);
  objc_msgSend(v14, "bounds");
  v53 = fmax(MaxX - CGRectGetMaxX(v89), 0.0);
  v90.origin.x = x;
  v90.origin.y = y;
  v90.size.width = v48;
  v90.size.height = v49;
  MaxY = CGRectGetMaxY(v90);
  objc_msgSend(v14, "bounds");
  v55 = fmax(MaxY - CGRectGetMaxY(v91), 0.0);
  objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setFrame:", 0.0, 0.0, v67 + v50 + v53, v76 + v51 + v55);
  v85[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v85, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setSublayers:", v57);

  objc_msgSend(v14, "setPosition:", v50 + v67 * 0.5, v51 + v76 * 0.5);
  Mutable = CGPathCreateMutable();
  if (!v68)
  {
    if (!v32)
    {
      objc_msgSend(v56, "bounds");
      goto LABEL_40;
    }
LABEL_38:
    objc_msgSend(v26, "bounds");
    objc_msgSend(v26, "convertRect:toLayer:", v56);
LABEL_40:
    CGPathAddRect(Mutable, 0, *(CGRect *)&v59);
    goto LABEL_41;
  }
  objc_msgSend(v29, "bounds");
  objc_msgSend(v29, "convertRect:toLayer:", v56);
  CGPathAddRect(Mutable, 0, v92);
  if (v32)
    goto LABEL_38;
LABEL_41:
  if (a7)
  {
    a7->top = v51;
    a7->left = v50;
    a7->bottom = v55;
    a7->right = v53;
  }
  if (v71)
    *v71 = CGPathRetain(Mutable);
  CGPathRelease(Mutable);
  objc_msgSend(v56, "setRasterizationScale:", v72);

  return v56;
}

- (id)_stackLayerWithImages:(id)a3 filters:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 insets:(UIEdgeInsets *)a7 path:(const CGPath *)a8
{
  double height;
  double width;
  id v15;
  id v16;
  void *v17;
  int v18;
  _BCUCoverEffectsSeriesStack *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  UIEdgeInsets *v25;
  const CGPath **v26;
  uint64_t v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;

  height = a5.height;
  width = a5.width;
  v15 = a3;
  v16 = a4;
  -[_BCUCoverEffectsSeriesStack identifier](self, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierSeriesStackHorizontal"));

  if (v18)
  {
    v19 = self;
    v20 = v15;
    v21 = v16;
    v22 = width;
    v23 = height;
    v24 = a6;
    v25 = a7;
    v26 = a8;
    v27 = 0;
  }
  else
  {
    -[_BCUCoverEffectsSeriesStack identifier](self, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierSeriesStackHorizontalRTL"));

    v19 = self;
    v20 = v15;
    v21 = v16;
    v22 = width;
    v23 = height;
    v24 = a6;
    v25 = a7;
    v26 = a8;
    if (!v29)
    {
      -[_BCUCoverEffectsSeriesStack _stackLayerForDiagonalstyleWithImages:filters:size:contentsScale:insets:path:](self, "_stackLayerForDiagonalstyleWithImages:filters:size:contentsScale:insets:path:", v15, v16, a7, a8, width, height, a6);
      v30 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v27 = 1;
  }
  -[_BCUCoverEffectsSeriesStack _stackLayerForHorizontalstyleWithImages:filters:size:contentsScale:insets:path:isRTL:](v19, "_stackLayerForHorizontalstyleWithImages:filters:size:contentsScale:insets:path:isRTL:", v20, v21, v25, v26, v27, v22, v23, v24);
  v30 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v31 = (void *)v30;

  return v31;
}

- (BCULayerRenderer)renderer
{
  return self->_renderer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
