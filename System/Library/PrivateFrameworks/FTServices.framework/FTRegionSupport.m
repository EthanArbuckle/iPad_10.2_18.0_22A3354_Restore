@implementation FTRegionSupport

+ (id)sharedInstance
{
  if (qword_1ECF9D850 != -1)
    dispatch_once(&qword_1ECF9D850, &unk_1E4DD94D0);
  return (id)qword_1ECF9D898;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_invalidate(self->_delivery, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)FTRegionSupport;
  -[FTRegionSupport dealloc](&v4, sel_dealloc);
}

- (void)_buildMessageDeliveryIfNeeded
{
  FTMessageDelivery *v3;
  FTMessageDelivery *delivery;
  const char *v5;

  if (!self->_delivery)
  {
    v3 = objc_alloc_init(FTMessageDelivery);
    delivery = self->_delivery;
    self->_delivery = v3;

    objc_msgSend_setUserAgent_(self->_delivery, v5, (uint64_t)CFSTR("com.apple.facetime-region-query"));
  }
}

- (void)startLoading
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  FTGetRegionMetadataMessage *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  _QWORD v15[5];

  if ((objc_msgSend_isLoading(self, a2, v2) & 1) == 0 && (objc_msgSend_isLoaded(self, v4, v5) & 1) == 0)
  {
    objc_msgSend__buildMessageDeliveryIfNeeded(self, v6, v7);
    v8 = objc_alloc_init(FTGetRegionMetadataMessage);
    IMCurrentPreferredLanguage();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLanguage_(v8, v10, (uint64_t)v9);

    objc_msgSend_setTimeout_(v8, v11, v12, 600.0);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1A4CADD20;
    v15[3] = &unk_1E4DD9F88;
    v15[4] = self;
    objc_msgSend_setCompletionBlock_(v8, v13, (uint64_t)v15);
    objc_msgSend_sendMessage_(self->_delivery, v14, (uint64_t)v8);

  }
}

- (void)flushRegions
{
  NSArray *regions;
  const char *v4;
  uint64_t v5;

  regions = self->_regions;
  self->_regions = 0;

  objc_msgSend_invalidate(self->_delivery, v4, v5);
}

- (BOOL)isLoaded
{
  return self->_regions != 0;
}

- (BOOL)isLoading
{
  uint64_t v2;

  return objc_msgSend_busy(self->_delivery, a2, v2);
}

- (id)regionForID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend_regions(self, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend_regionWithID_(*(void **)(*((_QWORD *)&v17 + 1) + 8 * v13), v10, (uint64_t)v4);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          goto LABEL_11;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (NSArray)regions
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRegions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (FTMessageDelivery)delivery
{
  return (FTMessageDelivery *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelivery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delivery, 0);
  objc_storeStrong((id *)&self->_regions, 0);
}

@end
