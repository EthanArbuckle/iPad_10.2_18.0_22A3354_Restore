@implementation CDRichComplicationCornerBaseTextView

- (CDRichComplicationCornerBaseTextView)initWithFontFallback:(int64_t)a3
{
  CDRichComplicationCornerBaseTextView *v3;
  CDRichComplicationCornerBaseTextView *v4;
  void *v5;
  uint64_t v6;
  CLKUICurvedColoringLabel *innerLabel;
  _OWORD v9[5];
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CDRichComplicationCornerBaseTextView;
  v3 = -[CDRichComplicationCornerView initWithFontFallback:](&v11, sel_initWithFontFallback_, a3);
  v4 = v3;
  if (v3)
  {
    v10 = 0;
    memset(v9, 0, sizeof(v9));
    -[CDRichComplicationView device](v3, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_0(v5, (uint64_t)v9);

    -[CDRichComplicationCornerView _createAndAddColoringLabelWithFontSize:](v4, "_createAndAddColoringLabelWithFontSize:", *(double *)v9);
    v6 = objc_claimAutoreleasedReturnValue();
    innerLabel = v4->_innerLabel;
    v4->_innerLabel = (CLKUICurvedColoringLabel *)v6;

    CLKDegreesToRadians();
    -[CLKUICurvedColoringLabel setMaxAngularWidth:](v4->_innerLabel, "setMaxAngularWidth:");
  }
  return v4;
}

- (id)innerLabel
{
  return self->_innerLabel;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CLKUICurvedColoringLabel *innerLabel;
  double v6;
  double v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CDRichComplicationCornerBaseTextView;
  -[CDRichComplicationCornerBaseTextView layoutSubviews](&v14, sel_layoutSubviews);
  v13 = 0.0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CDRichComplicationView device](self, "device", 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_0(v3, (uint64_t)&v8);

  switch(-[CDRichComplicationCornerView cornerComplicationPosition](self, "cornerComplicationPosition"))
  {
    case 0:
    case 1:
      -[CLKUICurvedColoringLabel setCircleRadius:](self->_innerLabel, "setCircleRadius:", *((double *)&v9 + 1) + *((double *)&v10 + 1));
      -[CLKUICurvedColoringLabel setInterior:](self->_innerLabel, "setInterior:", 0);
      v4 = *((double *)&v12 + 1);
      goto LABEL_4;
    case 2:
    case 3:
      -[CLKUICurvedColoringLabel setCircleRadius:](self->_innerLabel, "setCircleRadius:", *(double *)&v10 + *(double *)&v11);
      -[CLKUICurvedColoringLabel setInterior:](self->_innerLabel, "setInterior:", 1);
      v4 = v13;
LABEL_4:
      -[CLKUICurvedColoringLabel setTracking:](self->_innerLabel, "setTracking:", v4);
      break;
    default:
      break;
  }
  innerLabel = self->_innerLabel;
  v6 = *((double *)&v11 + 1);
  -[CDRichComplicationCornerView innerComponentRotationInDegree](self, "innerComponentRotationInDegree");
  -[CDRichComplicationCornerView _layoutCurvedLabel:centerAngleInDegree:editingRotationInDegree:](self, "_layoutCurvedLabel:centerAngleInDegree:editingRotationInDegree:", innerLabel, v6, v7);
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  id v5;
  double var2;
  double *v7;
  objc_super v8;
  BOOL v9[8];
  id v10;
  double v11;

  v9[0] = a3->var0;
  v5 = a3->var1;
  var2 = a3->var2;
  v10 = v5;
  v11 = var2;
  v8.receiver = self;
  v8.super_class = (Class)CDRichComplicationCornerBaseTextView;
  -[CDRichComplicationView _setFontConfiguration:](&v8, sel__setFontConfiguration_, v9);
  if (a3->var1)
  {
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_innerLabel, a3->var2);
  }
  else
  {
    if (a3->var0)
      v7 = (double *)MEMORY[0x24BEBB600];
    else
      v7 = (double *)MEMORY[0x24BEBB610];
    -[CDRichComplicationCornerView _updateColoringLabel:withFontWeight:](self, "_updateColoringLabel:withFontWeight:", self->_innerLabel, *v7);
  }

}

- (void)setInnerLabelProviders:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CLKUICurvedColoringLabel *innerLabel;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  CLKUICurvedColoringLabel *v17;
  void *v18;
  void *v19;
  int v20;
  NSArray *obj;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_innerLabelProviders, a3);
  if (-[NSArray count](self->_innerLabelProviders, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = self->_innerLabelProviders;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        objc_msgSend(v10, "imageProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_254B86A80))
        {
          innerLabel = self->_innerLabel;
          v13 = v11;
          -[CLKUICurvedColoringLabel font](innerLabel, "font");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setFont:", v14);

          objc_msgSend(v13, "setScale:", 2);
        }
        -[CLKUICurvedColoringLabel imageView](self->_innerLabel, "imageView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "conformsToProtocol:", &unk_254B855A0)
          || !+[CDComplicationImageViewProvider existingImageView:supportsImageProvider:](CDComplicationImageViewProvider, "existingImageView:supportsImageProvider:", v15, v11))
        {
          +[CDComplicationImageViewProvider viewForImageProvider:](CDComplicationImageViewProvider, "viewForImageProvider:", v11);
          v16 = objc_claimAutoreleasedReturnValue();

          v17 = self->_innerLabel;
          -[CDRichComplicationView device](self, "device");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKUICurvedColoringLabel setImageView:placement:padding:](v17, "setImageView:placement:padding:", v16, 1, CDRichComplicationCornerInnerImagePadding(v18));

          v15 = (void *)v16;
        }
        objc_msgSend(v15, "setImageProvider:", v11);
        objc_msgSend(v10, "textProvider");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLKUICurvedColoringLabel setTextProvider:](self->_innerLabel, "setTextProvider:", v19);
        if (v11 && !v19)
        {
          -[CLKUICurvedColoringLabel setText:](self->_innerLabel, "setText:", CFSTR("​"));
          -[CLKUICurvedColoringLabel setImagePadding:](self->_innerLabel, "setImagePadding:", 0.0);
        }
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __63__CDRichComplicationCornerBaseTextView_setInnerLabelProviders___block_invoke;
        v22[3] = &unk_24CF21410;
        v22[4] = self;
        objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v22);
        v20 = -[CLKUICurvedColoringLabel isTextTruncated](self->_innerLabel, "isTextTruncated");

        if (!v20)
          break;
        if (v7 == ++v9)
        {
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  else
  {
    -[CLKUICurvedColoringLabel setImageView:](self->_innerLabel, "setImageView:", 0);
    -[CLKUICurvedColoringLabel setTextProvider:](self->_innerLabel, "setTextProvider:", 0);
  }

}

uint64_t __63__CDRichComplicationCornerBaseTextView_setInnerLabelProviders___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutSubviews");
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  (*((void (**)(id, CLKUICurvedColoringLabel *))a3 + 2))(a3, self->_innerLabel);
}

- (NSArray)innerLabelProviders
{
  return self->_innerLabelProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerLabelProviders, 0);
  objc_storeStrong((id *)&self->_innerLabel, 0);
}

@end
