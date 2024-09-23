@implementation BWZoomRange

+ (id)fudgedZoomRangeWithLower:(float)a3 upperBound:(float)a4 fudgedLowerBound:(float)a5 fudgedUpperBound:(float)a6
{
  BWZoomRange *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v10 = [BWZoomRange alloc];
  *(float *)&v11 = a3;
  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  *(float *)&v14 = a6;
  return -[BWZoomRange initWithLowerBound:upperBound:fudgedLowerBound:fudgedUpperBound:](v10, "initWithLowerBound:upperBound:fudgedLowerBound:fudgedUpperBound:", v11, v12, v13, v14);
}

- (BWZoomRange)initWithLowerBound:(float)a3 upperBound:(float)a4 fudgedLowerBound:(float)a5 fudgedUpperBound:(float)a6
{
  BWZoomRange *result;
  float v12;
  int v13;
  float v14;
  int v15;
  float v16;
  int v17;
  float v18;
  int v19;
  int v20;
  unint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)BWZoomRange;
  result = -[BWZoomRange init](&v23, sel_init);
  if (result)
  {
    if (a3 < a4 && a5 < a6)
    {
      result->_lowerBound = a3;
      result->_upperBound = a4;
      result->_fudgedLowerBound = a5;
      result->_fudgedUpperBound = a6;
      v12 = a3 * 1024.0;
      if (a3 >= 1024.0)
        v12 = a3;
      v13 = (int)v12;
      v14 = a4 * 1024.0;
      if (a4 >= 1024.0)
        v14 = a4;
      v15 = (int)v14;
      if (a6 >= 1024.0)
        v16 = 2.0;
      else
        v16 = 2048.0;
      v17 = (int)(float)(v16 * a6);
      if (a5 >= 1024.0)
        v18 = 2.0;
      else
        v18 = 2048.0;
      v19 = (int)(float)(v18 * a5);
      v20 = v15 ^ v13;
      if (v13 == v19 || v15 == v17)
        v22 = v20;
      else
        v22 = v20 ^ v19 ^ v17;
      result->_hash = v22;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

- (float)upperBound
{
  return self->_upperBound;
}

- (float)lowerBound
{
  return self->_lowerBound;
}

- (float)applyFudgeToZoomFactor:(float)a3
{
  float lowerBound;
  float upperBound;

  lowerBound = self->_lowerBound;
  if (lowerBound > a3)
    return self->_fudgedLowerBound;
  upperBound = self->_upperBound;
  if (upperBound >= a3)
    return self->_fudgedLowerBound
         + (float)((float)(self->_fudgedUpperBound - self->_fudgedLowerBound)
                 * (float)((float)(a3 - lowerBound) / (float)(upperBound - lowerBound)));
  else
    return self->_fudgedUpperBound;
}

- (float)fudgedUpperBound
{
  return self->_fudgedUpperBound;
}

- (float)fudgedLowerBound
{
  return self->_fudgedLowerBound;
}

+ (id)zoomRangeWithLower:(float)a3 upperBound:(float)a4
{
  BWZoomRange *v6;
  double v7;
  double v8;

  v6 = [BWZoomRange alloc];
  *(float *)&v7 = a3;
  *(float *)&v8 = a4;
  return -[BWZoomRange initWithLowerBound:upperBound:](v6, "initWithLowerBound:upperBound:", v7, v8);
}

- (BWZoomRange)initWithLowerBound:(float)a3 upperBound:(float)a4
{
  double v4;
  double v5;

  *(float *)&v4 = a3;
  *(float *)&v5 = a4;
  return -[BWZoomRange initWithLowerBound:upperBound:fudgedLowerBound:fudgedUpperBound:](self, "initWithLowerBound:upperBound:fudgedLowerBound:fudgedUpperBound:", *(double *)&a3, *(double *)&a4, v4, v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  BWZoomRange *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = +[BWZoomRange allocWithZone:](BWZoomRange, "allocWithZone:", a3);
  *(float *)&v5 = self->_lowerBound;
  *(float *)&v6 = self->_upperBound;
  *(float *)&v7 = self->_fudgedLowerBound;
  *(float *)&v8 = self->_fudgedUpperBound;
  return -[BWZoomRange initWithLowerBound:upperBound:fudgedLowerBound:fudgedUpperBound:](v4, "initWithLowerBound:upperBound:fudgedLowerBound:fudgedUpperBound:", v5, v6, v7, v8);
}

- (BOOL)isEqual:(id)a3
{
  float v5;
  float v6;
  float v7;
  float v9;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend(a3, "lowerBound");
  if (v5 != self->_lowerBound)
    return 0;
  objc_msgSend(a3, "upperBound");
  if (v6 != self->_upperBound)
    return 0;
  objc_msgSend(a3, "fudgedLowerBound");
  if (v7 != self->_fudgedLowerBound)
    return 0;
  objc_msgSend(a3, "fudgedUpperBound");
  return v9 == self->_fudgedUpperBound;
}

- (float)removeFudgeFromZoomFactor:(float)a3
{
  float fudgedLowerBound;
  float fudgedUpperBound;

  fudgedLowerBound = self->_fudgedLowerBound;
  if (fudgedLowerBound > a3)
    return self->_lowerBound;
  fudgedUpperBound = self->_fudgedUpperBound;
  if (fudgedUpperBound >= a3)
    return self->_lowerBound
         + (float)((float)(self->_upperBound - self->_lowerBound)
                 * (float)((float)(a3 - fudgedLowerBound) / (float)(fudgedUpperBound - fudgedLowerBound)));
  else
    return self->_upperBound;
}

- (id)description
{
  float lowerBound;
  float upperBound;
  float fudgedUpperBound;
  float fudgedLowerBound;
  double v6;
  double v7;
  uint64_t v10;
  uint64_t v11;

  lowerBound = self->_lowerBound;
  upperBound = self->_upperBound;
  fudgedLowerBound = self->_fudgedLowerBound;
  fudgedUpperBound = self->_fudgedUpperBound;
  v6 = lowerBound;
  v7 = upperBound;
  if (lowerBound == fudgedLowerBound && upperBound == fudgedUpperBound)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%f..%f]"), v6, v7, lowerBound, upperBound, v10, v11);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%f..%f] -> [%f..%f]"), v6, v7, lowerBound, upperBound, fudgedLowerBound, fudgedUpperBound);
}

- (unint64_t)hash
{
  return self->_hash;
}

@end
