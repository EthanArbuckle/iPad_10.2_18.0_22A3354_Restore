@implementation PDFAnnotationAccessibilityElement

- (PDFAnnotationAccessibilityElement)initWithPage:(id)a3 annotation:(id)a4 withParent:(id)a5
{
  id v8;
  id v9;
  PDFAnnotationAccessibilityElement *v10;
  PDFAnnotationAccessibilityElement *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PDFAnnotationAccessibilityElement;
  v10 = -[AXPDFNodeElement initWithAccessibilityContainer:withPage:](&v19, sel_initWithAccessibilityContainer_withPage_, a5, v8);
  v11 = v10;
  if (v10)
  {
    -[AXPDFNodeElement setPage:](v10, "setPage:", v8);
    -[PDFAnnotationAccessibilityElement setAnnotation:](v11, "setAnnotation:", v9);
  }
  -[PDFAnnotationAccessibilityElement _accessibilityAnnotationFieldType](v11, "_accessibilityAnnotationFieldType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDE31C0]);

  if (v13)
  {
    -[PDFAnnotationAccessibilityElement annotation](v11, "annotation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isListChoice");

    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", v11, sel__axAnnotationHit_, *MEMORY[0x24BDE3200], 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObserver:selector:name:object:", v11, sel__axRemovedFromSuperview_, AXPDFRemoveFromSuperviewNotification, 0);

    }
  }

  return v11;
}

- (void)_axAnnotationHit:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3200]);

  if (v5)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    -[PDFAnnotationAccessibilityElement setCachedAXElements:](self, "setCachedAXElements:", 0);
  }
}

- (void)_axRemovedFromSuperview:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", AXPDFRemoveFromSuperviewNotification);

  if (v5)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    -[PDFAnnotationAccessibilityElement setCachedAXElements:](self, "setCachedAXElements:", 0);
  }
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  -[PDFAnnotationAccessibilityElement _accessibilityAnnotationType](self, "_accessibilityAnnotationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE3178]);

  if ((v4 & 1) != 0)
    return 0;
  -[PDFAnnotationAccessibilityElement _accessibilityAnnotationFieldType](self, "_accessibilityAnnotationFieldType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDE31C0]);

  if (!v6)
    return 1;
  -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isListChoice");

  return (v8 & 1) == 0;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AXPDFNodeElement axConvertBoundsFromPageToScreenCoordinates:](self, "axConvertBoundsFromPageToScreenCoordinates:", v5, v7, v9, v11);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PDFAnnotationAccessibilityElement;
  v3 = -[PDFAnnotationAccessibilityElement accessibilityTraits](&v21, sel_accessibilityTraits);
  -[PDFAnnotationAccessibilityElement _accessibilityAnnotationFieldType](self, "_accessibilityAnnotationFieldType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotationAccessibilityElement _accessibilityAnnotationType](self, "_accessibilityAnnotationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PDFAnnotationAccessibilityElement _accessibilityIsButtonWidget](self, "_accessibilityIsButtonWidget"))
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE31C0]))
    {
      if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE31D0]) & 1) == 0
        && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDE3158]) & 1) == 0
        && !objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDE31A0]))
      {
        goto LABEL_18;
      }
      v15 = *MEMORY[0x24BEBB198] | *MEMORY[0x24BDFF000];
LABEL_17:
      v3 |= v15;
      goto LABEL_18;
    }
    -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isListChoice");

    if ((v13 & 1) != 0)
      goto LABEL_18;
    v14 = (uint64_t *)MEMORY[0x24BDFEF28];
LABEL_16:
    v15 = *v14;
    goto LABEL_17;
  }
  -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "widgetControlType");

  if (v7 == 2)
  {
    v3 |= *MEMORY[0x24BDF73B0] | *MEMORY[0x24BEBB1A8] | *MEMORY[0x24BDFF128];
    goto LABEL_18;
  }
  if (v7 != 1)
  {
    v14 = (uint64_t *)MEMORY[0x24BDF73B0];
    goto LABEL_16;
  }
  v8 = *MEMORY[0x24BEBB158];
  -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "buttonWidgetState");

  v11 = *MEMORY[0x24BDF7400];
  if (v10 != 1)
    v11 = 0;
  v3 |= v8 | v11;
LABEL_18:
  -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isPasswordField");

  v18 = *MEMORY[0x24BEBB168];
  if (!v17)
    v18 = 0;
  v19 = v18 | v3;

  return v19;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  const __CFString *v48;
  objc_super v49;

  -[PDFAnnotationAccessibilityElement _accessibilityAnnotationFieldType](self, "_accessibilityAnnotationFieldType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotationAccessibilityElement _accessibilityAnnotationType](self, "_accessibilityAnnotationType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3170]))
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3160]))
    {
      v9 = CFSTR("highlight.annotation");
      goto LABEL_6;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3158]) & 1) == 0
      && !objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE31A0]))
    {
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3188]))
      {
        v9 = CFSTR("square.annotation");
        goto LABEL_6;
      }
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3150]))
      {
        v9 = CFSTR("circle.annotation");
        goto LABEL_6;
      }
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE31A8]))
      {
        v9 = CFSTR("underline.annotation");
        goto LABEL_6;
      }
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3198]))
      {
        v9 = CFSTR("strike.out.annotation");
        goto LABEL_6;
      }
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3168]))
      {
        v9 = CFSTR("ink.annotation");
        goto LABEL_6;
      }
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3190]))
      {
        v9 = CFSTR("stamp.annotation");
        goto LABEL_6;
      }
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3180]))
      {
        v9 = CFSTR("popup.annotation");
        goto LABEL_6;
      }
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE31B0]))
      {
        if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE31D0]))
        {
          -[PDFAnnotationAccessibilityElement _accessibilityAnnotationWidgetTextLabel](self, "_accessibilityAnnotationWidgetTextLabel");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "caption");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "contents");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = CFSTR("__AXStringForVariablesSentinel");
          v44 = v40;
          __UIAXStringForVariables();
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_53;
        }
        if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE31C8]))
        {
          v9 = CFSTR("signature.annotation");
          goto LABEL_6;
        }
        if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE31B8]))
        {
          -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "widgetControlType");

          if (!v43)
          {
            -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "caption");
            v24 = objc_claimAutoreleasedReturnValue();
LABEL_51:
            v11 = (void *)v24;
            goto LABEL_53;
          }
          if (v43 == 2)
          {
            -[PDFAnnotationAccessibilityElement _accessibilityAnnotationWidgetTextLabel](self, "_accessibilityAnnotationWidgetTextLabel");
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_7;
          }
        }
      }
      v11 = 0;
      goto LABEL_54;
    }
    -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForAnnotationKey:", *MEMORY[0x24BDE3130]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("/Comment")) & 1) != 0)
    {
      v15 = CFSTR("comment.icon");
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("/Key")) & 1) != 0)
    {
      v15 = CFSTR("key.icon");
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("/Note")) & 1) != 0)
    {
      v15 = CFSTR("note.icon");
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("/Help")) & 1) != 0)
    {
      v15 = CFSTR("help.icon");
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("/NewParagraph")) & 1) != 0)
    {
      v15 = CFSTR("newparagraph.icon");
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("/Paragraph")) & 1) != 0)
    {
      v15 = CFSTR("paragraph.icon");
    }
    else
    {
      if (!objc_msgSend(v14, "isEqualToString:", CFSTR("/Insert")))
      {
LABEL_49:
        -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "iconType");

        if (v23 > 6)
        {
          v11 = 0;
          goto LABEL_53;
        }
        accessibilityLocalizedString(off_2502DF090[v23]);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_51;
      }
      v15 = CFSTR("insert.icon");
    }
    accessibilityLocalizedString(v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
LABEL_53:

      goto LABEL_54;
    }
    goto LABEL_49;
  }
  -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "startLineStyle");

  -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "endLineStyle");

  if (!(v6 | v8))
  {
    v9 = CFSTR("line.annotation");
LABEL_6:
    accessibilityLocalizedString(v9);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = (void *)v10;
    goto LABEL_54;
  }
  if (v6 && v8)
  {
    v12 = CFSTR("double.headed.arrow.annotation");
  }
  else
  {
    if (!(v6 | v8))
    {
      v16 = 0;
      goto LABEL_23;
    }
    v12 = CFSTR("single.headed.arrow.annotation");
  }
  accessibilityLocalizedString(v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
  if (v8)
    v17 = v6 == 0;
  else
    v17 = 0;
  if (v17)
    v18 = v8;
  else
    v18 = v6;
  -[PDFAnnotationAccessibilityElement _accessibilityLineStyleStringForLineStyle:](self, "_accessibilityLineStyleStringForLineStyle:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("line.style"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", v21, v16, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_54:
  -[PDFAnnotationAccessibilityElement annotation](self, "annotation", v44, v46, v48);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isTextMarkupAnnotation");

  if (v26)
  {
    -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "textMarkupString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v11;
    v47 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v29 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v29;
  }
  -[PDFAnnotationAccessibilityElement annotation](self, "annotation", v45, v47);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "isNoteAnnotation"))
  {
    -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "contents");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "contents");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "length");

      if (!v35)
        goto LABEL_62;
      -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "contents");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v32 = v11;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_62:
  if (v11)
  {
    v36 = v11;
  }
  else
  {
    v49.receiver = self;
    v49.super_class = (Class)PDFAnnotationAccessibilityElement;
    -[PDFAnnotationAccessibilityElement accessibilityLabel](&v49, sel_accessibilityLabel);
    v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  v37 = v36;

  return v37;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  double v16;
  double v17;
  const __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  -[PDFAnnotationAccessibilityElement _accessibilityAnnotationFieldType](self, "_accessibilityAnnotationFieldType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotationAccessibilityElement _accessibilityAnnotationType](self, "_accessibilityAnnotationType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDE31B0];
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE31B0]))
  {
    v9 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3190]);
    -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      objc_msgSend(v10, "valueForAnnotationKey:", *MEMORY[0x24BDE3130]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), &stru_2502DF408);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "valueForAnnotationKey:", *MEMORY[0x24BDE3128]);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "border");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "style");
    objc_msgSend(v14, "lineWidth");
    v17 = v16;
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3150]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3168]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3170]) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3188]))
    {
      if (v15 > 4)
      {
        v50 = 0;
      }
      else
      {
        accessibilityLocalizedString(off_2502DF100[v15]);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v18 = CFSTR("thick.line");
      if (v17 < 8.5)
        v18 = CFSTR("medium.line");
      if (v17 >= 2.5)
        v19 = (__CFString *)v18;
      else
        v19 = CFSTR("thin.line");
      accessibilityLocalizedString(v19);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = 0;
      v54 = 0;
    }
    -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "font");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = v3;
    v55 = v14;
    v52 = v21;
    v49 = *MEMORY[0x24BDE3158];
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3158]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE31A0]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3180]) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", v5)
      && ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE31D0]) & 1) != 0
       || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE31B8]) & 1) != 0
       || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE31C0])))
    {
      objc_msgSend(v21, "fontName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("stroke.fontsize.value"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v21, "pointSize");
      objc_msgSend(v25, "numberWithDouble:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", v24, v26);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v53 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v53 = 0;
    }
    -[PDFAnnotationAccessibilityElement annotation](self, "annotation", v47, v48);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "alignment");

    if (objc_msgSend(v4, "isEqualToString:", v5)
      && (objc_msgSend(v56, "isEqualToString:", *MEMORY[0x24BDE31D0]) & 1) != 0)
    {
      if (v28 > 3)
      {
        v29 = 0;
        goto LABEL_37;
      }
    }
    else
    {
      v29 = 0;
      if (!objc_msgSend(v4, "isEqualToString:", v49) || v28 >= 4)
      {
LABEL_37:
        -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "userName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "length");

        if (v32)
        {
          v33 = (void *)MEMORY[0x24BDD17C8];
          accessibilityLocalizedString(CFSTR("annotation.creator.username.format"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "userName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringWithFormat:", v34, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v37 = 0;
        }
        -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "color");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = (void *)v29;
        if (v39)
        {
          AXColorStringForColor();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v41 = 0;
        }
        __UIAXStringForVariables();
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v3 = v56;
        goto LABEL_44;
      }
    }
    accessibilityLocalizedString(off_2502DF0E0[v28]);
    v29 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE31D0]) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE31C0]))
  {
    -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetStringValue");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (__CFString *)v7;

    goto LABEL_44;
  }
  -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "widgetControlType");

  -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v45;
  if (v44 != 2)
  {
    objc_msgSend(v45, "buttonWidgetStateString");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v46 = objc_msgSend(v45, "buttonWidgetState");

  if ((unint64_t)(v46 + 1) >= 3)
    v8 = 0;
  else
    v8 = off_2502DF0C8[v46 + 1];
LABEL_44:

  return v8;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[PDFAnnotationAccessibilityElement cachedAXElements](self, "cachedAXElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotationAccessibilityElement _accessibilityAnnotationFieldType](self, "_accessibilityAnnotationFieldType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE31C0]);

    if (v5)
    {
      -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isListChoice");

      if (v7)
      {
        -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safeValueForKey:", CFSTR("control"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9
          && (objc_opt_class(),
              __UIAccessibilityCastAsClass(),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v10, "superview"),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              v11,
              v10,
              v11))
        {
          accessibilityLocalizedString(CFSTR("list.annotation"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setAccessibilityLabel:", v12);

          objc_msgSend(v9, "setAccessibilityContainerType:", 4);
          objc_msgSend(v3, "axSafelyAddObject:", v9);
        }
        else
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
          -[PDFAnnotationAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
          objc_msgSend(v13, "setAccessibilityFrame:");
          accessibilityLocalizedString(CFSTR("list.annotation"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setAccessibilityLabel:", v14);

          -[PDFAnnotationAccessibilityElement accessibilityValue](self, "accessibilityValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setAccessibilityValue:", v15);

          accessibilityLocalizedString(CFSTR("list.annotation.hint"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setAccessibilityHint:", v16);

          objc_msgSend(v3, "axSafelyAddObject:", v13);
        }

      }
      -[PDFAnnotationAccessibilityElement setCachedAXElements:](self, "setCachedAXElements:", v3);
    }
  }
  return v3;
}

- (id)_accessibilityLineStyleStringForLineStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  accessibilityLocalizedString(off_2502DF128[a3 - 1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accessibilityAnnotationType
{
  void *v2;
  void *v3;

  -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAnnotationKey:", *MEMORY[0x24BDE3138]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityAnnotationFieldType
{
  void *v2;
  void *v3;

  -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAnnotationKey:", *MEMORY[0x24BDE3140]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityAnnotationWidgetTextLabel
{
  void *v2;
  void *v3;

  -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAnnotationKey:", *MEMORY[0x24BDE3148]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityIsButtonWidget
{
  void *v2;
  char v3;

  -[PDFAnnotationAccessibilityElement _accessibilityAnnotationFieldType](self, "_accessibilityAnnotationFieldType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDE31B8]);

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGRect v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[PDFAnnotationAccessibilityElement accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotationAccessibilityElement accessibilityValue](self, "accessibilityValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotationAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  NSStringFromCGRect(v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotationAccessibilityElement annotation](self, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%p] %@, %@ : %@\n\tAnnotation: %@"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PDFAnnotation)annotation
{
  return (PDFAnnotation *)objc_loadWeakRetained((id *)&self->_annotation);
}

- (void)setAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->_annotation, a3);
}

- (NSMutableArray)cachedAXElements
{
  return self->_cachedAXElements;
}

- (void)setCachedAXElements:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAXElements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAXElements, 0);
  objc_destroyWeak((id *)&self->_annotation);
}

@end
