@implementation IDSCKNotificationInfo

+ (Class)__class
{
  if (qword_1EE40B190 != -1)
    dispatch_once(&qword_1EE40B190, &unk_1E3C207D8);
  return (Class)(id)qword_1EE40B188;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (NSString)alertLocalizationKey
{
  return self->_alertLocalizationKey;
}

- (void)setAlertLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)shouldSendContentAvailable
{
  return self->_shouldSendContentAvailable;
}

- (void)setShouldSendContentAvailable:(BOOL)a3
{
  self->_shouldSendContentAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertLocalizationKey, 0);
}

@end
