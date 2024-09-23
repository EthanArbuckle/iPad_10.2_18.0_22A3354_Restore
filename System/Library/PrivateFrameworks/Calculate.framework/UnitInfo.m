@implementation UnitInfo

- (UnitInfo)init
{
  UnitInfo *v2;
  UnitInfo *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UnitInfo;
  v2 = -[UnitInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UnitInfo setUnitID:](v2, "setUnitID:", 0);
    -[UnitInfo setBaseNumerator:](v3, "setBaseNumerator:", 1, 0x3040000000000000);
    -[UnitInfo setBaseDenominator:](v3, "setBaseDenominator:", 1, 0x3040000000000000);
    v4 = (void *)objc_opt_new();
    -[UnitInfo setAllSubunitIDs:](v3, "setAllSubunitIDs:", v4);

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  BOOL v7;

  v4 = a3;
  v5 = -[UnitInfo unitID](self, "unitID");
  if (v5 == objc_msgSend(v4, "unitID"))
  {
    v6 = -[UnitInfo unitType](self, "unitType");
    v7 = v6 == objc_msgSend(v4, "unitType");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int v5;
  int64_t v6;
  int v7;

  v4 = a3;
  v5 = -[UnitInfo unitID](self, "unitID");
  if (v5 <= (int)objc_msgSend(v4, "unitID"))
  {
    v7 = -[UnitInfo unitID](self, "unitID");
    if (v7 >= (int)objc_msgSend(v4, "unitID"))
      v6 = 0;
    else
      v6 = -1;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = 31 * -[UnitInfo unitID](self, "unitID");
  return v3 + -[UnitInfo unitType](self, "unitType") + 961;
}

- (int)unitID
{
  return self->_unitID;
}

- (void)setUnitID:(int)a3
{
  self->_unitID = a3;
}

- (int)unitType
{
  return self->_unitType;
}

- (void)setUnitType:(int)a3
{
  self->_unitType = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- ($71D83D51AB0F57F7CF166351F850C832)baseNumerator
{
  unint64_t v2;
  unint64_t v3;
  $71D83D51AB0F57F7CF166351F850C832 result;

  v2 = self->_baseNumerator.w[1];
  v3 = self->_baseNumerator.w[0];
  result.var0[1] = v2;
  result.var0[0] = v3;
  return result;
}

- (void)setBaseNumerator:(id)a3
{
  self->_baseNumerator = ($739D1A12408C92E4BFA0C2DF4C691557)a3;
}

- ($71D83D51AB0F57F7CF166351F850C832)baseDenominator
{
  unint64_t v2;
  unint64_t v3;
  $71D83D51AB0F57F7CF166351F850C832 result;

  v2 = self->_baseDenominator.w[1];
  v3 = self->_baseDenominator.w[0];
  result.var0[1] = v2;
  result.var0[0] = v3;
  return result;
}

- (void)setBaseDenominator:(id)a3
{
  self->_baseDenominator = ($739D1A12408C92E4BFA0C2DF4C691557)a3;
}

- (BOOL)isInverted
{
  return self->_isInverted;
}

- (void)setIsInverted:(BOOL)a3
{
  self->_isInverted = a3;
}

- (BOOL)isBaseUnit
{
  return self->_isBaseUnit;
}

- (void)setIsBaseUnit:(BOOL)a3
{
  self->_isBaseUnit = a3;
}

- (BOOL)isDisplayName
{
  return self->_isDisplayName;
}

- (void)setIsDisplayName:(BOOL)a3
{
  self->_isDisplayName = a3;
}

- (BOOL)impliesDivision
{
  return self->_impliesDivision;
}

- (void)setImpliesDivision:(BOOL)a3
{
  self->_impliesDivision = a3;
}

- (BOOL)isFahrenheit
{
  return self->_isFahrenheit;
}

- (void)setIsFahrenheit:(BOOL)a3
{
  self->_isFahrenheit = a3;
}

- (BOOL)isCelsius
{
  return self->_isCelsius;
}

- (void)setIsCelsius:(BOOL)a3
{
  self->_isCelsius = a3;
}

- (BOOL)isKelvin
{
  return self->_isKelvin;
}

- (void)setIsKelvin:(BOOL)a3
{
  self->_isKelvin = a3;
}

- (UnitTypeInfo)typeInfo
{
  return (UnitTypeInfo *)objc_loadWeakRetained((id *)&self->_typeInfo);
}

- (void)setTypeInfo:(id)a3
{
  objc_storeWeak((id *)&self->_typeInfo, a3);
}

- (UnitInfo)bestEquivalent
{
  return (UnitInfo *)objc_loadWeakRetained((id *)&self->_bestEquivalent);
}

- (void)setBestEquivalent:(id)a3
{
  objc_storeWeak((id *)&self->_bestEquivalent, a3);
}

- (unint64_t)measurementSystem
{
  return self->_measurementSystem;
}

- (void)setMeasurementSystem:(unint64_t)a3
{
  self->_measurementSystem = a3;
}

- (BOOL)doNotSuggest
{
  return self->_doNotSuggest;
}

- (void)setDoNotSuggest:(BOOL)a3
{
  self->_doNotSuggest = a3;
}

- (UnitInfo)nextSmallest
{
  return (UnitInfo *)objc_loadWeakRetained((id *)&self->_nextSmallest);
}

- (void)setNextSmallest:(id)a3
{
  objc_storeWeak((id *)&self->_nextSmallest, a3);
}

- (BOOL)formatNextSmallest
{
  return self->_formatNextSmallest;
}

- (void)setFormatNextSmallest:(BOOL)a3
{
  self->_formatNextSmallest = a3;
}

- (BOOL)isPreferredUnit
{
  return self->_isPreferredUnit;
}

- (void)setIsPreferredUnit:(BOOL)a3
{
  self->_isPreferredUnit = a3;
}

- (NSArray)subunitIDs
{
  return self->_subunitIDs;
}

- (void)setSubunitIDs:(id)a3
{
  objc_storeStrong((id *)&self->_subunitIDs, a3);
}

- (NSSet)allSubunitIDs
{
  return self->_allSubunitIDs;
}

- (void)setAllSubunitIDs:(id)a3
{
  objc_storeStrong((id *)&self->_allSubunitIDs, a3);
}

- (NSMutableDictionary)localizationToCompactName
{
  return self->_localizationToCompactName;
}

- (void)setLocalizationToCompactName:(id)a3
{
  objc_storeStrong((id *)&self->_localizationToCompactName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizationToCompactName, 0);
  objc_storeStrong((id *)&self->_allSubunitIDs, 0);
  objc_storeStrong((id *)&self->_subunitIDs, 0);
  objc_destroyWeak((id *)&self->_nextSmallest);
  objc_destroyWeak((id *)&self->_bestEquivalent);
  objc_destroyWeak((id *)&self->_typeInfo);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
