@implementation NUPurgeableImageAccessGuard

- (NUPurgeableImageAccessGuard)initWithRegion:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  NUPurgeableImageAccessGuard *v8;
  uint64_t v9;
  NURegion *accessRegion;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUPurgeableImageAccessGuard;
  v8 = -[NUPurgeableImageAccessGuard init](&v12, sel_init);
  v9 = objc_msgSend(v6, "copy");
  accessRegion = v8->_accessRegion;
  v8->_accessRegion = (NURegion *)v9;

  objc_storeStrong((id *)&v8->_accessImage, a4);
  -[NUPurgeableImageAccessGuard _beginAccess](v8, "_beginAccess");

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[NUPurgeableImageAccessGuard _endAccess](self, "_endAccess");
  v3.receiver = self;
  v3.super_class = (Class)NUPurgeableImageAccessGuard;
  -[NUPurgeableImageAccessGuard dealloc](&v3, sel_dealloc);
}

- (void)_beginAccess
{
  NUPurgeableImage *v3;
  NSObject *v4;
  NURegion *accessRegion;
  int v6;
  NUPurgeableImage *v7;
  __int16 v8;
  NURegion *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = self->_accessImage;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
  v4 = _NURenderLogger;
  if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_DEBUG))
  {
    accessRegion = self->_accessRegion;
    v6 = 134218242;
    v7 = v3;
    v8 = 2114;
    v9 = accessRegion;
    _os_log_debug_impl(&dword_1A6553000, v4, OS_LOG_TYPE_DEBUG, "beginAccess %p %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[NUPurgeableImage beginAccessRegion:](v3, "beginAccessRegion:", self->_accessRegion);

}

- (void)_endAccess
{
  NUPurgeableImage *v3;
  NSObject *v4;
  NURegion *accessRegion;
  int v6;
  NUPurgeableImage *v7;
  __int16 v8;
  NURegion *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = self->_accessImage;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
  v4 = _NURenderLogger;
  if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_DEBUG))
  {
    accessRegion = self->_accessRegion;
    v6 = 134218242;
    v7 = v3;
    v8 = 2114;
    v9 = accessRegion;
    _os_log_debug_impl(&dword_1A6553000, v4, OS_LOG_TYPE_DEBUG, "endAccess %p %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[NUPurgeableImage endAccessRegion:](v3, "endAccessRegion:", self->_accessRegion);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessImage, 0);
  objc_storeStrong((id *)&self->_accessRegion, 0);
}

@end
