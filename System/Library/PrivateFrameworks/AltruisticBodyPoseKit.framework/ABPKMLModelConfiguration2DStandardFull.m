@implementation ABPKMLModelConfiguration2DStandardFull

- (ABPKMLModelConfiguration2DStandardFull)init
{
  ABPKMLModelConfiguration2DStandardFull *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *mlModelPath;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ABPKMLModelConfiguration2DStandardFull;
  v2 = -[ABPKMLModelConfiguration init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", kABPK2D19JointsFlickrNetworkName);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ABPKMLModelPath(v3, v4, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    mlModelPath = v2->_mlModelPath;
    v2->_mlModelPath = (NSString *)v5;

  }
  return v2;
}

- (id)compiledMLModelPath
{
  return self->_mlModelPath;
}

- (id)inputTensorNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = kABPK2D19JointsFlickrInputTensorName;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)outputTensorNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = kABPK2D19JointsFlickrOutputHeatmapsTensorName;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGSize)inputDimensions
{
  double v2;
  double v3;
  CGSize result;

  -[ABPKMLModelConfiguration2DStandardFull inputDimensionsForABPKDeviceOrientation:](self, "inputDimensionsForABPKDeviceOrientation:", 3);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)inputDimensionsForABPKDeviceOrientation:(int64_t)a3
{
  double v4;
  double v5;
  _BOOL4 IsPortrait;
  CGSize result;

  if (ABPKDeviceOrientationIsLandscape(a3))
  {
    v4 = 288.0;
    v5 = 192.0;
  }
  else
  {
    IsPortrait = ABPKDeviceOrientationIsPortrait(a3);
    if (IsPortrait)
      v5 = 288.0;
    else
      v5 = 0.0;
    v4 = 192.0;
    if (!IsPortrait)
      v4 = 0.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)configStringForABPKDeviceOrientation:(int64_t)a3
{
  __CFString **v4;
  __CFString *v5;

  if (ABPKDeviceOrientationIsLandscape(a3))
  {
    v4 = kABPK2D19JointsFlickrLandscapeConfigMode;
  }
  else
  {
    if (!ABPKDeviceOrientationIsPortrait(a3))
    {
      v5 = 0;
      return v5;
    }
    v4 = kABPK2D19JointsFlickrPortraitConfigMode;
  }
  v5 = *v4;
  return v5;
}

- (float)biasR
{
  return *(float *)&kABPK19JointsFlickrBiasR;
}

- (float)biasG
{
  return *(float *)&kABPK19JointsFlickrBiasG;
}

- (float)biasB
{
  return *(float *)&kABPK19JointsFlickrBiasB;
}

- (float)scale
{
  return *(float *)&kABPK19JointsFlickrScale;
}

- (BOOL)networkWantsBGR
{
  return kABPK19JointsFlickrNetworkTakesBGR;
}

- (BOOL)applyPreProcessing
{
  return kABPK19JointsFlickrApplyPreProcessing;
}

- (unsigned)heatMapChannels
{
  return kABPK19JointsFlickrHeatMapChannels;
}

- (unsigned)affinityMapChannels
{
  return kABPK19JointsFlickrAffinityMapChannels;
}

- (BOOL)networkEstimatesAffinityMaps
{
  return kABPK19JointsFlickrNetworkEstimatesAffinityMaps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mlModelPath, 0);
}

@end
