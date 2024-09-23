@implementation ATXInternalInstallNotification

void __76___ATXInternalInstallNotification_registerForNotificationsWithInstallBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[_ATXInternalInstallNotification _installedAppsWithDatesFromNotificationData:](_ATXInternalInstallNotification, "_installedAppsWithDatesFromNotificationData:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __79___ATXInternalInstallNotification__installedAppsWithDatesFromNotificationData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CF8CE8], "isAppClipForBundleId:", a2) ^ 1;
}

@end
