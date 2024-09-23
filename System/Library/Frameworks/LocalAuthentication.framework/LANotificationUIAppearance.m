@implementation LANotificationUIAppearance

- (id)darwinNotificationForBoolValue:(BOOL)a3
{
  if (a3)
    return CFSTR("com.apple.LocalAuthentication.ui.presented");
  else
    return CFSTR("com.apple.LocalAuthentication.ui.dismissed");
}

- (BOOL)didDisappear
{
  return !-[LANotificationOfBooleanState BOOLValue](self, "BOOLValue");
}

- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5
{
  objc_super v5;

  if (!a3)
    a3 = (id)MEMORY[0x1E0C9AAA0];
  if (!a4)
    a4 = (id)MEMORY[0x1E0C9AAA0];
  v5.receiver = self;
  v5.super_class = (Class)LANotificationUIAppearance;
  -[LANotification newValue:oldValue:completionHandler:](&v5, sel_newValue_oldValue_completionHandler_, a3, a4, a5);
}

@end
