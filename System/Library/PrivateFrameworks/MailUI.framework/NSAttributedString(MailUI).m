@implementation NSAttributedString(MailUI)

+ (id)mui_attributedStringWithString:()MailUI attributes:
{
  id v4;
  objc_class *v5;
  id v6;
  id v7;

  v4 = a3;
  if (a3)
  {
    v5 = (objc_class *)MEMORY[0x1E0CB3498];
    v6 = a4;
    v7 = v4;
    v4 = (id)objc_msgSend([v5 alloc], "initWithString:attributes:", v7, v6);

  }
  return v4;
}

+ (id)mui_attributedStringWithAttributedString:()MailUI attributes:
{
  id v4;
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;

  v4 = a3;
  if (a3)
  {
    v5 = (objc_class *)MEMORY[0x1E0CB3778];
    v6 = a4;
    v7 = v4;
    v4 = (id)objc_msgSend([v5 alloc], "initWithAttributedString:", v7);
    v8 = objc_msgSend(v7, "length");

    objc_msgSend(v4, "addAttributes:range:", v6, 0, v8);
  }
  return v4;
}

- (double)mui_boundingHeightForWidth:()MailUI font:
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3498];
  v14 = *MEMORY[0x1E0DC1138];
  v15[0] = a4;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a4;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mui_attributedStringWithAttributedString:attributes:", a1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "boundingRectWithSize:options:context:", 3, 0, a2, 3.40282347e38);
  v12 = v11;

  return ceil(v12);
}

+ (id)mui_attributedStringWithImage:()MailUI string:keyword:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "componentsSeparatedByString:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v11 = objc_msgSend(v9, "count");
  v12 = objc_alloc(MEMORY[0x1E0CB3498]);
  v13 = v12;
  if (v11 == 2)
  {
    objc_msgSend(v9, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithString:", v14);

    objc_msgSend(v10, "appendAttributedString:", v15);
    v16 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(v16, "setImage:", v7);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendAttributedString:", v17);
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithString:", v19);

    objc_msgSend(v10, "appendAttributedString:", v20);
  }
  else
  {
    v15 = (void *)objc_msgSend(v12, "initWithString:", v8);
    objc_msgSend(v10, "appendAttributedString:", v15);
  }

  return v10;
}

@end
