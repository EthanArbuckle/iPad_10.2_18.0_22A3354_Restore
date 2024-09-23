@implementation DOCTagRenderer

- (void)renderInUncacheableContext:(CGContext *)a3 request:(id)a4
{
  CGFloat v6;
  id v7;

  v7 = a4;
  if (UIGraphicsGetCurrentContext())
  {
    -[DOCTagRenderer _renderInContext:request:](self, "_renderInContext:request:", a3, v7);
  }
  else
  {
    UIGraphicsPushContext(a3);
    objc_msgSend(v7, "tagDimension");
    CGContextTranslateCTM(a3, 0.0, v6);
    CGContextScaleCTM(a3, 1.0, -1.0);
    -[DOCTagRenderer _renderInContext:request:](self, "_renderInContext:request:", a3, v7);
    UIGraphicsPopContext();
  }

}

id __41__DOCTagRenderer_renderImageWithRequest___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  id v5;
  void *v6;
  CGSize v8;

  objc_msgSend(*(id *)(a1 + 32), "sizeOfTagContentForRenderingRequest:", *(_QWORD *)(a1 + 40));
  UIGraphicsBeginImageContextWithOptions(v8, 0, *(CGFloat *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_renderInContext:request:", UIGraphicsGetCurrentContext(), *(_QWORD *)(a1 + 40));
  UIGraphicsGetImageFromCurrentImageContext();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_customRenderingBaselineOffsetFromBottomForRequest:", *(_QWORD *)(a1 + 40));
  if (v3 != -1.79769313e308)
  {
    objc_msgSend(v2, "imageWithBaselineOffsetFromBottom:");
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  UIGraphicsEndImageContext();
  if (v2)
    v5 = v2;
  else
    v5 = objc_alloc_init(MEMORY[0x24BEBD640]);
  v6 = v5;

  return v6;
}

- (double)_customRenderingBaselineOffsetFromBottomForRequest:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  v4 = a3;
  if (-[DOCTagRenderer differentiateWithShapes](self, "differentiateWithShapes"))
  {
    -[DOCTagRenderer sizeOfTagContentForRenderingRequest:](self, "sizeOfTagContentForRenderingRequest:", v4);
    v6 = v5;
    v8 = v7;
    +[DOCTagShapeRenderer shared](DOCTagShapeRenderer, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "baselineOffsetForRequest:tagRectSize:", v4, v6, v8);
    v11 = v10;

  }
  else
  {
    v11 = -1.79769313e308;
  }

  return v11;
}

- (id)renderImageWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  double v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    v8 = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", UIAccessibilityIsInvertColorsEnabled());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v9;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DOCTagRenderer differentiateWithShapes](self, "differentiateWithShapes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[DOCTagRenderer _symbolImageIfPosssibleForRequest:](self, "_symbolImageIfPosssibleForRequest:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      v16 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(v5, "_UIImageCacheKeyWithAdditionalComponents:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __41__DOCTagRenderer_renderImageWithRequest___block_invoke;
      v21[3] = &unk_24E327798;
      v21[4] = self;
      v22 = v5;
      v23 = v8;
      objc_msgSend(v16, "_cachedImageForKey:fromBlock:", v17, v21);
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid parameter"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    DOCLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[DOCTagRenderer renderImageWithRequest:].cold.1(v19);

    v15 = objc_alloc_init(MEMORY[0x24BEBD640]);
  }

  return v15;
}

- (id)_symbolImageIfPosssibleForRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  double Alpha;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v26;
  DOCTagSymbolImageConfiguration *v27;

  v4 = a3;
  if (!+[DOCTagRenderer allowUnsizedSymbolImages](DOCTagRenderer, "allowUnsizedSymbolImages"))
    goto LABEL_9;
  if (!objc_msgSend(v4, "allowUnsizedSymbolImages"))
    goto LABEL_9;
  objc_msgSend(v4, "selectionOutlineColor");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "selectionOutlineColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v7, "CGColor"));

    if (Alpha != 0.0)
      goto LABEL_9;
  }
  objc_msgSend(v4, "tags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 != 1)
    goto LABEL_9;
  objc_msgSend(v4, "tags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  objc_msgSend(v4, "fillColors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 == v14)
  {
    objc_msgSend(v4, "tags");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "fillColors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "ringColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[DOCTagRenderer differentiateWithShapes](self, "differentiateWithShapes");
    v21 = objc_retainAutorelease(v18);
    if (CGColorGetAlpha((CGColorRef)objc_msgSend(v21, "CGColor")) == 0.0)
    {
      v22 = 1;
      v23 = v19;
    }
    else
    {
      v22 = objc_msgSend(v4, "variant");
      v23 = v21;
    }
    v26 = v23;
    v27 = -[DOCTagSymbolImageConfiguration initWithTag:color:variant:differentiateWithShapes:]([DOCTagSymbolImageConfiguration alloc], "initWithTag:color:variant:differentiateWithShapes:", v16, v26, v22, v20);

    -[DOCTagSymbolImageConfiguration loadedImageForSettings](v27, "loadedImageForSettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_9:
    v24 = 0;
  }

  return v24;
}

- (void)_renderInContext:(CGContext *)a3 request:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double x;
  double y;
  double width;
  CGFloat height;
  void *v32;
  double v33;
  id v34;
  double Alpha;
  double v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  double v42;
  double v43;
  void *v44;
  double v45;
  id v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  NSObject *v51;
  CGAffineTransform transform;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v5 = a4;
  objc_msgSend(v5, "tags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v5, "fillColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 == v9)
  {
    -[DOCTagRenderer sizeOfTagContentForRenderingRequest:](self, "sizeOfTagContentForRenderingRequest:", v5);
    v11 = v10;
    objc_msgSend(v5, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "spacingType");
    objc_msgSend(v5, "tags");
    v51 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fillColors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ringColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionOutlineColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v5;
    objc_msgSend(v5, "knockOutBorderWidth");
    v48 = v16;
    v50 = v14;
    v17 = objc_msgSend(v14, "count");
    if (v17)
    {
      v18 = v17;
      objc_msgSend(v5, "tagDimension");
      -[DOCTagRenderer _tagChainSpacingForSpacingType:tagDimension:](self, "_tagChainSpacingForSpacingType:tagDimension:", v13);
      v20 = v19;
      if (objc_msgSend(v5, "layoutDirection") == 1)
      {
        -[DOCTagRenderer sizeOfTagContentForRenderingRequest:](self, "sizeOfTagContentForRenderingRequest:", v5);
        v22 = v21;
        memset(&v55, 0, sizeof(v55));
        CGAffineTransformMakeScale(&v55, -1.0, 1.0);
        transform = v55;
        memset(&v54, 0, sizeof(v54));
        CGAffineTransformTranslate(&v54, &transform, -v22, 0.0);
        transform = v54;
        CGContextConcatCTM(a3, &transform);
      }
      v23 = v18 - 1;
      if (v18 - 1 >= 0)
      {
        v47 = v20;
        v24 = 0.0;
        v25 = v11;
        do
        {
          -[NSObject objectAtIndexedSubscript:](v51, "objectAtIndexedSubscript:", --v18);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectAtIndexedSubscript:", v18);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          x = v20 * (double)v18;
          if (v18 < v23)
          {
            v56.origin.x = v20 * (double)v18;
            v56.origin.y = v24;
            v56.size.width = v11;
            v56.size.height = v25;
            v57 = CGRectInset(v56, -v48, -v48);
            y = v57.origin.y;
            width = v57.size.width;
            height = v57.size.height;
            objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = height;
            v20 = v47;
            -[DOCTagRenderer __drawInContext:tag:contextSize:tagRect:blendMode:fillColor:strokeColor:traitCollection:](self, "__drawInContext:tag:contextSize:tagRect:blendMode:fillColor:strokeColor:traitCollection:", a3, v26, 16, v32, 0, v12, v11, v25, x - v48, y, width, v33);

          }
          v34 = objc_retainAutorelease(v27);
          Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v34, "CGColor"));
          v36 = Alpha;
          if (Alpha == 0.0)
            v37 = 0;
          else
            v37 = v34;
          if (Alpha == 0.0)
            v38 = v49;
          else
            v38 = v15;
          v39 = v37;
          v40 = v38;
          if (v36 == 0.0 && v15 != 0)
          {
            -[DOCTagRenderer _defaultBorderWidth](self, "_defaultBorderWidth");
            v43 = v42;
            if (-[DOCTagRenderer differentiateWithShapes](self, "differentiateWithShapes"))
            {
              objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "scaledValueForValue:compatibleWithTraitCollection:", v12, 1.0);
              v43 = v43 + v45;

            }
            v58.origin.x = x;
            v58.origin.y = v24;
            v58.size.width = v11;
            v58.size.height = v25;
            v59 = CGRectInset(v58, v43, v43);
            x = v59.origin.x;
            v24 = v59.origin.y;
            v11 = v59.size.width;
            v25 = v59.size.height;
          }
          -[DOCTagRenderer __drawInContext:tag:contextSize:tagRect:blendMode:fillColor:strokeColor:traitCollection:](self, "__drawInContext:tag:contextSize:tagRect:blendMode:fillColor:strokeColor:traitCollection:", a3, v26, 17, v39, v40, v12, v11, v25, x, v24, v11, v25);

        }
        while (v18 > 0);
      }
    }

    v5 = v46;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected input: tag/color count mismatch"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    DOCLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      -[DOCTagRenderer renderImageWithRequest:].cold.1(v12);
  }

}

- (CGSize)sizeOfTagContentForRenderingRequest:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v4 = a3;
  objc_msgSend(v4, "tags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (double)v6;
    objc_msgSend(v4, "tagDimension");
    -[DOCTagRenderer differentiateWithShapes](self, "differentiateWithShapes");
    objc_msgSend(v4, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayScale");
    UIRoundToScale();
    v10 = v9;

    v11 = objc_msgSend(v4, "spacingType");
    objc_msgSend(v4, "tagDimension");
    -[DOCTagRenderer _tagChainSpacingForSpacingType:tagDimension:](self, "_tagChainSpacingForSpacingType:tagDimension:", v11);
    v13 = v10 + (v7 + -1.0) * v12;
    objc_msgSend(v4, "selectionOutlineColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[DOCTagRenderer _defaultBorderWidth](self, "_defaultBorderWidth");
      v13 = v13 + v15;
      v10 = v10 + v15;
    }
  }
  else
  {
    v13 = *MEMORY[0x24BDBF148];
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v16 = v13;
  v17 = v10;
  result.height = v17;
  result.width = v16;
  return result;
}

- (BOOL)differentiateWithShapes
{
  if (differentiateWithShapes_onceToken != -1)
    dispatch_once(&differentiateWithShapes_onceToken, &__block_literal_global_1);
  return differentiateWithShapes_alwaysUseShapes || UIAccessibilityShouldDifferentiateWithoutColor();
}

- (double)_tagChainSpacingForSpacingType:(unint64_t)a3 tagDimension:(double)a4
{
  double v4;
  float v5;

  v4 = 0.4;
  if (a3 != 1)
    v4 = 0.5625;
  v5 = v4 * a4;
  return ceilf(v5);
}

+ (DOCTagRenderer)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global);
  return (DOCTagRenderer *)(id)shared_shared;
}

- (void)__drawInContext:(CGContext *)a3 tag:(id)a4 contextSize:(CGSize)a5 tagRect:(CGRect)a6 blendMode:(int)a7 fillColor:(id)a8 strokeColor:(id)a9 traitCollection:(id)a10
{
  double height;
  double width;
  double y;
  double x;
  double v18;
  double v19;
  id v22;
  id v23;
  id v24;
  id v25;
  double v26;
  double v27;
  CGFloat v28;
  id v29;
  CGRect v30;
  CGRect v31;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v18 = a5.height;
  v19 = a5.width;
  v29 = a4;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  CGContextSetBlendMode(a3, (CGBlendMode)a7);
  if (-[DOCTagRenderer differentiateWithShapes](self, "differentiateWithShapes"))
  {
    +[DOCTagShapeRenderer shared](DOCTagShapeRenderer, "shared");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "renderInContext:contextSize:tagRect:tag:outlineColor:fillColor:traitCollection:", a3, v29, v23, v22, v24, v19, v18, x, y, width, height);
  }
  else
  {
    -[DOCTagRenderer _defaultBorderWidth](self, "_defaultBorderWidth");
    v27 = v26;
    if (v23)
    {
      v28 = v26 * 0.5;
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.width = width;
      v30.size.height = height;
      v31 = CGRectInset(v30, v28, v27 * 0.5);
      x = v31.origin.x;
      y = v31.origin.y;
      width = v31.size.width;
      height = v31.size.height;
    }
    objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithOvalInRect:", x, y, width, height);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(objc_retainAutorelease(v22), "CGColor"));
      CGContextAddPath(a3, (CGPathRef)objc_msgSend(objc_retainAutorelease(v25), "CGPath"));
      CGContextFillPath(a3);
    }
    if (v23)
    {
      CGContextSetLineWidth(a3, v27);
      CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(objc_retainAutorelease(v23), "CGColor"));
      v25 = objc_retainAutorelease(v25);
      CGContextAddPath(a3, (CGPathRef)objc_msgSend(v25, "CGPath"));
      CGContextStrokePath(a3);
    }
  }

}

- (double)_defaultBorderWidth
{
  void *v2;
  double v3;
  double v4;

  +[DOCTagAppearance renderingAppearance](DOCTagAppearance, "renderingAppearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultBorderWidth");
  v4 = v3;

  return v4;
}

+ (BOOL)allowUnsizedSymbolImages
{
  return 0;
}

void __41__DOCTagRenderer_differentiateWithShapes__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  differentiateWithShapes_alwaysUseShapes = objc_msgSend(v0, "BOOLForKey:", CFSTR("DOCTagsRenderWithShapes"));

}

void __24__DOCTagRenderer_shared__block_invoke()
{
  DOCTagRenderer *v0;
  void *v1;

  v0 = objc_alloc_init(DOCTagRenderer);
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;

}

- (id)tintedSystemImageForTag:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[DOCTagRenderer differentiateWithShapes](self, "differentiateWithShapes");
  v6 = objc_msgSend(v4, "labelIndex");

  return (id)objc_msgSend(MEMORY[0x24BEBD640], "_doc_tagImageForRenderingVariant:differentiateWithShapes:tagColorType:", 0, v5, v6);
}

- (id)renderAttributedStringWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
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
  void *v32;
  NSObject *v33;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[DOCTagRenderer shared](DOCTagRenderer, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "renderImageWithRequest:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "tagBaselineAdjustment");
    v11 = v10;
    if (-[DOCTagRenderer differentiateWithShapes](self, "differentiateWithShapes"))
    {
      objc_msgSend(v9, "baselineOffsetFromBottom");
      v11 = v11 - v12;
    }
    v13 = objc_msgSend(v9, "isSymbolImage");
    objc_msgSend(v9, "size");
    v16 = v15;
    if (v13)
    {
      objc_msgSend(v9, "size");
      v18 = v16 / v17;
      v19 = v16 / v17 <= 0.0;
      if (v16 / v17 <= 0.0)
        v20 = v16 / v17;
      else
        v20 = 1.0;
      v21 = 1.0 / v18;
      if (v19)
        v22 = 1.0;
      else
        v22 = v21;
      objc_msgSend(v5, "tagDimension");
      v16 = v23 * v20;
      objc_msgSend(v5, "tagDimension");
      v25 = v24 * v22;
    }
    else
    {
      v25 = v14;
    }
    v26 = (void *)objc_opt_new();
    objc_msgSend(v26, "setImage:", v9);
    objc_msgSend(v26, "setBounds:", 0.0, v11, v16, v25);
    v27 = (void *)objc_opt_new();
    objc_msgSend(v5, "tagToTitleSpacing");
    -[DOCTagRenderer _spacerImageWithWidth:](self, "_spacerImageWithWidth:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setImage:", v28);

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v6, v7);
    objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagRenderer _insertPrefixTextAttachment:spacerAttributedString:ensuringLayoutDirection:into:](self, "_insertPrefixTextAttachment:spacerAttributedString:ensuringLayoutDirection:into:", v26, v30, objc_msgSend(v5, "layoutDirection"), v29);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid parameter"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    DOCLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      -[DOCTagRenderer renderImageWithRequest:].cold.1(v32);

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", &stru_24E330BE0);
  }

  return v29;
}

- (id)_spacerImageWithWidth:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v12;
  CGSize v13;

  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCTagRenderer.m"), 345, CFSTR("Requesting spacer image with zero size."));

  }
  if (_spacerImageWithWidth__onceToken != -1)
    dispatch_once(&_spacerImageWithWidth__onceToken, &__block_literal_global_28);
  v4 = (void *)_spacerImageWithWidth___spacerImageCache;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v13.height = 1.0;
    v13.width = a3;
    UIGraphicsBeginImageContextWithOptions(v13, 0, 1.0);
    UIGraphicsGetImageFromCurrentImageContext();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v7 = (void *)_spacerImageWithWidth___spacerImageCache;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v8);

  }
  return v6;
}

void __40__DOCTagRenderer__spacerImageWithWidth___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_spacerImageWithWidth___spacerImageCache;
  _spacerImageWithWidth___spacerImageCache = v0;

}

- (void)_insertPrefixTextAttachment:(id)a3 spacerAttributedString:(id)a4 ensuringLayoutDirection:(int64_t)a5 into:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v9 = (void *)MEMORY[0x24BDD1458];
  v10 = a6;
  v11 = a4;
  objc_msgSend(v9, "attributedStringWithAttachment:", a3);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x24BDD1688]);
  +[DOCUnicode nonBreakingSpace_zeroWidth](_TtC26DocumentManagerExecutables10DOCUnicode, "nonBreakingSpace_zeroWidth");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendUnicode:", v13);

  objc_msgSend(v12, "appendAttributedString:", v16);
  +[DOCUnicode nonBreakingSpace_zeroWidth](_TtC26DocumentManagerExecutables10DOCUnicode, "nonBreakingSpace_zeroWidth");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendUnicode:", v14);

  objc_msgSend(v12, "appendAttributedString:", v11);
  +[DOCUnicode nonBreakingSpace_zeroWidth](_TtC26DocumentManagerExecutables10DOCUnicode, "nonBreakingSpace_zeroWidth");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendUnicode:", v15);

  objc_msgSend(v10, "wrapInDirectionalIsolation:", 0);
  objc_msgSend(v10, "insertAttributedString:atIndex:", v12, 0);
  objc_msgSend(v10, "wrapInDirectionalIsolation:", +[DOCUnicode layoutDirectionForUIDirection:](_TtC26DocumentManagerExecutables10DOCUnicode, "layoutDirectionForUIDirection:", a5));

}

- (void)renderImageWithRequest:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(OUTLINED_FUNCTION_2(a1), "UTF8String");
  OUTLINED_FUNCTION_0(&dword_21EA4C000, v1, v2, "%s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_1();
}

@end
