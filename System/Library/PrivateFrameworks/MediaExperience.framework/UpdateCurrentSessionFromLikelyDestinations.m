@implementation UpdateCurrentSessionFromLikelyDestinations

void __routingSessionManager_UpdateCurrentSessionFromLikelyDestinations_block_invoke()
{
  _OWORD v0[5];
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  CFAbsoluteTimeGetCurrent();
  routingSessionManager_getConfiguration(v0);
}

void __routingSessionManager_UpdateCurrentSessionFromLikelyDestinations_block_invoke_2(uint64_t a1)
{
  const void *v2;
  double v3;
  __int128 v4;
  uint64_t v5;
  const void *v6;
  __int128 v7;
  _QWORD v8[5];
  __int128 v9;
  _QWORD v10[6];
  _QWORD v11[6];

  v2 = *(const void **)(a1 + 32);
  v3 = *(double *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 48);
  if (v2)
  {
    v7 = *(_OWORD *)(a1 + 48);
    CFRetain(*(CFTypeRef *)(a1 + 32));
    v4 = v7;
  }
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __routingSessionManager_startSessionIfNecessary_block_invoke;
  v8[3] = &__block_descriptor_56_e56_v32__0i8____CFDictionary__12__ARPPredictionContext_20C28l;
  v8[4] = v2;
  v9 = v4;
  if (v2)
    CFRetain(v2);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __routingSessionManager_findTopAvailablePredictedDestination_block_invoke;
  v11[3] = &unk_1E309ECF0;
  v11[4] = v8;
  v11[5] = v2;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __routingSessionManager_findTopAvailablePredictedDestination_block_invoke_150;
  v10[3] = &unk_1E309ED18;
  v10[4] = v8;
  v10[5] = v2;
  routingSessionManager_discoverRoutes((uint64_t)v11, (uint64_t)v10, v3);
  v6 = *(const void **)(a1 + 32);
  if (v6)
    CFRelease(v6);
}

@end
