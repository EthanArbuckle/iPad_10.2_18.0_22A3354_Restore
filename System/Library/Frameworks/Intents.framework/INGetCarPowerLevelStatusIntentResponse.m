@implementation INGetCarPowerLevelStatusIntentResponse

- (id)init
{
  return -[INGetCarPowerLevelStatusIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INGetCarPowerLevelStatusIntentResponse)initWithCode:(INGetCarPowerLevelStatusIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  INGetCarPowerLevelStatusIntentResponse *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  INGetCarPowerLevelStatusIntentResponseCode v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  NSUserActivity *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INGetCarPowerLevelStatusIntentResponseCodeFailureRequiringAppLaunch)
      v8 = 0;
    else
      v8 = (uint64_t)*(&off_1E228FAF0 + code);
    *(_DWORD *)buf = 136315906;
    v14 = "-[INGetCarPowerLevelStatusIntentResponse initWithCode:userActivity:]";
    v15 = 2048;
    v16 = code;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);

  }
  v12.receiver = self;
  v12.super_class = (Class)INGetCarPowerLevelStatusIntentResponse;
  v10 = -[INIntentResponse _initWithCode:userActivity:](&v12, sel__initWithCode_userActivity_, code, v6);

  return v10;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetCarPowerLevelStatusIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INGetCarPowerLevelStatusIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INGetCarPowerLevelStatusIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INGetCarPowerLevelStatusIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INGetCarPowerLevelStatusIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INGetCarPowerLevelStatusIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INGetCarPowerLevelStatusIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INGetCarPowerLevelStatusIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  INGetCarPowerLevelStatusIntentResponseCode v2;

  v2 = -[INGetCarPowerLevelStatusIntentResponse code](self, "code");
  if ((unint64_t)(v2 - 1) > 4)
    return 0;
  else
    return qword_18C312B58[v2 - 1];
}

- (int64_t)_codeWithName:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "isEqualToString:", CFSTR("INGetCarPowerLevelStatusIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INGetCarPowerLevelStatusIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INGetCarPowerLevelStatusIntentResponseCodeInProgress")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INGetCarPowerLevelStatusIntentResponseCodeSuccess")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INGetCarPowerLevelStatusIntentResponseCodeFailure")))
    v5 = 4;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INGetCarPowerLevelStatusIntentResponseCodeFailureRequiringAppLaunch"));

  if (v6)
    return 5;
  else
    return v5;
}

- (NSString)carIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "carIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (NSNumber)fuelPercentRemaining
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fuelPercentRemaining");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDouble(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSNumber)chargePercentRemaining
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chargePercentRemaining");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDouble(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSMeasurement)distanceRemaining
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distanceRemaining");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDistance(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v4;
}

- (NSNumber)charging
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasCharging"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "charging"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSNumber)minutesToFull
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minutesToFull");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromInteger(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSMeasurement)maximumDistance
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumDistance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDistance(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v4;
}

- (NSMeasurement)distanceRemainingElectric
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distanceRemainingElectric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDistance(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v4;
}

- (NSMeasurement)maximumDistanceElectric
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumDistanceElectric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDistance(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v4;
}

- (NSMeasurement)distanceRemainingFuel
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distanceRemainingFuel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDistance(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v4;
}

- (NSMeasurement)maximumDistanceFuel
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumDistanceFuel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDistance(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v4;
}

- (NSDictionary)consumptionFormulaArguments
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "consumptionFormulaArguments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromJSONDictionary(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSDictionary)chargingFormulaArguments
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chargingFormulaArguments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromJSONDictionary(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSDateComponents)dateOfLastStateUpdate
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateOfLastStateUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTime(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v4;
}

- (INCarChargingConnectorType)activeConnector
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  __CFString *v7;
  NSString *v8;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasActiveConnector");
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "activeConnector");
  if (v4 && (v6 - 2) <= 9)
    v7 = off_1E2295038[v6 - 2];
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (NSMeasurement)maximumBatteryCapacity
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumBatteryCapacity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromEnergy(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v4;
}

- (NSMeasurement)currentBatteryCapacity
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentBatteryCapacity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromEnergy(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v4;
}

- (NSMeasurement)minimumBatteryCapacity
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumBatteryCapacity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromEnergy(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v4;
}

- (void)setCarIdentifier:(NSString *)carIdentifier
{
  NSString *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = carIdentifier;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCarIdentifier:", v4);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (void)setFuelPercentRemaining:(NSNumber *)fuelPercentRemaining
{
  NSNumber *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = fuelPercentRemaining;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDouble(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFuelPercentRemaining:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setChargePercentRemaining:(NSNumber *)chargePercentRemaining
{
  NSNumber *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = chargePercentRemaining;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDouble(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setChargePercentRemaining:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setDistanceRemaining:(NSMeasurement *)distanceRemaining
{
  NSMeasurement *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = distanceRemaining;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDistance(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDistanceRemaining:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setCharging:(NSNumber *)charging
{
  void *v4;
  void *v5;
  void *v6;
  NSNumber *v7;

  v7 = charging;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setCharging:", -[NSNumber BOOLValue](v7, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasCharging:", 0);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

}

- (void)setMinutesToFull:(NSNumber *)minutesToFull
{
  NSNumber *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = minutesToFull;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToInteger(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMinutesToFull:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setMaximumDistance:(NSMeasurement *)maximumDistance
{
  NSMeasurement *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = maximumDistance;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDistance(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMaximumDistance:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setDistanceRemainingElectric:(NSMeasurement *)distanceRemainingElectric
{
  NSMeasurement *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = distanceRemainingElectric;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDistance(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDistanceRemainingElectric:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setMaximumDistanceElectric:(NSMeasurement *)maximumDistanceElectric
{
  NSMeasurement *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = maximumDistanceElectric;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDistance(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMaximumDistanceElectric:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setDistanceRemainingFuel:(NSMeasurement *)distanceRemainingFuel
{
  NSMeasurement *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = distanceRemainingFuel;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDistance(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDistanceRemainingFuel:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setMaximumDistanceFuel:(NSMeasurement *)maximumDistanceFuel
{
  NSMeasurement *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = maximumDistanceFuel;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDistance(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMaximumDistanceFuel:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setConsumptionFormulaArguments:(NSDictionary *)consumptionFormulaArguments
{
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = consumptionFormulaArguments;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToJSONDictionary((uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setConsumptionFormulaArguments:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setChargingFormulaArguments:(NSDictionary *)chargingFormulaArguments
{
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = chargingFormulaArguments;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToJSONDictionary((uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setChargingFormulaArguments:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setDateOfLastStateUpdate:(NSDateComponents *)dateOfLastStateUpdate
{
  NSDateComponents *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = dateOfLastStateUpdate;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTime(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDateOfLastStateUpdate:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setActiveConnector:(INCarChargingConnectorType)activeConnector
{
  uint64_t BackingType;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  BackingType = INCarChargingConnectorTypeGetBackingType(activeConnector);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)BackingType == 0x7FFFFFFF)
    objc_msgSend(v5, "setHasActiveConnector:", 0);
  else
    objc_msgSend(v5, "setActiveConnector:", BackingType);

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setMaximumBatteryCapacity:(NSMeasurement *)maximumBatteryCapacity
{
  NSMeasurement *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = maximumBatteryCapacity;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToEnergy(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMaximumBatteryCapacity:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setCurrentBatteryCapacity:(NSMeasurement *)currentBatteryCapacity
{
  NSMeasurement *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = currentBatteryCapacity;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToEnergy(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setCurrentBatteryCapacity:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (void)setMinimumBatteryCapacity:(NSMeasurement *)minimumBatteryCapacity
{
  NSMeasurement *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = minimumBatteryCapacity;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToEnergy(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMinimumBatteryCapacity:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (id)_dictionaryRepresentation
{
  INGetCarPowerLevelStatusIntentResponseCode v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unint64_t v68;
  void *v69;
  _QWORD v70[19];
  _QWORD v71[21];

  v71[19] = *MEMORY[0x1E0C80C00];
  v70[0] = CFSTR("code");
  v3 = -[INGetCarPowerLevelStatusIntentResponse code](self, "code");
  v68 = v3;
  if ((unint64_t)v3 <= INGetCarPowerLevelStatusIntentResponseCodeFailureRequiringAppLaunch)
  {
    v4 = (uint64_t)*(&off_1E228FAF0 + v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v4;
  v71[0] = v4;
  v70[1] = CFSTR("carIdentifier");
  -[INGetCarPowerLevelStatusIntentResponse carIdentifier](self, "carIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v55 = (void *)v5;
  v71[1] = v5;
  v70[2] = CFSTR("fuelPercentRemaining");
  -[INGetCarPowerLevelStatusIntentResponse fuelPercentRemaining](self, "fuelPercentRemaining");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v54 = (void *)v7;
  v71[2] = v7;
  v70[3] = CFSTR("chargePercentRemaining");
  -[INGetCarPowerLevelStatusIntentResponse chargePercentRemaining](self, "chargePercentRemaining");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v9;
  v71[3] = v9;
  v70[4] = CFSTR("distanceRemaining");
  -[INGetCarPowerLevelStatusIntentResponse distanceRemaining](self, "distanceRemaining");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v52 = (void *)v11;
  v71[4] = v11;
  v70[5] = CFSTR("charging");
  -[INGetCarPowerLevelStatusIntentResponse charging](self, "charging");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v13;
  v71[5] = v13;
  v70[6] = CFSTR("minutesToFull");
  -[INGetCarPowerLevelStatusIntentResponse minutesToFull](self, "minutesToFull");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v15;
  v71[6] = v15;
  v70[7] = CFSTR("maximumDistance");
  -[INGetCarPowerLevelStatusIntentResponse maximumDistance](self, "maximumDistance");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v17;
  v71[7] = v17;
  v70[8] = CFSTR("distanceRemainingElectric");
  -[INGetCarPowerLevelStatusIntentResponse distanceRemainingElectric](self, "distanceRemainingElectric");
  v19 = objc_claimAutoreleasedReturnValue();
  v61 = (void *)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v19;
  v71[8] = v19;
  v70[9] = CFSTR("maximumDistanceElectric");
  -[INGetCarPowerLevelStatusIntentResponse maximumDistanceElectric](self, "maximumDistanceElectric");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v20;
  v71[9] = v20;
  v70[10] = CFSTR("distanceRemainingFuel");
  -[INGetCarPowerLevelStatusIntentResponse distanceRemainingFuel](self, "distanceRemainingFuel");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v22;
  v71[10] = v22;
  v70[11] = CFSTR("maximumDistanceFuel");
  -[INGetCarPowerLevelStatusIntentResponse maximumDistanceFuel](self, "maximumDistanceFuel");
  v24 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v66 = v8;
  v45 = (void *)v24;
  v71[11] = v24;
  v70[12] = CFSTR("consumptionFormulaArguments");
  -[INGetCarPowerLevelStatusIntentResponse consumptionFormulaArguments](self, "consumptionFormulaArguments");
  v25 = objc_claimAutoreleasedReturnValue();
  v58 = (void *)v25;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v62 = v18;
  v44 = (void *)v25;
  v71[12] = v25;
  v70[13] = CFSTR("chargingFormulaArguments");
  -[INGetCarPowerLevelStatusIntentResponse chargingFormulaArguments](self, "chargingFormulaArguments");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v67 = v6;
  v43 = (void *)v26;
  v71[13] = v26;
  v70[14] = CFSTR("dateOfLastStateUpdate");
  -[INGetCarPowerLevelStatusIntentResponse dateOfLastStateUpdate](self, "dateOfLastStateUpdate");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v59 = v23;
  v64 = v12;
  v42 = (void *)v28;
  v71[14] = v28;
  v70[15] = CFSTR("activeConnector");
  -[INGetCarPowerLevelStatusIntentResponse activeConnector](self, "activeConnector");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v60 = v21;
  v63 = v14;
  v65 = v10;
  v41 = (void *)v30;
  v71[15] = v30;
  v70[16] = CFSTR("maximumBatteryCapacity");
  -[INGetCarPowerLevelStatusIntentResponse maximumBatteryCapacity](self, "maximumBatteryCapacity");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34 = v16;
  v71[16] = v33;
  v70[17] = CFSTR("currentBatteryCapacity");
  -[INGetCarPowerLevelStatusIntentResponse currentBatteryCapacity](self, "currentBatteryCapacity");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v71[17] = v36;
  v70[18] = CFSTR("minimumBatteryCapacity");
  -[INGetCarPowerLevelStatusIntentResponse minimumBatteryCapacity](self, "minimumBatteryCapacity");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (!v37)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v71[18] = v38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 19);
  v57 = (id)objc_claimAutoreleasedReturnValue();
  if (!v37)

  if (!v35)
  if (!v32)

  if (!v31)
  if (!v29)

  if (!v27)
  if (!v58)

  v39 = v69;
  if (!v69)
  {

    v39 = 0;
  }

  if (!v59)
  if (!v60)

  if (!v61)
  if (!v62)

  if (!v34)
  if (!v63)

  if (!v64)
  if (!v65)

  if (!v66)
  if (!v67)

  if (v68 >= 6)
  return v57;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result;

  result = 0;
  switch(a3)
  {
    case 0:
      result = 3;
      break;
    case 1:
      if (a5)
        result = 5;
      else
        result = 4;
      break;
    case 2:
      result = 2;
      break;
    case 5:
      result = 1;
      break;
    default:
      return result;
  }
  return result;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 3;
  else
    return dword_18C312B44[a3 - 1];
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  return 0x7FFFFFFF;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

@end
