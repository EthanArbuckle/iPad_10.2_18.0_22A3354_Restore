@implementation NTKMovingMedian

- (NTKMovingMedian)initWithSampleSize:(unint64_t)a3
{
  NTKMovingMedian *v4;
  NTKMovingMedian *v5;
  uint64_t v6;
  NSMutableArray *values;

  v4 = -[NTKMovingMedian init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_sampleSize = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    values = v5->_values;
    v5->_values = (NSMutableArray *)v6;

  }
  return v5;
}

- (uint64_t)_entryAtIndex:(uint64_t)result
{
  void *v2;
  _QWORD v3[2];

  if (result)
  {
    objc_msgSend(*(id *)(result + 24), "objectAtIndex:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = 0;
    v3[1] = 0;
    objc_msgSend(v2, "getValue:size:", v3, 16);

    return v3[0];
  }
  return result;
}

- (void)addNewValue:(double)a3
{
  void *v4;
  uint64_t v5;
  unint64_t sampleSize;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v14;
  double v15;
  NSMutableArray *values;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  __uint64_t v21;

  v20 = a3;
  v21 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B18]), "initWithBytes:objCType:", &v20, "{_SortedEntry=dQ}");
  v5 = -[NSMutableArray count](self->_values, "count");
  sampleSize = self->_sampleSize;
  if (v5 == sampleSize && sampleSize != 0)
  {
    if (-[NSMutableArray count](self->_values, "count"))
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      do
      {
        -[NTKMovingMedian _entryAtIndex:]((uint64_t)self, v10);
        if (v10)
          v12 = v11 >= v8;
        else
          v12 = 0;
        if (!v12)
        {
          v9 = v10;
          v8 = v11;
        }
        ++v10;
      }
      while (v10 < -[NSMutableArray count](self->_values, "count", *(_QWORD *)&v20, v21));
    }
    else
    {
      v9 = 0;
    }
    -[NSMutableArray removeObjectAtIndex:](self->_values, "removeObjectAtIndex:", v9, *(_QWORD *)&v20);
  }
  if (-[NSMutableArray count](self->_values, "count", *(_QWORD *)&v20))
  {
    v14 = 0;
    while (1)
    {
      v15 = COERCE_DOUBLE(-[NTKMovingMedian _entryAtIndex:]((uint64_t)self, v14));
      values = self->_values;
      if (v20 < v15)
        break;
      if (++v14 >= (unint64_t)-[NSMutableArray count](values, "count"))
        goto LABEL_23;
    }
    -[NSMutableArray insertObject:atIndex:](values, "insertObject:atIndex:", v4, v14);
  }
  else
  {
LABEL_23:
    -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  }
  v17 = (unint64_t)-[NSMutableArray count](self->_values, "count") >> 1;
  if ((-[NSMutableArray count](self->_values, "count") & 1) != 0)
  {
    v19 = COERCE_DOUBLE(-[NTKMovingMedian _entryAtIndex:]((uint64_t)self, v17));
  }
  else
  {
    v18 = COERCE_DOUBLE(-[NTKMovingMedian _entryAtIndex:]((uint64_t)self, v17 - 1));
    v19 = (v18 + COERCE_DOUBLE(-[NTKMovingMedian _entryAtIndex:]((uint64_t)self, v17))) * 0.5;
  }
  -[NTKMovingMedian setCurrentValue:](self, "setCurrentValue:", v19);

}

- (unint64_t)sampleCount
{
  return -[NSMutableArray count](self->_values, "count");
}

- (double)currentValue
{
  return self->_currentValue;
}

- (void)setCurrentValue:(double)a3
{
  self->_currentValue = a3;
}

- (unint64_t)sampleSize
{
  return self->_sampleSize;
}

- (void)setSampleSize:(unint64_t)a3
{
  self->_sampleSize = a3;
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
