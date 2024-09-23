@implementation ForceTouchInputs

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v10;

  v10 = 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("startingCircleRatio"), &off_10000C8E8, &off_10000C8F8, &v10));
  objc_msgSend(v5, "floatValue");
  -[ForceTouchInputs setStartingCircleRatio:](self, "setStartingCircleRatio:");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("endingCircleRatio"), &off_10000C8E8, &off_10000C8F8, &v10));
  objc_msgSend(v6, "floatValue");
  -[ForceTouchInputs setEndingCircleRatio:](self, "setEndingCircleRatio:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("gridRows"), &off_10000C928, &off_10000C940, &v10));
  -[ForceTouchInputs setGridRows:](self, "setGridRows:", objc_msgSend(v7, "intValue"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("gridColumns"), &off_10000C928, &off_10000C940, &v10));
  -[ForceTouchInputs setGridColumns:](self, "setGridColumns:", objc_msgSend(v8, "intValue"));

  return v10 == 0;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  uint64_t v5;
  NSSet *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  void *v15;
  char v17;

  v17 = 0;
  v4 = a3;
  v6 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSNumber, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:validator:", CFSTR("pressurePoints"), v7, 1000, &v17, &stru_10000C378));
  -[ForceTouchInputs setPressurePoints:](self, "setPressurePoints:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:maxLength:failed:", CFSTR("forceTouchSensitivityText"), 100, &v17));
  -[ForceTouchInputs setForceTouchSensitivityText:](self, "setForceTouchSensitivityText:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("partialInputTimeout"), &off_10000CAB0, &off_10000CAC0, &off_10000CAD0, &v17));
  objc_msgSend(v10, "doubleValue");
  -[ForceTouchInputs setPartialInputTimeout:](self, "setPartialInputTimeout:");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("noInputTimeout"), &off_10000CAB0, &off_10000CAC0, &off_10000CAD0, &v17));
  objc_msgSend(v11, "doubleValue");
  -[ForceTouchInputs setNoInputTimeout:](self, "setNoInputTimeout:");

  -[ForceTouchInputs setRandomizeCoordinates:](self, "setRandomizeCoordinates:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("randomizeCoordinates"), 0, &v17));
  -[ForceTouchInputs setHapticFeedback:](self, "setHapticFeedback:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("hapticFeedback"), 0, &v17));
  v13 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromKey:types:maxLength:defaultValue:failed:", CFSTR("testCoordinates"), v14, 18, 0, &v17));

  -[ForceTouchInputs setTestCoordinateColorsParameter:](self, "setTestCoordinateColorsParameter:", v15);
  return v17 == 0;
}

- (NSArray)testCoordinateColorsParameter
{
  return self->_testCoordinateColorsParameter;
}

- (void)setTestCoordinateColorsParameter:(id)a3
{
  objc_storeStrong((id *)&self->_testCoordinateColorsParameter, a3);
}

- (NSArray)pressurePoints
{
  return self->_pressurePoints;
}

- (void)setPressurePoints:(id)a3
{
  objc_storeStrong((id *)&self->_pressurePoints, a3);
}

- (double)noInputTimeout
{
  return self->_noInputTimeout;
}

- (void)setNoInputTimeout:(double)a3
{
  self->_noInputTimeout = a3;
}

- (double)partialInputTimeout
{
  return self->_partialInputTimeout;
}

- (void)setPartialInputTimeout:(double)a3
{
  self->_partialInputTimeout = a3;
}

- (BOOL)hapticFeedback
{
  return self->_hapticFeedback;
}

- (void)setHapticFeedback:(BOOL)a3
{
  self->_hapticFeedback = a3;
}

- (NSString)forceTouchSensitivityText
{
  return self->_forceTouchSensitivityText;
}

- (void)setForceTouchSensitivityText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (float)startingCircleRatio
{
  return self->_startingCircleRatio;
}

- (void)setStartingCircleRatio:(float)a3
{
  self->_startingCircleRatio = a3;
}

- (float)endingCircleRatio
{
  return self->_endingCircleRatio;
}

- (void)setEndingCircleRatio:(float)a3
{
  self->_endingCircleRatio = a3;
}

- (int)gridRows
{
  return self->_gridRows;
}

- (void)setGridRows:(int)a3
{
  self->_gridRows = a3;
}

- (int)gridColumns
{
  return self->_gridColumns;
}

- (void)setGridColumns:(int)a3
{
  self->_gridColumns = a3;
}

- (BOOL)randomizeCoordinates
{
  return self->_randomizeCoordinates;
}

- (void)setRandomizeCoordinates:(BOOL)a3
{
  self->_randomizeCoordinates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forceTouchSensitivityText, 0);
  objc_storeStrong((id *)&self->_pressurePoints, 0);
  objc_storeStrong((id *)&self->_testCoordinateColorsParameter, 0);
}

@end
