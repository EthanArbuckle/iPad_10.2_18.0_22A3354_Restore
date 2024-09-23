@implementation HFCameraClipVideoAssetOperationMarker

+ (id)sentinelWithKey:(id)a3
{
  id v3;
  HFCameraClipVideoAssetOperationMarker *v4;

  v3 = a3;
  v4 = objc_alloc_init(HFCameraClipVideoAssetOperationMarker);
  -[HFCameraClipVideoAssetOperationMarker setKey:](v4, "setKey:", v3);

  return v4;
}

- (HFCameraClipVideoAssetOperationMarker)initWithCameraClip:(id)a3 operation:(id)a4 key:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFCameraClipVideoAssetOperationMarker *v12;
  HFCameraClipVideoAssetOperationMarker *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFCameraClipVideoAssetOperationMarker;
  v12 = -[HFCameraClipVideoAssetOperationMarker init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_key, a5);
    objc_storeStrong((id *)&v13->_clip, a3);
    objc_storeWeak((id *)&v13->_operation, v10);
  }

  return v13;
}

- (HFCameraClipVideoAssetOperationMarker)previous
{
  return (HFCameraClipVideoAssetOperationMarker *)objc_loadWeakRetained((id *)&self->_previous);
}

- (void)setPrevious:(id)a3
{
  objc_storeWeak((id *)&self->_previous, a3);
}

- (HFCameraClipVideoAssetOperationMarker)next
{
  return (HFCameraClipVideoAssetOperationMarker *)objc_loadWeakRetained((id *)&self->_next);
}

- (void)setNext:(id)a3
{
  objc_storeWeak((id *)&self->_next, a3);
}

- (HMCameraClipFetchVideoAssetContextOperation)operation
{
  return (HMCameraClipFetchVideoAssetContextOperation *)objc_loadWeakRetained((id *)&self->_operation);
}

- (void)setOperation:(id)a3
{
  objc_storeWeak((id *)&self->_operation, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (HMCameraClip)clip
{
  return self->_clip;
}

- (void)setClip:(id)a3
{
  objc_storeStrong((id *)&self->_clip, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clip, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_destroyWeak((id *)&self->_next);
  objc_destroyWeak((id *)&self->_previous);
}

@end
