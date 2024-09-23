@implementation CWFAutoJoinRetryInterval

- (id)autoJoinRetryInterval:(unint64_t)a3 count:(unint64_t)a4
{
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v7 = (void *)objc_msgSend_copy(self, a2, a3, a4, v4);
  objc_msgSend_setInterval_(v7, v8, a3, v9, v10);
  objc_msgSend_setCount_(v7, v11, a4, v12, v13);
  return v7;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB37A0], a2, (uint64_t)CFSTR("interval=%lu, count=%lu, BSSChannelsOnly=%d, maxBSSChannelAge=%lu, maxBSSChannelCount=%lu, passiveScan=%d, dwellTime=%lu, autoHotspotFallback=%d, includeAdjacent5GHzChannel=%d, alwaysIncludeRemainingNon2GHzChannels=%d"), v2, v3, self->_interval, self->_count, self->_BSSChannelsOnly, self->_maxBSSChannelAge, self->_maxBSSChannelCount, self->_passiveScan, self->_dwellTime, self->_allowAutoHotspotFallback, self->_includeAdjacent5GHzChannel, self->_alwaysIncludeRemainingNon2GHzChannels);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v5, v6, (uint64_t)CFSTR(", alwaysInclude6GHzPSCChannels=%d"), v7, v8, self->_alwaysInclude6GHzPSCChannels);
  v13 = (void *)objc_msgSend_copy(v5, v9, v10, v11, v12);

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFAutoJoinRetryInterval, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setInterval_(v11, v12, self->_interval, v13, v14);
  objc_msgSend_setCount_(v11, v15, self->_count, v16, v17);
  objc_msgSend_setBSSChannelsOnly_(v11, v18, self->_BSSChannelsOnly, v19, v20);
  objc_msgSend_setMaxBSSChannelAge_(v11, v21, self->_maxBSSChannelAge, v22, v23);
  objc_msgSend_setMaxBSSChannelCount_(v11, v24, self->_maxBSSChannelCount, v25, v26);
  objc_msgSend_setPassiveScan_(v11, v27, self->_passiveScan, v28, v29);
  objc_msgSend_setDwellTime_(v11, v30, self->_dwellTime, v31, v32);
  objc_msgSend_setAllowAutoHotspotFallback_(v11, v33, self->_allowAutoHotspotFallback, v34, v35);
  objc_msgSend_setIncludeAdjacent5GHzChannel_(v11, v36, self->_includeAdjacent5GHzChannel, v37, v38);
  objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v11, v39, self->_alwaysIncludeRemainingNon2GHzChannels, v40, v41);
  objc_msgSend_setAlwaysInclude6GHzPSCChannels_(v11, v42, self->_alwaysInclude6GHzPSCChannels, v43, v44);
  return v11;
}

- (unint64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(unint64_t)a3
{
  self->_interval = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (BOOL)BSSChannelsOnly
{
  return self->_BSSChannelsOnly;
}

- (void)setBSSChannelsOnly:(BOOL)a3
{
  self->_BSSChannelsOnly = a3;
}

- (unint64_t)maxBSSChannelCount
{
  return self->_maxBSSChannelCount;
}

- (void)setMaxBSSChannelCount:(unint64_t)a3
{
  self->_maxBSSChannelCount = a3;
}

- (unint64_t)maxBSSChannelAge
{
  return self->_maxBSSChannelAge;
}

- (void)setMaxBSSChannelAge:(unint64_t)a3
{
  self->_maxBSSChannelAge = a3;
}

- (unint64_t)dwellTime
{
  return self->_dwellTime;
}

- (void)setDwellTime:(unint64_t)a3
{
  self->_dwellTime = a3;
}

- (BOOL)passiveScan
{
  return self->_passiveScan;
}

- (void)setPassiveScan:(BOOL)a3
{
  self->_passiveScan = a3;
}

- (BOOL)allowAutoHotspotFallback
{
  return self->_allowAutoHotspotFallback;
}

- (void)setAllowAutoHotspotFallback:(BOOL)a3
{
  self->_allowAutoHotspotFallback = a3;
}

- (BOOL)includeAdjacent5GHzChannel
{
  return self->_includeAdjacent5GHzChannel;
}

- (void)setIncludeAdjacent5GHzChannel:(BOOL)a3
{
  self->_includeAdjacent5GHzChannel = a3;
}

- (BOOL)alwaysIncludeRemainingNon2GHzChannels
{
  return self->_alwaysIncludeRemainingNon2GHzChannels;
}

- (void)setAlwaysIncludeRemainingNon2GHzChannels:(BOOL)a3
{
  self->_alwaysIncludeRemainingNon2GHzChannels = a3;
}

- (BOOL)alwaysInclude6GHzPSCChannels
{
  return self->_alwaysInclude6GHzPSCChannels;
}

- (void)setAlwaysInclude6GHzPSCChannels:(BOOL)a3
{
  self->_alwaysInclude6GHzPSCChannels = a3;
}

@end
