@implementation MIORangeAsValue

+ (id)valueWithMIORange:(_MIORange)a3
{
  int64_t upperBound;
  int64_t lowerBound;
  _QWORD *v5;

  upperBound = a3.upperBound;
  lowerBound = a3.lowerBound;
  v5 = (_QWORD *)objc_msgSend(objc_allocWithZone((Class)a1), "init");
  v5[1] = lowerBound;
  v5[2] = upperBound;
  return v5;
}

- (_MIORange)MIORangeValue
{
  _MIORange *p_range;
  int64_t lowerBound;
  int64_t upperBound;
  _MIORange result;

  p_range = &self->_range;
  lowerBound = self->_range.lowerBound;
  upperBound = p_range->upperBound;
  result.upperBound = upperBound;
  result.lowerBound = lowerBound;
  return result;
}

- (void)getValue:(void *)a3
{
  *(_MIORange *)a3 = self->_range;
}

- (const)objCType
{
  return "{_MIORange=qq}";
}

@end
