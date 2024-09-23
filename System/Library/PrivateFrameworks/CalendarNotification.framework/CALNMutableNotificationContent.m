@implementation CALNMutableNotificationContent

- (CALNMutableNotificationContent)init
{
  CALNMutableNotificationContent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CALNMutableNotificationContent;
  result = -[CALNMutableNotificationContent init](&v3, sel_init);
  if (result)
    result->super._interruptionLevel = 1;
  return result;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->super._title;
  self->super._title = v4;

}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subtitle = self->super._subtitle;
  self->super._subtitle = v4;

}

- (void)setBody:(id)a3
{
  NSString *v4;
  NSString *body;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  body = self->super._body;
  self->super._body = v4;

}

- (void)setCategoryIdentifier:(id)a3
{
  NSString *v4;
  NSString *categoryIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  categoryIdentifier = self->super._categoryIdentifier;
  self->super._categoryIdentifier = v4;

}

- (void)setSectionIdentifier:(id)a3
{
  NSString *v4;
  NSString *sectionIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  sectionIdentifier = self->super._sectionIdentifier;
  self->super._sectionIdentifier = v4;

}

- (void)setDate:(id)a3
{
  NSDate *v4;
  NSDate *date;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  date = self->super._date;
  self->super._date = v4;

}

- (void)setExpirationDate:(id)a3
{
  NSDate *v4;
  NSDate *expirationDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  expirationDate = self->super._expirationDate;
  self->super._expirationDate = v4;

}

- (void)setDefaultActionURL:(id)a3
{
  NSURL *v4;
  NSURL *defaultActionURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  defaultActionURL = self->super._defaultActionURL;
  self->super._defaultActionURL = v4;

}

- (void)setIconIdentifier:(id)a3
{
  NSString *v4;
  NSString *iconIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  iconIdentifier = self->super._iconIdentifier;
  self->super._iconIdentifier = v4;

}

- (void)setShouldHideTime:(BOOL)a3
{
  self->super._shouldHideTime = a3;
}

- (void)setShouldSuppressSyncDismissalWhenRemoved:(BOOL)a3
{
  self->super._shouldSuppressSyncDismissalWhenRemoved = a3;
}

- (void)setPeopleIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *peopleIdentifiers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  peopleIdentifiers = self->super._peopleIdentifiers;
  self->super._peopleIdentifiers = v4;

}

- (void)setSound:(id)a3
{
  CALNNotificationSound *v4;
  CALNNotificationSound *sound;

  v4 = (CALNNotificationSound *)objc_msgSend(a3, "copy");
  sound = self->super._sound;
  self->super._sound = v4;

}

- (void)setUserInfo:(id)a3
{
  NSDictionary *v4;
  NSDictionary *userInfo;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  userInfo = self->super._userInfo;
  self->super._userInfo = v4;

}

- (void)setThreadIdentifier:(id)a3
{
  NSString *v4;
  NSString *threadIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  threadIdentifier = self->super._threadIdentifier;
  self->super._threadIdentifier = v4;

}

- (void)setInterruptionLevel:(unint64_t)a3
{
  self->super._interruptionLevel = a3;
}

- (void)setFilterCriteria:(id)a3
{
  NSString *v4;
  NSString *filterCriteria;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  filterCriteria = self->super._filterCriteria;
  self->super._filterCriteria = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  CALNNotificationContent *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  v20 = +[CALNNotificationContent allocWithZone:](CALNNotificationContent, "allocWithZone:", a3);
  -[CALNNotificationContent title](self, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent subtitle](self, "subtitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent body](self, "body");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent categoryIdentifier](self, "categoryIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent sectionIdentifier](self, "sectionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent date](self, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent expirationDate](self, "expirationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent defaultActionURL](self, "defaultActionURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent iconIdentifier](self, "iconIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CALNNotificationContent shouldHideTime](self, "shouldHideTime");
  v14 = -[CALNNotificationContent shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved");
  -[CALNNotificationContent peopleIdentifiers](self, "peopleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent sound](self, "sound");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationContent threadIdentifier](self, "threadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CALNNotificationContent interruptionLevel](self, "interruptionLevel");
  -[CALNNotificationContent filterCriteria](self, "filterCriteria");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v11) = v14;
  LOBYTE(v11) = v16;
  v21 = -[CALNNotificationContent _initWithTitle:subtitle:body:categoryIdentifier:sectionIdentifier:date:expirationDate:defaultActionURL:iconIdentifier:shouldHideTime:shouldSuppressSyncDismissalWhenRemoved:peopleIdentifiers:sound:userInfo:threadIdentifier:interruptionLevel:filterCriteria:](v20, "_initWithTitle:subtitle:body:categoryIdentifier:sectionIdentifier:date:expirationDate:defaultActionURL:iconIdentifier:shouldHideTime:shouldSuppressSyncDismissalWhenRemoved:peopleIdentifiers:sound:userInfo:threadIdentifier:interruptionLevel:filterCriteria:", v24, v23, v22, v19, v18, v17, v15, v13, v12, v11, v4, v5, v6, v7, v8,
          v9);

  return v21;
}

- (void)setUserInfoValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[CALNNotificationContent userInfo](self, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v6);

    v11 = (void *)objc_msgSend(v10, "copy");
  }
  else
  {
    v12 = v6;
    v13[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[CALNMutableNotificationContent setUserInfo:](self, "setUserInfo:", v11);

}

@end
