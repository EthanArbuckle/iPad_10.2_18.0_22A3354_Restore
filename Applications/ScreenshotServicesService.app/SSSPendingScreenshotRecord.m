@implementation SSSPendingScreenshotRecord

- (SSSPendingScreenshotRecord)initWithScreenshot:(id)a3 deliveryCompletionBlock:(id)a4
{
  id v5;
  id v6;
  SSSPendingScreenshotRecord *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSSPendingScreenshotRecord;
  v5 = a4;
  v6 = a3;
  v7 = -[SSSPendingScreenshotRecord init](&v9, "init");
  -[SSSPendingScreenshotRecord setScreenshot:](v7, "setScreenshot:", v6, v9.receiver, v9.super_class);

  -[SSSPendingScreenshotRecord setDeliveryCompletionBlock:](v7, "setDeliveryCompletionBlock:", v5);
  return v7;
}

- (SSSScreenshot)screenshot
{
  return self->_screenshot;
}

- (void)setScreenshot:(id)a3
{
  objc_storeStrong((id *)&self->_screenshot, a3);
}

- (id)deliveryCompletionBlock
{
  return self->_deliveryCompletionBlock;
}

- (void)setDeliveryCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deliveryCompletionBlock, 0);
  objc_storeStrong((id *)&self->_screenshot, 0);
}

@end
