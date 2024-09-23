@implementation CPSharedConversationServerBag

- (unint64_t)activeParticipantPruningTimeout
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("qr-participant-prune-timeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 30;

  return v4;
}

- (unint64_t)sessionCleanupTimeout
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("qr-session-cleanup-timeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 30;

  return v4;
}

- (unint64_t)AVCBlobRecoveryGracePeriod
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("qr-session-avc-blob-recovery-grace-period"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 5;

  return v4;
}

- (unint64_t)AVCBlobRecoveryTimeout
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("qr-session-avc-blob-recovery-timeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 65;

  return v4;
}

- (unint64_t)rebroadcastTimeThreshold
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("qr-session-rebroadcast-threshold"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 10;

  return v4;
}

- (unint64_t)activeParticipantRefreshDelay
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("qr-session-participant-refresh-delay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 5;

  return v4;
}

- (unint64_t)backgroundAppPolicyHandleExpiryDays
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("background-app-policy-handle-expiry-days"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 30;

  return v4;
}

- (unint64_t)maxActiveParticipantFetchRetries
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("qr-active-participant-fetch-retries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 5;

  return v4;
}

- (unint64_t)qrPluginMaxConnectionAttempts
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("qr-plugin-max-connection-attempts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 5;

  return v4;
}

- (unint64_t)qrPluginConnectionRetryIntervalMillis
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("qr-plugin-connection-retry-interval-millis"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 5000;

  return v4;
}

- (unint64_t)qrPluginMaxRpcStreamAttempts
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("qr-plugin-rpc-stream-attempts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 5;

  return v4;
}

- (unint64_t)qrPluginRpcStreamRetryIntervalMillis
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("qr-plugin-rpc-stream-retry-interval-millis"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 1000;

  return v4;
}

- (unint64_t)unreliableMessengerEstablishChannelMaxAttempts
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("unreliable-messenger-establish-channel-max-attempts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 3;

  return v4;
}

- (unint64_t)unreliableMessengerEstablishChannelRetryIntervalMillis
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("unreliable-messenger-establish-channel-retry-interval-millis"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 1000;

  return v4;
}

- (unint64_t)unreliableMessengerEgressMessagePayloadMaxSizeBytes
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("unreliable-messenger-egress-message-payload-max-size-bytes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 1180;

  return v4;
}

- (unint64_t)unreliableMessengerChannelStreamMaxQueueSize
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("unreliable-messenger-channel-stream-max-queue-size"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 1000;

  return v4;
}

- (unint64_t)unreliableMessengerChannelStreamMaxTries
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("unreliable-messenger-channel-stream-max-tries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 5;

  return v4;
}

- (unint64_t)unreliableMessengerChannelStreamRetryIntervalMillis
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("unreliable-messenger-channel-stream-retry-interval-millis"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 1000;

  return v4;
}

- (unint64_t)unreliableMessengerSeqNumBufferSize
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("unreliable-messenger-seq-num-buffer-size"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 1024;

  return v4;
}

- (unint64_t)timeBetweenMacOSSharePlayNotificationsSeconds
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("shareplay-time-between-macos-notifications"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 1200;

  return v4;
}

- (NSArray)blockedActivitySessionBundleIdentifiers
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("shareplay-blocked-bundle-identifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)stableBundleIdentifierForLocalBundleIdentifier:(id)a3
{
  return 0;
}

- (BOOL)fastSyncRecoveryMessageHandlingEnabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D20C20], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("fastsync-recovery-message-handling"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

@end
