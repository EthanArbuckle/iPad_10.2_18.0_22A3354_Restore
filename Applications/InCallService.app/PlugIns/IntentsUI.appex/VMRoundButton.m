@implementation VMRoundButton

- (VMRoundButton)initWithType:(unint64_t)a3
{
  VMRoundButton *v4;
  VMRoundButton *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;

  v4 = -[VMRoundButton initWithSize:](self, "initWithSize:", 37.0, 37.0);
  v5 = v4;
  if (v4)
  {
    -[VMRoundButton setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMRoundButton layer](v5, "layer"));
    objc_msgSend(v6, "setMasksToBounds:", 1);

    -[VMRoundButton bounds](v5, "bounds");
    v8 = v7 * 0.5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMRoundButton layer](v5, "layer"));
    objc_msgSend(v9, "setCornerRadius:", v8);

    -[VMRoundButton setAdjustsImageWhenDisabled:](v5, "setAdjustsImageWhenDisabled:", 0);
    -[VMRoundButton setButtonType:enabled:](v5, "setButtonType:enabled:", a3, 1);
    LODWORD(v10) = 1148846080;
    -[VMRoundButton setLayoutSize:withContentPriority:](v5, "setLayoutSize:withContentPriority:", 37.0, 37.0, v10);
  }
  return v5;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VMRoundButton;
  -[VMRoundButton layoutSubviews](&v6, "layoutSubviews");
  -[VMRoundButton bounds](self, "bounds");
  v4 = v3 * 0.5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMRoundButton layer](self, "layer"));
  objc_msgSend(v5, "setCornerRadius:", v4);

}

- (void)setButtonType:(unint64_t)a3 enabled:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[VMRoundButton setEnabled:](self, "setEnabled:", a4);
  if (self->_type != a3)
  {
    self->_type = a3;
    switch(a3)
    {
      case 1uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemLightGrayColor](UIColor, "systemLightGrayColor"));
        v9 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
        v7 = objc_claimAutoreleasedReturnValue(+[UIImage voicemailAudioRouteGlyphImage](UIImage, "voicemailAudioRouteGlyphImage"));
        goto LABEL_8;
      case 2uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
        v9 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
        v7 = objc_claimAutoreleasedReturnValue(+[UIImage voicemailDialRequestGlyphImage](UIImage, "voicemailDialRequestGlyphImage"));
        goto LABEL_8;
      case 3uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
        v9 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
        v7 = objc_claimAutoreleasedReturnValue(+[UIImage voicemailDeleteGlyphImage](UIImage, "voicemailDeleteGlyphImage"));
        goto LABEL_8;
      case 4uLL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
        v9 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
        v7 = objc_claimAutoreleasedReturnValue(+[UIImage voicemailUndeleteGlyphImage](UIImage, "voicemailUndeleteGlyphImage"));
LABEL_8:
        v8 = (void *)v7;
        break;
      default:
        v9 = 0;
        v6 = 0;
        v8 = 0;
        break;
    }
    -[VMRoundButton setActualBackgroundColor:](self, "setActualBackgroundColor:", v6);
    -[VMRoundButton setActualTintColor:](self, "setActualTintColor:", v9);
    -[VMRoundButton setImage:forState:](self, "setImage:forState:", v8, 0);

  }
}

- (void)configureButtonUsingAudioRoute:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v13;
  id v14;

  v4 = a3;
  if ((objc_msgSend(v4, "isReceiver") & 1) != 0)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v6 = (void *)v5;
  if (objc_msgSend(v4, "deviceType"))
    v7 = objc_claimAutoreleasedReturnValue(+[UIImage routeGlyphForDeviceType:displayStyle:color:](UIImage, "routeGlyphForDeviceType:displayStyle:color:", objc_msgSend(v4, "deviceType"), 0, v6));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[UIImage voicemailAudioRouteGlyphImage](UIImage, "voicemailAudioRouteGlyphImage"));
  v8 = (void *)v7;
  if ((objc_msgSend(v4, "isReceiver") & 1) != 0)
    v9 = objc_claimAutoreleasedReturnValue(+[UIColor systemLightGrayColor](UIColor, "systemLightGrayColor"));
  else
    v9 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v10 = (void *)v9;
  -[VMRoundButton setActualBackgroundColor:](self, "setActualBackgroundColor:", v9);

  -[VMRoundButton setActualTintColor:](self, "setActualTintColor:", v6);
  -[VMRoundButton setImage:forState:](self, "setImage:forState:", v8, 0);
  v11 = PHDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Configuring audio route button using route: %@", (uint8_t *)&v13, 0xCu);
  }

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VMRoundButton;
  -[VMRoundButton setHighlighted:](&v8, "setHighlighted:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMRoundButton actualBackgroundColor](self, "actualBackgroundColor"));
  v6 = v5;
  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", 0.6));
    -[VMRoundButton setBackgroundColor:](self, "setBackgroundColor:", v7);

  }
  else
  {
    -[VMRoundButton setBackgroundColor:](self, "setBackgroundColor:", v5);
  }

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VMRoundButton;
  -[VMRoundButton setEnabled:](&v12, "setEnabled:");
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMRoundButton actualBackgroundColor](self, "actualBackgroundColor"));
    -[VMRoundButton setBackgroundColor:](self, "setBackgroundColor:", v5);

    v6 = objc_claimAutoreleasedReturnValue(-[VMRoundButton actualTintColor](self, "actualTintColor"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v8, "alphaComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorWithAlphaComponent:", v9 * 0.5));
    -[VMRoundButton setBackgroundColor:](self, "setBackgroundColor:", v10);

    v6 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.5));
  }
  v11 = (void *)v6;
  -[VMRoundButton setTintColor:](self, "setTintColor:", v6);

}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VMRoundButton;
  -[VMRoundButton setSelected:](&v4, "setSelected:", a3);
  -[VMRoundButton _updateButtonState](self, "_updateButtonState");
}

- (void)setActualBackgroundColor:(id)a3
{
  UIColor **p_actualBackgroundColor;
  id v6;

  p_actualBackgroundColor = &self->_actualBackgroundColor;
  v6 = a3;
  if ((-[UIColor isEqual:](*p_actualBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_actualBackgroundColor, a3);
    -[VMRoundButton setBackgroundColor:](self, "setBackgroundColor:", *p_actualBackgroundColor);
  }

}

- (void)setActualTintColor:(id)a3
{
  UIColor **p_actualTintColor;
  id v6;

  p_actualTintColor = &self->_actualTintColor;
  v6 = a3;
  if ((-[UIColor isEqual:](*p_actualTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_actualTintColor, a3);
    -[VMRoundButton setTintColor:](self, "setTintColor:", *p_actualTintColor);
  }

}

- (void)_updateButtonState
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = -[VMRoundButton type](self, "type");
  if (v3 - 3 < 2)
  {
    if (!-[VMRoundButton isSelected](self, "isSelected"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemLightGrayColor](UIColor, "systemLightGrayColor"));
      -[VMRoundButton setBackgroundColor:](self, "setBackgroundColor:", v8);

      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      goto LABEL_11;
    }
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    goto LABEL_7;
  }
  if (v3 - 1 <= 1)
  {
    if (!-[VMRoundButton isSelected](self, "isSelected"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemLightGrayColor](UIColor, "systemLightGrayColor"));
      -[VMRoundButton setBackgroundColor:](self, "setBackgroundColor:", v7);

      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      goto LABEL_11;
    }
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
LABEL_7:
    v5 = (void *)v4;
    -[VMRoundButton setBackgroundColor:](self, "setBackgroundColor:", v4);

    v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
LABEL_11:
    v9 = (id)v6;
    -[VMRoundButton setTintColor:](self, "setTintColor:", v6);

  }
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (UIColor)actualBackgroundColor
{
  return self->_actualBackgroundColor;
}

- (UIColor)actualTintColor
{
  return self->_actualTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualTintColor, 0);
  objc_storeStrong((id *)&self->_actualBackgroundColor, 0);
}

@end
