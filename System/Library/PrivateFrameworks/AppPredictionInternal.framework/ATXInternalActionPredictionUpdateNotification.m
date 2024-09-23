@implementation ATXInternalActionPredictionUpdateNotification

- (ATXInternalActionPredictionUpdateNotification)init
{
  ATXInternalActionPredictionUpdateNotification *v2;
  _ATXInternalNotification *v3;
  _ATXInternalNotification *note;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXInternalActionPredictionUpdateNotification;
  v2 = -[ATXInternalActionPredictionUpdateNotification init](&v6, sel_init);
  if (v2)
  {
    v3 = -[_ATXInternalNotification initWithNotificationName:]([_ATXInternalNotification alloc], "initWithNotificationName:", CFSTR("com.apple.duetexpertd._ATXInternalInstallNotification.ActionPredictionUpdateCache"));
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
  v7[2] = __89__ATXInternalActionPredictionUpdateNotification_registerForNotificationsWithUpdateBlock___block_invoke;
  v7[3] = &unk_1E82DFFE0;
  v8 = v4;
  v6 = v4;
  -[_ATXInternalNotification registerForNotifications:](note, "registerForNotifications:", v7);

}

void __89__ATXInternalActionPredictionUpdateNotification_registerForNotificationsWithUpdateBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ttl"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "doubleValue");
  (*(void (**)(uint64_t, uint64_t, double))(v5 + 16))(v5, objc_msgSend(v4, "unsignedIntegerValue"), v6);

}

+ (void)postNotificationWithCacheRefreshTTL:(double)a3 reason:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("ttl");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("reason");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXInternalNotification postData:forNotificationNamed:](_ATXInternalNotification, "postData:forNotificationNamed:", v7, CFSTR("com.apple.duetexpertd._ATXInternalInstallNotification.ActionPredictionUpdateCache"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
}

@end
