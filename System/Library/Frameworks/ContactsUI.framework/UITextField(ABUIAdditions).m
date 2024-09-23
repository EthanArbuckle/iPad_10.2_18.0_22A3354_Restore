@implementation UITextField(ABUIAdditions)

- (void)setAb_textAttributes:()ABUIAdditions
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
    objc_msgSend(a1, "setFont:", v4);
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
      objc_msgSend(a1, "setTextColor:", v7);
  }

}

@end
