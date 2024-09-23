@implementation BPSFollowUpAttributes

+ (id)attributeWithOptions:(id)a3
{
  id v3;
  BPSFollowUpAttributes *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(BPSFollowUpAttributes);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSFollowUpAttributes setLocalizedTitle:](v4, "setLocalizedTitle:", v5);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("description"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSFollowUpAttributes setLocalizedDescription:](v4, "setLocalizedDescription:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("followUpActions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSFollowUpAttributes setFollowUpActions:](v4, "setFollowUpActions:", v7);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("notificationTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("notificationDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
  {
    -[BPSFollowUpAttributes setWantNotification:](v4, "setWantNotification:", 1);
    -[BPSFollowUpAttributes setLocalizedNotificationTitle:](v4, "setLocalizedNotificationTitle:", v8);
    -[BPSFollowUpAttributes setLocalizedNotificationDescription:](v4, "setLocalizedNotificationDescription:", v9);
  }

  return v4;
}

- (BOOL)wantNotification
{
  return self->_wantNotification;
}

- (void)setWantNotification:(BOOL)a3
{
  self->_wantNotification = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)followUpActions
{
  return self->_followUpActions;
}

- (void)setFollowUpActions:(id)a3
{
  objc_storeStrong((id *)&self->_followUpActions, a3);
}

- (NSString)localizedNotificationTitle
{
  return self->_localizedNotificationTitle;
}

- (void)setLocalizedNotificationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)localizedNotificationDescription
{
  return self->_localizedNotificationDescription;
}

- (void)setLocalizedNotificationDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNotificationDescription, 0);
  objc_storeStrong((id *)&self->_localizedNotificationTitle, 0);
  objc_storeStrong((id *)&self->_followUpActions, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
