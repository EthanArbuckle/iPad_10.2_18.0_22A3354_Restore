@implementation PHVideoResult

- (BOOL)containsValidData
{
  return self->_videoURL || self->_videoMediaItemMakerData != 0;
}

- (id)allowedInfoKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PHVideoResult_allowedInfoKeys__block_invoke;
  block[3] = &unk_1E35DF110;
  block[4] = self;
  if (allowedInfoKeys_onceToken_1595 != -1)
    dispatch_once(&allowedInfoKeys_onceToken_1595, block);
  return (id)allowedInfoKeys_allowedKeys_1596;
}

- (void)setVideoAdjustmentData:(id)a3
{
  -[PHCompositeMediaResult setInfo:forKey:](self, "setInfo:forKey:", a3, CFSTR("PHAdjustmentDataKey"));
}

- (id)videoAdjustmentData
{
  void *v2;
  void *v3;

  -[PHCompositeMediaResult info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PHAdjustmentDataKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->_videoURL, a3);
}

- (NSData)videoMediaItemMakerData
{
  return self->_videoMediaItemMakerData;
}

- (void)setVideoMediaItemMakerData:(id)a3
{
  objc_storeStrong((id *)&self->_videoMediaItemMakerData, a3);
}

- (NSString)fingerPrint
{
  return self->_fingerPrint;
}

- (void)setFingerPrint:(id)a3
{
  objc_storeStrong((id *)&self->_fingerPrint, a3);
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setUniformTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (PFSlowMotionTimeRangeMapper)timeRangeMapper
{
  return self->_timeRangeMapper;
}

- (void)setTimeRangeMapper:(id)a3
{
  objc_storeStrong((id *)&self->_timeRangeMapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRangeMapper, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_fingerPrint, 0);
  objc_storeStrong((id *)&self->_videoMediaItemMakerData, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
}

void __32__PHVideoResult_allowedInfoKeys__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E20]);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)PHVideoResult;
  objc_msgSendSuper2(&v7, sel_allowedInfoKeys);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSet:", v3);

  v8[0] = CFSTR("PHAdjustmentDataKey");
  v8[1] = CFSTR("PHImageResultTimeRangeMapperKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  v6 = (void *)allowedInfoKeys_allowedKeys_1596;
  allowedInfoKeys_allowedKeys_1596 = (uint64_t)v4;

}

@end
