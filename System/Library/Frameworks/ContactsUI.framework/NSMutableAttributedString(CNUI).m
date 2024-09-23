@implementation NSMutableAttributedString(CNUI)

- (void)cnui_appendTaglineString:()CNUI
{
  id v4;
  id v5;

  v4 = a3;
  +[CNUIFontRepository contactCardStaticHeaderDefaultTaglineFont](CNUIFontRepository, "contactCardStaticHeaderDefaultTaglineFont");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cnui_appendTaglineString:withFont:", v4, v5);

}

- (void)cnui_appendTaglineString:()CNUI withFont:uppercased:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((a5 & 1) != 0)
  {
    objc_msgSend(v8, "localizedUppercaseString");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;
  v12 = objc_alloc(MEMORY[0x1E0CB3498]);
  v24 = *MEMORY[0x1E0DC1138];
  v13 = v24;
  v25[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithString:attributes:", v11, v14);

  v16 = objc_alloc(MEMORY[0x1E0CB3498]);
  CNContactsUIBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CARD_TAGLINE_SEPARATOR"), &stru_1E20507A8, CFSTR("Localized"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v13;
  +[CNUIFontRepository contactCardStaticHeaderDefaultTaglineFont](CNUIFontRepository, "contactCardStaticHeaderDefaultTaglineFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v16, "initWithString:attributes:", v18, v20);

  if (objc_msgSend(a1, "length"))
    objc_msgSend(a1, "appendAttributedString:", v21);
  objc_msgSend(a1, "appendAttributedString:", v15);

}

- (uint64_t)cnui_appendTaglineString:()CNUI withFont:
{
  return objc_msgSend(a1, "cnui_appendTaglineString:withFont:uppercased:", a3, a4, 1);
}

- (void)cnui_appendTaglineString:()CNUI uppercased:
{
  id v6;
  id v7;

  v6 = a3;
  +[CNUIFontRepository contactCardStaticHeaderDefaultTaglineFont](CNUIFontRepository, "contactCardStaticHeaderDefaultTaglineFont");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cnui_appendTaglineString:withFont:uppercased:", v6, v7, a4);

}

@end
