@implementation VNSmartCam5CompoundRequestGroupingConfiguration

- (VNSmartCam5CompoundRequestGroupingConfiguration)initWithImageCropAndScaleOption:(unint64_t)a3
{
  VNSmartCam5CompoundRequestGroupingConfiguration *v4;
  VNSmartCam5CompoundRequestGroupingConfiguration *v5;
  NSMutableSet *v6;
  NSMutableSet *originalRequests;
  NSMutableDictionary *v8;
  NSMutableDictionary *detectorConfigurationOptions;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VNSmartCam5CompoundRequestGroupingConfiguration;
  v4 = -[VNSmartCam5CompoundRequestGroupingConfiguration init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_imageCropAndScaleOption = a3;
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    originalRequests = v5->_originalRequests;
    v5->_originalRequests = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    detectorConfigurationOptions = v5->_detectorConfigurationOptions;
    v5->_detectorConfigurationOptions = v8;

  }
  return v5;
}

- (unint64_t)imageCropAndScaleOption
{
  return self->_imageCropAndScaleOption;
}

- (void)addOriginalRequest:(id)a3
{
  -[NSMutableSet addObject:](self->_originalRequests, "addObject:", a3);
}

- (id)originalRequests
{
  return (id)-[NSMutableSet allObjects](self->_originalRequests, "allObjects");
}

- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_detectorConfigurationOptions, "setObject:forKeyedSubscript:", a4, a3);
}

- (id)detectorConfigurationOptions
{
  return (id)-[NSMutableDictionary copy](self->_detectorConfigurationOptions, "copy");
}

- (id)processingDevice
{
  void *v2;
  void *v3;

  -[NSMutableSet anyObject](self->_originalRequests, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processingDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)preferBackgroundProcessing
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_originalRequests;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "preferBackgroundProcessing", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorConfigurationOptions, 0);
  objc_storeStrong((id *)&self->_originalRequests, 0);
}

@end
