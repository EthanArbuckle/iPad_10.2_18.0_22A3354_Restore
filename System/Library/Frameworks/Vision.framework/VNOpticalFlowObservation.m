@implementation VNOpticalFlowObservation

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNGenerateOpticalFlowRequest");
}

- (VNImageSignature)targetImageSignature
{
  return self->_targetImageSignature;
}

- (void)setTargetImageSignature:(id)a3
{
  objc_storeStrong((id *)&self->_targetImageSignature, a3);
}

- (VNLKTOpticalFlow)opticalFlow
{
  return self->_opticalFlow;
}

- (void)setOpticalFlow:(id)a3
{
  objc_storeStrong((id *)&self->_opticalFlow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opticalFlow, 0);
  objc_storeStrong((id *)&self->_targetImageSignature, 0);
}

@end
