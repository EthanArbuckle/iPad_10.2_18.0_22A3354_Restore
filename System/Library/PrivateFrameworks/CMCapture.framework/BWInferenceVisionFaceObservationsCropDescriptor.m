@implementation BWInferenceVisionFaceObservationsCropDescriptor

- (BWInferenceVisionFaceObservationsCropDescriptor)initWithFaceIndex:(unint64_t)a3
{
  BWInferenceVisionFaceObservationsCropDescriptor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWInferenceVisionFaceObservationsCropDescriptor;
  result = -[BWInferenceVisionFaceObservationsCropDescriptor init](&v5, sel_init);
  if (result)
    result->_faceIndex = a3;
  return result;
}

- (char)identifier
{
  return LOBYTE(self->_faceIndex) + 3;
}

- (CGRect)rectForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend((id)objc_msgSend((id)BWInferenceGetAttachedInference(a3, 802, 0x1E4951058), "objectAtIndexedSubscript:", self->_faceIndex), "boundingBox");
  v7 = 1.0 - (v6 + v5);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v3;
  return result;
}

- (BOOL)applicableToSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaKey:(id)a4
{
  return objc_msgSend((id)BWInferenceGetAttachedInference(a3, 802, 0x1E4951058), "count") > self->_faceIndex;
}

- ($2825F4736939C4A6D3AD43837233062D)maxCropForDimensions:(id)a3
{
  return a3;
}

@end
