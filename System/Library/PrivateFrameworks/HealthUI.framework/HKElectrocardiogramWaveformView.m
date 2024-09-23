@implementation HKElectrocardiogramWaveformView

- (HKElectrocardiogramWaveformView)initWithFrame:(CGRect)a3
{
  HKElectrocardiogramWaveformView *result;
  CGSize v4;
  CGPoint v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKElectrocardiogramWaveformView;
  result = -[HKElectrocardiogramWaveformView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_lineWidth = 1.5;
    v5 = (CGPoint)*MEMORY[0x1E0C9D648];
    v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    result->_pathBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    result->_pathBounds.size = v4;
    result->_lastPathBounds.origin = v5;
    result->_lastPathBounds.size = v4;
  }
  return result;
}

- (id)createShapeLayerWithPath:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x1E0CD2840];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setFillColor:", 0);
  -[HKElectrocardiogramWaveformView lineWidth](self, "lineWidth");
  objc_msgSend(v6, "setLineWidth:");
  -[HKElectrocardiogramWaveformView lineColor](self, "lineColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "CGColor");
  if (v8)
  {
    objc_msgSend(v6, "setStrokeColor:", v8);
  }
  else
  {
    -[HKElectrocardiogramWaveformView tintColor](self, "tintColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

  }
  objc_msgSend(v6, "setLineJoin:", *MEMORY[0x1E0CD3030]);
  v10 = objc_retainAutorelease(v5);
  v11 = objc_msgSend(v10, "CGPath");

  objc_msgSend(v6, "setPath:", v11);
  -[HKElectrocardiogramWaveformView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSublayer:", v6);

  return v6;
}

- (void)setPaths:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  double y;
  double x;
  double height;
  double width;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
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
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HKElectrocardiogramWaveformView shapeLayers](self, "shapeLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "removeFromSuperlayer");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = v4;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        -[HKElectrocardiogramWaveformView createShapeLayerWithPath:](self, "createShapeLayerWithPath:", v20, (_QWORD)v26);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v21);

        objc_msgSend(v20, "bounds");
        v39.origin.x = v22;
        v39.origin.y = v23;
        v39.size.width = v24;
        v39.size.height = v25;
        v37.origin.x = x;
        v37.origin.y = y;
        v37.size.width = width;
        v37.size.height = height;
        v38 = CGRectUnion(v37, v39);
        x = v38.origin.x;
        y = v38.origin.y;
        width = v38.size.width;
        height = v38.size.height;
        objc_msgSend(v20, "bounds");
        -[HKElectrocardiogramWaveformView setLastPathBounds:](self, "setLastPathBounds:");
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v17);
  }

  -[HKElectrocardiogramWaveformView setPathBounds:](self, "setPathBounds:", x, y, width, height);
  -[HKElectrocardiogramWaveformView setShapeLayers:](self, "setShapeLayers:", v10);
  -[HKElectrocardiogramWaveformView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)setLineWidth:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_lineWidth = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HKElectrocardiogramWaveformView shapeLayers](self, "shapeLayers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setLineWidth:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setLineColor:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_lineColor, a3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HKElectrocardiogramWaveformView shapeLayers](self, "shapeLayers", 0);
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
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = objc_msgSend(objc_retainAutorelease(v5), "CGColor");
        if (v12)
        {
          objc_msgSend(v11, "setStrokeColor:", v12);
        }
        else
        {
          -[HKElectrocardiogramWaveformView tintColor](self, "tintColor");
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v11, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[HKElectrocardiogramWaveformView pathBounds](self, "pathBounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogramWaveformView;
  -[HKElectrocardiogramWaveformView tintColorDidChange](&v15, sel_tintColorDidChange);
  -[HKElectrocardiogramWaveformView lineColor](self, "lineColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[HKElectrocardiogramWaveformView shapeLayers](self, "shapeLayers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
          -[HKElectrocardiogramWaveformView tintColor](self, "tintColor");
          v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v9, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v6);
    }

  }
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (NSArray)shapeLayers
{
  return self->_shapeLayers;
}

- (void)setShapeLayers:(id)a3
{
  objc_storeStrong((id *)&self->_shapeLayers, a3);
}

- (CGRect)pathBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_pathBounds.origin.x;
  y = self->_pathBounds.origin.y;
  width = self->_pathBounds.size.width;
  height = self->_pathBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPathBounds:(CGRect)a3
{
  self->_pathBounds = a3;
}

- (CGRect)lastPathBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastPathBounds.origin.x;
  y = self->_lastPathBounds.origin.y;
  width = self->_lastPathBounds.size.width;
  height = self->_lastPathBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastPathBounds:(CGRect)a3
{
  self->_lastPathBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLayers, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
}

@end
