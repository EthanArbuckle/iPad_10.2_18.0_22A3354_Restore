@implementation HKElectrocardiogramGridView

- (HKElectrocardiogramGridView)initWithUnitSize:(CGSize)a3 grids:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  HKElectrocardiogramGridView *v8;
  HKElectrocardiogramGridView *v9;
  uint64_t v10;
  NSArray *grids;
  NSMutableArray *v12;
  NSMutableArray *gridLayers;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogramGridView;
  v8 = -[HKElectrocardiogramGridView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    v8->_unitSize.width = width;
    v8->_unitSize.height = height;
    v10 = objc_msgSend(v7, "copy");
    grids = v9->_grids;
    v9->_grids = (NSArray *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    gridLayers = v9->_gridLayers;
    v9->_gridLayers = v12;

  }
  return v9;
}

- (void)setUnitSize:(CGSize)a3
{
  self->_unitSize = a3;
  -[HKElectrocardiogramGridView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)majorGridSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
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
  CGSize result;

  -[HKElectrocardiogramGridView unitSize](self, "unitSize");
  v4 = v3;
  v6 = v5;
  -[HKElectrocardiogramGridView grids](self, "grids");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "scale");
    v10 = v19;
    v11 = v18;
    v12 = v21;
    v13 = v20;
  }
  else
  {
    v12 = 0.0;
    v10 = 0.0;
    v13 = 0.0;
    v11 = 0.0;
  }
  v14 = v6 * v13 + v11 * v4;
  v15 = v6 * v12 + v10 * v4;

  v16 = v14;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)setControlSignalPath:(id)a3
{
  objc_storeStrong((id *)&self->_controlSignalPath, a3);
  -[HKElectrocardiogramGridView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKElectrocardiogramGridView;
  -[HKElectrocardiogramGridView layoutSubviews](&v3, sel_layoutSubviews);
  -[HKElectrocardiogramGridView _createLayers](self, "_createLayers");
}

- (void)_createLayers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  id v38;
  double v39;
  id v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  void *v69;
  void *v70;
  void *v71;
  id obj;
  void *v73;
  CATransform3D v74;
  CATransform3D v75;
  CATransform3D v76;
  CATransform3D v77;
  CATransform3D v78;
  CATransform3D v79;
  CATransform3D v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;
  CGRect v95;

  v94 = *MEMORY[0x1E0C80C00];
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  -[HKElectrocardiogramGridView gridLayers](self, "gridLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v89 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * i), "removeFromSuperlayer");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
    }
    while (v5);
  }

  -[HKElectrocardiogramGridView gridLayers](self, "gridLayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[HKElectrocardiogramGridView controlSignalLayer](self, "controlSignalLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperlayer");

  -[HKElectrocardiogramGridView setControlSignalLayer:](self, "setControlSignalLayer:", 0);
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[HKElectrocardiogramGridView grids](self, "grids");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
  v11 = 0x1E0CD2000uLL;
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v85;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v85 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
        -[HKElectrocardiogramGridView unitSize](self, "unitSize");
        v17 = v16;
        v19 = v18;
        if (v15)
        {
          objc_msgSend(v15, "scale");
          v20 = *((double *)&v81 + 1);
          v21 = *(double *)&v81;
          v22 = *((double *)&v82 + 1);
          v23 = *(double *)&v82;
        }
        else
        {
          v82 = 0u;
          v83 = 0u;
          v22 = 0.0;
          v20 = 0.0;
          v23 = 0.0;
          v21 = 0.0;
          v81 = 0u;
        }
        v24 = v19 * v23 + v21 * v17;
        v25 = v19 * v22 + v20 * v17;
        v26 = *(void **)(v11 + 2112);
        -[HKElectrocardiogramGridView bounds](self, "bounds");
        v28 = v27;
        objc_msgSend(v15, "lineWidth");
        objc_msgSend(v26, "horizontalLineLayerWithLength:lineWidth:", v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setFillColor:", 0);
        objc_msgSend(v15, "lineColor");
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v30, "setStrokeColor:", objc_msgSend(v31, "CGColor"));

        v32 = *(void **)(v11 + 2112);
        -[HKElectrocardiogramGridView bounds](self, "bounds");
        v34 = v33;
        objc_msgSend(v15, "lineWidth");
        objc_msgSend(v32, "verticalLineLayerWithLength:lineWidth:", v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setFillColor:", 0);
        objc_msgSend(v15, "lineColor");
        v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v36, "setStrokeColor:", objc_msgSend(v37, "CGColor"));

        v38 = objc_alloc_init(MEMORY[0x1E0CD2828]);
        v73 = v30;
        objc_msgSend(v38, "addSublayer:", v30);
        -[HKElectrocardiogramGridView bounds](self, "bounds");
        objc_msgSend(v38, "setInstanceCount:", (uint64_t)HKUIRoundedDivide(v39, v25, 0.01) + 1);
        CATransform3DMakeTranslation(&v80, 0.0, v25, 0.0);
        v79 = v80;
        objc_msgSend(v38, "setInstanceTransform:", &v79);
        v40 = objc_alloc_init(MEMORY[0x1E0CD2828]);
        objc_msgSend(v40, "addSublayer:", v36);
        -[HKElectrocardiogramGridView bounds](self, "bounds");
        objc_msgSend(v40, "setInstanceCount:", (uint64_t)HKUIRoundedDivide(v41, v24, 0.01) + 1);
        CATransform3DMakeTranslation(&v78, v24, 0.0, 0.0);
        v77 = v78;
        objc_msgSend(v40, "setInstanceTransform:", &v77);
        if ((objc_msgSend(v15, "axis") & 1) != 0)
        {
          -[HKElectrocardiogramGridView layer](self, "layer");
          v42 = v12;
          v43 = v13;
          v44 = v11;
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "insertSublayer:atIndex:", v38, 0);

          -[HKElectrocardiogramGridView gridLayers](self, "gridLayers");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v38);

          v11 = v44;
          v13 = v43;
          v12 = v42;
        }
        if ((objc_msgSend(v15, "axis") & 2) != 0)
        {
          -[HKElectrocardiogramGridView layer](self, "layer");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "insertSublayer:atIndex:", v40, 0);

          -[HKElectrocardiogramGridView gridLayers](self, "gridLayers");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addObject:", v40);

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
    }
    while (v12);
  }

  -[HKElectrocardiogramGridView controlSignalPath](self, "controlSignalPath");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    v50 = objc_alloc_init(*(Class *)(v11 + 2112));
    -[HKElectrocardiogramGridView setControlSignalLayer:](self, "setControlSignalLayer:", v50);

    -[HKElectrocardiogramGridView controlSignalLayer](self, "controlSignalLayer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setFillColor:", 0);

    -[HKElectrocardiogramGridView controlSignalLayer](self, "controlSignalLayer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setLineWidth:", 1.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.4, 1.0);
    v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v54 = objc_msgSend(v53, "CGColor");
    -[HKElectrocardiogramGridView controlSignalLayer](self, "controlSignalLayer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setStrokeColor:", v54);

    v56 = *MEMORY[0x1E0CD3030];
    -[HKElectrocardiogramGridView controlSignalLayer](self, "controlSignalLayer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setLineJoin:", v56);

    -[HKElectrocardiogramGridView controlSignalPath](self, "controlSignalPath");
    v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v59 = objc_msgSend(v58, "CGPath");
    -[HKElectrocardiogramGridView controlSignalLayer](self, "controlSignalLayer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setPath:", v59);

    -[HKElectrocardiogramGridView bounds](self, "bounds");
    v61 = CGRectGetHeight(v95) * 0.5;
    -[HKElectrocardiogramGridView unitSize](self, "unitSize");
    v63 = round(v61 / v62);
    -[HKElectrocardiogramGridView unitSize](self, "unitSize");
    v65 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v75.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v75.m33 = v65;
    v66 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v75.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v75.m43 = v66;
    v67 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v75.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v75.m13 = v67;
    v68 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v75.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v75.m23 = v68;
    CATransform3DTranslate(&v76, &v75, 0.0, v64 * v63, 0.0);
    -[HKElectrocardiogramGridView controlSignalLayer](self, "controlSignalLayer");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v76;
    objc_msgSend(v69, "setTransform:", &v74);

    -[HKElectrocardiogramGridView layer](self, "layer");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramGridView controlSignalLayer](self, "controlSignalLayer");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addSublayer:", v71);

  }
}

- (CGSize)unitSize
{
  double width;
  double height;
  CGSize result;

  width = self->_unitSize.width;
  height = self->_unitSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSArray)grids
{
  return self->_grids;
}

- (void)setGrids:(id)a3
{
  objc_storeStrong((id *)&self->_grids, a3);
}

- (UIBezierPath)controlSignalPath
{
  return self->_controlSignalPath;
}

- (NSMutableArray)gridLayers
{
  return self->_gridLayers;
}

- (void)setGridLayers:(id)a3
{
  objc_storeStrong((id *)&self->_gridLayers, a3);
}

- (CAShapeLayer)controlSignalLayer
{
  return self->_controlSignalLayer;
}

- (void)setControlSignalLayer:(id)a3
{
  objc_storeStrong((id *)&self->_controlSignalLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlSignalLayer, 0);
  objc_storeStrong((id *)&self->_gridLayers, 0);
  objc_storeStrong((id *)&self->_controlSignalPath, 0);
  objc_storeStrong((id *)&self->_grids, 0);
}

@end
