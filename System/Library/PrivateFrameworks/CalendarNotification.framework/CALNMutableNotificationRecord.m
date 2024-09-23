@implementation CALNMutableNotificationRecord

- (id)copyWithZone:(_NSZone *)a3
{
  CALNNotificationRecord *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CALNNotificationRecord *v9;

  v4 = +[CALNNotificationRecord allocWithZone:](CALNNotificationRecord, "allocWithZone:", a3);
  -[CALNNotificationRecord sourceIdentifier](self, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationRecord sourceClientIdentifier](self, "sourceClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationRecord content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationRecord date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CALNNotificationRecord initWithSourceIdentifier:sourceClientIdentifier:content:date:shouldPresentAlert:shouldPlaySound:](v4, "initWithSourceIdentifier:sourceClientIdentifier:content:date:shouldPresentAlert:shouldPlaySound:", v5, v6, v7, v8, -[CALNNotificationRecord shouldPresentAlert](self, "shouldPresentAlert"), -[CALNNotificationRecord shouldPlaySound](self, "shouldPlaySound"));

  return v9;
}

- (void)setSourceIdentifier:(id)a3
{
  NSString *v4;
  NSString *sourceIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  sourceIdentifier = self->super._sourceIdentifier;
  self->super._sourceIdentifier = v4;

}

- (void)setSourceClientIdentifier:(id)a3
{
  NSString *v4;
  NSString *sourceClientIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  sourceClientIdentifier = self->super._sourceClientIdentifier;
  self->super._sourceClientIdentifier = v4;

}

- (void)setContent:(id)a3
{
  CALNNotificationContent *v4;
  CALNNotificationContent *content;

  v4 = (CALNNotificationContent *)objc_msgSend(a3, "copy");
  content = self->super._content;
  self->super._content = v4;

}

- (void)setDate:(id)a3
{
  NSDate *v4;
  NSDate *date;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  date = self->super._date;
  self->super._date = v4;

}

- (void)setShouldPresentAlert:(BOOL)a3
{
  self->super._shouldPresentAlert = a3;
}

- (void)setShouldPlaySound:(BOOL)a3
{
  self->super._shouldPlaySound = a3;
}

@end
