@implementation BKSHIDServiceConnection

+ (id)clientConnectionForServiceWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D03458], "endpointForMachName:service:instance:", CFSTR("com.apple.backboard.hid-services.xpc"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BKLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v3;
      _os_log_error_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_ERROR, "cannot get endpoint for mach service (on behalf of BSService namee: %{public}@)", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

@end
