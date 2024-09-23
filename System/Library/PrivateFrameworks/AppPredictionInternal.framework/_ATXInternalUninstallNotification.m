@implementation _ATXInternalUninstallNotification

- (_ATXInternalUninstallNotification)init
{
  _ATXInternalUninstallNotification *v2;
  _ATXInternalNotification *v3;
  _ATXInternalNotification *note;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ATXInternalUninstallNotification;
  v2 = -[_ATXInternalUninstallNotification init](&v6, sel_init);
  if (v2)
  {
    v3 = -[_ATXInternalNotification initWithNotificationName:]([_ATXInternalNotification alloc], "initWithNotificationName:", CFSTR("com.apple.duetexpertd._ATXInternalUninstallNotification.appUninstalled"));
    note = v2->_note;
    v2->_note = v3;

  }
  return v2;
}

- (void)registerForNotificationsWithUninstallBlock:(id)a3
{
  -[_ATXInternalNotification registerForNotifications:](self->_note, "registerForNotifications:", a3);
}

+ (void)postNotificationWithUninstallSet:(id)a3 histogramBundleIdTable:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[_ATXInternalNotification postData:forNotificationNamed:](_ATXInternalNotification, "postData:forNotificationNamed:", v5, CFSTR("com.apple.duetexpertd._ATXInternalUninstallNotification.appUninstalled"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "remove:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
}

@end
