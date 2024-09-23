@implementation PHCarPlayInCallKeyPadButton

- (PHCarPlayInCallKeyPadButton)initWithKeyPadButtonType:(unint64_t)a3 usingSmallFont:(BOOL)a4
{
  _BOOL8 v4;
  PHCarPlayInCallKeyPadButton *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;

  v4 = a4;
  v7 = (PHCarPlayInCallKeyPadButton *)objc_claimAutoreleasedReturnValue(+[PHCarPlayInCallKeyPadButton buttonWithType:](PHCarPlayInCallKeyPadButton, "buttonWithType:", 0));

  if (v7)
  {
    v7->_keyPadButtonType = a3;
    v7->_usingSmallFont = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeyPadButton layer](v7, "layer"));
    objc_msgSend(v8, "setCornerRadius:", 3.0);

    -[PHCarPlayInCallKeyPadButton setClipsToBounds:](v7, "setClipsToBounds:", 1);
    -[PHCarPlayInCallKeyPadButton setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PHCarPlayInCallKeyPadButton setContentEdgeInsets:](v7, "setContentEdgeInsets:", 5.0, 5.0, 5.0, 5.0);
    v10 = objc_msgSend((id)objc_opt_class(v7, v9), "titleForKeyPadButtonType:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v13 = objc_msgSend((id)objc_opt_class(v7, v12), "alignmentForKeyPadButtonType:", a3);
    v15 = objc_msgSend((id)objc_opt_class(v7, v14), "symbolTypeForKeyPadButtonType:", a3);
    v17 = objc_msgSend((id)objc_opt_class(v7, v16), "colorForKeyPadButtonType:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[PHCarPlayInCallKeyPadButton setTitle:alignment:symbolType:normalStateColor:usingSmallFont:](v7, "setTitle:alignment:symbolType:normalStateColor:usingSmallFont:", v11, v13, v15, v18, v4);

  }
  return v7;
}

- (void)setUsingSmallFont:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  if (self->_usingSmallFont != a3)
  {
    v3 = a3;
    self->_usingSmallFont = a3;
    v5 = objc_msgSend((id)objc_opt_class(self, a2), "titleForKeyPadButtonType:", -[PHCarPlayInCallKeyPadButton keyPadButtonType](self, "keyPadButtonType"));
    v13 = (id)objc_claimAutoreleasedReturnValue(v5);
    v7 = objc_msgSend((id)objc_opt_class(self, v6), "alignmentForKeyPadButtonType:", -[PHCarPlayInCallKeyPadButton keyPadButtonType](self, "keyPadButtonType"));
    v9 = objc_msgSend((id)objc_opt_class(self, v8), "symbolTypeForKeyPadButtonType:", -[PHCarPlayInCallKeyPadButton keyPadButtonType](self, "keyPadButtonType"));
    v11 = objc_msgSend((id)objc_opt_class(self, v10), "colorForKeyPadButtonType:", -[PHCarPlayInCallKeyPadButton keyPadButtonType](self, "keyPadButtonType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[PHCarPlayInCallKeyPadButton setTitle:alignment:symbolType:normalStateColor:usingSmallFont:](self, "setTitle:alignment:symbolType:normalStateColor:usingSmallFont:", v13, v7, v9, v12, v3);

  }
}

- (void)setTitle:(id)a3 alignment:(int64_t)a4 symbolType:(int64_t)a5 normalStateColor:(id)a6 usingSmallFont:(BOOL)a7
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableAttributedString mutableAttributedStringWithString:alignment:symbolType:foregroundColor:usingSmallFont:](NSMutableAttributedString, "mutableAttributedStringWithString:alignment:symbolType:foregroundColor:usingSmallFont:", a3, a4, a5, a6, a7));
  v8 = objc_msgSend(v14, "copy");
  -[PHCarPlayInCallKeyPadButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v8, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v14, "setForegroundColor:", v9);

  v10 = objc_msgSend(v14, "copy");
  -[PHCarPlayInCallKeyPadButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v10, 4);
  -[PHCarPlayInCallKeyPadButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v10, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "colorWithAlphaComponent:", 0.699999988));
  objc_msgSend(v14, "setForegroundColor:", v12);

  v13 = objc_msgSend(v14, "copy");
  -[PHCarPlayInCallKeyPadButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v13, 1);

}

+ (id)titleForKeyPadButtonType:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("CARPLAY_END_BUTTON");
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      return v6;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("CARPLAY_CANCEL_BUTTON");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10028DC20, CFSTR("PHCarPlay")));

  return v6;
}

+ (int64_t)alignmentForKeyPadButtonType:(unint64_t)a3
{
  return 2 * (a3 == 1);
}

+ (int64_t)symbolTypeForKeyPadButtonType:(unint64_t)a3
{
  int64_t v3;

  v3 = 3;
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return v3;
  else
    return 39;
}

+ (id)colorForKeyPadButtonType:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemTealColor](UIColor, "systemTealColor"));
  }
  return v3;
}

- (unint64_t)keyPadButtonType
{
  return self->_keyPadButtonType;
}

- (BOOL)isUsingSmallFont
{
  return self->_usingSmallFont;
}

@end
