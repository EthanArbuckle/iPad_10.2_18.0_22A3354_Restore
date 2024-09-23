@implementation UILabel(ABUIAdditions)

- (void)setAb_textAttributes:()ABUIAdditions
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
    objc_msgSend(a1, "setFont:", v4);
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
      objc_msgSend(a1, "setTextColor:", v7);
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ABHilightedColorAttributeName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "highlightedTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if ((v12 & 1) == 0)
      objc_msgSend(a1, "setHighlightedTextColor:", v10);
  }

}

- (id)ab_textAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(a1, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(a1, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
