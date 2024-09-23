@implementation PHAssetStoryPlaybackProperties

- (PHAssetStoryPlaybackProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetStoryPlaybackProperties *v10;
  PHAssetStoryPlaybackProperties *v11;
  const __CFString *v12;
  void *v13;
  objc_super v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PHAssetStoryPlaybackProperties;
  v10 = -[PHAssetStoryPlaybackProperties init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
      v12 = CFSTR("additionalAttributes.hasPeopleSceneMidOrGreaterConfidence");
    else
      v12 = CFSTR("hasPeopleSceneMidOrGreaterConfidence");
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_hasPeopleSceneMidOrGreaterConfidence = objc_msgSend(v13, "BOOLValue");

  }
  return v11;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return self->_hasPeopleSceneMidOrGreaterConfidence;
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetStoryPlayback");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_74;
}

void __51__PHAssetStoryPlaybackProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("hasPeopleSceneMidOrGreaterConfidence");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_74;
  propertiesToFetch_pl_once_object_74 = v1;

}

@end
