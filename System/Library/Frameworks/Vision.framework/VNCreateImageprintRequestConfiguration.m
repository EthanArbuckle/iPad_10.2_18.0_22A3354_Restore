@implementation VNCreateImageprintRequestConfiguration

- (VNCreateImageprintRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNCreateImageprintRequestConfiguration *v3;
  VNCreateImageprintRequestConfiguration *v4;
  NSNumber *timeStamp;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNCreateImageprintRequestConfiguration;
  v3 = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v7, sel_initWithRequestClass_, a3);
  v4 = v3;
  if (v3)
  {
    timeStamp = v3->_timeStamp;
    v3->_timeStamp = (NSNumber *)&unk_1E459CAF0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNCreateImageprintRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setTimeStamp:", self->_timeStamp);
  return v5;
}

- (NSNumber)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStamp, 0);
}

@end
