@implementation MX_GEOCountryConfigurationObserver

- (MX_GEOCountryConfigurationObserver)init
{
  MX_GEOCountryConfigurationObserver *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MX_GEOCountryConfigurationObserver;
  v2 = -[MX_GEOCountryConfigurationObserver init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_create("com.apple.coremedia.geocountryconfigurationobserver", v3);
    v5 = MEMORY[0x1E0C809B0];
    v2->mAccessQueue = (OS_dispatch_queue *)v4;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __42__MX_GEOCountryConfigurationObserver_init__block_invoke;
    block[3] = &unk_1E3099900;
    block[4] = v2;
    dispatch_async(v4, block);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  NSObject *mAccessQueue;
  objc_super v5;

  v3 = (void *)MEMORY[0x194035B20](self, a2);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, getGEOCountryConfigurationCountryCodeDidChangeNotification(), 0);
  mAccessQueue = self->mAccessQueue;
  if (mAccessQueue)
    dispatch_release(mAccessQueue);
  v5.receiver = self;
  v5.super_class = (Class)MX_GEOCountryConfigurationObserver;
  -[MX_GEOCountryConfigurationObserver dealloc](&v5, sel_dealloc);
  objc_autoreleasePoolPop(v3);
}

- (id)getCurrentCountryCode
{
  NSObject *mAccessQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  mAccessQueue = self->mAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__MX_GEOCountryConfigurationObserver_getCurrentCountryCode__block_invoke;
  v5[3] = &unk_1E309C368;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_async_and_wait(mAccessQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateCountryCodeFromCurrentGeoCountryConfiguration:(id)a3
{
  NSObject *mAccessQueue;
  _QWORD v4[6];

  mAccessQueue = self->mAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __91__MX_GEOCountryConfigurationObserver__updateCountryCodeFromCurrentGeoCountryConfiguration___block_invoke;
  v4[3] = &unk_1E309CCF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mAccessQueue, v4);
}

- (void)countryConfigurationDidChange:(id)a3
{
  void *v4;
  _QWORD *v5;
  void *v6;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v5 = (_QWORD *)getGEODeviceCountryCodeKeySymbolLoc_ptr;
  v11 = getGEODeviceCountryCodeKeySymbolLoc_ptr;
  if (!getGEODeviceCountryCodeKeySymbolLoc_ptr)
  {
    v6 = (void *)GeoServicesLibrary();
    v5 = dlsym(v6, "GEODeviceCountryCodeKey");
    v9[3] = (uint64_t)v5;
    getGEODeviceCountryCodeKeySymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v8, 8);
  if (!v5)
  {
    v7 = (_Unwind_Exception *)__68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  -[MX_GEOCountryConfigurationObserver _updateCountryCodeFromCurrentGeoCountryConfiguration:](self, "_updateCountryCodeFromCurrentGeoCountryConfiguration:", objc_msgSend(v4, "objectForKey:", *v5, v8));
}

@end
