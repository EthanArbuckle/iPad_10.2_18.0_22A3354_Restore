@implementation HDNanoHealthNotification

- (HDNanoHealthNotification)initWithNotificationManager:(id)a3
{
  id v5;
  HDNanoHealthNotification *v6;
  HDNanoHealthNotification *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDNanoHealthNotification;
  v6 = -[HDNanoHealthNotification init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_notificationManager, a3);

  return v7;
}

+ (id)category
{
  objc_opt_class();
  objc_opt_class();
  NSRequestConcreteImplementation();
  return CFSTR("<INVALID>");
}

- (unint64_t)destinations
{
  return 15;
}

- (id)title
{
  objc_opt_class();
  objc_opt_class();
  NSRequestConcreteImplementation();
  return &stru_1E6D11BB8;
}

- (id)body
{
  objc_opt_class();
  objc_opt_class();
  NSRequestConcreteImplementation();
  return &stru_1E6D11BB8;
}

- (void)triggerNotification
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HDNotificationManager *notificationManager;
  _QWORD v18[5];

  -[HDNanoHealthNotification title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDNanoHealthNotification body](self, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self)
  {
    v6 = (objc_class *)MEMORY[0x1E0CEC6E0];
    v7 = v4;
    v8 = v3;
    v9 = objc_alloc_init(v6);
    objc_msgSend(v9, "setTitle:", v8);

    objc_msgSend(v9, "setBody:", v7);
    objc_msgSend((id)objc_opt_class(), "category");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCategoryIdentifier:", v10);

    objc_msgSend(MEMORY[0x1E0CEC760], "soundWithAlertType:", 25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSound:", v11);

    objc_msgSend(v9, "setShouldIgnoreDoNotDisturb:", 1);
  }
  else
  {
    v9 = 0;
  }

  objc_msgSend((id)objc_opt_class(), "category");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v15, v9, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDestinations:", -[HDNanoHealthNotification destinations](self, "destinations"));
  notificationManager = self->_notificationManager;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__HDNanoHealthNotification_triggerNotification__block_invoke;
  v18[3] = &unk_1E6CE77C8;
  v18[4] = self;
  -[HDNotificationManager postNotificationWithRequest:completion:](notificationManager, "postNotificationWithRequest:completion:", v16, v18);

}

void __47__HDNanoHealthNotification_triggerNotification__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  const __CFString *v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5330];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("NO");
    v10 = 138412802;
    v11 = v8;
    v12 = 2112;
    if (a2)
      v9 = CFSTR("YES");
    v13 = v9;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "Posted %@ with success %@, error: %@", (uint8_t *)&v10, 0x20u);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);
}

@end
