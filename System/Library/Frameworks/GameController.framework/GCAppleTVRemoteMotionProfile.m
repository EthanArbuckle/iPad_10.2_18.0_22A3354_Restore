@implementation GCAppleTVRemoteMotionProfile

void __56___GCAppleTVRemoteMotionProfile_setValueChangedHandler___block_invoke(id *a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (!WeakRetained[63] && !WeakRetained[64])
    objc_msgSend(a1[4], "_startDeviceMotionUpdates");
  v3 = objc_msgSend(a1[5], "copy");
  v4 = (void *)v5[63];
  v5[63] = v3;

}

void __56___GCAppleTVRemoteMotionProfile_setValueChangedHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (!*((_QWORD *)WeakRetained + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "_stopDeviceMotionUpdates");
    WeakRetained = v4;
  }
  v3 = (void *)*((_QWORD *)WeakRetained + 63);
  *((_QWORD *)WeakRetained + 63) = 0;

}

void __64___GCAppleTVRemoteMotionProfile_setInternalValueChangedHandler___block_invoke(id *a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (!WeakRetained[63] && !WeakRetained[64])
    objc_msgSend(a1[4], "_startDeviceMotionUpdates");
  v3 = objc_msgSend(a1[5], "copy");
  v4 = (void *)v5[64];
  v5[64] = v3;

}

void __64___GCAppleTVRemoteMotionProfile_setInternalValueChangedHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (!*((_QWORD *)WeakRetained + 63))
  {
    objc_msgSend(*(id *)(a1 + 32), "_stopDeviceMotionUpdates");
    WeakRetained = v4;
  }
  v3 = (void *)*((_QWORD *)WeakRetained + 64);
  *((_QWORD *)WeakRetained + 64) = 0;

}

void __56___GCAppleTVRemoteMotionProfile__motionLiteFusedHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BYTE *WeakRetained;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  _QWORD block[4];
  _BYTE *v41;

  v5 = a2;
  v6 = a3;
  if (kGlyphFlagProtocolXboxLogo_block_invoke_onceToken != -1)
    dispatch_once(&kGlyphFlagProtocolXboxLogo_block_invoke_onceToken, &__block_literal_global_45);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "machTimestamp");
    kdebug_trace();
    if (WeakRetained[496])
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v8 = objc_msgSend(v5, "isUsingCompass");
        WeakRetained[498] = v8;
        objc_msgSend(v5, "attitude");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "pitch");
        v11 = v10;
        objc_msgSend(v9, "yaw");
        v13 = v12;
        objc_msgSend(v9, "roll");
        *((_QWORD *)WeakRetained + 51) = v11;
        *((_QWORD *)WeakRetained + 52) = v13;
        *((_QWORD *)WeakRetained + 53) = v14;
        if (v8)
        {
          objc_msgSend(v5, "rotationRate");
          *((_QWORD *)WeakRetained + 57) = v15;
          *((_QWORD *)WeakRetained + 58) = v16;
          *((_QWORD *)WeakRetained + 59) = v17;
          objc_msgSend(v9, "quaternion");
          *((_QWORD *)WeakRetained + 43) = v18;
          *((_QWORD *)WeakRetained + 44) = v19;
          *((_QWORD *)WeakRetained + 45) = v20;
          *((_QWORD *)WeakRetained + 46) = v21;
        }
        objc_msgSend(v5, "gravity");
        *((_QWORD *)WeakRetained + 34) = v22;
        *((_QWORD *)WeakRetained + 35) = v23;
        *((_QWORD *)WeakRetained + 36) = v24;

      }
    }
    else
    {
      objc_msgSend(v5, "gravity");
      *((_QWORD *)WeakRetained + 34) = v25;
      *((_QWORD *)WeakRetained + 35) = v26;
      *((_QWORD *)WeakRetained + 36) = v27;
    }
    objc_msgSend(v5, "userAcceleration");
    *((_QWORD *)WeakRetained + 40) = v28;
    *((_QWORD *)WeakRetained + 41) = v29;
    *((_QWORD *)WeakRetained + 42) = v30;
    objc_msgSend(v5, "tip");
    *((_DWORD *)WeakRetained + 120) = v31;
    objc_msgSend(v5, "tilt");
    *((_DWORD *)WeakRetained + 121) = v32;
    objc_msgSend(v5, "machTimestamp");
    kdebug_trace();
    if (*((_QWORD *)WeakRetained + 63))
    {
      objc_msgSend(WeakRetained, "controller");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v34 = (void *)v33;
        objc_msgSend(WeakRetained, "controller");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handlerQueue");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(WeakRetained, "controller");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "handlerQueue");
          v38 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __56___GCAppleTVRemoteMotionProfile__motionLiteFusedHandler__block_invoke_3;
          block[3] = &unk_24D2B2B20;
          v41 = WeakRetained;
          dispatch_async(v38, block);

        }
      }
    }
    v39 = *((_QWORD *)WeakRetained + 64);
    if (v39)
      (*(void (**)(uint64_t, _BYTE *))(v39 + 16))(v39, WeakRetained);
  }

}

void __56___GCAppleTVRemoteMotionProfile__motionLiteFusedHandler__block_invoke_2()
{
  id v0;

  +[GCAnalytics instance](GCAnalytics, "instance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "onSiriMotionEnabled");

}

uint64_t __56___GCAppleTVRemoteMotionProfile__motionLiteFusedHandler__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
