@implementation PKInputPointBaseFilter

- (void)resetFilter
{
  self->_filteredPoint.estimatedActiveInputPropertiesExpectingUpdates = 0;
  *(_OWORD *)&self->_filteredPoint.length = 0u;
  *(_OWORD *)&self->_filteredPoint.rollAngle = 0u;
  *(_OWORD *)&self->_filteredPoint.zPosition = 0u;
  *(_OWORD *)&self->_filteredPoint.predicted = 0u;
  *(_OWORD *)&self->_filteredPoint.azimuth = 0u;
  *(_OWORD *)&self->_filteredPoint.velocity = 0u;
  *(_OWORD *)&self->_numInputPoints = 0u;
  *(_OWORD *)&self->_filteredPoint.var0.location.y = 0u;
}

- (PKInputPointBaseFilter)init
{
  PKInputPointBaseFilter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKInputPointBaseFilter;
  result = -[PKInputPointBaseFilter init](&v3, sel_init);
  if (result)
  {
    result->_filteredPoint.estimatedActiveInputPropertiesExpectingUpdates = 0;
    *(_OWORD *)&result->_filteredPoint.length = 0u;
    *(_OWORD *)&result->_filteredPoint.rollAngle = 0u;
    *(_OWORD *)&result->_filteredPoint.zPosition = 0u;
    *(_OWORD *)&result->_filteredPoint.predicted = 0u;
    *(_OWORD *)&result->_filteredPoint.azimuth = 0u;
    *(_OWORD *)&result->_filteredPoint.velocity = 0u;
    *(_OWORD *)&result->_numInputPoints = 0u;
    *(_OWORD *)&result->_filteredPoint.var0.location.y = 0u;
  }
  return result;
}

- ($78FB54F4A6B442EA15B736438C71FAD1)currentFilteredPoint
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self->var12;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&self->var10;
  *(_OWORD *)&retstr->var9 = v3;
  v4 = *(_OWORD *)&self[1].var0.var1.y;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&self->var14;
  *(_OWORD *)&retstr->var13 = v4;
  v5 = *(_OWORD *)&self->var4;
  retstr->var0 = *($9076B28992D74D3AA2059476C2B9E2A9 *)&self->var2;
  *(_OWORD *)&retstr->var1 = v5;
  v6 = *(_OWORD *)&self->var8;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&self->var6;
  *(_OWORD *)&retstr->var5 = v6;
  return self;
}

@end
