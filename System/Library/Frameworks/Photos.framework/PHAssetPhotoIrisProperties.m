@implementation PHAssetPhotoIrisProperties

- (PHAssetPhotoIrisProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetPhotoIrisProperties *v10;
  PHAssetPhotoIrisProperties *v11;
  int64_t v12;
  BOOL v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  int32_t v18;
  void *v19;
  int64_t v20;
  void *v21;
  int32_t v22;
  __int128 v23;
  __int128 v24;
  CMTime v26;
  objc_super v27;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PHAssetPhotoIrisProperties;
  v10 = -[PHAssetPhotoIrisProperties init](&v27, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    v12 = objc_msgSend(v9, "videoCpDurationValue");
    v13 = !v5;
    if (v5)
      v14 = CFSTR("additionalAttributes.videoCpDurationTimescale");
    else
      v14 = CFSTR("videoCpDurationTimescale");
    if (v5)
      v15 = CFSTR("additionalAttributes.videoCpDisplayValue");
    else
      v15 = CFSTR("videoCpDisplayValue");
    if (v13)
      v16 = CFSTR("videoCpDisplayTimescale");
    else
      v16 = CFSTR("additionalAttributes.videoCpDisplayTimescale");
    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");

    CMTimeMake(&v26, v20, v22);
    v23 = *(_OWORD *)&v26.value;
    *(_QWORD *)&v11->_photoIrisStillDisplayTime.flags = v26.epoch;
    *(_OWORD *)(&v11->_photoIrisVisibilityState + 2) = v23;
    CMTimeMake(&v26, v12, v18);
    v24 = *(_OWORD *)&v26.value;
    *(_QWORD *)&v11->_photoIrisVideoDuration.flags = v26.epoch;
    *(_OWORD *)((char *)&v11->_photoIrisStillDisplayTime.epoch + 4) = v24;
    v11->_photoIrisVisibilityState = objc_msgSend(v9, "videoCpVisibilityState");
  }

  return v11;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self->var3 + 4);
  retstr->var3 = *(_QWORD *)&self[1].var2;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[1].var3 + 4);
  retstr->var3 = *(_QWORD *)&self[2].var2;
  return self;
}

- (unsigned)photoIrisVisibilityState
{
  return self->_photoIrisVisibilityState;
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetPhotoIris");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_53;
}

void __47__PHAssetPhotoIrisProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("videoCpDurationTimescale");
  v3[1] = CFSTR("videoCpDisplayValue");
  v3[2] = CFSTR("videoCpDisplayTimescale");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_53;
  propertiesToFetch_pl_once_object_53 = v1;

}

@end
