@implementation AKTextualLinkButton

+ (id)buttonWithText:(id)a3 fontSize:(double)a4 target:(id)a5 action:(SEL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
    objc_msgSend(v11, "setTitle:forState:", v9, 0);
  if (a4 > 0.0)
  {
    objc_msgSend(v12, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "fontWithSize:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v15);

  }
  if (a6)
    objc_msgSend(v12, "addTarget:action:forControlEvents:", v10, a6, 64);
  objc_msgSend(v12, "sizeToFit");

  return v12;
}

@end
