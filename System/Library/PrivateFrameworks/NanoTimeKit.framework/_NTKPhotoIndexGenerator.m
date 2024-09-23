@implementation _NTKPhotoIndexGenerator

- (_NTKPhotoIndexGenerator)initWithSize:(int64_t)a3
{
  _NTKPhotoIndexGenerator *v4;
  _NTKPhotoIndexGenerator *v5;
  NSArray *stepSizes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_NTKPhotoIndexGenerator;
  v4 = -[_NTKPhotoIndexGenerator init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    stepSizes = v4->_stepSizes;
    v4->_stepSizes = (NSArray *)&unk_1E6CA9A78;

    v5->_n = a3;
    v5->_count = 0;
    v5->_prevIndex = a3 - 1;
  }
  return v5;
}

- (void)reset
{
  self->_prevIndex = self->_n - 1;
}

- (void)setIndex:(int64_t)a3
{
  if (self->_n > a3)
    self->_prevIndex = a3;
}

- (int64_t)nextRandom
{
  int64_t n;
  int64_t result;
  int64_t count;
  int64_t prevIndex;
  uint64_t v7;
  void *v8;
  int64_t v9;

  n = self->_n;
  if (n >= 2)
  {
    count = self->_count;
    prevIndex = self->_prevIndex;
    while (1)
    {
      if (count % n)
      {
        v7 = self->_step + prevIndex;
      }
      else
      {
        do
        {
          do
          {
            -[NSArray objectAtIndexedSubscript:](self->_stepSizes, "objectAtIndexedSubscript:", arc4random() % -[NSArray count](self->_stepSizes, "count"));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v8, "integerValue");

          }
          while (v9 == self->_step);
          n = self->_n;
        }
        while (v9 == n);
        self->_step = v9;
        count = self->_count;
        if (!count)
        {
          result = 0;
          goto LABEL_11;
        }
        v7 = arc4random();
        n = self->_n;
        count = self->_count;
      }
      result = v7 % n;
LABEL_11:
      self->_count = ++count;
      self->_prevIndex = result;
      if (prevIndex != result)
        return result;
    }
  }
  return 0;
}

- (int64_t)nextSequential
{
  int64_t n;
  int64_t v3;

  n = self->_n;
  if (n < 2)
    return 0;
  v3 = (self->_prevIndex + 1) % n;
  self->_prevIndex = v3;
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepSizes, 0);
}

@end
