@implementation NTKCacheableAnalogDialView

- (NTKCacheableAnalogDialView)initWithDialDiameter:(double)a3 device:(id)a4
{
  id v6;
  NTKCacheableAnalogDialView *v7;
  NTKCacheableAnalogDialView *v8;
  BSUIMappedImageCache *cache;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKCacheableAnalogDialView;
  v7 = -[NTKCacheableAnalogDialView initWithFrame:](&v15, sel_initWithFrame_, 0.0, 0.0, a3, a3);
  v8 = v7;
  if (v7)
  {
    v7->_dialDiameter = a3;
    cache = v7->_cache;
    v7->_cache = 0;

    -[NTKCacheableAnalogDialView layer](v8, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShouldRasterize:", 1);

    objc_msgSend(v6, "screenScale");
    v12 = v11;
    -[NTKCacheableAnalogDialView layer](v8, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRasterizationScale:", v12);

  }
  return v8;
}

- (NTKCacheableAnalogDialView)initWithDialDiameter:(double)a3 device:(id)a4 cache:(id)a5 key:(id)a6
{
  id v10;
  id v11;
  id v12;
  NTKCacheableAnalogDialView *v13;
  NTKCacheableAnalogDialView *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = -[NTKCacheableAnalogDialView initWithDialDiameter:device:](self, "initWithDialDiameter:device:", v10, a3);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_cache, a5);
    objc_storeStrong((id *)&v14->_cacheKey, a6);
    -[NTKCacheableAnalogDialView layer](v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShouldRasterize:", 1);

    objc_msgSend(v10, "screenScale");
    v17 = v16;
    -[NTKCacheableAnalogDialView layer](v14, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRasterizationScale:", v17);

  }
  return v14;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKCacheableAnalogDialView;
  -[NTKCacheableAnalogDialView layoutSubviews](&v3, sel_layoutSubviews);
  -[NTKCacheableAnalogDialView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_tickContainer, 0);
  -[NTKCacheableAnalogDialView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_textContainer, self->_tickContainer);
}

- (void)addTicksWithCount:(unint64_t)a3 moduloGroups:(id)a4 sizes:(id)a5 roundedCorners:(id)a6
{
  id v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  UIView *v18;
  UIView *tickContainer;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  double dialDiameter;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  unint64_t v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  unint64_t v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  void *v46;
  unint64_t v47;
  void *v48;
  __double2 v49;
  id v50;
  CGFloat v51;
  CGFloat v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSArray *tickGroups;
  NTKCacheableAnalogDialView *v60;
  id v61;
  NSArray *v62;
  id v63;
  void *v64;
  CGAffineTransform v65;
  CGAffineTransform v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;
  CGSize v73;

  v72 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v63 = a5;
  v61 = a6;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v12 = self->_tickGroups;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v68 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "removeFromSuperview");
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    }
    while (v14);
  }

  -[UIView removeFromSuperview](self->_tickContainer, "removeFromSuperview");
  v17 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[NTKCacheableAnalogDialView bounds](self, "bounds");
  v18 = (UIView *)objc_msgSend(v17, "initWithFrame:");
  tickContainer = self->_tickContainer;
  self->_tickContainer = v18;

  -[NTKCacheableAnalogDialView addSubview:](self, "addSubview:", self->_tickContainer);
  objc_storeStrong((id *)&self->_moduloGroups, a4);
  v20 = (void *)objc_opt_new();
  if (objc_msgSend(v11, "count"))
  {
    v21 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, v23);

      ++v21;
    }
    while (v21 < objc_msgSend(v11, "count"));
  }
  objc_storeStrong((id *)&self->_moduloToGroup, v20);
  dialDiameter = self->_dialDiameter;
  v62 = (NSArray *)objc_opt_new();
  v25 = v61;
  if (objc_msgSend(v11, "count"))
  {
    v26 = 0;
    v27 = dialDiameter * 0.5;
    v29 = -(dialDiameter * 0.5);
    v60 = self;
    while (1)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "unsignedIntegerValue");

      objc_msgSend(v63, "objectAtIndexedSubscript:", v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "CGSizeValue");
      v34 = v33;
      v36 = v35;

      if (v25)
      {
        objc_msgSend(v25, "objectAtIndexedSubscript:", v26);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "BOOLValue");

      }
      else
      {
        v38 = 0;
      }
      if (!self->_cache)
        break;
      -[NTKCacheableAnalogDialView _cacheIdentifierForTickCount:modulus:size:rounded:](self, "_cacheIdentifierForTickCount:modulus:size:rounded:", a3, v31, v38, v34, v36);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSUIMappedImageCache imageForKey:](self->_cache, "imageForKey:");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39)
        goto LABEL_20;
LABEL_37:
      v53 = objc_alloc(MEMORY[0x1E0DC3890]);
      objc_msgSend(v39, "imageWithRenderingMode:", 2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)objc_msgSend(v53, "initWithImage:", v54);

      -[NTKCacheableAnalogDialView bounds](self, "bounds");
      objc_msgSend(v55, "setFrame:");
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setTintColor:", v56);

      _disabledLayerActions_0();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "layer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setActions:", v57);

      -[NSArray addObject:](v62, "addObject:", v55);
      -[UIView addSubview:](self->_tickContainer, "addSubview:", v55);

      if (++v26 >= (unint64_t)objc_msgSend(v11, "count"))
        goto LABEL_38;
    }
    v64 = 0;
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setBounds:", 0.0, 0.0, self->_dialDiameter, self->_dialDiameter);
    objc_msgSend(v40, "setContentsScale:", 2.0);
    objc_msgSend(v40, "setMasksToBounds:", 1);
    objc_msgSend(v40, "setCornerRadius:", self->_dialDiameter * 0.5);
    if (a3)
    {
      v41 = 0;
      if (v34 >= v36)
        v42 = v36;
      else
        v42 = v34;
      v43 = v42 * 0.5;
      if ((_DWORD)v38)
        v44 = v43;
      else
        v44 = 0.0;
      do
      {
        if (!(v41 % v31))
        {
          if (v26)
          {
            v45 = 0;
            while (1)
            {
              objc_msgSend(v11, "objectAtIndexedSubscript:", v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = v41 % objc_msgSend(v46, "unsignedIntegerValue");

              if (!v47)
                break;
              if (v26 == ++v45)
                goto LABEL_32;
            }
          }
          else
          {
LABEL_32:
            v28 = 6.28318531 / (double)a3;
            objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setFrame:", 0.0, 0.0, v34, v36);
            objc_msgSend(v48, "setAnchorPoint:", 0.5, 0.0);
            objc_msgSend(v48, "setCornerRadius:", v44);
            v49 = __sincos_stret(v28 * (double)v41);
            objc_msgSend(v48, "setPosition:", v27 + v27 * v49.__sinval, v27 + v29 * v49.__cosval);
            objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
            v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v48, "setBackgroundColor:", objc_msgSend(v50, "CGColor"));

            CGAffineTransformMakeRotation(&v66, v28 * (double)v41);
            v65 = v66;
            objc_msgSend(v48, "setAffineTransform:", &v65);
            objc_msgSend(v40, "addSublayer:", v48);

          }
        }
        ++v41;
      }
      while (v41 != a3);
    }
    objc_msgSend(v40, "bounds");
    v73.width = v51;
    v73.height = v52;
    UIGraphicsBeginImageContextWithOptions(v73, 0, 0.0);
    objc_msgSend(v40, "renderInContext:", UIGraphicsGetCurrentContext());
    UIGraphicsGetImageFromCurrentImageContext();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    self = v60;
    if (v64)
      -[BSUIMappedImageCache setImage:forKey:](v60->_cache, "setImage:forKey:", v39);

    v25 = v61;
    goto LABEL_37;
  }
LABEL_38:
  tickGroups = self->_tickGroups;
  self->_tickGroups = v62;

}

- (void)applyTickColor:(id)a3 toModulo:(unint64_t)a4
{
  NSDictionary *moduloToGroup;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  moduloToGroup = self->_moduloToGroup;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a3;
  objc_msgSend(v7, "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](moduloToGroup, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  -[NTKCacheableAnalogDialView applyTickColor:toGroupIndex:](self, "applyTickColor:toGroupIndex:", v11, v10);
}

- (void)applyTickColor:(id)a3 toGroupIndex:(unint64_t)a4
{
  NSArray *tickGroups;
  id v6;
  id v7;

  tickGroups = self->_tickGroups;
  v6 = a3;
  -[NSArray objectAtIndexedSubscript:](tickGroups, "objectAtIndexedSubscript:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v6);

}

- (id)_cacheIdentifierForTickCount:(unint64_t)a3 modulus:(unint64_t)a4 size:(CGSize)a5 rounded:(BOOL)a6
{
  float width;
  float height;

  width = a5.width;
  height = a5.height;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ticks-(%@)-%f-%i-%i-%f-%f-%i"), self->_cacheKey, *(_QWORD *)&self->_dialDiameter, a3, a4, width, height, a6);
}

- (void)addTextWithCount:(unint64_t)a3 configurationBlock:(id)a4
{
  id v6;
  UIView *v7;
  UIView *textContainer;
  NSArray *v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  __double2 v17;
  void *v18;
  NSArray *textLayers;
  NSArray *v20;
  void *v21;
  void *v22;
  double (**v23)(id, void *, unint64_t);

  v23 = (double (**)(id, void *, unint64_t))a4;
  -[UIView removeFromSuperview](self->_textContainer, "removeFromSuperview");
  v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[NTKCacheableAnalogDialView bounds](self, "bounds");
  v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
  textContainer = self->_textContainer;
  self->_textContainer = v7;

  v9 = (NSArray *)objc_opt_new();
  if (a3)
  {
    v10 = 0;
    v11 = self->_dialDiameter * 0.5;
    v12 = *MEMORY[0x1E0CD28F0];
    do
    {
      objc_msgSend(MEMORY[0x1E0CD28A0], "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _disabledLayerActions_0();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setActions:", v14);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v13, "setForegroundColor:", objc_msgSend(v15, "CGColor"));

      objc_msgSend(v13, "setContentsScale:", 2.0);
      objc_msgSend(v13, "setAnchorPoint:", 0.5, 0.5);
      v16 = self->_dialDiameter * 0.5 - v23[2](v23, v13, v10);
      objc_msgSend(v13, "setAlignmentMode:", v12);
      v17 = __sincos_stret((double)v10 * 6.28318531 / (double)a3);
      objc_msgSend(v13, "setPosition:", v11 + v16 * v17.__sinval, v11 - v16 * v17.__cosval);
      -[NSArray addObject:](v9, "addObject:", v13);
      -[UIView layer](self->_textContainer, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSublayer:", v13);

      ++v10;
    }
    while (a3 != v10);
  }
  textLayers = self->_textLayers;
  self->_textLayers = v9;
  v20 = v9;

  _disabledLayerActions_0();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_textContainer, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActions:", v21);

  -[NTKCacheableAnalogDialView addSubview:](self, "addSubview:", self->_textContainer);
}

- (void)applyTextColor:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__NTKCacheableAnalogDialView_applyTextColor___block_invoke;
  v6[3] = &unk_1E6BD33F8;
  v7 = v4;
  v5 = v4;
  -[NTKCacheableAnalogDialView enumerateTextLayersWithBlock:](self, "enumerateTextLayersWithBlock:", v6);

}

void __45__NTKCacheableAnalogDialView_applyTextColor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = objc_retainAutorelease(*(id *)(a1 + 32));
  v4 = a2;
  objc_msgSend(v4, "setForegroundColor:", objc_msgSend(v3, "CGColor"));

}

- (void)enumerateTextLayersWithBlock:(id)a3
{
  -[NSArray enumerateObjectsUsingBlock:](self->_textLayers, "enumerateObjectsUsingBlock:", a3);
}

- (NSArray)tickGroups
{
  return (NSArray *)objc_getProperty(self, a2, 472, 1);
}

- (double)dialDiameter
{
  return self->_dialDiameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tickGroups, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_tickContainer, 0);
  objc_storeStrong((id *)&self->_textLayers, 0);
  objc_storeStrong((id *)&self->_moduloToGroup, 0);
  objc_storeStrong((id *)&self->_moduloGroups, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
