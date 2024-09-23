@implementation CALNMutableNotificationSound

- (void)setAlertTopic:(id)a3
{
  NSString *v4;
  NSString *alertTopic;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  alertTopic = self->super._alertTopic;
  self->super._alertTopic = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  CALNNotificationSound *v4;
  int64_t v5;
  void *v6;
  id v7;

  v4 = +[CALNNotificationSound allocWithZone:](CALNNotificationSound, "allocWithZone:", a3);
  v5 = -[CALNNotificationSound alertType](self, "alertType");
  -[CALNNotificationSound alertTopic](self, "alertTopic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CALNNotificationSound _initWithAlertType:alertTopic:](v4, "_initWithAlertType:alertTopic:", v5, v6);

  return v7;
}

@end
