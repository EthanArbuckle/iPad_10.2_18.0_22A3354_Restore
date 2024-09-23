@implementation WKGeolocationProviderIOS(WebGeolocationCoreLocationUpdateListener)

- (uint64_t)geolocationAuthorizationGranted
{
  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8));
  return objc_msgSend(*(id *)(a1 + 16), "geolocationAuthorizationGranted");
}

- (_QWORD)geolocationAuthorizationGranted
{
  const void *v2;
  uint64_t v3;

  *a1 = &off_1E34CDE40;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  v3 = a1[1];
  a1[1] = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

@end
