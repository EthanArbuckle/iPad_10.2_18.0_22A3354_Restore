@implementation ICNAHistogramBase

- (ICNAHistogramBase)init
{
  ICNAHistogramBase *v2;
  ICNAHistogramBase *v3;
  NSMutableArray *v4;
  NSMutableArray *countsForEachBucket;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICNAHistogramBase;
  v2 = -[ICNAHistogramBase init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_valuePrecision = 1.0;
    -[ICNAHistogramBase setup](v2, "setup");
    if (!v3->_bucketLeftBounds)
    {
      v3->_bucketLeftBounds = (NSArray *)&unk_1E77509E0;

    }
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    countsForEachBucket = v3->_countsForEachBucket;
    v3->_countsForEachBucket = v4;

    if (-[NSArray count](v3->_bucketLeftBounds, "count"))
    {
      v6 = 0;
      do
      {
        -[NSMutableArray addObject:](v3->_countsForEachBucket, "addObject:", &unk_1E7749E78);
        ++v6;
      }
      while (v6 < -[NSArray count](v3->_bucketLeftBounds, "count"));
    }
  }
  return v3;
}

- (void)reportValue:(double)a3
{
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  float v16;
  double v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  -[ICNAHistogramBase roundedValue:](self, "roundedValue:", a3);
  v5 = v4;
  -[ICNAHistogramBase valueMax](self, "valueMax");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        -[ICNAHistogramBase valueMax](self, "valueMax"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "doubleValue"),
        v10 = v9,
        v8,
        v7,
        v5 <= v10))
  {
    -[ICNAHistogramBase bucketLeftBounds](self, "bucketLeftBounds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = 0;
      while (1)
      {
        -[ICNAHistogramBase bucketLeftBounds](self, "bucketLeftBounds");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        v17 = v16;

        if (v5 < v17)
          break;
        ++v13;
        -[ICNAHistogramBase bucketLeftBounds](self, "bucketLeftBounds");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v13 >= v19)
          goto LABEL_9;
      }
      if (!v13)
        return;
LABEL_9:
      v20 = v13 - 1;
      -[ICNAHistogramBase countsForEachBucket](self, "countsForEachBucket");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23 + 1);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[ICNAHistogramBase countsForEachBucket](self, "countsForEachBucket");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:atIndexedSubscript:", v25, v20);

    }
  }
}

- (id)icasHistogram
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  double v20;
  double v21;
  void *v22;
  ICASHistogramItemData *v23;
  void *v24;
  void *v25;
  ICASHistogramItemData *v26;
  void *v27;
  unint64_t v28;
  void *v29;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[ICNAHistogramBase bucketLeftBounds](self, "bucketLeftBounds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      -[ICNAHistogramBase countsForEachBucket](self, "countsForEachBucket");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedIntegerValue");

      if (v9)
      {
        -[ICNAHistogramBase bucketLeftBounds](self, "bucketLeftBounds");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        v13 = v12;

        -[ICNAHistogramBase bucketLeftBounds](self, "bucketLeftBounds");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count") - 1;

        if (v6 >= v15)
        {
          -[ICNAHistogramBase valueMax](self, "valueMax");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = (void *)MEMORY[0x1E0CB37E8];
          -[ICNAHistogramBase bucketLeftBounds](self, "bucketLeftBounds");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", v6 + 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "floatValue");
          v20 = v19;
          -[ICNAHistogramBase valuePrecision](self, "valuePrecision");
          objc_msgSend(v16, "numberWithDouble:", v20 - v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v23 = [ICASHistogramItemData alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICNAHistogramBase roundedCount:](self, "roundedCount:", v9));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[ICASHistogramItemData initWithLeftBound:rightBound:count:](v23, "initWithLeftBound:rightBound:count:", v24, v22, v25);

        objc_msgSend(v3, "addObject:", v26);
      }
      ++v6;
      -[ICNAHistogramBase bucketLeftBounds](self, "bucketLeftBounds");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");

    }
    while (v6 < v28);
  }
  v29 = (void *)objc_msgSend(v3, "copy");

  return v29;
}

- (double)roundedValue:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[ICNAHistogramBase valuePrecision](self, "valuePrecision");
  v6 = round(a3 / v5);
  -[ICNAHistogramBase valuePrecision](self, "valuePrecision");
  return v7 * v6;
}

- (unint64_t)roundedCount:(unint64_t)a3
{
  return ICNARoundTo2SigFigsInt(a3);
}

- (NSArray)bucketLeftBounds
{
  return self->_bucketLeftBounds;
}

- (void)setBucketLeftBounds:(id)a3
{
  objc_storeStrong((id *)&self->_bucketLeftBounds, a3);
}

- (double)valuePrecision
{
  return self->_valuePrecision;
}

- (void)setValuePrecision:(double)a3
{
  self->_valuePrecision = a3;
}

- (NSNumber)valueMax
{
  return self->_valueMax;
}

- (void)setValueMax:(id)a3
{
  objc_storeStrong((id *)&self->_valueMax, a3);
}

- (NSMutableArray)countsForEachBucket
{
  return self->_countsForEachBucket;
}

- (void)setCountsForEachBucket:(id)a3
{
  objc_storeStrong((id *)&self->_countsForEachBucket, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countsForEachBucket, 0);
  objc_storeStrong((id *)&self->_valueMax, 0);
  objc_storeStrong((id *)&self->_bucketLeftBounds, 0);
}

@end
