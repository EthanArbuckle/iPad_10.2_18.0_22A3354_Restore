@implementation NSMutableAttributedString

+ (NSMutableAttributedString)mutableAttributedStringWithString:(id)a3 alignment:(int64_t)a4 symbolType:(int64_t)a5 foregroundColor:(id)a6 usingSmallFont:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  id *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  BOOL v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  BOOL v29;
  id v30;
  void *v31;
  id v32;

  v7 = a7;
  v11 = a3;
  v12 = a6;
  v13 = objc_alloc_init((Class)NSMutableAttributedString);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v15 = (id *)&UIFontTextStyleFootnote;
  if (!v7)
    v15 = (id *)&UIFontTextStyleCallout;
  v16 = *v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", v16));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, NSFontAttributeName);

  v18 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v18, "setAlignment:", a4);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, NSParagraphStyleAttributeName);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", a5, v16, 3, 0));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageWithRenderingMode:", 2));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSTextAttachment textAttachmentWithImage:](NSTextAttachment, "textAttachmentWithImage:", v20));

  v22 = objc_msgSend(UIApp, "userInterfaceLayoutDirection");
  if (!a4 && v22 != (id)1 || (v23 = v22 != (id)1, a4 == 2) && v22 == (id)1)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v21));
    objc_msgSend(v13, "appendAttributedString:", v24);

    v25 = objc_alloc((Class)NSAttributedString);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR(" "), "stringByAppendingString:", v11));
    v27 = objc_msgSend(v25, "initWithString:attributes:", v26, v14);
    objc_msgSend(v13, "appendAttributedString:", v27);

LABEL_8:
    goto LABEL_9;
  }
  if (a4)
    v23 = 1;
  v29 = v22 != (id)1 && a4 == 2;
  if (v29 || !v23)
  {
    v30 = objc_alloc((Class)NSAttributedString);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR(" ")));
    v32 = objc_msgSend(v30, "initWithString:attributes:", v31, v14);
    objc_msgSend(v13, "appendAttributedString:", v32);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v21));
    objc_msgSend(v13, "appendAttributedString:", v26);
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v13, "setForegroundColor:", v12);

  return (NSMutableAttributedString *)v13;
}

- (void)setForegroundColor:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    -[NSMutableAttributedString addAttribute:value:range:](self, "addAttribute:value:range:", NSForegroundColorAttributeName, v4, 0, -[NSMutableAttributedString length](self, "length"));

  }
}

- (UIColor)foregroundColor
{
  return (UIColor *)-[NSMutableAttributedString attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", NSForegroundColorAttributeName, 0, 0);
}

@end
