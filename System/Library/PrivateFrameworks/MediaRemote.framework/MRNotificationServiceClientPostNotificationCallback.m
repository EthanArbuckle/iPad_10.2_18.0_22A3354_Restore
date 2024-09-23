@implementation MRNotificationServiceClientPostNotificationCallback

uint64_t __MRNotificationServiceClientPostNotificationCallback_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "notificationClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotification:userInfo:object:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
