@implementation ARDepthBasedPersonDetectionResult

- (ARDepthBasedPersonDetectionResult)initWithBoundingBox:(CGRect)a3
{
  ARDepthBasedPersonDetectionResult *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARDepthBasedPersonDetectionResult;
  result = -[ARPersonDetectionResult initWithBoundingBox:](&v4, sel_initWithBoundingBox_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_sumDepthValues = 0.0;
    result->_numberDepthPixels = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARDepthBasedPersonDetectionResult;
  result = -[ARPersonDetectionResult copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
  {
    *((_DWORD *)result + 10) = LODWORD(self->_sumDepthValues);
    *((_QWORD *)result + 6) = self->_numberDepthPixels;
    *((_QWORD *)result + 8) = self->_numberDepthPixelsWithHighConfidence;
    *((_DWORD *)result + 14) = LODWORD(self->_sumDepthValuesWithHighConfidence);
  }
  return result;
}

- (ARDepthBasedPersonDetectionResult)initWithCoder:(id)a3
{
  id v4;
  ARDepthBasedPersonDetectionResult *v5;
  float v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARDepthBasedPersonDetectionResult;
  v5 = -[ARPersonDetectionResult initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("sumDepthValues"));
    v5->_sumDepthValues = v6;
    v5->_numberDepthPixels = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numberDepthPixels"));
    v5->_numberDepthPixelsWithHighConfidence = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numberDepthPixelsWithHighConfidence"));
    v5->_sumDepthValuesWithHighConfidence = (float)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sumDepthValuesWithHighConfidence"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARDepthBasedPersonDetectionResult;
  v4 = a3;
  -[ARPersonDetectionResult encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  *(float *)&v5 = self->_sumDepthValues;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("sumDepthValues"), v5, v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_numberDepthPixels, CFSTR("numberDepthPixels"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_numberDepthPixelsWithHighConfidence, CFSTR("numberDepthPixelsWithHighConfidence"));
  objc_msgSend(v4, "encodeInteger:forKey:", (uint64_t)self->_sumDepthValuesWithHighConfidence, CFSTR("sumDepthValuesWithHighConfidence"));

}

- (unint64_t)numberOfSamples
{
  return self->_numberDepthPixels;
}

- (void)addSampleValue:(float)a3
{
  self->_sumDepthValues = self->_sumDepthValues + a3;
  ++self->_numberDepthPixels;
}

- (void)addSampleValueWithHighConfidence:(float)a3
{
  self->_sumDepthValuesWithHighConfidence = self->_sumDepthValuesWithHighConfidence + a3;
  ++self->_numberDepthPixelsWithHighConfidence;
}

- (float)meanValue
{
  int64_t numberDepthPixels;
  float numberDepthPixelsWithHighConfidence;
  float v4;

  numberDepthPixels = self->_numberDepthPixels;
  if (!numberDepthPixels)
    return NAN;
  numberDepthPixelsWithHighConfidence = (float)self->_numberDepthPixelsWithHighConfidence;
  v4 = (double)numberDepthPixels * 0.75;
  if (numberDepthPixelsWithHighConfidence <= v4)
    return self->_sumDepthValues / (float)numberDepthPixels;
  else
    return self->_sumDepthValuesWithHighConfidence / numberDepthPixelsWithHighConfidence;
}

- (double)initialBoundingBoxAvg
{
  return self->_initialBoundingBoxAvg;
}

- (void)setInitialBoundingBoxAvg:(double)a3
{
  self->_initialBoundingBoxAvg = a3;
}

@end
