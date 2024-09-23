@implementation BiometricKitEnrollProgressInfo

- (BiometricKitEnrollProgressInfo)init
{
  BiometricKitEnrollProgressInfo *v2;
  BiometricKitEnrollProgressInfo *v3;
  NSDictionary *messageDetails;
  NSDictionary *captureImage;
  NSDictionary *renderedImage;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BiometricKitEnrollProgressInfo;
  v2 = -[BiometricKitEnrollProgressInfo init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    messageDetails = v2->_messageDetails;
    v2->_messageDetails = 0;

    captureImage = v3->_captureImage;
    v3->_captureImage = 0;

    renderedImage = v3->_renderedImage;
    v3->_renderedImage = 0;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BiometricKitEnrollProgressInfo setMessageDetails:](self, "setMessageDetails:", 0);
  -[BiometricKitEnrollProgressInfo setCaptureImage:](self, "setCaptureImage:", 0);
  -[BiometricKitEnrollProgressInfo setRenderedImage:](self, "setRenderedImage:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BiometricKitEnrollProgressInfo;
  -[BiometricKitEnrollProgressInfo dealloc](&v3, sel_dealloc);
}

- (int64_t)progress
{
  return self->_progress;
}

- (void)setProgress:(int64_t)a3
{
  self->_progress = a3;
}

- (int64_t)currentPrimaryComponentID
{
  return self->_currentPrimaryComponentID;
}

- (void)setCurrentPrimaryComponentID:(int64_t)a3
{
  self->_currentPrimaryComponentID = a3;
}

- (NSDictionary)captureImage
{
  return self->_captureImage;
}

- (void)setCaptureImage:(id)a3
{
  objc_storeStrong((id *)&self->_captureImage, a3);
}

- (NSDictionary)renderedImage
{
  return self->_renderedImage;
}

- (void)setRenderedImage:(id)a3
{
  objc_storeStrong((id *)&self->_renderedImage, a3);
}

- (int)message
{
  return self->_message;
}

- (void)setMessage:(int)a3
{
  self->_message = a3;
}

- (NSDictionary)messageDetails
{
  return self->_messageDetails;
}

- (void)setMessageDetails:(id)a3
{
  objc_storeStrong((id *)&self->_messageDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDetails, 0);
  objc_storeStrong((id *)&self->_renderedImage, 0);
  objc_storeStrong((id *)&self->_captureImage, 0);
}

@end
