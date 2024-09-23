@implementation CameraSensorInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v8;

  v8 = 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("Rear"), CFSTR("Front"), CFSTR("FrontSuperWide"), CFSTR("RearTelephoto"), CFSTR("RearSynced"), CFSTR("RearSuperWide"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:inSet:failed:", CFSTR("identifier"), v5, &v8));

  -[CameraSensorInputs setIdentifier:](self, "setIdentifier:", v6);
  LOBYTE(self) = v8 == 0;

  return (char)self;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  id v5;
  char v7;

  v7 = 0;
  v4 = a3;
  -[CameraSensorInputs setEnableMaxDataRate:](self, "setEnableMaxDataRate:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("enableMaxDataRate"), 0, &v7));
  v5 = objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("enableTestPatternPN9"), 0, &v7);

  -[CameraSensorInputs setEnableTestPatternPN9:](self, "setEnableTestPatternPN9:", v5);
  return v7 == 0;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  unsigned __int8 v15;

  v15 = 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("framesToSample"), &off_100010F58, &off_100010F70, &off_100010F88, &v15));
  -[CameraSensorInputs setFramesToSample:](self, "setFramesToSample:", objc_msgSend(v5, "intValue"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("frameSampleTimeout"), &off_100010FA0, &off_100010FB0, &off_100010FC0, &v15));
  objc_msgSend(v6, "doubleValue");
  -[CameraSensorInputs setFrameSampleTimeout:](self, "setFrameSampleTimeout:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumFrameRate")));
  v8 = v15;
  if (!v15 && v7)
  {
    v9 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      -[CameraSensorInputs setMinimumFrameRate:](self, "setMinimumFrameRate:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorInputs minimumFrameRate](self, "minimumFrameRate"));
      if ((int)objc_msgSend(v10, "intValue") <= 0)
      {

      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorInputs minimumFrameRate](self, "minimumFrameRate"));
        v12 = objc_msgSend(v11, "intValue");

        if (v12 <= 1000)
        {
          v8 = v15;
          goto LABEL_9;
        }
      }
    }
    v8 = 1;
    v15 = 1;
  }
LABEL_9:
  v13 = v8 == 0;

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)enableMaxDataRate
{
  return self->_enableMaxDataRate;
}

- (void)setEnableMaxDataRate:(BOOL)a3
{
  self->_enableMaxDataRate = a3;
}

- (BOOL)enableTestPatternPN9
{
  return self->_enableTestPatternPN9;
}

- (void)setEnableTestPatternPN9:(BOOL)a3
{
  self->_enableTestPatternPN9 = a3;
}

- (int)framesToSample
{
  return self->_framesToSample;
}

- (void)setFramesToSample:(int)a3
{
  self->_framesToSample = a3;
}

- (double)frameSampleTimeout
{
  return self->_frameSampleTimeout;
}

- (void)setFrameSampleTimeout:(double)a3
{
  self->_frameSampleTimeout = a3;
}

- (NSNumber)minimumFrameRate
{
  return self->_minimumFrameRate;
}

- (void)setMinimumFrameRate:(id)a3
{
  self->_minimumFrameRate = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
