@implementation HMDemoCameraClip

- (HMDemoCameraClip)initWithCameraProfile:(id)a3 clipURL:(id)a4 startDate:(id)a5 duration:(double)a6 significantEvents:(id)a7
{
  return -[HMDemoCameraClip initWithClipURL:startDate:duration:significantEvents:](self, "initWithClipURL:startDate:duration:significantEvents:", a4, a5, a7, a6);
}

- (HMDemoCameraClip)initWithClipURL:(id)a3 startDate:(id)a4 duration:(double)a5 significantEvents:(id)a6
{
  id v10;
  id v11;
  id v12;
  HMCameraClipEncryptionContext *v13;
  void *v14;
  HMCameraClipEncryptionContext *v15;
  void *v16;
  HMDemoCameraClip *v17;
  uint64_t v18;
  NSURL *clipURL;
  objc_super v21;

  v10 = a3;
  v11 = a6;
  v12 = a4;
  v13 = [HMCameraClipEncryptionContext alloc];
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMCameraClipEncryptionContext initWithKey:scheme:](v13, "initWithKey:scheme:", v14, 1);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)HMDemoCameraClip;
  v17 = -[HMCameraClip initWithUniqueIdentifier:startDate:duration:targetFragmentDuration:isComplete:isDonated:quality:streamingAssetVersion:encryptionContext:videoSegments:significantEvents:](&v21, sel_initWithUniqueIdentifier_startDate_duration_targetFragmentDuration_isComplete_isDonated_quality_streamingAssetVersion_encryptionContext_videoSegments_significantEvents_, v16, v12, 1, 0, 0, CFSTR("1"), a5, 0.0, v15, MEMORY[0x1E0C9AA60], v11);

  if (v17)
  {
    v18 = objc_msgSend(v10, "copy");
    clipURL = v17->_clipURL;
    v17->_clipURL = (NSURL *)v18;

  }
  return v17;
}

- (NSURL)clipURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipURL, 0);
}

@end
