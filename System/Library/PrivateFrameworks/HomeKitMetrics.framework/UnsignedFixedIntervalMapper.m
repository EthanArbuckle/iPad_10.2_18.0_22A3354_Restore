@implementation UnsignedFixedIntervalMapper

- (UnsignedFixedIntervalMapper)initWithBins:(id)a3 intervalCreationBlock:(id)a4 valueComparisonBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  UnsignedFixedIntervalMapper *v11;
  uint64_t v12;
  id creationBlock;
  uint64_t v14;
  id comparisonBlock;
  void *v16;
  unint64_t v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  void *v25;
  uint64_t v26;
  NSArray *intervals;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)UnsignedFixedIntervalMapper;
  v11 = -[UnsignedFixedIntervalMapper init](&v29, sel_init);
  if (v11)
  {
    v12 = MEMORY[0x1D17B7A7C](v9);
    creationBlock = v11->_creationBlock;
    v11->_creationBlock = (id)v12;

    v14 = MEMORY[0x1D17B7A7C](v10);
    comparisonBlock = v11->_comparisonBlock;
    v11->_comparisonBlock = (id)v14;

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count") + 1);
    if (objc_msgSend(v8, "count"))
    {
      v17 = 0;
      v18 = &unk_1E8991EA0;
      do
      {
        -[UnsignedFixedIntervalMapper creationBlock](v11, "creationBlock");
        v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *))v19)[2](v19, v18, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v21);

        objc_msgSend(v8, "objectAtIndexedSubscript:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        ++v17;
        v18 = v22;
      }
      while (objc_msgSend(v8, "count") > v17);
    }
    else
    {
      v22 = &unk_1E8991EA0;
    }
    -[UnsignedFixedIntervalMapper creationBlock](v11, "creationBlock");
    v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    +[HMMInterval positiveInfinityEnd](HMMInterval, "positiveInfinityEnd");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v23)[2](v23, v22, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v25);

    v26 = objc_msgSend(v16, "copy");
    intervals = v11->_intervals;
    v11->_intervals = (NSArray *)v26;

  }
  return v11;
}

- (id)intervalIndexForValue:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  unint64_t v14;

  -[UnsignedFixedIntervalMapper intervals](self, "intervals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      -[UnsignedFixedIntervalMapper comparisonBlock](self, "comparisonBlock");
      v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[UnsignedFixedIntervalMapper intervals](self, "intervals");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "end");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = ((uint64_t (**)(_QWORD, unint64_t, void *))v8)[2](v8, a3, v11);

      if (v12)
        break;
      ++v7;
      -[UnsignedFixedIntervalMapper intervals](self, "intervals");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count") - 1;

    }
    while (v7 < v14);
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
}

- (id)intervalForValue:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[UnsignedFixedIntervalMapper intervals](self, "intervals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UnsignedFixedIntervalMapper intervalIndexForValue:](self, "intervalIndexForValue:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "unsignedIntValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)intervals
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)creationBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)comparisonBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparisonBlock, 0);
  objc_storeStrong(&self->_creationBlock, 0);
  objc_storeStrong((id *)&self->_intervals, 0);
}

@end
