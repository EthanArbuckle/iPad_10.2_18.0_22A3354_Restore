@implementation _INPBGetCarPowerLevelStatusIntentResponse

- (void)setActiveConnector:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_activeConnector = a3;
  }
}

- (BOOL)hasActiveConnector
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasActiveConnector:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)activeConnectorAsString:(int)a3
{
  if ((a3 - 2) < 0xA)
    return off_1E228ADA0[a3 - 2];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActiveConnector:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("J1772")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("C_C_S1")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("C_C_S2")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHAdeMO")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("G_B_T_A_C")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("G_B_T_D_C")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Tesla")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mennekes")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("N_A_C_S_D_C")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("N_A_C_S_A_C")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (void)setCarIdentifier:(id)a3
{
  NSString *v4;
  NSString *carIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  carIdentifier = self->_carIdentifier;
  self->_carIdentifier = v4;

}

- (BOOL)hasCarIdentifier
{
  return self->_carIdentifier != 0;
}

- (void)setChargePercentRemaining:(id)a3
{
  objc_storeStrong((id *)&self->_chargePercentRemaining, a3);
}

- (BOOL)hasChargePercentRemaining
{
  return self->_chargePercentRemaining != 0;
}

- (void)setCharging:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_charging = a3;
}

- (BOOL)hasCharging
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCharging:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setChargingFormulaArguments:(id)a3
{
  objc_storeStrong((id *)&self->_chargingFormulaArguments, a3);
}

- (BOOL)hasChargingFormulaArguments
{
  return self->_chargingFormulaArguments != 0;
}

- (void)setConsumptionFormulaArguments:(id)a3
{
  objc_storeStrong((id *)&self->_consumptionFormulaArguments, a3);
}

- (BOOL)hasConsumptionFormulaArguments
{
  return self->_consumptionFormulaArguments != 0;
}

- (void)setCurrentBatteryCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_currentBatteryCapacity, a3);
}

- (BOOL)hasCurrentBatteryCapacity
{
  return self->_currentBatteryCapacity != 0;
}

- (void)setDateOfLastStateUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfLastStateUpdate, a3);
}

- (BOOL)hasDateOfLastStateUpdate
{
  return self->_dateOfLastStateUpdate != 0;
}

- (void)setDistanceRemaining:(id)a3
{
  objc_storeStrong((id *)&self->_distanceRemaining, a3);
}

- (BOOL)hasDistanceRemaining
{
  return self->_distanceRemaining != 0;
}

- (void)setDistanceRemainingElectric:(id)a3
{
  objc_storeStrong((id *)&self->_distanceRemainingElectric, a3);
}

- (BOOL)hasDistanceRemainingElectric
{
  return self->_distanceRemainingElectric != 0;
}

- (void)setDistanceRemainingFuel:(id)a3
{
  objc_storeStrong((id *)&self->_distanceRemainingFuel, a3);
}

- (BOOL)hasDistanceRemainingFuel
{
  return self->_distanceRemainingFuel != 0;
}

- (void)setFuelPercentRemaining:(id)a3
{
  objc_storeStrong((id *)&self->_fuelPercentRemaining, a3);
}

- (BOOL)hasFuelPercentRemaining
{
  return self->_fuelPercentRemaining != 0;
}

- (void)setMaximumBatteryCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_maximumBatteryCapacity, a3);
}

- (BOOL)hasMaximumBatteryCapacity
{
  return self->_maximumBatteryCapacity != 0;
}

- (void)setMaximumDistance:(id)a3
{
  objc_storeStrong((id *)&self->_maximumDistance, a3);
}

- (BOOL)hasMaximumDistance
{
  return self->_maximumDistance != 0;
}

- (void)setMaximumDistanceElectric:(id)a3
{
  objc_storeStrong((id *)&self->_maximumDistanceElectric, a3);
}

- (BOOL)hasMaximumDistanceElectric
{
  return self->_maximumDistanceElectric != 0;
}

- (void)setMaximumDistanceFuel:(id)a3
{
  objc_storeStrong((id *)&self->_maximumDistanceFuel, a3);
}

- (BOOL)hasMaximumDistanceFuel
{
  return self->_maximumDistanceFuel != 0;
}

- (void)setMinimumBatteryCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_minimumBatteryCapacity, a3);
}

- (BOOL)hasMinimumBatteryCapacity
{
  return self->_minimumBatteryCapacity != 0;
}

- (void)setMinutesToFull:(id)a3
{
  objc_storeStrong((id *)&self->_minutesToFull, a3);
}

- (BOOL)hasMinutesToFull
{
  return self->_minutesToFull != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetCarPowerLevelStatusIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  if (-[_INPBGetCarPowerLevelStatusIntentResponse hasActiveConnector](self, "hasActiveConnector"))
    PBDataWriterWriteInt32Field();
  -[_INPBGetCarPowerLevelStatusIntentResponse carIdentifier](self, "carIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBGetCarPowerLevelStatusIntentResponse chargePercentRemaining](self, "chargePercentRemaining");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse chargePercentRemaining](self, "chargePercentRemaining");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBGetCarPowerLevelStatusIntentResponse hasCharging](self, "hasCharging"))
    PBDataWriterWriteBOOLField();
  -[_INPBGetCarPowerLevelStatusIntentResponse chargingFormulaArguments](self, "chargingFormulaArguments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse chargingFormulaArguments](self, "chargingFormulaArguments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse consumptionFormulaArguments](self, "consumptionFormulaArguments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse consumptionFormulaArguments](self, "consumptionFormulaArguments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse currentBatteryCapacity](self, "currentBatteryCapacity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse currentBatteryCapacity](self, "currentBatteryCapacity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse dateOfLastStateUpdate](self, "dateOfLastStateUpdate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse dateOfLastStateUpdate](self, "dateOfLastStateUpdate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemaining](self, "distanceRemaining");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemaining](self, "distanceRemaining");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemainingElectric](self, "distanceRemainingElectric");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemainingElectric](self, "distanceRemainingElectric");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemainingFuel](self, "distanceRemainingFuel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemainingFuel](self, "distanceRemainingFuel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse fuelPercentRemaining](self, "fuelPercentRemaining");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse fuelPercentRemaining](self, "fuelPercentRemaining");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse maximumBatteryCapacity](self, "maximumBatteryCapacity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse maximumBatteryCapacity](self, "maximumBatteryCapacity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistance](self, "maximumDistance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistance](self, "maximumDistance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistanceElectric](self, "maximumDistanceElectric");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistanceElectric](self, "maximumDistanceElectric");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistanceFuel](self, "maximumDistanceFuel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistanceFuel](self, "maximumDistanceFuel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse minimumBatteryCapacity](self, "minimumBatteryCapacity");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse minimumBatteryCapacity](self, "minimumBatteryCapacity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse minutesToFull](self, "minutesToFull");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v36;
  if (v33)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse minutesToFull](self, "minutesToFull");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v34 = v36;
  }

}

- (_INPBGetCarPowerLevelStatusIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBGetCarPowerLevelStatusIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBGetCarPowerLevelStatusIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBGetCarPowerLevelStatusIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBGetCarPowerLevelStatusIntentResponse initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBGetCarPowerLevelStatusIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBGetCarPowerLevelStatusIntentResponse *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = -[_INPBGetCarPowerLevelStatusIntentResponse init](+[_INPBGetCarPowerLevelStatusIntentResponse allocWithZone:](_INPBGetCarPowerLevelStatusIntentResponse, "allocWithZone:"), "init");
  if (-[_INPBGetCarPowerLevelStatusIntentResponse hasActiveConnector](self, "hasActiveConnector"))
    -[_INPBGetCarPowerLevelStatusIntentResponse setActiveConnector:](v5, "setActiveConnector:", -[_INPBGetCarPowerLevelStatusIntentResponse activeConnector](self, "activeConnector"));
  v6 = (void *)-[NSString copyWithZone:](self->_carIdentifier, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setCarIdentifier:](v5, "setCarIdentifier:", v6);

  v7 = -[_INPBDouble copyWithZone:](self->_chargePercentRemaining, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setChargePercentRemaining:](v5, "setChargePercentRemaining:", v7);

  if (-[_INPBGetCarPowerLevelStatusIntentResponse hasCharging](self, "hasCharging"))
    -[_INPBGetCarPowerLevelStatusIntentResponse setCharging:](v5, "setCharging:", -[_INPBGetCarPowerLevelStatusIntentResponse charging](self, "charging"));
  v8 = -[_INPBJSONDictionary copyWithZone:](self->_chargingFormulaArguments, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setChargingFormulaArguments:](v5, "setChargingFormulaArguments:", v8);

  v9 = -[_INPBJSONDictionary copyWithZone:](self->_consumptionFormulaArguments, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setConsumptionFormulaArguments:](v5, "setConsumptionFormulaArguments:", v9);

  v10 = -[_INPBEnergy copyWithZone:](self->_currentBatteryCapacity, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setCurrentBatteryCapacity:](v5, "setCurrentBatteryCapacity:", v10);

  v11 = -[_INPBDateTime copyWithZone:](self->_dateOfLastStateUpdate, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setDateOfLastStateUpdate:](v5, "setDateOfLastStateUpdate:", v11);

  v12 = -[_INPBDistance copyWithZone:](self->_distanceRemaining, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setDistanceRemaining:](v5, "setDistanceRemaining:", v12);

  v13 = -[_INPBDistance copyWithZone:](self->_distanceRemainingElectric, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setDistanceRemainingElectric:](v5, "setDistanceRemainingElectric:", v13);

  v14 = -[_INPBDistance copyWithZone:](self->_distanceRemainingFuel, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setDistanceRemainingFuel:](v5, "setDistanceRemainingFuel:", v14);

  v15 = -[_INPBDouble copyWithZone:](self->_fuelPercentRemaining, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setFuelPercentRemaining:](v5, "setFuelPercentRemaining:", v15);

  v16 = -[_INPBEnergy copyWithZone:](self->_maximumBatteryCapacity, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setMaximumBatteryCapacity:](v5, "setMaximumBatteryCapacity:", v16);

  v17 = -[_INPBDistance copyWithZone:](self->_maximumDistance, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setMaximumDistance:](v5, "setMaximumDistance:", v17);

  v18 = -[_INPBDistance copyWithZone:](self->_maximumDistanceElectric, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setMaximumDistanceElectric:](v5, "setMaximumDistanceElectric:", v18);

  v19 = -[_INPBDistance copyWithZone:](self->_maximumDistanceFuel, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setMaximumDistanceFuel:](v5, "setMaximumDistanceFuel:", v19);

  v20 = -[_INPBEnergy copyWithZone:](self->_minimumBatteryCapacity, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setMinimumBatteryCapacity:](v5, "setMinimumBatteryCapacity:", v20);

  v21 = -[_INPBInteger copyWithZone:](self->_minutesToFull, "copyWithZone:", a3);
  -[_INPBGetCarPowerLevelStatusIntentResponse setMinutesToFull:](v5, "setMinutesToFull:", v21);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int activeConnector;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int charging;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  char v90;
  BOOL v91;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_90;
  v5 = -[_INPBGetCarPowerLevelStatusIntentResponse hasActiveConnector](self, "hasActiveConnector");
  if (v5 != objc_msgSend(v4, "hasActiveConnector"))
    goto LABEL_90;
  if (-[_INPBGetCarPowerLevelStatusIntentResponse hasActiveConnector](self, "hasActiveConnector"))
  {
    if (objc_msgSend(v4, "hasActiveConnector"))
    {
      activeConnector = self->_activeConnector;
      if (activeConnector != objc_msgSend(v4, "activeConnector"))
        goto LABEL_90;
    }
  }
  -[_INPBGetCarPowerLevelStatusIntentResponse carIdentifier](self, "carIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse carIdentifier](self, "carIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBGetCarPowerLevelStatusIntentResponse carIdentifier](self, "carIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_90;
  }
  else
  {

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse chargePercentRemaining](self, "chargePercentRemaining");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chargePercentRemaining");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse chargePercentRemaining](self, "chargePercentRemaining");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBGetCarPowerLevelStatusIntentResponse chargePercentRemaining](self, "chargePercentRemaining");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chargePercentRemaining");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_90;
  }
  else
  {

  }
  v19 = -[_INPBGetCarPowerLevelStatusIntentResponse hasCharging](self, "hasCharging");
  if (v19 != objc_msgSend(v4, "hasCharging"))
    goto LABEL_90;
  if (-[_INPBGetCarPowerLevelStatusIntentResponse hasCharging](self, "hasCharging"))
  {
    if (objc_msgSend(v4, "hasCharging"))
    {
      charging = self->_charging;
      if (charging != objc_msgSend(v4, "charging"))
        goto LABEL_90;
    }
  }
  -[_INPBGetCarPowerLevelStatusIntentResponse chargingFormulaArguments](self, "chargingFormulaArguments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chargingFormulaArguments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse chargingFormulaArguments](self, "chargingFormulaArguments");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_INPBGetCarPowerLevelStatusIntentResponse chargingFormulaArguments](self, "chargingFormulaArguments");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chargingFormulaArguments");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_90;
  }
  else
  {

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse consumptionFormulaArguments](self, "consumptionFormulaArguments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "consumptionFormulaArguments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse consumptionFormulaArguments](self, "consumptionFormulaArguments");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[_INPBGetCarPowerLevelStatusIntentResponse consumptionFormulaArguments](self, "consumptionFormulaArguments");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "consumptionFormulaArguments");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_90;
  }
  else
  {

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse currentBatteryCapacity](self, "currentBatteryCapacity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentBatteryCapacity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse currentBatteryCapacity](self, "currentBatteryCapacity");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_INPBGetCarPowerLevelStatusIntentResponse currentBatteryCapacity](self, "currentBatteryCapacity");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentBatteryCapacity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_90;
  }
  else
  {

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse dateOfLastStateUpdate](self, "dateOfLastStateUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfLastStateUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse dateOfLastStateUpdate](self, "dateOfLastStateUpdate");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_INPBGetCarPowerLevelStatusIntentResponse dateOfLastStateUpdate](self, "dateOfLastStateUpdate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateOfLastStateUpdate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_90;
  }
  else
  {

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemaining](self, "distanceRemaining");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distanceRemaining");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemaining](self, "distanceRemaining");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemaining](self, "distanceRemaining");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "distanceRemaining");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_90;
  }
  else
  {

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemainingElectric](self, "distanceRemainingElectric");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distanceRemainingElectric");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemainingElectric](self, "distanceRemainingElectric");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemainingElectric](self, "distanceRemainingElectric");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "distanceRemainingElectric");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_90;
  }
  else
  {

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemainingFuel](self, "distanceRemainingFuel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distanceRemainingFuel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemainingFuel](self, "distanceRemainingFuel");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemainingFuel](self, "distanceRemainingFuel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "distanceRemainingFuel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqual:", v54);

    if (!v55)
      goto LABEL_90;
  }
  else
  {

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse fuelPercentRemaining](self, "fuelPercentRemaining");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fuelPercentRemaining");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse fuelPercentRemaining](self, "fuelPercentRemaining");
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    v57 = (void *)v56;
    -[_INPBGetCarPowerLevelStatusIntentResponse fuelPercentRemaining](self, "fuelPercentRemaining");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fuelPercentRemaining");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "isEqual:", v59);

    if (!v60)
      goto LABEL_90;
  }
  else
  {

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse maximumBatteryCapacity](self, "maximumBatteryCapacity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumBatteryCapacity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse maximumBatteryCapacity](self, "maximumBatteryCapacity");
  v61 = objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    v62 = (void *)v61;
    -[_INPBGetCarPowerLevelStatusIntentResponse maximumBatteryCapacity](self, "maximumBatteryCapacity");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maximumBatteryCapacity");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v63, "isEqual:", v64);

    if (!v65)
      goto LABEL_90;
  }
  else
  {

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistance](self, "maximumDistance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumDistance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistance](self, "maximumDistance");
  v66 = objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    v67 = (void *)v66;
    -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistance](self, "maximumDistance");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maximumDistance");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v68, "isEqual:", v69);

    if (!v70)
      goto LABEL_90;
  }
  else
  {

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistanceElectric](self, "maximumDistanceElectric");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumDistanceElectric");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistanceElectric](self, "maximumDistanceElectric");
  v71 = objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    v72 = (void *)v71;
    -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistanceElectric](self, "maximumDistanceElectric");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maximumDistanceElectric");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v73, "isEqual:", v74);

    if (!v75)
      goto LABEL_90;
  }
  else
  {

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistanceFuel](self, "maximumDistanceFuel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumDistanceFuel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistanceFuel](self, "maximumDistanceFuel");
  v76 = objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    v77 = (void *)v76;
    -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistanceFuel](self, "maximumDistanceFuel");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maximumDistanceFuel");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v78, "isEqual:", v79);

    if (!v80)
      goto LABEL_90;
  }
  else
  {

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse minimumBatteryCapacity](self, "minimumBatteryCapacity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumBatteryCapacity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_89;
  -[_INPBGetCarPowerLevelStatusIntentResponse minimumBatteryCapacity](self, "minimumBatteryCapacity");
  v81 = objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    v82 = (void *)v81;
    -[_INPBGetCarPowerLevelStatusIntentResponse minimumBatteryCapacity](self, "minimumBatteryCapacity");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minimumBatteryCapacity");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v83, "isEqual:", v84);

    if (!v85)
      goto LABEL_90;
  }
  else
  {

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse minutesToFull](self, "minutesToFull");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minutesToFull");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse minutesToFull](self, "minutesToFull");
    v86 = objc_claimAutoreleasedReturnValue();
    if (!v86)
    {

LABEL_93:
      v91 = 1;
      goto LABEL_91;
    }
    v87 = (void *)v86;
    -[_INPBGetCarPowerLevelStatusIntentResponse minutesToFull](self, "minutesToFull");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minutesToFull");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v88, "isEqual:", v89);

    if ((v90 & 1) != 0)
      goto LABEL_93;
  }
  else
  {
LABEL_89:

  }
LABEL_90:
  v91 = 0;
LABEL_91:

  return v91;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  if (-[_INPBGetCarPowerLevelStatusIntentResponse hasActiveConnector](self, "hasActiveConnector"))
    v3 = 2654435761 * self->_activeConnector;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_carIdentifier, "hash");
  v5 = -[_INPBDouble hash](self->_chargePercentRemaining, "hash");
  if (-[_INPBGetCarPowerLevelStatusIntentResponse hasCharging](self, "hasCharging"))
    v6 = 2654435761 * self->_charging;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[_INPBJSONDictionary hash](self->_chargingFormulaArguments, "hash");
  v9 = v8 ^ -[_INPBJSONDictionary hash](self->_consumptionFormulaArguments, "hash");
  v10 = v7 ^ v9 ^ -[_INPBEnergy hash](self->_currentBatteryCapacity, "hash");
  v11 = -[_INPBDateTime hash](self->_dateOfLastStateUpdate, "hash");
  v12 = v11 ^ -[_INPBDistance hash](self->_distanceRemaining, "hash");
  v13 = v12 ^ -[_INPBDistance hash](self->_distanceRemainingElectric, "hash");
  v14 = v10 ^ v13 ^ -[_INPBDistance hash](self->_distanceRemainingFuel, "hash");
  v15 = -[_INPBDouble hash](self->_fuelPercentRemaining, "hash");
  v16 = v15 ^ -[_INPBEnergy hash](self->_maximumBatteryCapacity, "hash");
  v17 = v16 ^ -[_INPBDistance hash](self->_maximumDistance, "hash");
  v18 = v17 ^ -[_INPBDistance hash](self->_maximumDistanceElectric, "hash");
  v19 = v14 ^ v18 ^ -[_INPBDistance hash](self->_maximumDistanceFuel, "hash");
  v20 = -[_INPBEnergy hash](self->_minimumBatteryCapacity, "hash");
  return v19 ^ v20 ^ -[_INPBInteger hash](self->_minutesToFull, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBGetCarPowerLevelStatusIntentResponse hasActiveConnector](self, "hasActiveConnector"))
  {
    v4 = -[_INPBGetCarPowerLevelStatusIntentResponse activeConnector](self, "activeConnector");
    if ((v4 - 2) >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E228ADA0[(v4 - 2)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("activeConnector"));

  }
  if (self->_carIdentifier)
  {
    -[_INPBGetCarPowerLevelStatusIntentResponse carIdentifier](self, "carIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("carIdentifier"));

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse chargePercentRemaining](self, "chargePercentRemaining");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("chargePercentRemaining"));

  if (-[_INPBGetCarPowerLevelStatusIntentResponse hasCharging](self, "hasCharging"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBGetCarPowerLevelStatusIntentResponse charging](self, "charging"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("charging"));

  }
  -[_INPBGetCarPowerLevelStatusIntentResponse chargingFormulaArguments](self, "chargingFormulaArguments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("chargingFormulaArguments"));

  -[_INPBGetCarPowerLevelStatusIntentResponse consumptionFormulaArguments](self, "consumptionFormulaArguments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("consumptionFormulaArguments"));

  -[_INPBGetCarPowerLevelStatusIntentResponse currentBatteryCapacity](self, "currentBatteryCapacity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("currentBatteryCapacity"));

  -[_INPBGetCarPowerLevelStatusIntentResponse dateOfLastStateUpdate](self, "dateOfLastStateUpdate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("dateOfLastStateUpdate"));

  -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemaining](self, "distanceRemaining");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("distanceRemaining"));

  -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemainingElectric](self, "distanceRemainingElectric");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("distanceRemainingElectric"));

  -[_INPBGetCarPowerLevelStatusIntentResponse distanceRemainingFuel](self, "distanceRemainingFuel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dictionaryRepresentation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("distanceRemainingFuel"));

  -[_INPBGetCarPowerLevelStatusIntentResponse fuelPercentRemaining](self, "fuelPercentRemaining");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dictionaryRepresentation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("fuelPercentRemaining"));

  -[_INPBGetCarPowerLevelStatusIntentResponse maximumBatteryCapacity](self, "maximumBatteryCapacity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dictionaryRepresentation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("maximumBatteryCapacity"));

  -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistance](self, "maximumDistance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dictionaryRepresentation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("maximumDistance"));

  -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistanceElectric](self, "maximumDistanceElectric");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dictionaryRepresentation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("maximumDistanceElectric"));

  -[_INPBGetCarPowerLevelStatusIntentResponse maximumDistanceFuel](self, "maximumDistanceFuel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "dictionaryRepresentation");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("maximumDistanceFuel"));

  -[_INPBGetCarPowerLevelStatusIntentResponse minimumBatteryCapacity](self, "minimumBatteryCapacity");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "dictionaryRepresentation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("minimumBatteryCapacity"));

  -[_INPBGetCarPowerLevelStatusIntentResponse minutesToFull](self, "minutesToFull");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "dictionaryRepresentation");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("minutesToFull"));

  return v3;
}

- (int)activeConnector
{
  return self->_activeConnector;
}

- (NSString)carIdentifier
{
  return self->_carIdentifier;
}

- (_INPBDouble)chargePercentRemaining
{
  return self->_chargePercentRemaining;
}

- (BOOL)charging
{
  return self->_charging;
}

- (_INPBJSONDictionary)chargingFormulaArguments
{
  return self->_chargingFormulaArguments;
}

- (_INPBJSONDictionary)consumptionFormulaArguments
{
  return self->_consumptionFormulaArguments;
}

- (_INPBEnergy)currentBatteryCapacity
{
  return self->_currentBatteryCapacity;
}

- (_INPBDateTime)dateOfLastStateUpdate
{
  return self->_dateOfLastStateUpdate;
}

- (_INPBDistance)distanceRemaining
{
  return self->_distanceRemaining;
}

- (_INPBDistance)distanceRemainingElectric
{
  return self->_distanceRemainingElectric;
}

- (_INPBDistance)distanceRemainingFuel
{
  return self->_distanceRemainingFuel;
}

- (_INPBDouble)fuelPercentRemaining
{
  return self->_fuelPercentRemaining;
}

- (_INPBEnergy)maximumBatteryCapacity
{
  return self->_maximumBatteryCapacity;
}

- (_INPBDistance)maximumDistance
{
  return self->_maximumDistance;
}

- (_INPBDistance)maximumDistanceElectric
{
  return self->_maximumDistanceElectric;
}

- (_INPBDistance)maximumDistanceFuel
{
  return self->_maximumDistanceFuel;
}

- (_INPBEnergy)minimumBatteryCapacity
{
  return self->_minimumBatteryCapacity;
}

- (_INPBInteger)minutesToFull
{
  return self->_minutesToFull;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minutesToFull, 0);
  objc_storeStrong((id *)&self->_minimumBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_maximumDistanceFuel, 0);
  objc_storeStrong((id *)&self->_maximumDistanceElectric, 0);
  objc_storeStrong((id *)&self->_maximumDistance, 0);
  objc_storeStrong((id *)&self->_maximumBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_fuelPercentRemaining, 0);
  objc_storeStrong((id *)&self->_distanceRemainingFuel, 0);
  objc_storeStrong((id *)&self->_distanceRemainingElectric, 0);
  objc_storeStrong((id *)&self->_distanceRemaining, 0);
  objc_storeStrong((id *)&self->_dateOfLastStateUpdate, 0);
  objc_storeStrong((id *)&self->_currentBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_consumptionFormulaArguments, 0);
  objc_storeStrong((id *)&self->_chargingFormulaArguments, 0);
  objc_storeStrong((id *)&self->_chargePercentRemaining, 0);
  objc_storeStrong((id *)&self->_carIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
