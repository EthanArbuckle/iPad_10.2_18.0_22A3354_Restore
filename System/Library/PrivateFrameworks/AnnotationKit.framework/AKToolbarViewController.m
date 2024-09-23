@implementation AKToolbarViewController

- (AKToolbarViewController)initWithController:(id)a3
{
  id v4;
  AKToolbarViewController *v5;
  AKToolbarViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKToolbarViewController;
  v5 = -[AKToolbarViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AKToolbarViewController setController:](v5, "setController:", v4);

  return v6;
}

- (BOOL)isPresentingPopover
{
  return 0;
}

- (id)_toolbarButtonItemOfType:(unint64_t)a3
{
  return 0;
}

+ (id)titleForToolbarButtonItemOfType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;

  v3 = 0;
  switch(a3)
  {
    case 0uLL:
      +[AKController akBundle](AKController, "akBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Sketch");
      goto LABEL_10;
    case 1uLL:
      +[AKController akBundle](AKController, "akBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Draw");
      goto LABEL_10;
    case 3uLL:
      +[AKController akBundle](AKController, "akBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Sign");
      goto LABEL_10;
    case 4uLL:
      +[AKController akBundle](AKController, "akBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Text");
      goto LABEL_10;
    case 0xDuLL:
      +[AKController akBundle](AKController, "akBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Draw_Ink");
      v7 = CFSTR("Draw");
      goto LABEL_11;
    case 0x11uLL:
    case 0x13uLL:
      +[AKController akBundle](AKController, "akBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Rotate Left");
      goto LABEL_10;
    case 0x12uLL:
      +[AKController akBundle](AKController, "akBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Rotate Right");
      goto LABEL_10;
    case 0x14uLL:
      +[AKController akBundle](AKController, "akBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Crop");
LABEL_10:
      v7 = &stru_24F1A83D0;
LABEL_11:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, v7, CFSTR("AKToolbarViewController"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)_imageNameForToolbarButtonItemOfType:(unint64_t)a3
{
  if (a3 > 0x14)
    return 0;
  else
    return off_24F1A8208[a3];
}

+ (id)imageForToolbarButtonItemOfType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_imageNameForToolbarButtonItemOfType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDF6AC8];
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", v3, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)alternateImageForToolbarButtonItemOfType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_imageNameForToolbarButtonItemOfType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("_Active"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x24BDF6AC8];
    +[AKController akBundle](AKController, "akBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v7, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v4;
}

+ (int64_t)buttonTypeForToolbarButtonItemOfType:(unint64_t)a3
{
  return 1;
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
}

@end
