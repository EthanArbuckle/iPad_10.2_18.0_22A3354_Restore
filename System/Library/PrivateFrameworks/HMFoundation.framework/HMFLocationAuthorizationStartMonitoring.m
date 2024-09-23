@implementation HMFLocationAuthorizationStartMonitoring

void ____HMFLocationAuthorizationStartMonitoring_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 72))
  {
    v3 = objc_msgSend(objc_alloc((Class)getCLLocationManagerClass()), "initWithEffectiveBundleIdentifier:delegate:onQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v5 = *(_QWORD *)(v2 + 80);
    v6 = objc_alloc((Class)getCLLocationManagerClass());
    v7 = *(_QWORD *)(a1 + 32);
    if (v5)
      v3 = objc_msgSend(v6, "initWithEffectiveBundlePath:delegate:onQueue:", *(_QWORD *)(v7 + 80), v7, *(_QWORD *)(v7 + 64));
    else
      v3 = objc_msgSend(v6, "_initWithDelegate:onQueue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(v7 + 64));
    v4 = *(_QWORD *)(a1 + 32);
  }
  v8 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v3;

}

@end
