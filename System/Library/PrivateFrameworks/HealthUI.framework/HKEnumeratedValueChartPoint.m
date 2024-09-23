@implementation HKEnumeratedValueChartPoint

- (id)yValue
{
  return -[NSArray lastObject](self->_indices, "lastObject");
}

- (id)allYValues
{
  return self->_indices;
}

- (NSArray)indices
{
  return self->_indices;
}

- (void)setIndices:(id)a3
{
  objc_storeStrong((id *)&self->_indices, a3);
}

- (NSDate)xValue
{
  return self->_xValue;
}

- (void)setXValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
  objc_storeStrong((id *)&self->_indices, 0);
}

@end
