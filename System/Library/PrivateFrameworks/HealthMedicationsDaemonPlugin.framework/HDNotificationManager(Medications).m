@implementation HDNotificationManager(Medications)

- (void)removeDeliveredNotificationsForScheduleItemIdentifiers:()Medications
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v10 = a1;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1B815E000, v5, OS_LOG_TYPE_DEFAULT, "[%public@] Removing delivered notifications for scheduleItems: %@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__HDNotificationManager_Medications__removeDeliveredNotificationsForScheduleItemIdentifiers___block_invoke;
  v7[3] = &unk_1E6E01738;
  v7[4] = a1;
  v8 = v4;
  v6 = v4;
  objc_msgSend(a1, "getDeliveredNotificationsWithCompletionHandler:", v7);

}

@end
