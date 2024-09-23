@implementation HMDPendingBulkSendListener

- (HMDPendingBulkSendListener)initWithListener:(id)a3 fileType:(id)a4
{
  id v6;
  id v7;
  HMDPendingBulkSendListener *v8;
  HMDPendingBulkSendListener *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDPendingBulkSendListener;
  v8 = -[HMDPendingBulkSendListener init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listener, v6);
    objc_storeStrong((id *)&v9->_fileType, a4);
  }

  return v9;
}

- (HMDDataStreamBulkSendListener)listener
{
  return (HMDDataStreamBulkSendListener *)objc_loadWeakRetained((id *)&self->_listener);
}

- (void)setListener:(id)a3
{
  objc_storeWeak((id *)&self->_listener, a3);
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void)setFileType:(id)a3
{
  objc_storeStrong((id *)&self->_fileType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_destroyWeak((id *)&self->_listener);
}

@end
