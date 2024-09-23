@implementation AFCoreAnalyticsEventCreateForServiceDeviceContexts

void __AFCoreAnalyticsEventCreateForServiceDeviceContexts_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a2, "metricsContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("coreAnalyticsContextPayload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __AFCoreAnalyticsEventCreateForServiceDeviceContexts_block_invoke_2;
  v8[3] = &unk_1E3A30D60;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v4, "mutatedCopyWithMutator:", v8);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  objc_msgSend(v7, "contextIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, v6);

}

void __AFCoreAnalyticsEventCreateForServiceDeviceContexts_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "nearbyDevicesLoggingID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNearbyDevicesRequestIdentifier:", v4);

}

@end
