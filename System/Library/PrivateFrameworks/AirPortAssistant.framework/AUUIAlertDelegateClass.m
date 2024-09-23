@implementation AUUIAlertDelegateClass

- (void)dealloc
{
  objc_super v3;

  objc_msgSend_setUiAlert_(self, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)AUUIAlertDelegateClass;
  -[AUUIAlertDelegateClass dealloc](&v3, sel_dealloc);
}

- (BOOL)auUIAlertOKAction:(id)a3
{
  AUUIAlertDelegateClass *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_setDelegate_(a3, a2, 0);
  v4 = self;
  qword_2550F4CB0 = 0;
  sub_21A736BD0((uint64_t)v4, v5, v6);
  return 1;
}

- (BOOL)auUIAlertCancelAction:(id)a3
{
  AUUIAlertDelegateClass *v4;

  objc_msgSend_setDelegate_(a3, a2, 0);
  v4 = self;
  qword_2550F4CB0 = 0;
  return 1;
}

- (AUUIAlert)uiAlert
{
  return self->uiAlert;
}

- (void)setUiAlert:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
