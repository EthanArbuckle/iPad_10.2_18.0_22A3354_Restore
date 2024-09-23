@implementation AXUIAlertContext

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIAlertContext identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = \"%@\">"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)creationTimeInterval
{
  return self->_creationTimeInterval;
}

- (void)setCreationTimeInterval:(double)a3
{
  self->_creationTimeInterval = a3;
}

- (double)fadeAnimationDuration
{
  return self->_fadeAnimationDuration;
}

- (void)setFadeAnimationDuration:(double)a3
{
  self->_fadeAnimationDuration = a3;
}

- (AXDispatchTimer)showOrHideTimer
{
  return self->_showOrHideTimer;
}

- (void)setShowOrHideTimer:(id)a3
{
  objc_storeStrong((id *)&self->_showOrHideTimer, a3);
}

- (AXUIAlert)alertView
{
  return self->_alertView;
}

- (void)setAlertView:(id)a3
{
  objc_storeStrong((id *)&self->_alertView, a3);
}

- (AXUIService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_storeStrong((id *)&self->_showOrHideTimer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
