@implementation _HMDCameraRemoteStreamTrackerAssertion

- (_HMDCameraRemoteStreamTrackerAssertion)initWithStreamTracker:(id)a3 streamIdentifier:(id)a4
{
  id v6;
  id v7;
  _HMDCameraRemoteStreamTrackerAssertion *v8;
  _HMDCameraRemoteStreamTrackerAssertion *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_HMDCameraRemoteStreamTrackerAssertion;
  v8 = -[_HMDCameraRemoteStreamTrackerAssertion init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_streamTracker, v6);
    objc_storeStrong((id *)&v9->_streamSessionID, a4);
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_streamTracker);
  objc_msgSend(WeakRetained, "stopTrackingStreamWithSessionID:", self->_streamSessionID);

  v4.receiver = self;
  v4.super_class = (Class)_HMDCameraRemoteStreamTrackerAssertion;
  -[_HMDCameraRemoteStreamTrackerAssertion dealloc](&v4, sel_dealloc);
}

- (HMDCameraRemoteStreamTracker)streamTracker
{
  return (HMDCameraRemoteStreamTracker *)objc_loadWeakRetained((id *)&self->_streamTracker);
}

- (void)setStreamTracker:(id)a3
{
  objc_storeWeak((id *)&self->_streamTracker, a3);
}

- (HMDCameraStreamSessionID)streamSessionID
{
  return (HMDCameraStreamSessionID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamSessionID, 0);
  objc_destroyWeak((id *)&self->_streamTracker);
}

@end
