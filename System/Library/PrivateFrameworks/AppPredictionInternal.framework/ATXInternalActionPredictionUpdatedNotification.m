@implementation ATXInternalActionPredictionUpdatedNotification

- (ATXInternalActionPredictionUpdatedNotification)init
{
  ATXInternalActionPredictionUpdatedNotification *v2;
  _ATXInternalNotification *v3;
  _ATXInternalNotification *note;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXInternalActionPredictionUpdatedNotification;
  v2 = -[ATXInternalActionPredictionUpdatedNotification init](&v6, sel_init);
  if (v2)
  {
    v3 = -[_ATXInternalNotification initWithNotificationName:]([_ATXInternalNotification alloc], "initWithNotificationName:", CFSTR("com.apple.duetexpertd._ATXInternalInstallNotification.ActionPredictionCacheUpdated"));
    note = v2->_note;
    v2->_note = v3;

  }
  return v2;
}

- (void)registerForNotificationsWithUpdateBlock:(id)a3
{
  id v4;
  _ATXInternalNotification *note;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  note = self->_note;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__ATXInternalActionPredictionUpdatedNotification_registerForNotificationsWithUpdateBlock___block_invoke;
  v7[3] = &unk_1E82DFDD8;
  v8 = v4;
  v6 = v4;
  -[_ATXInternalNotification registerForNotifications:](note, "registerForNotifications:", v7);

}

uint64_t __90__ATXInternalActionPredictionUpdatedNotification_registerForNotificationsWithUpdateBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)postNotification
{
  +[_ATXInternalNotification postData:forNotificationNamed:](_ATXInternalNotification, "postData:forNotificationNamed:", 0, CFSTR("com.apple.duetexpertd._ATXInternalInstallNotification.ActionPredictionCacheUpdated"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
}

@end
