@implementation FISimpleHistogram

- (FISimpleHistogram)initWithNumberOfBuckets:(int64_t)a3
{
  FISimpleHistogram *v4;
  FISimpleHistogram *v5;
  FISimpleHistogram *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FISimpleHistogram;
  v4 = -[FISimpleHistogram init](&v8, sel_init);
  v5 = v4;
  if (a3 < 1)
  {
    v6 = 0;
  }
  else
  {
    if (v4)
    {
      v4->_bucketCount = a3;
      v4->_buckets = ($12FC28267955EE572C1AED5C354322B1 *)malloc_type_calloc(a3, 0x10uLL, 0x1000040451B5BE8uLL);
    }
    v6 = v5;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_buckets);
  v3.receiver = self;
  v3.super_class = (Class)FISimpleHistogram;
  -[FISimpleHistogram dealloc](&v3, sel_dealloc);
}

- (int64_t)bucketCount
{
  return self->_bucketCount;
}

- (double)valueForBucketAtIndex:(unint64_t)a3
{
  double result;
  $12FC28267955EE572C1AED5C354322B1 *buckets;
  uint64_t var0;

  result = 0.0;
  if (self->_bucketCount > a3)
  {
    buckets = self->_buckets;
    var0 = buckets[a3].var0;
    if (var0)
      return buckets[a3].var1 / (double)var0;
  }
  return result;
}

- (void)addValue:(double)a3 toBucketAtIndex:(unint64_t)a4
{
  $12FC28267955EE572C1AED5C354322B1 *v4;

  if (self->_bucketCount > a4)
  {
    v4 = &self->_buckets[a4];
    ++v4->var0;
    v4->var1 = v4->var1 + a3;
  }
}

- (int64_t)numberOfValuesInBucketAtIndex:(unint64_t)a3
{
  if (self->_bucketCount <= a3)
    return 0;
  else
    return self->_buckets[a3].var0;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[FISimpleHistogram descriptionArray](self, "descriptionArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptionArray
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  $12FC28267955EE572C1AED5C354322B1 *buckets;
  uint64_t var0;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (self->_bucketCount)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      buckets = self->_buckets;
      var0 = buckets[v4].var0;
      if (var0)
        v8 = buckets[v4].var1 / (double)var0;
      else
        v8 = 0.0;
      objc_msgSend(&stru_24CC50B10, "stringByPaddingToLength:withString:startingAtIndex:", (unint64_t)v8, CFSTR("*"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%02d] %06.2f "), v5, *(_QWORD *)&v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingString:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v11);

      ++v5;
      ++v4;
    }
    while (self->_bucketCount > v5);
  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  FISimpleHistogram *v4;
  const void **v5;
  uint64_t v6;
  BOOL v7;

  v4 = (FISimpleHistogram *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = objc_msgSend(v5, "bucketCount");
      v7 = v6 == -[FISimpleHistogram bucketCount](self, "bucketCount")
        && memcmp(v5[2], self->_buckets, 16 * self->_bucketCount) == 0;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

@end
