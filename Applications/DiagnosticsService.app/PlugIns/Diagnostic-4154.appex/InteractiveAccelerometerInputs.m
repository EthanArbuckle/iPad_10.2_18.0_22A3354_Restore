@implementation InteractiveAccelerometerInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _UNKNOWN **v8;
  _UNKNOWN **v9;
  BOOL v10;
  char v12;

  v12 = 0;
  v4 = a3;
  -[InteractiveAccelerometerInputs setPredicates:](self, "setPredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("Accelerometer"), CFSTR("Gyro"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:inSet:failed:", CFSTR("type"), v5, &v12));

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Accelerometer")) & 1) != 0)
  {
    v7 = 0;
    v8 = &off_100010B80;
    v9 = &off_100010B70;
LABEL_5:
    -[InteractiveAccelerometerInputs setComponentSensor:](self, "setComponentSensor:", v7);
    -[InteractiveAccelerometerInputs setBoundOffsetMin:](self, "setBoundOffsetMin:", v9);
    -[InteractiveAccelerometerInputs setBoundOffsetMax:](self, "setBoundOffsetMax:", v8);
    goto LABEL_6;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Gyro")))
  {
    v8 = &off_100010BA0;
    v7 = 1;
    v9 = &off_100010B90;
    goto LABEL_5;
  }
LABEL_6:
  v10 = v12 == 0;

  return v10;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  float v18;
  BOOL v19;
  _QWORD v21[4];
  __CFString *v22;
  id v23;
  InteractiveAccelerometerInputs *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  -[InteractiveAccelerometerInputs setSpecifications:](self, "setSpecifications:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("portrait"), CFSTR("portraitUpsideDown"), CFSTR("landscapeLeft"), CFSTR("landscapeRight"), CFSTR("faceUp"), CFSTR("faceDown"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromRequiredKey:limitedToKeys:failed:", CFSTR("orientations"), v5, v28 + 3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v7, "count")));

  v9 = -[InteractiveAccelerometerInputs componentSensor](self, "componentSensor");
  v10 = CFSTR("gyroscope");
  if (!v9)
    v10 = CFSTR("accelerometer");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("zeroRangeThreshold"), CFSTR("degreesShiftRangeThreshold"), CFSTR("lowerBoundOffsetX"), CFSTR("upperBoundOffsetX"), CFSTR("lowerBoundOffsetY"), CFSTR("upperBoundOffsetY"), CFSTR("lowerBoundOffsetZ"), CFSTR("upperBoundOffsetZ"), 0));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100002F28;
  v21[3] = &unk_1000103F8;
  v13 = v11;
  v22 = v13;
  v14 = v12;
  v26 = &v27;
  v23 = v14;
  v24 = self;
  v15 = v8;
  v25 = v15;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v21);
  -[InteractiveAccelerometerInputs setComponentOrientationSpecifications:](self, "setComponentOrientationSpecifications:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("outputDataRate"), &off_100010BC0, &off_100010BD8, v28 + 3));
  -[InteractiveAccelerometerInputs setOutputDataRate:](self, "setOutputDataRate:", objc_msgSend(v16, "intValue"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("secondsToRunOrientation"), &off_100010E60, &off_100010E70, v28 + 3));
  objc_msgSend(v17, "floatValue");
  -[InteractiveAccelerometerInputs setSecondsToRunOrientation:](self, "setSecondsToRunOrientation:", v18);

  v19 = *((_BYTE *)v28 + 24) == 0;
  _Block_object_dispose(&v27, 8);

  return v19;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v12;

  v12 = 0;
  v4 = a3;
  -[InteractiveAccelerometerInputs setParameters:](self, "setParameters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerInputs componentOrientationSpecifications](self, "componentOrientationSpecifications"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:inSet:maxLength:failed:", CFSTR("orientations"), v7, 100, &v12));
  -[InteractiveAccelerometerInputs setOrientationsParameter:](self, "setOrientationsParameter:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("notStationaryTimeout"), &off_100010E60, &off_100010E70, &v12));
  objc_msgSend(v9, "doubleValue");
  -[InteractiveAccelerometerInputs setNotStationaryTimeout:](self, "setNotStationaryTimeout:");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("holdStationaryTimeout"), &off_100010E60, &off_100010E70, &v12));
  objc_msgSend(v10, "doubleValue");
  -[InteractiveAccelerometerInputs setHoldStationaryTimeout:](self, "setHoldStationaryTimeout:");

  return v12 == 0;
}

- (unint64_t)componentSensor
{
  return self->_componentSensor;
}

- (void)setComponentSensor:(unint64_t)a3
{
  self->_componentSensor = a3;
}

- (NSNumber)boundOffsetMin
{
  return self->_boundOffsetMin;
}

- (void)setBoundOffsetMin:(id)a3
{
  objc_storeStrong((id *)&self->_boundOffsetMin, a3);
}

- (NSNumber)boundOffsetMax
{
  return self->_boundOffsetMax;
}

- (void)setBoundOffsetMax:(id)a3
{
  objc_storeStrong((id *)&self->_boundOffsetMax, a3);
}

- (NSArray)orientationsParameter
{
  return self->_orientationsParameter;
}

- (void)setOrientationsParameter:(id)a3
{
  objc_storeStrong((id *)&self->_orientationsParameter, a3);
}

- (double)notStationaryTimeout
{
  return self->_notStationaryTimeout;
}

- (void)setNotStationaryTimeout:(double)a3
{
  self->_notStationaryTimeout = a3;
}

- (double)holdStationaryTimeout
{
  return self->_holdStationaryTimeout;
}

- (void)setHoldStationaryTimeout:(double)a3
{
  self->_holdStationaryTimeout = a3;
}

- (double)zeroRange
{
  return self->_zeroRange;
}

- (void)setZeroRange:(double)a3
{
  self->_zeroRange = a3;
}

- (double)degreesShiftRange
{
  return self->_degreesShiftRange;
}

- (void)setDegreesShiftRange:(double)a3
{
  self->_degreesShiftRange = a3;
}

- (NSDictionary)componentOrientationSpecifications
{
  return self->_componentOrientationSpecifications;
}

- (void)setComponentOrientationSpecifications:(id)a3
{
  objc_storeStrong((id *)&self->_componentOrientationSpecifications, a3);
}

- (int)outputDataRate
{
  return self->_outputDataRate;
}

- (void)setOutputDataRate:(int)a3
{
  self->_outputDataRate = a3;
}

- (double)secondsToRunOrientation
{
  return self->_secondsToRunOrientation;
}

- (void)setSecondsToRunOrientation:(double)a3
{
  self->_secondsToRunOrientation = a3;
}

- (NSDictionary)predicates
{
  return self->_predicates;
}

- (void)setPredicates:(id)a3
{
  objc_storeStrong((id *)&self->_predicates, a3);
}

- (NSDictionary)specifications
{
  return self->_specifications;
}

- (void)setSpecifications:(id)a3
{
  objc_storeStrong((id *)&self->_specifications, a3);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_specifications, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_componentOrientationSpecifications, 0);
  objc_storeStrong((id *)&self->_orientationsParameter, 0);
  objc_storeStrong((id *)&self->_boundOffsetMax, 0);
  objc_storeStrong((id *)&self->_boundOffsetMin, 0);
}

@end
