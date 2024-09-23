@implementation UIWebBrowserView_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWebBrowserView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UIWebBrowserView"), CFSTR("UIWebDocumentView"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("UIWebDocumentView"), CFSTR("UITextInputPrivate"));

}

- (id)_accessibilityTextRectsForRange:(id)a3 singleTextRect:(CGRect *)a4 selectedRange:(id)a5 string:(id)a6
{
  void *v8;
  void *v9;

  -[UIWebBrowserView_QSExtras _accessibilitySearchTextRangeFromRange:withString:selectedRange:](self, "_accessibilitySearchTextRangeFromRange:withString:selectedRange:", a3, a6, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebBrowserView_QSExtras _accessibilityTextRectsForRange:singleTextRect:](self, "_accessibilityTextRectsForRange:singleTextRect:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_accessibilitySearchTextRangeFromRange:(id)a3 withString:(id)a4 selectedRange:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIWebBrowserView_QSExtras *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  -[UIWebBrowserView_QSExtras textInRange:](v11, "textInRange:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIWebBrowserView_QSExtras _rangeStringMatch:wordText:](v11, "_rangeStringMatch:wordText:", v12, v9))
  {
    -[UIWebBrowserView_QSExtras _adjustedRange:withText:matchText:initiator:](v11, "_adjustedRange:withText:matchText:initiator:", v8, v12, v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  v35 = v12;
  objc_msgSend(v10, "start");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v10;
  objc_msgSend(v10, "end");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[UIWebBrowserView_QSExtras offsetFromPosition:toPosition:](v11, "offsetFromPosition:toPosition:", v14, v15);

  v17 = objc_msgSend(v9, "length");
  objc_msgSend(v8, "start");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "start");
  v19 = objc_claimAutoreleasedReturnValue();
  v36 = v8;
  v34 = v8;
  v20 = v18 != 0;
  v21 = v19 != 0;
  if (!(v18 | v19))
  {
LABEL_29:
    v12 = v35;
    v8 = v36;
    v10 = v38;
    v13 = v34;
    goto LABEL_35;
  }
  v37 = v16;
  while (1)
  {
    if (v20)
    {
      -[UIWebBrowserView_QSExtras positionFromPosition:offset:](v11, "positionFromPosition:offset:", v18, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }

    if (v21)
    {
      -[UIWebBrowserView_QSExtras positionFromPosition:offset:](v11, "positionFromPosition:offset:", v19, -1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }

    if (v22)
      break;
    v18 = 0;
    if (v23)
      goto LABEL_21;
LABEL_17:
    v19 = 0;
LABEL_28:
    v20 = v18 != 0;
    v21 = v19 != 0;
    if (!(v18 | v19))
      goto LABEL_29;
  }
  -[UIWebBrowserView_QSExtras positionFromPosition:offset:](v11, "positionFromPosition:offset:", v22, v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebBrowserView_QSExtras textRangeFromPosition:toPosition:](v11, "textRangeFromPosition:toPosition:", v22, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    v26 = 0;
    v29 = 0;
    if (-[UIWebBrowserView_QSExtras _rangeStringMatch:wordText:](v11, "_rangeStringMatch:wordText:", 0, v9))
      goto LABEL_31;
LABEL_19:

    v22 = 0;
    goto LABEL_20;
  }
  -[UIWebBrowserView_QSExtras textInRange:](v11, "textInRange:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIWebBrowserView_QSExtras _rangeStringMatch:wordText:](v11, "_rangeStringMatch:wordText:", v26, v9))
  {
    v29 = v26;
LABEL_31:
    -[UIWebBrowserView_QSExtras _adjustedRange:withText:matchText:initiator:](v11, "_adjustedRange:withText:matchText:initiator:", v25, v29, v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  objc_msgSend(v38, "start");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[UIWebBrowserView_QSExtras offsetFromPosition:toPosition:](v11, "offsetFromPosition:toPosition:", v27, v24);

  if (v28 > v37)
    goto LABEL_19;
LABEL_20:

  v18 = (uint64_t)v22;
  if (!v23)
    goto LABEL_17;
LABEL_21:
  -[UIWebBrowserView_QSExtras positionFromPosition:offset:](v11, "positionFromPosition:offset:", v23, v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebBrowserView_QSExtras textRangeFromPosition:toPosition:](v11, "textRangeFromPosition:toPosition:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    v30 = 0;
    v29 = 0;
    if (-[UIWebBrowserView_QSExtras _rangeStringMatch:wordText:](v11, "_rangeStringMatch:wordText:", 0, v9))
      goto LABEL_33;
LABEL_26:

    v23 = 0;
LABEL_27:

    v19 = (uint64_t)v23;
    goto LABEL_28;
  }
  -[UIWebBrowserView_QSExtras textInRange:](v11, "textInRange:", v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIWebBrowserView_QSExtras _rangeStringMatch:wordText:](v11, "_rangeStringMatch:wordText:", v30, v9))
  {
    objc_msgSend(v38, "start");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[UIWebBrowserView_QSExtras offsetFromPosition:toPosition:](v11, "offsetFromPosition:toPosition:", v31, v23);

    if (v32 < 0)
      goto LABEL_26;
    goto LABEL_27;
  }
  v29 = v30;
LABEL_33:
  -[UIWebBrowserView_QSExtras _adjustedRange:withText:matchText:initiator:](v11, "_adjustedRange:withText:matchText:initiator:", v25, v29, v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v18;
LABEL_34:

  v12 = v35;
  v8 = v36;
  v10 = v38;
LABEL_35:

  return v13;
}

- (id)_adjustedRange:(id)a3 withText:(id)a4 matchText:(id)a5 initiator:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v10, "length");
  if (v13 >= objc_msgSend(v11, "length"))
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v9, "start");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "end");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "positionFromPosition:offset:", v15, objc_msgSend(v11, "length") - objc_msgSend(v10, "length"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textRangeFromPosition:toPosition:", v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v17)
    v18 = v17;
  else
    v18 = v9;
  v19 = v18;

  return v19;
}

- (BOOL)_rangeStringMatch:(id)a3 wordText:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
    v7 = objc_msgSend(v5, "rangeOfString:", v6) != 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend(v6, "rangeOfString:", v5) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = 0;

  return v7;
}

@end
