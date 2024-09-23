@implementation ARSceneReconstructionOptions

- (ARSceneReconstructionOptions)init
{
  ARSceneReconstructionOptions *v2;
  ARSceneReconstructionOptions *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARSceneReconstructionOptions;
  v2 = -[ARSceneReconstructionOptions init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_voxelSize = 0;
    v2->_bucketsCount = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.sceneReconstruction.bucketsCount"));
    v3->_preset = 2;
    v3->_deterministicMode = 0;
    v3->_lowQosSchedulingEnabled = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.sceneReconstruction.enableLowQosScheduling"));
    v3->_enableOccupancyMapping = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.sceneReconstruction.enableOccupancyMapping"));
    v3->_minDepthUncertaintyThreshold = 1.0;
  }
  return v3;
}

- (void)setPreset:(int64_t)a3
{
  self->_preset = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 3) = self->_voxelSize;
  *((_QWORD *)result + 4) = self->_bucketsCount;
  *((_QWORD *)result + 2) = self->_preset;
  *((_BYTE *)result + 8) = self->_deterministicMode;
  *((_BYTE *)result + 9) = self->_lowQosSchedulingEnabled;
  *((_BYTE *)result + 10) = self->_enableOccupancyMapping;
  *((_DWORD *)result + 3) = LODWORD(self->_minDepthUncertaintyThreshold);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int v9;
  int v10;
  int v11;
  BOOL v12;
  float v14;
  float v15;
  float v16;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[ARSceneReconstructionOptions voxelSize](self, "voxelSize");
    if (v6 == objc_msgSend(v5, "voxelSize")
      && (v7 = -[ARSceneReconstructionOptions bucketsCount](self, "bucketsCount"), v7 == objc_msgSend(v5, "bucketsCount"))&& (v8 = -[ARSceneReconstructionOptions preset](self, "preset"), v8 == objc_msgSend(v5, "preset"))&& (v9 = -[ARSceneReconstructionOptions deterministicMode](self, "deterministicMode"), v9 == objc_msgSend(v5, "deterministicMode"))&& (v10 = -[ARSceneReconstructionOptions lowQosSchedulingEnabled](self, "lowQosSchedulingEnabled"), v10 == objc_msgSend(v5, "lowQosSchedulingEnabled"))&& (v11 = -[ARSceneReconstructionOptions enableOccupancyMapping](self, "enableOccupancyMapping"), v11 == objc_msgSend(v5, "enableOccupancyMapping")))
    {
      -[ARSceneReconstructionOptions minDepthUncertaintyThreshold](self, "minDepthUncertaintyThreshold");
      v15 = v14;
      objc_msgSend(v5, "minDepthUncertaintyThreshold");
      v12 = v15 == v16;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int64_t)preset
{
  return self->_preset;
}

- (int64_t)voxelSize
{
  return self->_voxelSize;
}

- (void)setVoxelSize:(int64_t)a3
{
  self->_voxelSize = a3;
}

- (int64_t)bucketsCount
{
  return self->_bucketsCount;
}

- (void)setBucketsCount:(int64_t)a3
{
  self->_bucketsCount = a3;
}

- (BOOL)deterministicMode
{
  return self->_deterministicMode;
}

- (void)setDeterministicMode:(BOOL)a3
{
  self->_deterministicMode = a3;
}

- (BOOL)lowQosSchedulingEnabled
{
  return self->_lowQosSchedulingEnabled;
}

- (void)setLowQosSchedulingEnabled:(BOOL)a3
{
  self->_lowQosSchedulingEnabled = a3;
}

- (BOOL)enableOccupancyMapping
{
  return self->_enableOccupancyMapping;
}

- (void)setEnableOccupancyMapping:(BOOL)a3
{
  self->_enableOccupancyMapping = a3;
}

- (float)minDepthUncertaintyThreshold
{
  return self->_minDepthUncertaintyThreshold;
}

- (void)setMinDepthUncertaintyThreshold:(float)a3
{
  self->_minDepthUncertaintyThreshold = a3;
}

@end
