@implementation CNGeminiBadge

- (NSDictionary)viewAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0DC1138];
  -[CNGeminiBadge font](self, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E0DC1140];
  -[CNGeminiBadge textColor](self, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = *MEMORY[0x1E0DC1100];
  -[CNGeminiBadge _textEncapsulation](self, "_textEncapsulation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (void)setViewAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CNGeminiBadge font](self, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v4)
      -[CNGeminiBadge setFont:](self, "setFont:", v4);
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CNGeminiBadge textColor](self, "textColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
      -[CNGeminiBadge setTextColor:](self, "setTextColor:", v6);
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1100]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CNGeminiBadge _textEncapsulation](self, "_textEncapsulation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    if ((v12 & 1) == 0)
    {
      -[CNGeminiBadge _textEncapsulation](self, "_textEncapsulation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setColor:", v9);

    }
  }

}

+ (CNGeminiBadge)geminiBadgeWithText:(id)a3
{
  id v3;
  CNGeminiBadge *v4;

  v3 = a3;
  v4 = objc_alloc_init(CNGeminiBadge);
  -[CNGeminiBadge setText:](v4, "setText:", v3);

  return v4;
}

@end
