@implementation HMDBulletinNotificationLogEvent

- (HMDBulletinNotificationLogEvent)initWithTopic:(int64_t)a3
{
  HMDBulletinNotificationLogEvent *v4;
  HMDBulletinNotificationLogEvent *v5;
  __CFString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDBulletinNotificationLogEvent;
  v4 = -[HMMLogEvent init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if ((unint64_t)(a3 - 1) > 0x15)
      v6 = CFSTR("Unknown");
    else
      v6 = off_24E77AD00[a3 - 1];
    objc_storeStrong((id *)&v4->_topic, v6);
  }
  return v5;
}

- (NSString)topic
{
  return self->_topic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
