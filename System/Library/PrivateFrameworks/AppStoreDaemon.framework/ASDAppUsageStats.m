@implementation ASDAppUsageStats

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;

  v5 = objc_opt_new();
  v6 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_clipBundleID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_clipLaunchReason, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSURL copyWithZone:](self->_clipFullURL, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = -[NSString copyWithZone:](self->_clipReferrerBundleID, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v16;

  v18 = -[NSString copyWithZone:](self->_clipReferrerURL, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v18;

  v20 = -[NSString copyWithZone:](self->_clipWebAppBundleID, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v20;

  v22 = -[NSString copyWithZone:](self->_containingBundleID, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v22;

  v24 = -[NSDate copyWithZone:](self->_endDate, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v24;

  v26 = -[NSNumber copyWithZone:](self->_evid, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v26;

  *(_BYTE *)(v5 + 8) = self->_isClip;
  *(_BYTE *)(v5 + 9) = self->_isClipLaunch;
  *(_BYTE *)(v5 + 10) = self->_isExtensionUsage;
  v28 = -[NSNumber copyWithZone:](self->_itemID, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v28;

  v30 = -[NSString copyWithZone:](self->_itemName, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v30;

  v32 = -[NSString copyWithZone:](self->_launchReason, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v32;

  v34 = -[NSString copyWithZone:](self->_sourceStream, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v34;

  v36 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v36;

  *(_OWORD *)(v5 + 160) = *(_OWORD *)&self->_usageTime;
  return (id)v5;
}

- (id)description
{
  void *v3;
  NSString *bundleID;
  NSString *containingBundleID;
  id v6;
  _BOOL4 v7;
  void *v8;
  NSString *v9;
  _BOOL8 isClipLaunch;
  _BOOL8 isClip;
  int64_t usageTime;
  void *v13;
  void *v14;
  int64_t usageCount;

  if (self->_isExtensionUsage)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    bundleID = self->_bundleID;
    containingBundleID = self->_containingBundleID;
    -[ASDAppUsageStats _formatTimeInternal:]((uint64_t)self, self->_usageTime);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<id: %@ isExtension: Y containingBundleID: %@ usage: %@>"), bundleID, containingBundleID, v6);
LABEL_8:
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v7 = -[ASDAppUsageStats isClip](self, "isClip");
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = self->_bundleID;
  if (!v7)
  {
    usageCount = self->_usageCount;
    -[ASDAppUsageStats _formatTimeInternal:]((uint64_t)self, self->_usageTime);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<id: %@ count: %lu usage: %@>"), v9, usageCount, v6);
    goto LABEL_8;
  }
  isClipLaunch = self->_isClipLaunch;
  isClip = self->_isClip;
  usageTime = self->_usageTime;
  -[ASDAppUsageStats startDate](self, "startDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (qword_1ECFFAA00 != -1)
    dispatch_once(&qword_1ECFFAA00, &__block_literal_global_6);
  objc_msgSend((id)_MergedGlobals_29, "stringFromDate:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithFormat:", CFSTR("{ id: %@ launch: %d clip: %d usage: %ld startDate: %@ }"), v9, isClipLaunch, isClip, usageTime, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v14;
}

- (id)_formatTimeInternal:(uint64_t)a1
{
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v3 = a2 % 60;
    if (a2 / 60 % 60 >= 10)
      v4 = &stru_1E37C1320;
    else
      v4 = CFSTR("0");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu"), v4, a2 / 60 % 60);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)v3 >= 10)
      v6 = &stru_1E37C1320;
    else
      v6 = CFSTR("0");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu"), v6, v3 % 0x3C);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu:%@:%@"), a2 / 3600, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

void __37__ASDAppUsageStats__formatShortDate___block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_29;
  _MergedGlobals_29 = (uint64_t)v0;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend((id)_MergedGlobals_29, "setLocale:", v2);
  objc_msgSend((id)_MergedGlobals_29, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)clipBundleID
{
  return self->_clipBundleID;
}

- (void)setClipBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)clipFullURL
{
  return self->_clipFullURL;
}

- (void)setClipFullURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)clipLaunchReason
{
  return self->_clipLaunchReason;
}

- (void)setClipLaunchReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)clipReferrerURL
{
  return self->_clipReferrerURL;
}

- (void)setClipReferrerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)clipReferrerBundleID
{
  return self->_clipReferrerBundleID;
}

- (void)setClipReferrerBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)clipWebAppBundleID
{
  return self->_clipWebAppBundleID;
}

- (void)setClipWebAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)containingBundleID
{
  return self->_containingBundleID;
}

- (void)setContainingBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)eventTime
{
  return self->_eventTime;
}

- (void)setEventTime:(int64_t)a3
{
  self->_eventTime = a3;
}

- (NSNumber)evid
{
  return self->_evid;
}

- (void)setEvid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isClip
{
  return self->_isClip;
}

- (void)setIsClip:(BOOL)a3
{
  self->_isClip = a3;
}

- (BOOL)isClipLaunch
{
  return self->_isClipLaunch;
}

- (void)setIsClipLaunch:(BOOL)a3
{
  self->_isClipLaunch = a3;
}

- (BOOL)isExtensionUsage
{
  return self->_isExtensionUsage;
}

- (void)setIsExtensionUsage:(BOOL)a3
{
  self->_isExtensionUsage = a3;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDate)lastEventEndDate
{
  return self->_lastEventEndDate;
}

- (void)setLastEventEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)sourceStream
{
  return self->_sourceStream;
}

- (void)setSourceStream:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (int64_t)usageTime
{
  return self->_usageTime;
}

- (void)setUsageTime:(int64_t)a3
{
  self->_usageTime = a3;
}

- (int64_t)usageCount
{
  return self->_usageCount;
}

- (void)setUsageCount:(int64_t)a3
{
  self->_usageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_sourceStream, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_lastEventEndDate, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_evid, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_containingBundleID, 0);
  objc_storeStrong((id *)&self->_clipWebAppBundleID, 0);
  objc_storeStrong((id *)&self->_clipReferrerBundleID, 0);
  objc_storeStrong((id *)&self->_clipReferrerURL, 0);
  objc_storeStrong((id *)&self->_clipLaunchReason, 0);
  objc_storeStrong((id *)&self->_clipFullURL, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
