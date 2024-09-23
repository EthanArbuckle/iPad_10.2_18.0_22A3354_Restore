@implementation HPSListeningModeLabel

- (HPSListeningModeLabel)initWithText:(id)a3
{
  id v3;
  HPSListeningModeLabel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HPSListeningModeLabel;
  v3 = a3;
  v4 = -[HPSListeningModeLabel init](&v13, sel_init);
  -[HPSListeningModeLabel setText:](v4, "setText:", v3, v13.receiver, v13.super_class);

  -[HPSListeningModeLabel setTextAlignment:](v4, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A98], *MEMORY[0x1E0DC48F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v5, "pointSize");
  objc_msgSend(v6, "boldSystemFontOfSize:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSListeningModeLabel setFont:](v4, "setFont:", v7);

  -[HPSListeningModeLabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HPSListeningModeLabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("de")) & 1) == 0
    && (objc_msgSend(v10, "isEqualToString:", CFSTR("uk")) & 1) == 0
    && (objc_msgSend(v10, "isEqualToString:", CFSTR("ru")) & 1) == 0)
  {
    LODWORD(v11) = 1036831949;
    -[HPSListeningModeLabel _setHyphenationFactor:](v4, "_setHyphenationFactor:", v11);
  }

  return v4;
}

@end
