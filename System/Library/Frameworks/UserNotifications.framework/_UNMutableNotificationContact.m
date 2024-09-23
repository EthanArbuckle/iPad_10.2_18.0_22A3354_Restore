@implementation _UNMutableNotificationContact

- (void)setHandle:(id)a3
{
  NSString *v4;
  NSString *handle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  handle = self->super._handle;
  self->super._handle = v4;

}

- (void)setHandleType:(int64_t)a3
{
  self->super._handleType = a3;
}

- (void)setServiceName:(id)a3
{
  NSString *v4;
  NSString *serviceName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  serviceName = self->super._serviceName;
  self->super._serviceName = v4;

}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  displayName = self->super._displayName;
  self->super._displayName = v4;

}

- (void)setDisplayNameSuggested:(BOOL)a3
{
  self->super._displayNameSuggested = a3;
}

- (void)setCustomIdentifier:(id)a3
{
  NSString *v4;
  NSString *customIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  customIdentifier = self->super._customIdentifier;
  self->super._customIdentifier = v4;

}

- (void)setCnContactIdentifierSuggested:(BOOL)a3
{
  self->super._cnContactIdentifierSuggested = a3;
}

- (void)setCnContactIdentifier:(id)a3
{
  NSString *v4;
  NSString *cnContactIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  cnContactIdentifier = self->super._cnContactIdentifier;
  self->super._cnContactIdentifier = v4;

}

- (void)setCnContactFullname:(id)a3
{
  NSString *v4;
  NSString *cnContactFullname;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  cnContactFullname = self->super._cnContactFullname;
  self->super._cnContactFullname = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _UNNotificationContact *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;

  v4 = +[_UNNotificationContact allocWithZone:](_UNNotificationContact, "allocWithZone:", a3);
  -[_UNNotificationContact handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UNNotificationContact handleType](self, "handleType");
  -[_UNNotificationContact serviceName](self, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationContact displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UNNotificationContact isDisplayNameSuggested](self, "isDisplayNameSuggested");
  -[_UNNotificationContact customIdentifier](self, "customIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationContact cnContactIdentifier](self, "cnContactIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationContact cnContactFullname](self, "cnContactFullname");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = -[_UNNotificationContact isCNContactIdentifierSuggested](self, "isCNContactIdentifierSuggested");
  v13 = -[_UNNotificationContact _initWithhandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:](v4, "_initWithhandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:", v5, v6, v7, v8, v9, v10, v11, v12, v15);

  return v13;
}

@end
