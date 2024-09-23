@implementation FigRouteDiscovererCreate

void __FigRouteDiscovererCreate_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  const void *v19;
  const void *v20;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  FigRouteDiscoveryManagerAddDiscoverer(*(_QWORD *)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 40) + 40));
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_msgSend(*(id *)(a1 + 48), "stringValue");
  v4 = *(int *)(*(_QWORD *)(a1 + 40) + 40);
  if (v4 > 8)
    v5 = 0;
  else
    v5 = off_1E309C828[v4];
  v6 = FigCFEqual();
  v7 = CFSTR("YES");
  if (!v6)
    v7 = CFSTR("NO");
  v8 = objc_msgSend(v2, "stringWithFormat:", CFSTR("%@+%@+%@"), v3, v5, v7);
  v9 = FigRouteDiscoveryManagerCopyCachedAudioSessionRouteInformation();
  v10 = (void *)objc_msgSend(v9, "objectForKey:", v8);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if (v10)
  {
    v11 = v10;
    v12 = (id)objc_msgSend(v10, "objectForKey:", CFSTR("FigRouteDiscoverer_Endpoints_Key"));
    v27[3] = (uint64_t)v12;
    v13 = (id)objc_msgSend(v11, "objectForKey:", CFSTR("FigRouteDiscoverer_RouteDescriptors_Key"));
    v23[3] = (uint64_t)v13;
  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __FigRouteDiscovererCreate_block_invoke_2;
    v21[3] = &unk_1E309C7E0;
    v14 = *(_QWORD *)(a1 + 40);
    v21[5] = &v22;
    v21[6] = v14;
    v21[4] = &v26;
    if (MX_FeatureFlags_IsReduceRouteDiscoveryQueueHoppingEnabled())
      FigRouteDiscoveryManagerRunBlockOnSerialQueueIfOnEmbeddedPlatforms((uint64_t)v21);
    else
      __FigRouteDiscovererCreate_block_invoke_2(v21);
  }
  MEMORY[0x1940352BC](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));

  v15 = (id)v27[3];
  v16 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(v16 + 88) = v15;

  v17 = (id)v23[3];
  v18 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(v18 + 80) = v17;
  MEMORY[0x1940352C8](*(_QWORD *)(v18 + 64));

  v19 = (const void *)v27[3];
  if (v19)
    CFRelease(v19);
  v20 = (const void *)v23[3];
  if (v20)
    CFRelease(v20);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

const __CFArray *__FigRouteDiscovererCreate_block_invoke_2(_QWORD *a1)
{
  const __CFArray *result;

  FigRouteDiscoveryManagerCopyRoutesForTypeAndAudioSessionID(*MEMORY[0x1E0C9AE00], *(_DWORD *)(a1[6] + 40), *(_DWORD *)(a1[6] + 8), *(_QWORD *)(a1[6] + 24), (CFMutableArrayRef *)(*(_QWORD *)(a1[4] + 8) + 24));
  result = FigRouteDiscoveryManagerCopyRouteDescriptorsFromEndpointsAndAudioSessionID(*(const __CFArray **)(*(_QWORD *)(a1[4] + 8) + 24), *(unsigned int *)(a1[6] + 8));
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

@end
