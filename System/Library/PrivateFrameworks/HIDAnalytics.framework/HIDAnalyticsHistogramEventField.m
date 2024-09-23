@implementation HIDAnalyticsHistogramEventField

- (void)dealloc
{
  _HIDAnalyticsHistogramSegment *segments;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  segments = self->_segments;
  if (segments)
  {
    v4 = -1;
    v5 = 8;
    while (++v4 < (unint64_t)self->_segmentCount)
    {
      if (*(_QWORD *)(&segments->var0 + v5))
      {
        free(*(void **)(&segments->var0 + v5));
        segments = self->_segments;
      }
      v5 += 16;
      if (!segments)
        goto LABEL_9;
    }
    free(segments);
  }
LABEL_9:
  v6.receiver = self;
  v6.super_class = (Class)HIDAnalyticsHistogramEventField;
  -[HIDAnalyticsHistogramEventField dealloc](&v6, sel_dealloc);
}

- (HIDAnalyticsHistogramEventField)initWithAttributes:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5
{
  id v9;
  HIDAnalyticsHistogramEventField *v10;
  HIDAnalyticsHistogramEventField *v11;
  HIDAnalyticsHistogramEventField *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HIDAnalyticsHistogramEventField;
  v10 = -[HIDAnalyticsHistogramEventField init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fieldName, a3);
    -[HIDAnalyticsHistogramEventField createBuckets:count:](v11, "createBuckets:count:", a4, a5);
    v12 = v11;
  }

  return v11;
}

- (void)createBuckets:(_HIDAnalyticsHistogramSegmentConfig *)a3 count:(int64_t)a4
{
  _HIDAnalyticsHistogramSegment *v7;
  uint64_t v8;
  NSObject *v9;
  _HIDAnalyticsHistogramSegmentConfig *v10;
  unint64_t var3;
  uint64_t v12;
  NSString *fieldName;
  int var2;
  uint64_t var0;
  uint64_t v16;
  int var1;
  _WORD *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  NSString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  self->_segmentCount = a4;
  v7 = (_HIDAnalyticsHistogramSegment *)malloc_type_malloc(16 * a4, 0x10200408CB94CA5uLL);
  self->_segments = v7;
  bzero(v7, 16 * self->_segmentCount);
  if (a4 >= 1)
  {
    v8 = 0;
    v9 = MEMORY[0x24BDACB70];
    do
    {
      v10 = &a3[v8];
      var3 = v10->var3;
      if (var3 <= 1)
        v12 = 1;
      else
        v12 = v10->var3;
      if (var3 >= 2 && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        fieldName = self->_fieldName;
        *(_DWORD *)buf = 134218242;
        v20 = v12;
        v21 = 2112;
        v22 = fieldName;
        _os_log_impl(&dword_215A4E000, v9, OS_LOG_TYPE_DEFAULT, "HIDAnalytics higher value normalizer %llu for field %@ , reduce to 1 ", buf, 0x16u);
      }
      var2 = v10->var2;
      var0 = v10->var0;
      self->_segments[v8].var0 = var0;
      self->_segments[v8].var1 = (_HIDAnalyticsHistogramBucket *)malloc_type_malloc(6 * var0, 0x10000405D080610uLL);
      bzero(self->_segments[v8].var1, 6 * v10->var0);
      v16 = v10->var0;
      if (v10->var0)
      {
        var1 = a3[v8].var1;
        v18 = (_WORD *)((char *)self->_segments[v8].var1 + 2);
        do
        {
          *(v18 - 1) = var2;
          var2 += var1;
          *v18 = var2;
          v18 += 3;
          --v16;
        }
        while (v16);
      }
      ++v8;
    }
    while (v8 != a4);
  }
}

- (NSString)fieldName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)value
{
  void *v3;
  id v4;
  uint64_t segmentCount;
  uint64_t v6;
  _HIDAnalyticsHistogramSegment *segments;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x2199EB5DC](self, a2);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  segmentCount = self->_segmentCount;
  if (self->_segmentCount)
  {
    v6 = 0;
    segments = self->_segments;
    do
    {
      if (segments[v6].var0)
      {
        v8 = 0;
        v9 = 4;
        do
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *((unsigned __int8 *)segments[v6].var1 + v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v8;
          segments = self->_segments;
          v9 += 6;
        }
        while (v8 < segments[v6].var0);
      }
      ++v6;
    }
    while (v6 != segmentCount);
  }
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (void)setIntegerValue:(unint64_t)a3
{
  uint64_t segmentCount;
  uint64_t v4;
  _HIDAnalyticsHistogramSegment *segments;
  uint64_t v6;
  _HIDAnalyticsHistogramBucket *var1;
  uint64_t v8;

  segmentCount = self->_segmentCount;
  if (self->_segmentCount)
  {
    v4 = 0;
    segments = self->_segments;
    do
    {
      if (segments[v4].var0)
      {
        v6 = 0;
        var1 = segments[v4].var1;
        v8 = 6 * segments[v4].var0;
        do
        {
          if (!(_DWORD)v6 && (unsigned __int16)a3 <= *(unsigned __int16 *)((char *)var1 + v6)
            || (_DWORD)v8 - 6 == (_DWORD)v6
            && (unsigned __int16)a3 > *(unsigned __int16 *)((char *)var1 + v6 + 2)
            || (unsigned __int16)a3 > *(unsigned __int16 *)((char *)var1 + v6)
            && (unsigned __int16)a3 <= *(unsigned __int16 *)((char *)var1 + v6 + 2))
          {
            ++*((_BYTE *)var1 + v6 + 4);
          }
          v6 += 6;
        }
        while (v8 != v6);
      }
      ++v4;
    }
    while (v4 != segmentCount);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldName, 0);
}

- (void)setValue:(id)a3
{
  char v4;
  unsigned int segmentCount;
  unint64_t v6;
  _HIDAnalyticsHistogramSegment *segments;
  uint64_t var0;
  _BYTE *v9;

  v4 = objc_msgSend(a3, "unsignedIntegerValue");
  segmentCount = self->_segmentCount;
  if (self->_segmentCount)
  {
    v6 = 0;
    segments = self->_segments;
    do
    {
      var0 = segments[v6].var0;
      if (segments[v6].var0)
      {
        v9 = (char *)segments[v6].var1 + 4;
        do
        {
          *v9 = v4;
          v9 += 6;
          --var0;
        }
        while (var0);
        segmentCount = self->_segmentCount;
      }
      ++v6;
    }
    while (v6 < segmentCount);
  }
}

@end
