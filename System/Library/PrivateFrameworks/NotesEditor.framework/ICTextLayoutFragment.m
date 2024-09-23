@implementation ICTextLayoutFragment

- (double)topMargin
{
  double result;

  -[ICTextLayoutFragment marginForTop:](self, "marginForTop:", 1);
  return result;
}

- (double)bottomMargin
{
  double result;

  -[ICTextLayoutFragment marginForTop:](self, "marginForTop:", 0);
  return result;
}

- (ICTextLayoutFragment)initWithTextElement:(id)a3 range:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICTextLayoutFragment;
  return -[ICTextLayoutFragment initWithTextElement:range:](&v5, sel_initWithTextElement_range_, a3, a4);
}

- (double)leadingPadding
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;

  -[ICTextLayoutFragment textElement](self, "textElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textContentManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[ICTextLayoutFragment nsRangeInTextStorage:](self, "nsRangeInTextStorage:", v4);
  objc_msgSend(v4, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v8 = 0.0;
  if (v5 < v7)
  {
    objc_msgSend(v4, "attributedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_opt_class();
      -[ICTextLayoutFragment textLayoutManager](self, "textLayoutManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      objc_msgSend(v12, "textContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      ICDynamicCast();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "effectiveAttachmentViewSizeForTextContainer:", v14);
      if (v15 && v16 == 1)
      {

LABEL_12:
        goto LABEL_13;
      }
      objc_msgSend(v14, "tk2TextView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textContainerInset");
      v19 = -v18;
      objc_msgSend(v14, "lineFragmentPadding");
      v8 = v19 - v20;

    }
    objc_msgSend(v4, "attributedString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v5, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "style") == 4)
    {
      v8 = (float)((float)(unint64_t)objc_msgSend(v12, "blockQuoteLevel") * 13.0) + 10.0;
    }
    else if (objc_msgSend(v12, "isBlockQuote"))
    {
      v8 = (double)(unint64_t)objc_msgSend(v12, "blockQuoteLevel") * 12.0;
    }
    goto LABEL_12;
  }
LABEL_13:

  return v8;
}

- (double)marginForTop:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v41;
  uint64_t v42;

  v3 = a3;
  objc_opt_class();
  -[ICTextLayoutFragment textElement](self, "textElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "elementRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0.0;
  if ((objc_msgSend(v7, "isEmpty") & 1) == 0)
  {
    objc_opt_class();
    objc_msgSend(v6, "textContentManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "documentRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "offsetFromLocation:toLocation:", v12, v13);

    objc_msgSend(v10, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !v14)
      {
        v8 = *MEMORY[0x1E0D64A80];
LABEL_29:

        goto LABEL_30;
      }
    }
    objc_msgSend(v10, "textStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v14, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 && objc_msgSend(v18, "style") == 103 && !v14)
    {
      -[ICTextLayoutFragment textElement](self, "textElement");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textContentManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      objc_msgSend(v41, "textStorage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "styler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "zoomController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "zoomFactor");
      v25 = v24;

      if (v25 != 1.0)
      {
        v8 = 2.0;
LABEL_28:

        goto LABEL_29;
      }
    }
    v8 = 0.0;
    if (objc_msgSend(v18, "style") != 4)
      goto LABEL_28;
    v26 = -[ICTextLayoutFragment nsRangeInTextStorage:](self, "nsRangeInTextStorage:", v10);
    v28 = v27;
    objc_msgSend(v10, "attributedString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "length");

    if (v26 >= v30)
      goto LABEL_28;
    v42 = v28;
    objc_msgSend(v10, "attributedString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v26, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v32;
    if (objc_msgSend(v32, "style") != 4)
    {
LABEL_27:

      goto LABEL_28;
    }
    v34 = 0;
    v35 = v42;
    if (v3)
      v35 = -1;
    v36 = v35 + v26;
    if ((uint64_t)(v35 + v26) >= 0 && v36 < v30)
    {
      v37 = v33;
      objc_msgSend(v10, "attributedString");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v36, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        if (objc_msgSend(v34, "style") == 4)
        {
          v33 = v37;
          if (objc_msgSend(v34, "style") == 4)
          {
            v39 = objc_msgSend(v34, "blockQuoteLevel");
            if (v39 == objc_msgSend(v37, "blockQuoteLevel"))
              v8 = 0.0;
            else
              v8 = 10.0;
          }
          goto LABEL_26;
        }
        v8 = 10.0;
      }
      v33 = v37;
    }
LABEL_26:

    goto LABEL_27;
  }
LABEL_30:

  return v8;
}

- (_NSRange)nsRangeInTextStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  _NSRange result;

  v4 = a3;
  -[ICTextLayoutFragment textElement](self, "textElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textContentManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextLayoutFragment textElement](self, "textElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "elementRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "offsetFromLocation:toLocation:", v8, v11);

  -[ICTextLayoutFragment textElement](self, "textElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textContentManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextLayoutFragment textElement](self, "textElement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "elementRange");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextLayoutFragment textElement](self, "textElement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "elementRange");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "endLocation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v14, "offsetFromLocation:toLocation:", v17, v20);

  v22 = v12;
  v23 = v21;
  result.length = v23;
  result.location = v22;
  return result;
}

- (double)trailingPadding
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  double v8;
  void *v9;
  void *v10;

  -[ICTextLayoutFragment textElement](self, "textElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textContentManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[ICTextLayoutFragment nsRangeInTextStorage:](self, "nsRangeInTextStorage:", v4);
  objc_msgSend(v4, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v8 = 0.0;
  if (v5 < v7)
  {
    objc_msgSend(v4, "attributedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "style") == 4)
      v8 = 4.0;
    else
      v8 = 0.0;

  }
  return v8;
}

- (void)drawAtPoint:(CGPoint)a3 inContext:(CGContext *)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  objc_super v28;
  objc_super v29;
  const __CFString *v30;
  _QWORD v31[2];

  y = a3.y;
  x = a3.x;
  v31[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[ICTextLayoutFragment textLayoutManager](self, "textLayoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v9, "textContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;

  if (objc_msgSend(v11, "insideSiriSnippet"))
  {
    v15 = v14 + v14;
    -[ICTextLayoutFragment textElement](self, "textElement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "elementRange");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLayoutFragmentForLocation:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layoutFragmentFrame");
    v21 = v20;
    v23 = v22;

    if (y + v21 < v15)
    {
      if (v23 + y + v21 <= v15)
      {
        v28.receiver = self;
        v28.super_class = (Class)ICTextLayoutFragment;
        -[ICTextLayoutFragment drawAtPoint:inContext:](&v28, sel_drawAtPoint_inContext_, a4, x, y);
      }
      else
      {
        v30 = CFSTR("finalHeight");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D64E00], 0, v25);

        v29.receiver = self;
        v29.super_class = (Class)ICTextLayoutFragment;
        -[ICTextLayoutFragment drawAtPoint:inContext:](&v29, sel_drawAtPoint_inContext_, a4, x, y);

      }
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)ICTextLayoutFragment;
    -[ICTextLayoutFragment drawAtPoint:inContext:](&v27, sel_drawAtPoint_inContext_, a4, x, y);
  }

}

@end
