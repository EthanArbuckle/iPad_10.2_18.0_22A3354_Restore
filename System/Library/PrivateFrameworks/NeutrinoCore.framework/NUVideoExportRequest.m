@implementation NUVideoExportRequest

- (NUVideoExportRequest)initWithComposition:(id)a3
{
  id v3;
  NUVideoExportRequest *v4;
  NSDictionary *outputSettings;
  uint64_t v6;
  NUColorSpace *colorSpace;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NUVideoExportRequest;
  v3 = a3;
  v4 = -[NUExportRequest initWithComposition:](&v9, sel_initWithComposition_, v3);
  outputSettings = v4->_outputSettings;
  v4->_outputSettings = (NSDictionary *)MEMORY[0x1E0C9AA70];

  +[NUVideoUtilities defaultOutputColorSpaceForComposition:](NUVideoUtilities, "defaultOutputColorSpaceForComposition:", v3, v9.receiver, v9.super_class);
  v6 = objc_claimAutoreleasedReturnValue();

  colorSpace = v4->_colorSpace;
  v4->_colorSpace = (NUColorSpace *)v6;

  v4->_applyOrientationAsMetadata = 1;
  return v4;
}

- (id)newRenderJob
{
  return -[NUVideoExportJob initWithVideoExportRequest:]([NUVideoExportJob alloc], "initWithVideoExportRequest:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUVideoExportRequest;
  v4 = -[NUExportRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 22, self->_outputSettings);
    objc_storeStrong(v5 + 23, self->_colorSpace);
    objc_storeStrong(v5 + 24, self->_metadata);
    *((_BYTE *)v5 + 168) = self->_bypassOutputSettingsIfNoComposition;
    *((_BYTE *)v5 + 170) = self->_applyOrientationAsMetadata;
    *((_BYTE *)v5 + 171) = self->_includeCinematicVideoTracks;
    *((_BYTE *)v5 + 172) = self->_computeDigest;
  }
  return v5;
}

- (int64_t)mediaComponentType
{
  return 2;
}

- (void)submitWithProgress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__NUVideoExportRequest_submitWithProgress_completion___block_invoke;
  v8[3] = &unk_1E5061728;
  v9 = v6;
  v7 = v6;
  -[NURenderRequest submitGenericConfiguringRequest:completion:](self, "submitGenericConfiguringRequest:completion:", v8, a4);

}

- (NSDictionary)outputSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setOutputSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (NSArray)metadata
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 200, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (BOOL)bypassOutputSettingsIfNoComposition
{
  return self->_bypassOutputSettingsIfNoComposition;
}

- (void)setBypassOutputSettingsIfNoComposition:(BOOL)a3
{
  self->_bypassOutputSettingsIfNoComposition = a3;
}

- (BOOL)requireHardwareEncoder
{
  return self->_requireHardwareEncoder;
}

- (void)setRequireHardwareEncoder:(BOOL)a3
{
  self->_requireHardwareEncoder = a3;
}

- (BOOL)applyOrientationAsMetadata
{
  return self->_applyOrientationAsMetadata;
}

- (void)setApplyOrientationAsMetadata:(BOOL)a3
{
  self->_applyOrientationAsMetadata = a3;
}

- (BOOL)includeCinematicVideoTracks
{
  return self->_includeCinematicVideoTracks;
}

- (void)setIncludeCinematicVideoTracks:(BOOL)a3
{
  self->_includeCinematicVideoTracks = a3;
}

- (BOOL)computeDigest
{
  return self->_computeDigest;
}

- (void)setComputeDigest:(BOOL)a3
{
  self->_computeDigest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_outputSettings, 0);
}

uint64_t __54__NUVideoExportRequest_submitWithProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setProgress:", *(_QWORD *)(a1 + 32));
}

@end
