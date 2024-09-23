@implementation _NUFlexRangeChannelProperties

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = +[_NUFlexRangeChannelProperties allocWithZone:](_NUFlexRangeChannelProperties, "allocWithZone:", a3);
  *((_DWORD *)result + 2) = LODWORD(self->_min);
  *((_DWORD *)result + 3) = LODWORD(self->_max);
  *((_DWORD *)result + 4) = LODWORD(self->_gamma);
  *((_DWORD *)result + 5) = LODWORD(self->_baseOffset);
  *((_DWORD *)result + 6) = LODWORD(self->_alternateOffset);
  return result;
}

- (NSString)description
{
  void *v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_NUFlexRangeChannelProperties min](self, "min");
  v5 = v4;
  -[_NUFlexRangeChannelProperties min](self, "min");
  v7 = exp2f(v6);
  -[_NUFlexRangeChannelProperties max](self, "max");
  v9 = v8;
  -[_NUFlexRangeChannelProperties max](self, "max");
  v11 = exp2f(v10);
  -[_NUFlexRangeChannelProperties gamma](self, "gamma");
  v13 = v12;
  -[_NUFlexRangeChannelProperties alternateOffset](self, "alternateOffset");
  v15 = v14;
  -[_NUFlexRangeChannelProperties baseOffset](self, "baseOffset");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("[min:%0.3f(%0.3f) max:%0.3f(%0.3f) gamma:%0.3f kA:%g kB:%g]"), *(_QWORD *)&v5, *(_QWORD *)&v7, *(_QWORD *)&v9, *(_QWORD *)&v11, *(_QWORD *)&v13, *(_QWORD *)&v15, v16);
}

- (float)min
{
  return self->_min;
}

- (void)setMin:(float)a3
{
  self->_min = a3;
}

- (float)max
{
  return self->_max;
}

- (void)setMax:(float)a3
{
  self->_max = a3;
}

- (float)gamma
{
  return self->_gamma;
}

- (void)setGamma:(float)a3
{
  self->_gamma = a3;
}

- (float)baseOffset
{
  return self->_baseOffset;
}

- (void)setBaseOffset:(float)a3
{
  self->_baseOffset = a3;
}

- (float)alternateOffset
{
  return self->_alternateOffset;
}

- (void)setAlternateOffset:(float)a3
{
  self->_alternateOffset = a3;
}

@end
