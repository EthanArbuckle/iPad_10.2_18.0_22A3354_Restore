@implementation IMAutomaticEventNotificationQueue

- (void)_invokeEvent:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    v5 = a3;
    -[IMEventNotificationQueue eventNotificationList](self, "eventNotificationList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeLinkedListNode:", v5);

    objc_msgSend(v5, "invoke");
    objc_msgSend(v5, "cancel");
    objc_msgSend(v5, "cache");

  }
}

- (void)_didProcessQueue
{
  id v3;

  -[IMEventNotificationQueue eventNotificationList](self, "eventNotificationList");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[IMEventNotificationQueue _setBusy:](self, "_setBusy:", objc_msgSend(v3, "count") != 0);

}

- (void)_didAddNotification:(id)a3
{
  -[IMEventNotificationQueue _setBusy:](self, "_setBusy:", 1);
  -[IMEventNotificationQueue _scheduleIfNeeded:](self, "_scheduleIfNeeded:", 0);
}

- (void)_didCancelNotifications
{
  id v3;

  -[IMEventNotificationQueue eventNotificationList](self, "eventNotificationList");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[IMEventNotificationQueue _setBusy:](self, "_setBusy:", objc_msgSend(v3, "count") != 0);

}

@end
