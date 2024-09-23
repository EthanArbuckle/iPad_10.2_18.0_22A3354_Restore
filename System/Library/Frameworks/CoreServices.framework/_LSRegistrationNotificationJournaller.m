@implementation _LSRegistrationNotificationJournaller

- (_LSRegistrationNotificationJournaller)initWithPrimaryBundleID:(id)a3 placeholder:(BOOL)a4
{
  _LSRegistrationNotificationJournaller *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_LSRegistrationNotificationJournaller;
  result = -[_LSInstallNotificationJournaller initWithPrimaryBundleID:operation:](&v6, sel_initWithPrimaryBundleID_operation_, a3, 0);
  if (result)
    result->_placeholder = a4;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LSRegistrationNotificationJournaller)initWithCoder:(id)a3
{
  id v4;
  _LSRegistrationNotificationJournaller *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_LSRegistrationNotificationJournaller;
  v5 = -[_LSInstallNotificationJournaller initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_placeholder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("placeholder"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_LSRegistrationNotificationJournaller;
  v4 = a3;
  -[_LSInstallNotificationJournaller encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_placeholder, CFSTR("placeholder"), v5.receiver, v5.super_class);

}

- (BOOL)shouldExpectEntityToExist
{
  return 1;
}

- (BOOL)entityExists
{
  _LSRegistrationNotificationJournaller *v2;
  void *v3;

  v2 = self;
  -[_LSInstallNotificationJournaller primaryBundleID](self, "primaryBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[_LSInstallNotificationJournaller isApplicationRegisteredWithbundleID:placeholder:](v2, "isApplicationRegisteredWithbundleID:placeholder:", v3, v2->_placeholder);

  return (char)v2;
}

- (id)synthesizedPreliminaryJournalledNotifications
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
