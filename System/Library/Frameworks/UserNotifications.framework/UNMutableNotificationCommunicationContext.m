@implementation UNMutableNotificationCommunicationContext

intptr_t __101___UNMutableNotificationCommunicationContext_UserNotifications_INIntent__mutableContextFromINIntent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a2, "_identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
