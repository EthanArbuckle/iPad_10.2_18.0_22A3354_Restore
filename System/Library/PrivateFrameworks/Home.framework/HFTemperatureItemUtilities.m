@implementation HFTemperatureItemUtilities

+ (id)targetHeatingCoolingModeValueInResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8AC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8AB8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "responseForCharacteristicType:inService:", *MEMORY[0x1E0CB8790], v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "valueWithExpectedClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = 0;
      if (v10 && v12)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "_heatingCoolingValueForTargetHeaterCoolerState:isActive:", objc_msgSend(v10, "integerValue"), objc_msgSend(v12, "BOOLValue")));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

+ (id)currentHeatingCoolingModeValueInResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8848]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8840]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "responseForCharacteristicType:inService:", *MEMORY[0x1E0CB8790], v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "valueWithExpectedClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = 0;
      if (v10 && v12)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "_heatingCoolingValueForCurrentHeaterCoolerState:isActive:", objc_msgSend(v10, "integerValue"), objc_msgSend(v12, "BOOLValue")));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

+ (id)targetTemperatureValueInResponse:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(a1, "currentHeatingCoolingModeValueInResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "targetHeatingCoolingModeValueInResponse:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = +[HFTargetRangeUtilities rangeModeForHeatingCoolingMode:](HFTargetRangeUtilities, "rangeModeForHeatingCoolingMode:", objc_msgSend(v5, "integerValue"));
    v10 = +[HFTargetRangeUtilities rangeModeForHeatingCoolingMode:](HFTargetRangeUtilities, "rangeModeForHeatingCoolingMode:", objc_msgSend(v7, "integerValue"));
    objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB88D8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8828]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8B08]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFTargetRangeUtilities targetValueWithTargetMode:currentMode:rawTargetResponse:minimumThresholdResponse:maximumThresholdResponse:](HFTargetRangeUtilities, "targetValueWithTargetMode:currentMode:rawTargetResponse:minimumThresholdResponse:maximumThresholdResponse:", v10, v9, v13, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (int64_t)_heatingCoolingValueForTargetHeaterCoolerState:(int64_t)a3 isActive:(BOOL)a4
{
  int64_t result;

  result = 0;
  if ((unint64_t)a3 <= 2 && a4)
    return qword_1DD669A98[a3];
  return result;
}

+ (int64_t)_heatingCoolingValueForCurrentHeaterCoolerState:(int64_t)a3 isActive:(BOOL)a4
{
  int64_t v4;

  v4 = a3 == 2;
  if (a3 == 3)
    v4 = 2;
  if (a4)
    return v4;
  else
    return 0;
}

+ (id)integerTemperatureRangeWithinNumberRange:(id)a3 representsCelsius:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "minValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  if (v4)
  {
    v8 = ceil(v7);

    objc_msgSend(v5, "maxValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "doubleValue");
    v11 = floor(v10);

  }
  else
  {
    v12 = ceil(v7 * 9.0 / 5.0 + 32.0);

    v8 = (v12 + -32.0) * 5.0 / 9.0;
    objc_msgSend(v5, "maxValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "doubleValue");
    v15 = floor(v14 * 9.0 / 5.0 + 32.0);

    v11 = (v15 + -32.0) * 5.0 / 9.0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNumberRange rangeWithMaxValue:minValue:](HFNumberRange, "rangeWithMaxValue:minValue:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
