@implementation HMDCameraClipUploadVideoSegmentOperation

+ (unint64_t)cameraClipOperationType
{
  return 4;
}

+ (id)streamingAssetPropertyName
{
  return CFSTR("videoStreamingAsset");
}

+ (id)metadataPropertyName
{
  return CFSTR("videoMetadataArray");
}

+ (BOOL)shouldRetry
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_30652 != -1)
    dispatch_once(&logCategory__hmf_once_t0_30652, &__block_literal_global_30653);
  return (id)logCategory__hmf_once_v1_30654;
}

void __55__HMDCameraClipUploadVideoSegmentOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_30654;
  logCategory__hmf_once_v1_30654 = v0;

}

@end
