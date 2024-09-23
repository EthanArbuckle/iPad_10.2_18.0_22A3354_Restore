@implementation VNAlignFaceRectangleRequestConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNAlignFaceRectangleRequestConfiguration;
  v4 = -[VNRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setInputFaceObservations:", self->_inputFaceObservations);
  return v5;
}

- (NSArray)inputFaceObservations
{
  return self->_inputFaceObservations;
}

- (void)setInputFaceObservations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputFaceObservations, 0);
}

@end
