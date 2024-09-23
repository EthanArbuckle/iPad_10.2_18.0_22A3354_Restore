@implementation ANAnalyticsCounter

- (ANAnalyticsCounter)init
{
  ANAnalyticsCounter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ANAnalyticsCounter;
  result = -[ANAnalyticsCounter init](&v3, sel_init);
  if (result)
  {
    result->_hexCount = 0;
    result->_count = 0;
  }
  return result;
}

- (ANAnalyticsCounter)initWithHexCount:(unint64_t)a3
{
  ANAnalyticsCounter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ANAnalyticsCounter;
  result = -[ANAnalyticsCounter init](&v5, sel_init);
  if (result)
  {
    result->_hexCount = a3;
    result->_count = a3 & 0xF;
  }
  return result;
}

- (void)append:(unint64_t)a3
{
  unsigned int count;
  unsigned int v4;
  unint64_t v5;

  count = self->_count;
  if (count <= 9)
  {
    v4 = count + 1;
    self->_count = v4;
    v5 = 10;
    if (a3 < 0xA)
      v5 = a3;
    self->_hexCount |= v5 << (4 * v4);
  }
}

- (void)finished
{
  self->_hexCount |= self->_count;
}

- (id)payload:(id)a3 keyTwo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  if (self->_count)
  {
    v9 = 1;
    v10 = 4;
    do
    {
      v11 = (self->_hexCount >> v10) & 0xF;
      v16[0] = v6;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v7;
      v17[0] = v12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v14);

      v9 = (v9 + 1);
      v10 += 4;
    }
    while (v9 <= self->_count);
  }

  return v8;
}

- (unint64_t)hexCount
{
  return self->_hexCount;
}

- (void)setHexCount:(unint64_t)a3
{
  self->_hexCount = a3;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  self->_count = a3;
}

@end
