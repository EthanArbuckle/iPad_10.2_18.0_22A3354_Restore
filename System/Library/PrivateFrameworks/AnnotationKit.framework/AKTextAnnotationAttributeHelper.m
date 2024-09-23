@implementation AKTextAnnotationAttributeHelper

+ (void)resolvedAlignmentAndDirection:(id)a3 locale:(id)a4 alignment:(int64_t *)a5 direction:(int64_t *)a6
{
  id v9;
  int64_t v10;
  int64_t v11;
  _BOOL4 v12;
  id v13;

  v13 = a3;
  v9 = a4;
  if (!v13 || (v10 = objc_msgSend(v13, "baseWritingDirection"), v10 == -1))
    v10 = objc_msgSend(MEMORY[0x24BDF6750], "defaultWritingDirectionForLanguage:", v9);
  if (a6)
    *a6 = v10;
  if (a5)
  {
    if (v13)
    {
      v11 = objc_msgSend(v13, "alignment");
      v12 = v10 == 1;
      if (v11 != 4)
        goto LABEL_12;
    }
    else
    {
      v12 = v10 == 1;
    }
    v11 = 2 * v12;
LABEL_12:
    *a5 = v11;
  }

}

+ (id)fontsOfAnnotations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v17 = *MEMORY[0x24BDF65F8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToAKTextAnnotationProtocol", v17))
        {
          v11 = v10;
          objc_msgSend(v11, "annotationText");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 3221225472;
          v18[2] = sub_228FDC980;
          v18[3] = &unk_24F1A74F0;
          v13 = v4;
          v19 = v13;
          +[AKTextAnnotationAttributeHelper enumerateFontAttributesOfAttributedString:usingBlock:](AKTextAnnotationAttributeHelper, "enumerateFontAttributesOfAttributedString:usingBlock:", v12, v18);
          if (!v12 || !objc_msgSend(v12, "length"))
          {
            objc_msgSend(v11, "typingAttributes");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v17);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
              objc_msgSend(v13, "addObject:", v15);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)fontsOfEditor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  double v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEditing"))
  {
    objc_msgSend(v3, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "annotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "originalModelBaseScaleFactor");
    v8 = 1.0 / v7;
    objc_msgSend(v5, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_228FDCA94;
    v11[3] = &unk_24F1A7518;
    v13 = v8;
    v12 = v4;
    +[AKTextAnnotationAttributeHelper enumerateFontAttributesOfAttributedString:usingBlock:](AKTextAnnotationAttributeHelper, "enumerateFontAttributesOfAttributedString:usingBlock:", v9, v11);

  }
  return v4;
}

+ (void)setFont:(id)a3 ofAnnotation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "annotationText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v7, "annotationText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = sub_228FDCBEC;
  v17 = &unk_24F1A7540;
  v18 = v9;
  v19 = v6;
  v11 = v6;
  v12 = v9;
  +[AKTextAnnotationAttributeHelper enumerateFontAttributesOfAttributedString:usingBlock:](AKTextAnnotationAttributeHelper, "enumerateFontAttributesOfAttributedString:usingBlock:", v10, &v14);

  v13 = (void *)objc_msgSend(a1, "newTextStorageOriginalFontSavvyWithAttributedString:", v12, v14, v15, v16, v17);
  objc_msgSend(v7, "setAnnotationText:", v13);

}

+ (void)setTextAlignment:(int64_t)a3 ofAnnotation:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  objc_msgSend(v6, "annotationText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v7, "mutableCopy");

  v8 = objc_msgSend(v13, "length");
  v9 = *MEMORY[0x24BDF6628];
  if (!v8
    || (objc_msgSend(v13, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BDF6628], 0, 0),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v11, "setAlignment:", a3);
  objc_msgSend(v13, "addAttribute:value:range:", v9, v11, 0, objc_msgSend(v13, "length"));
  v12 = (void *)objc_msgSend(a1, "newTextStorageOriginalFontSavvyWithAttributedString:", v13);
  objc_msgSend(v6, "setAnnotationText:", v12);

}

+ (id)textAttributesOfAnnotations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToAKTextAnnotationProtocol"))
        {
          v11 = v10;
          objc_msgSend(v11, "annotationText");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "length");
          v17[0] = MEMORY[0x24BDAC760];
          v17[1] = 3221225472;
          v17[2] = sub_228FDCEE8;
          v17[3] = &unk_24F1A7568;
          v14 = v4;
          v18 = v14;
          objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 0, v17);
          if (!v12 || !objc_msgSend(v12, "length"))
          {
            objc_msgSend(v11, "typingAttributes");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v15);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)textAttributesOfEditor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEditing"))
  {
    objc_msgSend(v3, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_228FDCFD4;
    v9[3] = &unk_24F1A7568;
    v10 = v4;
    objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v9);

  }
  return v4;
}

+ (void)setTextAttributes:(id)a3 ofAnnotation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "annotationText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v10, "addAttributes:range:", v7, 0, objc_msgSend(v10, "length"));
  v9 = (void *)objc_msgSend(a1, "newTextStorageOriginalFontSavvyWithAttributedString:", v10);
  objc_msgSend(v6, "setAnnotationText:", v9);

}

+ (void)adjustBoundsOfAnnotation:(id)a3 toFitOptionalText:(id)a4 onPageController:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  __int128 *v11;
  int v12;
  uint64_t v13;
  unsigned __int8 v14;
  __int128 v15;
  __int128 v16;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_msgSend(v7, "conformsToAKRectangularAnnotationProtocol");
  v15 = 0u;
  v16 = 0u;
  v14 = 0;
  if (v10)
    v11 = &v15;
  else
    v11 = 0;
  LOBYTE(v13) = 0;
  +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", v11, 0, 0, 0, &v14, v7, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), v8, 0, v13, v9);

  if (v10)
    objc_msgSend(v7, "setRectangle:", v15, v16);
  v12 = objc_msgSend(v7, "textIsClipped");
  if (v14 != v12)
    objc_msgSend(v7, "setTextIsClipped:", v14 != 0);

}

+ (void)adjustAnnotationBoundsToFitText:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  CGFloat x;
  double v9;
  CGFloat y;
  double v11;
  CGFloat v12;
  double v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  BOOL v31;
  CGFloat v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double Height;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double Width;
  unint64_t v47;
  double v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  double rect_8;
  double rect_16;
  CGFloat rect_24;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  double v65;
  char v66;
  __int128 v67;
  __int128 v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v3 = a3;
  +[AKTextAnnotationAttributeHelper actualOrPlaceholderTextOfAnnotation:](AKTextAnnotationAttributeHelper, "actualOrPlaceholderTextOfAnnotation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
    goto LABEL_20;
  v5 = objc_msgSend(v3, "textIsFixedWidth");
  v6 = objc_msgSend(v3, "textIsFixedHeight");
  objc_msgSend(v3, "setTextIsFixedWidth:", 1);
  objc_msgSend(v3, "setTextIsFixedHeight:", 1);
  objc_msgSend(v3, "rectangle");
  x = v7;
  y = v9;
  v12 = v11;
  v63 = v13;
  v14 = +[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", objc_msgSend(v3, "originalExifOrientation"));
  v64 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v65 = *MEMORY[0x24BDBF090];
  rect_8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  rect_16 = *(double *)(MEMORY[0x24BDBF090] + 16);
  +[AKAnnotationRenderer textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:](AKAnnotationRenderer, "textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v3, v4);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  +[AKTextAnnotationRenderHelper unconstrainedSizeForText:](AKTextAnnotationRenderHelper, "unconstrainedSizeForText:", v4);
  v24 = v23;
  v61 = y;
  v62 = x;
  rect_24 = v12;
  v25 = v16;
  v26 = v18;
  v27 = v20;
  v28 = v22;
  if (!v14)
  {
    Height = CGRectGetHeight(*(CGRect *)&v25);
    v38 = v24;
    v31 = v24 <= Height;
    v32 = v63;
    v33 = v20;
    v34 = rect_8;
    if (v31)
      goto LABEL_9;
    v36 = (v38 - Height) * -0.5;
    v35 = 0.0;
LABEL_7:
    v39 = v16;
    v40 = v18;
    v41 = v22;
    v69 = CGRectInset(*(CGRect *)(&v33 - 2), v35, v36);
    +[AKAnnotationRenderer rectangleForAnnotation:withTextBounds:](AKAnnotationRenderer, "rectangleForAnnotation:withTextBounds:", v3, v69.origin.x, v69.origin.y, v69.size.width, v69.size.height);
    x = v42;
    y = v43;
    v12 = v44;
    v32 = v45;
    objc_msgSend(v3, "setRectangle:");
    if (v14)
      goto LABEL_8;
LABEL_9:
    v71.origin.y = v61;
    v71.origin.x = v62;
    v71.size.width = rect_24;
    v71.size.height = v63;
    Width = CGRectGetWidth(v71);
    goto LABEL_10;
  }
  v29 = CGRectGetWidth(*(CGRect *)&v25);
  v30 = v24;
  v31 = v24 <= v29;
  v32 = v63;
  v33 = v20;
  v34 = rect_8;
  if (!v31)
  {
    v35 = (v30 - v29) * -0.5;
    v36 = 0.0;
    goto LABEL_7;
  }
LABEL_8:
  v70.origin.y = v61;
  v70.origin.x = v62;
  v70.size.width = rect_24;
  v70.size.height = v63;
  Width = CGRectGetHeight(v70);
LABEL_10:
  v47 = vcvtad_u64_f64(Width * 3.0);
  if (v47)
  {
    v48 = *MEMORY[0x24BDBEFB0];
    v49 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    while (1)
    {
      v67 = 0u;
      v68 = 0u;
      v66 = 0;
      LOBYTE(v57) = 0;
      +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", &v67, 0, 0, 0, &v66, v3, v48, v49, v65, v64, rect_16, v34, 0, 0, v57, v4);
      if (!v66)
        break;
      if (v14)
      {
        v50 = 0.0;
        v51 = -0.5;
      }
      else
      {
        v50 = -0.5;
        v51 = 0.0;
      }
      v72.origin.x = x;
      v72.origin.y = y;
      v72.size.width = v12;
      v72.size.height = v32;
      v73 = CGRectInset(v72, v50, v51);
      x = v73.origin.x;
      y = v73.origin.y;
      v12 = v73.size.width;
      v32 = v73.size.height;
      objc_msgSend(v3, "setRectangle:");
      if (!--v47)
        goto LABEL_17;
    }
    v54 = *((double *)&v67 + 1);
    v53 = *(double *)&v67;
    v56 = *((double *)&v68 + 1);
    v55 = *(double *)&v68;
    v52 = v3;
  }
  else
  {
LABEL_17:
    v52 = v3;
    v54 = v61;
    v53 = v62;
    v55 = rect_24;
    v56 = v63;
  }
  objc_msgSend(v52, "setRectangle:", v53, v54, v55, v56);
  objc_msgSend(v3, "setTextIsFixedWidth:", v5);
  objc_msgSend(v3, "setTextIsFixedHeight:", v6);
LABEL_20:

}

+ (id)placeholderTextOfAnnotation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  if (objc_msgSend(v3, "shouldUsePlaceholderText")
    && ((objc_msgSend(v3, "customPlaceholderText"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
     || (objc_msgSend((id)objc_opt_class(), "defaultPlaceholderText"),
         (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    objc_msgSend(v3, "typingAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:attributes:](AKTextAnnotationAttributeHelper, "newTextStorageOriginalFontSavvyWithString:attributes:", v4, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)actualOrPlaceholderTextOfAnnotation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "annotationText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
    objc_msgSend(v4, "annotationText");
  else
    objc_msgSend(a1, "placeholderTextOfAnnotation:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)font:(id)a3 byApplyingScaleFactor:(double)a4
{
  id v5;
  double v6;
  void *v7;

  v5 = a3;
  objc_msgSend(v5, "pointSize");
  objc_msgSend(v5, "fontWithSize:", v6 * a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)typingAttributes:(id)a3 byApplyingScaleFactor:(double)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (fabs(a4 + -1.0) >= 0.0005)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDF6620]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDF65F8];
    if (!v8)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDF65F8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "pointSize");
    v26 = v8;
    objc_msgSend(v8, "fontWithSize:", v10 * a4);
    v11 = objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "mutableCopy");
    v25 = (void *)v11;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v9);
    v12 = *MEMORY[0x24BDF66C8];
    v32[0] = *MEMORY[0x24BDF6608];
    v32[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            v21 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v19, "doubleValue");
            objc_msgSend(v21, "numberWithDouble:", v22 * a4);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, v18);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v15);
    }

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

+ (id)newTextStorage:(id)a3 byApplyingScaleFactor:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  double v14;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    if (objc_msgSend(v7, "length") && fabs(a4 + -1.0) >= 0.0005)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = sub_228FDD92C;
      v11[3] = &unk_24F1A7590;
      v13 = a1;
      v14 = a4;
      v12 = v8;
      objc_msgSend(a1, "enumerateFontAttributesOfAttributedString:usingBlock:", v7, v11);

    }
    v9 = (void *)objc_msgSend(a1, "newTextStorageOriginalFontSavvyWithAttributedString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)newTextStorageOriginalFontSavvyWithAttributedString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  AKTextLayoutManager *v6;

  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x24BDF6778];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_alloc_init(AKTextLayoutManager);
  objc_msgSend(v5, "addLayoutManager:", v6);
  objc_msgSend(v5, "setAttributedString:", v4);

  objc_msgSend(v5, "removeLayoutManager:", v6);
  return v5;
}

+ (id)newTextStorageOriginalFontSavvyWithString:(id)a3 attributes:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = (__CFString *)a3;
  if (v6)
    v7 = v6;
  else
    v7 = &stru_24F1A83D0;
  v8 = (objc_class *)MEMORY[0x24BDD1458];
  v9 = a4;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithString:attributes:", v7, v9);

  v11 = (void *)objc_msgSend(a1, "newTextStorageOriginalFontSavvyWithAttributedString:", v10);
  return v11;
}

+ (void)enumerateFontAttributesOfAttributedString:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_228FDDB68;
  v9[3] = &unk_24F1A75B8;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0x100000, v9);

}

@end
