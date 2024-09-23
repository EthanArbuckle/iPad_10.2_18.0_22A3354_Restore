@implementation PHAssetUserActivityProperties

- (PHAssetUserActivityProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetUserActivityProperties *v10;
  PHAssetUserActivityProperties *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDate *lastViewedDate;
  objc_super v28;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PHAssetUserActivityProperties;
  v10 = -[PHAssetUserActivityProperties init](&v28, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
      v12 = CFSTR("additionalAttributes.playCount");
    else
      v12 = CFSTR("playCount");
    if (v5)
      v13 = CFSTR("additionalAttributes.shareCount");
    else
      v13 = CFSTR("shareCount");
    if (v5)
      v14 = CFSTR("additionalAttributes.viewCount");
    else
      v14 = CFSTR("viewCount");
    if (v5)
      v15 = CFSTR("additionalAttributes.pendingPlayCount");
    else
      v15 = CFSTR("pendingPlayCount");
    if (v5)
      v16 = CFSTR("additionalAttributes.pendingShareCount");
    else
      v16 = CFSTR("pendingShareCount");
    if (v5)
      v17 = CFSTR("additionalAttributes.pendingViewCount");
    else
      v17 = CFSTR("pendingViewCount");
    if (v5)
      v18 = CFSTR("additionalAttributes.lastViewedDate");
    else
      v18 = CFSTR("lastViewedDate");
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_syncedPlayCount = objc_msgSend(v19, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_syncedShareCount = objc_msgSend(v20, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_syncedViewCount = objc_msgSend(v21, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_pendingPlayCount = objc_msgSend(v22, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_pendingShareCount = objc_msgSend(v23, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_pendingViewCount = objc_msgSend(v24, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v18);
    v25 = objc_claimAutoreleasedReturnValue();
    lastViewedDate = v11->_lastViewedDate;
    v11->_lastViewedDate = (NSDate *)v25;

  }
  return v11;
}

- (int64_t)playCount
{
  return self->_pendingPlayCount + self->_syncedPlayCount;
}

- (int64_t)shareCount
{
  return self->_pendingShareCount + self->_syncedShareCount;
}

- (int64_t)viewCount
{
  return self->_pendingViewCount + self->_syncedViewCount;
}

- (NSDate)lastViewedDate
{
  return self->_lastViewedDate;
}

- (int64_t)syncedPlayCount
{
  return self->_syncedPlayCount;
}

- (void)setSyncedPlayCount:(int64_t)a3
{
  self->_syncedPlayCount = a3;
}

- (int64_t)syncedShareCount
{
  return self->_syncedShareCount;
}

- (void)setSyncedShareCount:(int64_t)a3
{
  self->_syncedShareCount = a3;
}

- (int64_t)syncedViewCount
{
  return self->_syncedViewCount;
}

- (void)setSyncedViewCount:(int64_t)a3
{
  self->_syncedViewCount = a3;
}

- (int64_t)pendingPlayCount
{
  return self->_pendingPlayCount;
}

- (void)setPendingPlayCount:(int64_t)a3
{
  self->_pendingPlayCount = a3;
}

- (int64_t)pendingShareCount
{
  return self->_pendingShareCount;
}

- (void)setPendingShareCount:(int64_t)a3
{
  self->_pendingShareCount = a3;
}

- (int64_t)pendingViewCount
{
  return self->_pendingViewCount;
}

- (void)setPendingViewCount:(int64_t)a3
{
  self->_pendingViewCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastViewedDate, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetUserActivity");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_52;
}

void __50__PHAssetUserActivityProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("playCount");
  v3[1] = CFSTR("shareCount");
  v3[2] = CFSTR("viewCount");
  v3[3] = CFSTR("pendingPlayCount");
  v3[4] = CFSTR("pendingShareCount");
  v3[5] = CFSTR("pendingViewCount");
  v3[6] = CFSTR("lastViewedDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_52;
  propertiesToFetch_pl_once_object_52 = v1;

}

@end
