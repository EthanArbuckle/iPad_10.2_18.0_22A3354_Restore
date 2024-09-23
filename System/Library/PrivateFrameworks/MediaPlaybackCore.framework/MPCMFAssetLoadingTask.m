@implementation MPCMFAssetLoadingTask

- (BOOL)isCancelled
{
  return -[MFAssetLoadingTask isCancelled](self->_mfTask, "isCancelled");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mfTask, 0);
}

+ (id)wrap:(id)a3
{
  id v4;
  MPCMFAssetLoadingTask *v5;
  MPCMFAssetLoadingTask *v6;

  v4 = a3;
  v5 = objc_alloc_init(MPCMFAssetLoadingTask);
  v6 = v5;
  if (v5)
    objc_storeStrong((id *)&v5->_mfTask, a3);

  return v6;
}

@end
