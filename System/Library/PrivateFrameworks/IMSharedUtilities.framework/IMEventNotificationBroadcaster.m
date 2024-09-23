@implementation IMEventNotificationBroadcaster

- (void)_willProcessQueue
{
  -[IMEventNotificationQueue _setBusy:](self, "_setBusy:", 1);
}

- (void)_didProcessQueue
{
  -[IMEventNotificationQueue _setBusy:](self, "_setBusy:", 0);
}

- (void)broadcastEventToListeners:(id)a3
{
  id v4;
  IMEventNotificationBroadcaster *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19E29D3A8;
  v7[3] = &unk_1E3FB6C38;
  v6 = v4;
  v8 = v6;
  -[IMEventNotificationQueue enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v7);
  -[IMEventNotificationQueue _scheduleIfNeeded:](v5, "_scheduleIfNeeded:", 1);

  objc_sync_exit(v5);
}

@end
