@implementation IDSCKQuerySubscription

+ (Class)__class
{
  if (qword_1EE40B1A0 != -1)
    dispatch_once(&qword_1EE40B1A0, &unk_1E3C1B590);
  return (Class)(id)qword_1EE40B198;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (IDSCKNotificationInfo)notificationInfo
{
  return self->_notificationInfo;
}

- (void)setNotificationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationInfo, 0);
}

@end
