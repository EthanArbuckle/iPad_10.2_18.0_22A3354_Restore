@implementation NSError(MPCErrorController)

- (BOOL)mpc_isAirplayDeviceBusyError
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BDD1100], -12926);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isRentalContentRequiresDownloadError
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BDD1100], -17220);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isAirplayStreamingNotSupportedError
{
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BDB1C58], -11870);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BDD1100], -17226);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  return v3;
}

- (BOOL)mpc_isQueueLoadingFailure
{
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BDDB968], 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", CFSTR("MPCError"), 62);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  return v3;
}

- (BOOL)mpc_isAssetUnavailableFailure
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", CFSTR("MPCError"), 24);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isUnrecoverableAssetLoadingError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "msv_errorByUnwrappingDomain:", *MEMORY[0x24BEC8580]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "code");

  return v2 == -7403 || v2 == -7004;
}

- (BOOL)mpc_isResourceUnavailableError
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BDD1308], -1008);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isSubscriptionRequiredError
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", CFSTR("MPCError"), 17);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isLeaseTakenError
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BEC86C0], 3084);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isKeyServerNoOfflineSlotError
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BEC85C8], -1004);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)mpc_isStreamingSlotError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "msv_errorByUnwrappingDomain:", *MEMORY[0x24BEC85C8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "code");

  return ((unint64_t)(v2 - 3047) < 0xE) & (0x3005u >> (v2 + 25));
}

- (BOOL)mpc_isNetworkReachabilityError
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", CFSTR("MPCError"), 56);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)mpc_isFileDoesNotExistError
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BDD1308], -1100);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

@end
