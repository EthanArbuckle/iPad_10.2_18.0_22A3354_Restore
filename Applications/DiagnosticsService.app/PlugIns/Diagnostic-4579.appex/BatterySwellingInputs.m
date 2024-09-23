@implementation BatterySwellingInputs

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v8;

  v8 = 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("pixelMapHeight"), &off_10000C8D0, &off_10000C8E8, &v8));
  -[BatterySwellingInputs setPixelMapHeight:](self, "setPixelMapHeight:", objc_msgSend(v5, "intValue"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("pixelMapWidth"), &off_10000C8D0, &off_10000C8E8, &v8));
  -[BatterySwellingInputs setPixelMapWidth:](self, "setPixelMapWidth:", objc_msgSend(v6, "intValue"));

  return v8 == 0;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v11;

  v11 = 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("angleTolerance"), &off_10000C900, &off_10000C918, &v11));
  -[BatterySwellingInputs setAngleTolerance:](self, "setAngleTolerance:", objc_msgSend(v5, "intValue"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("samplingSetupTimeout"), &off_10000C978, &off_10000C988, &v11));
  objc_msgSend(v6, "doubleValue");
  -[BatterySwellingInputs setSamplingSetupTimeout:](self, "setSamplingSetupTimeout:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("samplingTimeout"), &off_10000C978, &off_10000C988, &v11));
  objc_msgSend(v7, "doubleValue");
  -[BatterySwellingInputs setSamplingTimeout:](self, "setSamplingTimeout:");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("flipSetupTimeout"), &off_10000C978, &off_10000C988, &v11));
  objc_msgSend(v8, "doubleValue");
  -[BatterySwellingInputs setFlipSetupTimeout:](self, "setFlipSetupTimeout:");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("numberOfFramesToCapture"), &off_10000C900, &off_10000C930, &v11));
  -[BatterySwellingInputs setNumFramesToRecord:](self, "setNumFramesToRecord:", objc_msgSend(v9, "intValue"));

  return v11 == 0;
}

- (int)pixelMapHeight
{
  return self->_pixelMapHeight;
}

- (void)setPixelMapHeight:(int)a3
{
  self->_pixelMapHeight = a3;
}

- (int)pixelMapWidth
{
  return self->_pixelMapWidth;
}

- (void)setPixelMapWidth:(int)a3
{
  self->_pixelMapWidth = a3;
}

- (int)angleTolerance
{
  return self->_angleTolerance;
}

- (void)setAngleTolerance:(int)a3
{
  self->_angleTolerance = a3;
}

- (double)samplingSetupTimeout
{
  return self->_samplingSetupTimeout;
}

- (void)setSamplingSetupTimeout:(double)a3
{
  self->_samplingSetupTimeout = a3;
}

- (double)flipSetupTimeout
{
  return self->_flipSetupTimeout;
}

- (void)setFlipSetupTimeout:(double)a3
{
  self->_flipSetupTimeout = a3;
}

- (double)samplingTimeout
{
  return self->_samplingTimeout;
}

- (void)setSamplingTimeout:(double)a3
{
  self->_samplingTimeout = a3;
}

- (int)numFramesToRecord
{
  return self->_numFramesToRecord;
}

- (void)setNumFramesToRecord:(int)a3
{
  self->_numFramesToRecord = a3;
}

@end
