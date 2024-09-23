@implementation MLProbabilityDictionaryFloat64Storage

- (MLProbabilityDictionaryFloat64Storage)initWithFloat64CArray:(const double *)a3 count:(unint64_t)a4
{
  MLProbabilityDictionaryFloat64Storage *v6;
  uint64_t v7;
  NSData *data;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MLProbabilityDictionaryFloat64Storage;
  v6 = -[MLProbabilityDictionaryFloat64Storage init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, 8 * a4);
    v7 = objc_claimAutoreleasedReturnValue();
    data = v6->_data;
    v6->_data = (NSData *)v7;

  }
  return v6;
}

- (id)probabilityAtIndex:(unint64_t)a3
{
  if (-[MLProbabilityDictionaryFloat64Storage count](self, "count") <= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Probability index %tu is out of range because there are only %tu classes."), a3, -[MLProbabilityDictionaryFloat64Storage count](self, "count"));
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(-[NSData bytes](self->_data, "bytes") + 8 * a3));
}

- (unint64_t)maxElementIndex
{
  double *v3;
  char *v4;
  double *v5;
  double *v6;
  double v9;
  double *v10;
  double *v11;
  double v12;
  double v13;

  if (!-[MLProbabilityDictionaryFloat64Storage count](self, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = -[NSData bytes](self->_data, "bytes");
  v4 = -[NSData bytes](self->_data, "bytes");
  v5 = (double *)&v4[-[NSData length](self->_data, "length")];
  v6 = v3 + 1;
  if (v3 == v5 || v6 == v5)
  {
    v10 = v3;
  }
  else
  {
    v9 = *v3;
    v10 = v3;
    v11 = v3 + 1;
    do
    {
      v12 = *v11++;
      v13 = v12;
      if (v9 < v12)
      {
        v9 = v13;
        v10 = v6;
      }
      v6 = v11;
    }
    while (v11 != v5);
  }
  return v10 - v3;
}

- (unint64_t)count
{
  return -[NSData length](self->_data, "length") >> 3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
