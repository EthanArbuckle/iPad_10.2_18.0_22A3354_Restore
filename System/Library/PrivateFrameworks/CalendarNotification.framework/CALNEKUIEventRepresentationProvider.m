@implementation CALNEKUIEventRepresentationProvider

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__CALNEKUIEventRepresentationProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_9 != -1)
    dispatch_once(&sharedInstance_onceToken_9, block);
  return (id)sharedInstance_sharedInstance_8;
}

void __53__CALNEKUIEventRepresentationProvider_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_8;
  sharedInstance_sharedInstance_8 = v0;

}

- (id)eventRepresentationDictionaryForUpcomingEvent:(id)a3 date:(id)a4 displayTimeZone:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (void *)MEMORY[0x24BDC7638];
  v8 = a3;
  objc_msgSend(v7, "upcomingEventNotificationRepresentationWithEvent:date:displayTimeZone:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEventRepresentationDataSourceUtils updateEventRepresentation:forEvent:](CALNEventRepresentationDataSourceUtils, "updateEventRepresentation:forEvent:", v9, v8);

  objc_msgSend(v9, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)eventRepresentationDictionaryForInvitationNotification:(id)a3 event:(id)a4 date:(id)a5 endDate:(id)a6 timeZone:(id)a7
{
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v11 = (void *)MEMORY[0x24BDC7638];
  v12 = a4;
  objc_msgSend(v11, "invitationNotificationRepresentationWithNotification:event:date:endDate:timeZone:", a3, v12, a5, a6, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEventRepresentationDataSourceUtils updateEventRepresentation:forEvent:](CALNEventRepresentationDataSourceUtils, "updateEventRepresentation:forEvent:", v13, v12);

  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)eventRepresentationDictionaryForResourceChangeNotification:(id)a3 message:(id)a4 date:(id)a5 endDate:(id)a6 timeZone:(id)a7
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDC7638], "resourceChangeNotificationWithNotification:message:date:endDate:timeZone:", a3, a4, a5, a6, a7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)eventRepresentationDictionaryForResponseNotificationWithTitle:(id)a3 message:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDC7638], "responseNotificationWithTitle:message:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)updateEventRepresentationDictionary:(id)a3 withHypothesisMessage:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BDC7638];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithDictionary:", v7);

  if (objc_msgSend(v8, "type") == 1)
  {
    objc_msgSend(v8, "updateUpcomingEventNotificationWithHypothesisMessage:", v5);
  }
  else
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CALNEKUIEventRepresentationProvider updateEventRepresentationDictionary:withHypothesisMessage:].cold.1(v8, v9);

  }
  objc_msgSend(v8, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)updateEventRepresentationDictionary:(void *)a1 withHypothesisMessage:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Tried to add hypothesis message to event representation with the wrong type: (%@)", (uint8_t *)&v4, 0xCu);

}

@end
