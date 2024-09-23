@implementation AVMetadataOfflineVideoStabilizationMotionObjectInternal

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetadataOfflineVideoStabilizationMotionObjectInternal;
  -[AVMetadataOfflineVideoStabilizationMotionObjectInternal dealloc](&v3, sel_dealloc);
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
