@implementation DOCTagShapeRenderer

+ (DOCTagShapeRenderer)shared
{
  if (shared_onceToken_0 != -1)
    dispatch_once(&shared_onceToken_0, &__block_literal_global_3);
  return (DOCTagShapeRenderer *)(id)shared_instance;
}

void __29__DOCTagShapeRenderer_shared__block_invoke()
{
  DOCTagShapeRenderer *v0;
  void *v1;

  v0 = objc_alloc_init(DOCTagShapeRenderer);
  v1 = (void *)shared_instance;
  shared_instance = (uint64_t)v0;

}

- (void)renderInContext:(CGContext *)a3 contextSize:(CGSize)a4 tagRect:(CGRect)a5 tag:(id)a6 outlineColor:(id)a7 fillColor:(id)a8 traitCollection:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v16;
  CGFloat v17;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  double v31;
  double v32;
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
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  void *v59;
  double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  CGFloat v67;
  CGFloat v68;
  _QWORD v69[4];
  id v70;
  CGContext *v71;
  CGFloat v72;
  CGFloat v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  CGRect v78;
  CGRect v79;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v16 = a4.height;
  v17 = a4.width;
  v20 = a7;
  v21 = a9;
  if (a3)
  {
    v22 = a8;
    v23 = a6;
    +[DOCTagAppearance renderingAppearance](DOCTagAppearance, "renderingAppearance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "labelIndex");

    -[DOCTagShapeRenderer _shapeImageForColorType:variant:renderedColor:](self, "_shapeImageForColorType:variant:renderedColor:", v25, 0, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = v17;
    v68 = v16;
    if (v26)
    {
      -[DOCTagShapeRenderer _shapeImageForColorType:variant:renderedColor:](self, "_shapeImageForColorType:variant:renderedColor:", v25, 1, v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
    }
    else
    {
      if (v20)
      {
        v29 = v20;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE2DF20], "nonClearNoneTagColor");
        v29 = (id)objc_claimAutoreleasedReturnValue();
      }
      v30 = v29;
      -[DOCTagShapeRenderer _shapeImageForColorType:variant:renderedColor:](self, "_shapeImageForColorType:variant:renderedColor:", v25, 1, v29);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v24, "outlineTagsToIndicateMixedState");

      v27 = 0;
    }
    objc_msgSend(v21, "displayScale");
    -[DOCTagShapeRenderer _imageRectForRenderingImage:tagRect:displayScale:](self, "_imageRectForRenderingImage:tagRect:displayScale:", v26, x, y, width, height);
    v35 = v31;
    v36 = v32;
    v37 = v33;
    v38 = v34;
    if (v27 || (v39 = v34, v40 = v33, v41 = v32, v42 = v31, v28))
    {
      v78 = CGRectInset(*(CGRect *)&v31, 1.0, 1.0);
      v42 = v78.origin.x;
      v41 = v78.origin.y;
      v40 = v78.size.width;
      v39 = v78.size.height;
    }
    if (CGContextGetBlendMode() == 16)
    {
      v43 = v26;
      objc_msgSend(v43, "size");
      v45 = v40 / v44;
      objc_msgSend(v43, "size");
      if (v45 >= v39 / v46)
        v45 = v39 / v46;
      objc_msgSend(v43, "contentInsets");
      v48 = v47 * v45;
      v50 = v49 * v45;
      v52 = v51 * v45;
      v54 = v53 * v45;
      v55 = v42 + v50;
      v56 = v41 + v48;
      v57 = v40 - (v50 + v54);
      v58 = v39 - (v48 + v52);
      objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "scaledValueForValue:compatibleWithTraitCollection:", v21, 1.0);
      v61 = v60;

      v79.origin.x = v55;
      v79.origin.y = v56;
      v79.size.width = v57;
      v79.size.height = v58;
      CGRectInset(v79, -v61, -v61);
      UIRectIntegralWithScale();
      v69[0] = MEMORY[0x24BDAC760];
      v69[1] = 3221225472;
      v69[2] = __102__DOCTagShapeRenderer_renderInContext_contextSize_tagRect_tag_outlineColor_fillColor_traitCollection___block_invoke;
      v69[3] = &unk_24E327AF0;
      v72 = v67;
      v73 = v68;
      v74 = v62;
      v75 = v63;
      v76 = v64;
      v77 = v65;
      v70 = v43;
      v71 = a3;
      v66 = v43;
      CGContextSaveGState(a3);
      __102__DOCTagShapeRenderer_renderInContext_contextSize_tagRect_tag_outlineColor_fillColor_traitCollection___block_invoke((uint64_t)v69);
      CGContextRestoreGState(a3);

    }
    else
    {
      objc_msgSend(v26, "drawInRect:", v42, v41, v40, v39);
      if (v27)
        objc_msgSend(v27, "drawInRect:", v35, v36, v37, v38);
    }

  }
}

void __102__DOCTagShapeRenderer_renderInContext_contextSize_tagRect_tag_outlineColor_fillColor_traitCollection___block_invoke(uint64_t a1)
{
  CGContext *v2;
  id v3;

  CGContextTranslateCTM(*(CGContextRef *)(a1 + 40), 0.0, *(CGFloat *)(a1 + 56));
  CGContextScaleCTM(*(CGContextRef *)(a1 + 40), 1.0, -1.0);
  CGContextClipToMask(*(CGContextRef *)(a1 + 40), *(CGRect *)(a1 + 64), (CGImageRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage"));
  v2 = *(CGContext **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BEBD4B8], "orangeColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v2, (CGColorRef)objc_msgSend(v3, "CGColor"));

  CGContextFillRect(*(CGContextRef *)(a1 + 40), *(CGRect *)(a1 + 64));
}

- (double)baselineOffsetForRequest:(id)a3 tagRectSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = v8;

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagShapeRenderer _shapeImageForColorType:variant:renderedColor:](self, "_shapeImageForColorType:variant:renderedColor:", 4, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[DOCTagShapeRenderer _imageRectForRenderingImage:tagRect:displayScale:](self, "_imageRectForRenderingImage:tagRect:displayScale:", v11, 0.0, 0.0, width, height, v9);
  objc_msgSend(v11, "size");
  objc_msgSend(v11, "baselineOffsetFromBottom");
  objc_msgSend(v11, "contentInsets");
  UIRoundToScale();
  v13 = v12;

  return v13;
}

- (CGRect)_imageRectForRenderingImage:(id)a3 tagRect:(CGRect)a4 displayScale:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
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
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(v9, "contentInsets");
  if (v11 >= v13)
    v11 = v13;
  if (v10 >= v12)
    v10 = v12;
  if (v11 < v10)
    v10 = v11;
  v14 = -fmax(v10, 0.0);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v29 = CGRectInset(v28, v14, v14);
  v15 = v29.origin.x;
  v16 = v29.origin.y;
  objc_msgSend(v9, "size");
  objc_msgSend(v9, "size");
  objc_msgSend(v9, "size");
  UIRoundToScale();
  v18 = v17;
  objc_msgSend(v9, "size");

  UIRoundToScale();
  v20 = v19;
  UIRoundToScale();
  v22 = v15 + v21;
  UIRoundToScale();
  v24 = v16 + v23;
  v25 = v22;
  v26 = v18;
  v27 = v20;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v24;
  result.origin.x = v25;
  return result;
}

- (id)_shapeImageForColorType:(int64_t)a3 variant:(unint64_t)a4 renderedColor:(id)a5
{
  if (!a5)
    return 0;
  objc_msgSend(MEMORY[0x24BEBD640], "_doc_tagImageForRenderingVariant:differentiateWithShapes:tagColorType:renderedColor:", a4, 1, a3, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
