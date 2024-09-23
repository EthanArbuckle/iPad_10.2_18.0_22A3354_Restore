@implementation UnitTypeInfo

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

- (BOOL)isDecomposable
{
  return self->_isDecomposable;
}

- (void)setIsDecomposable:(BOOL)a3
{
  self->_isDecomposable = a3;
}

- ($71D83D51AB0F57F7CF166351F850C832)decompositionCoefficient
{
  unint64_t v2;
  unint64_t v3;
  $71D83D51AB0F57F7CF166351F850C832 result;

  v2 = self->_decompositionCoefficient.w[1];
  v3 = self->_decompositionCoefficient.w[0];
  result.var0[1] = v2;
  result.var0[0] = v3;
  return result;
}

- (void)setDecompositionCoefficient:(id)a3
{
  self->_decompositionCoefficient = ($739D1A12408C92E4BFA0C2DF4C691557)a3;
}

- (UnitCounts)decomposition
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[1].types[2].unitID;
  *(_OWORD *)&retstr->types[8].unitID = *(_OWORD *)&self[1].types[0].unitID;
  *(_OWORD *)&retstr->types[10].unitID = v3;
  v4 = *(_OWORD *)&self[1].types[6].unitID;
  *(_OWORD *)&retstr->types[12].unitID = *(_OWORD *)&self[1].types[4].unitID;
  *(_OWORD *)&retstr->types[14].unitID = v4;
  v5 = *(_OWORD *)&self->types[10].unitID;
  *(_OWORD *)&retstr->types[0].unitID = *(_OWORD *)&self->types[8].unitID;
  *(_OWORD *)&retstr->types[2].unitID = v5;
  v6 = *(_OWORD *)&self->types[14].unitID;
  *(_OWORD *)&retstr->types[4].unitID = *(_OWORD *)&self->types[12].unitID;
  *(_OWORD *)&retstr->types[6].unitID = v6;
  return self;
}

- (void)setDecomposition:(UnitCounts *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->types[0].unitID;
  v4 = *(_OWORD *)&a3->types[2].unitID;
  v5 = *(_OWORD *)&a3->types[6].unitID;
  *(_OWORD *)&self->_decomposition.types[4].unitID = *(_OWORD *)&a3->types[4].unitID;
  *(_OWORD *)&self->_decomposition.types[6].unitID = v5;
  *(_OWORD *)&self->_decomposition.types[0].unitID = v3;
  *(_OWORD *)&self->_decomposition.types[2].unitID = v4;
  v6 = *(_OWORD *)&a3->types[8].unitID;
  v7 = *(_OWORD *)&a3->types[10].unitID;
  v8 = *(_OWORD *)&a3->types[14].unitID;
  *(_OWORD *)&self->_decomposition.types[12].unitID = *(_OWORD *)&a3->types[12].unitID;
  *(_OWORD *)&self->_decomposition.types[14].unitID = v8;
  *(_OWORD *)&self->_decomposition.types[8].unitID = v6;
  *(_OWORD *)&self->_decomposition.types[10].unitID = v7;
}

- (NSArray)units
{
  return self->_units;
}

- (void)setUnits:(id)a3
{
  objc_storeStrong((id *)&self->_units, a3);
}

- (UnitInfo)baseUnit
{
  return (UnitInfo *)objc_loadWeakRetained((id *)&self->_baseUnit);
}

- (void)setBaseUnit:(id)a3
{
  objc_storeWeak((id *)&self->_baseUnit, a3);
}

- (BOOL)isTemperature
{
  return self->_isTemperature;
}

- (void)setIsTemperature:(BOOL)a3
{
  self->_isTemperature = a3;
}

- (BOOL)isCurrency
{
  return self->_isCurrency;
}

- (void)setIsCurrency:(BOOL)a3
{
  self->_isCurrency = a3;
}

- (BOOL)isVolume
{
  return self->_isVolume;
}

- (void)setIsVolume:(BOOL)a3
{
  self->_isVolume = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_baseUnit);
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
