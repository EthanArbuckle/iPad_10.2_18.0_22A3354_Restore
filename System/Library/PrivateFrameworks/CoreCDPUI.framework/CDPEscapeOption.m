@implementation CDPEscapeOption

+ (id)cancelOption
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setStyle:", 1);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_CANCEL_BUTTON"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  objc_msgSend(v2, "setTitleLocalizationKey:", CFSTR("GENERIC_CANCEL_BUTTON"));
  objc_msgSend(v2, "setTitleTelemetryKey:", *MEMORY[0x24BE1A888]);
  return v2;
}

+ (id)okOption
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setStyle:", 0);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  objc_msgSend(v2, "setTitleLocalizationKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
  objc_msgSend(v2, "setTitleTelemetryKey:", *MEMORY[0x24BE1A8B8]);
  return v2;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)titleLocalizationKey
{
  return self->_titleLocalizationKey;
}

- (void)setTitleLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)titleTelemetryKey
{
  return self->_titleTelemetryKey;
}

- (void)setTitleTelemetryKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (id)escapeAction
{
  return self->_escapeAction;
}

- (void)setEscapeAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)canShowEscapeOption
{
  return self->_canShowEscapeOption;
}

- (void)setCanShowEscapeOption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)progressTitle
{
  return self->_progressTitle;
}

- (void)setProgressTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)progressLabel
{
  return self->_progressLabel;
}

- (void)setProgressLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressTitle, 0);
  objc_storeStrong(&self->_canShowEscapeOption, 0);
  objc_storeStrong(&self->_escapeAction, 0);
  objc_storeStrong((id *)&self->_titleTelemetryKey, 0);
  objc_storeStrong((id *)&self->_titleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
