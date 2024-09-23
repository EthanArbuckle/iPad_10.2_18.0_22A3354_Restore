@implementation VMRTTButton

- (VMRTTButton)init
{
  VMRTTButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (VMRTTButton *)objc_claimAutoreleasedReturnValue(+[VMRTTButton buttonWithType:](VMRTTButton, "buttonWithType:", 1));
  -[VMRTTButton setBounds:](v3, "setBounds:", 0.0, 0.0, 40.0, 40.0);
  -[VMRTTButton setClipsToBounds:](v3, "setClipsToBounds:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[VMRTTButton setBackgroundColor:](v3, "setBackgroundColor:", v4);

  -[VMRTTButton _setTouchInsets:](v3, "_setTouchInsets:", -40.0, -40.0, -40.0, -40.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage voicemailTTYGlyphImage](UIImage, "voicemailTTYGlyphImage"));
  -[VMRTTButton setImage:forState:](v3, "setImage:forState:", v5, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("VOICEMAILUI_MESSAGE_TOOLBAR_BUTTON_TITLE_RTT"), &stru_10007F010, CFSTR("VoicemailUI")));
  -[VMRTTButton setAccessibilityLabel:](v3, "setAccessibilityLabel:", v7);

  return v3;
}

@end
