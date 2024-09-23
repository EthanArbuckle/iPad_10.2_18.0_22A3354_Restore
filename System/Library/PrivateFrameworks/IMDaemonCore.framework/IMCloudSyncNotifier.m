@implementation IMCloudSyncNotifier

- (void)notifyClientsOfState:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "broadcasterForCloudSyncListeners");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateCloudKitStateWithDictionary:", v3);

}

- (void)notifyClientsOfProgress:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "broadcasterForCloudSyncListeners");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateCloudKitProgressWithDictionary:", v3);

}

@end
