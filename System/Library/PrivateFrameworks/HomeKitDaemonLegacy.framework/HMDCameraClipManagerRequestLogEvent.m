@implementation HMDCameraClipManagerRequestLogEvent

- (HMDCameraClipManagerRequestLogEvent)initWithRequestName:(id)a3 homeUUID:(id)a4
{
  id v7;
  HMDCameraClipManagerRequestLogEvent *v8;
  HMDCameraClipManagerRequestLogEvent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCameraClipManagerRequestLogEvent;
  v8 = -[HMMHomeLogEvent initWithHomeUUID:](&v11, sel_initWithHomeUUID_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_requestName, a3);

  return v9;
}

- (NSString)requestName
{
  return self->_requestName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestName, 0);
}

@end
