@implementation HFCameraPosterFrameDelegateRequest

- (NSNumber)offsetNumber
{
  return self->_offsetNumber;
}

- (void)setOffsetNumber:(id)a3
{
  objc_storeStrong((id *)&self->_offsetNumber, a3);
}

- (HMCameraClip)highQualityClip
{
  return self->_highQualityClip;
}

- (void)setHighQualityClip:(id)a3
{
  objc_storeStrong((id *)&self->_highQualityClip, a3);
}

- (HMCameraClip)timelapseClip
{
  return self->_timelapseClip;
}

- (void)setTimelapseClip:(id)a3
{
  objc_storeStrong((id *)&self->_timelapseClip, a3);
}

- (HFCameraPosterFrameDelegate)delegate
{
  return (HFCameraPosterFrameDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timelapseClip, 0);
  objc_storeStrong((id *)&self->_highQualityClip, 0);
  objc_storeStrong((id *)&self->_offsetNumber, 0);
}

@end
