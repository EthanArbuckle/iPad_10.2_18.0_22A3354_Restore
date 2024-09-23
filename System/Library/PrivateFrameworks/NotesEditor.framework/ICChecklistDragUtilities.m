@implementation ICChecklistDragUtilities

+ (BOOL)shouldDropAboveForTrackedTodoParagraph:(id)a3 forPoint:(CGPoint)a4 textView:(id)a5
{
  double y;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  BOOL v25;

  y = a4.y;
  v7 = a5;
  v8 = a3;
  v9 = objc_msgSend(v8, "characterRange");
  v11 = v10;
  v12 = objc_msgSend(v8, "characterRange");
  v14 = v13;

  v15 = v9 + v11;
  objc_msgSend(v7, "textStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  v18 = v14 - (v15 >= v17);
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_msgSend(v7, "ic_rectForRange:", v12, v18);
  }
  else
  {
    objc_msgSend(v7, "icLayoutManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "glyphRangeForCharacterRange:actualCharacterRange:", v12, v18, 0);
    v22 = v21;
    objc_msgSend(v7, "textContainer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "boundingRectForGlyphRange:inTextContainer:", v20, v22, v23);

  }
  objc_msgSend(v7, "textContainerInset");
  TSDCenterOfRect();
  v25 = y <= v24;

  return v25;
}

+ (CGRect)insertionRectForTrackedTodoParagraph:(id)a3 drawAbove:(BOOL)a4 inTextView:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL4 v46;
  int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  double MaxY;
  double MinY;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double rect;
  double v66;
  double v67;
  CGRect v68;
  CGRect result;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v10 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (objc_msgSend(v8, "isDraggingChecklistItem")
    && objc_msgSend(v8, "isDraggingOverChecklistItem"))
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      objc_opt_class();
      objc_msgSend(v8, "textLayoutManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "todoButtonForTrackedParagraph:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageFrame");
      objc_msgSend(v8, "convertRect:fromView:", v15);
      v17 = v16;
      rect = v18;
      v66 = v19;
      v67 = v20;
      v21 = objc_msgSend(v7, "characterRange");
      v23 = v21;
      v24 = v22;
      if (v6)
        v25 = -1;
      else
        v25 = v22;
      objc_msgSend(v14, "trackedTodoParagraphAtIndex:", v21 + v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "todoButtonForTrackedParagraph:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "imageFrame");
      objc_msgSend(v8, "convertRect:fromView:", v27);
    }
    else
    {
      objc_msgSend(v8, "icLayoutManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "todoButtonForTrackedParagraphIfExists:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageFrame");
      v17 = v32;
      rect = v33;
      v66 = v34;
      v67 = v35;
      v36 = objc_msgSend(v7, "characterRange");
      v23 = v36;
      v24 = v37;
      if (v6)
        v38 = -1;
      else
        v38 = v37;
      objc_msgSend(v14, "trackedTodoParagraphAtIndexIfExists:", v36 + v38);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "todoButtonForTrackedParagraphIfExists:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "imageFrame");
    }
    v39 = v28;
    v40 = v29;
    v41 = v30;
    v42 = v31;
    v43 = objc_msgSend(v14, "lineCountForCharacterRange:", v23, v24);
    if (v26)
    {
      v44 = objc_msgSend(v26, "characterRange");
      v46 = (unint64_t)(objc_msgSend(v14, "lineCountForCharacterRange:", v44, v45) - 3) < 0xFFFFFFFFFFFFFFFELL;
    }
    else
    {
      v46 = 0;
    }
    v47 = (unint64_t)(v43 - 3) < 0xFFFFFFFFFFFFFFFELL || v46;

    if (!v15)
      goto LABEL_59;
    if (v27)
    {
      if ((v47 & 1) == 0)
      {
        if (v6)
          v52 = v39;
        else
          v52 = v17;
        if (v6)
          v53 = v40;
        else
          v53 = rect;
        v11 = v67;
        if (v6)
          v54 = v41;
        else
          v54 = v67;
        if (v6)
          v55 = v42;
        else
          v55 = v66;
        if (v6)
          v56 = v17;
        else
          v56 = v39;
        if (v6)
          v57 = rect;
        else
          v57 = v40;
        if (v6)
        {
          v41 = v67;
          v42 = v66;
        }
        MaxY = CGRectGetMaxY(*(CGRect *)&v52);
        v68.origin.x = v56;
        v68.origin.y = v57;
        v68.size.width = v41;
        v68.size.height = v42;
        MinY = MaxY + (CGRectGetMinY(v68) - MaxY) * 0.5;
        v60 = -1.0;
        goto LABEL_58;
      }
      if (v6)
        v48 = v17;
      else
        v48 = v39;
      v49 = rect;
      v50 = v66;
      if (!v6)
        v49 = v40;
      v11 = v67;
      if (v6)
        v51 = v67;
      else
        v51 = v41;
      if (!v6)
        v50 = v42;
      goto LABEL_56;
    }
    if (!v47 || v6)
    {
      v50 = v66;
      v11 = v67;
      v49 = rect;
      v48 = v17;
      v51 = v67;
      if (v6)
      {
LABEL_56:
        MinY = CGRectGetMinY(*(CGRect *)&v48);
        v60 = -3.0;
LABEL_58:
        v9 = MinY + v60;
        v10 = v17;
LABEL_59:

        v12 = 2.0;
        goto LABEL_60;
      }
    }
    else
    {
      v48 = v17;
      v49 = rect;
      v50 = v66;
      v11 = v67;
      v51 = v67;
    }
    MinY = CGRectGetMaxY(*(CGRect *)&v48);
    v60 = 3.0;
    goto LABEL_58;
  }
LABEL_60:

  v61 = v10;
  v62 = v9;
  v63 = v11;
  v64 = v12;
  result.size.height = v64;
  result.size.width = v63;
  result.origin.y = v62;
  result.origin.x = v61;
  return result;
}

+ (unint64_t)tabIndentationEqualivantForString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "ic_trimmedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    if (objc_msgSend(v3, "ic_isLastCharacterANewline"))
    {
      objc_msgSend(v3, "ic_substringWithRange:", 0, objc_msgSend(v3, "length") - 1);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v7;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\t"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "ic_countOfCharactersInSet:", v8);

  }
  return v6;
}

@end
