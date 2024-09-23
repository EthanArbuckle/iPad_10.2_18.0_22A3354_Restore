@implementation MPCAssistantGetVolume

- (void)getVolumeLevelForUID:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  const void *v8;
  id v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v11[0] = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", v11, 1);
  v8 = (const void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();
  v10 = v5;
  v9 = v5;
  MRAVReconnaissanceSessionBeginSearch();
  CFRelease(v8);

}

void __57__MPCAssistantGetVolume_getVolumeLevelForUID_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  MPCAssistantConnection *v10;
  id v11;
  uint64_t v12;
  MPCAssistantConnection *v13;
  _QWORD v14[4];
  MPCAssistantConnection *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[MPCAssistantGetVolume] Completing with error: %{public}@", buf, 0xCu);
    }

    (*(void (**)(float))(*(_QWORD *)(a1 + 32) + 16))(0.0);
  }
  else
  {
    objc_msgSend(a2, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc_init(MPCAssistantConnection);
    CFRetain(*(CFTypeRef *)(a1 + 40));
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __57__MPCAssistantGetVolume_getVolumeLevelForUID_completion___block_invoke_2;
    v14[3] = &unk_24CAB9FF8;
    v17 = a3;
    v18 = v9;
    v15 = v10;
    v11 = *(id *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v16 = v11;
    v19 = v12;
    v13 = v10;
    -[MPCAssistantConnection connectToEndpoint:completion:](v13, "connectToEndpoint:completion:", a3, v14);

  }
}

void __57__MPCAssistantGetVolume_getVolumeLevelForUID_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  MRAVEndpointGetOutputDeviceVolume();

}

void __57__MPCAssistantGetVolume_getVolumeLevelForUID_completion___block_invoke_3(uint64_t a1, void *a2, float a3)
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  __n128 v10;
  __n128 v11;
  int v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = *(id *)(a1 + 32);
  v7 = a2;
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v12 = 138543362;
      v13 = *(double *)&v7;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[MPCAssistantGetVolume] Completing with error: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    v10.n128_u32[0] = 0;
    (*(void (**)(__n128))(*(_QWORD *)(a1 + 40) + 16))(v10);
  }
  else
  {
    if (v9)
    {
      v12 = 134217984;
      v13 = a3;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[MPCAssistantGetVolume] Completing with volume: %f", (uint8_t *)&v12, 0xCu);
    }

    v11.n128_f32[0] = a3;
    (*(void (**)(__n128))(*(_QWORD *)(a1 + 40) + 16))(v11);
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));

}

@end
