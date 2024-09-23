@implementation MovingAverage

- (MovingAverage)initWithWindowSize:(unint64_t)a3
{
  MovingAverage *v4;
  MovingAverage *v5;
  uint64_t v6;
  NSMutableArray *queue;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MovingAverage;
  v4 = -[MovingAverage init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    if (!a3)
    {
      v9 = (void *)MEMORY[0x24BDBCE88];
      v10 = *MEMORY[0x24BDBCAB8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid parameter for windowSize: %lu, windowSize must be > 0"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v12);
    }
    v4->_windowSize = a3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    queue = v5->_queue;
    v5->_queue = (NSMutableArray *)v6;

    v5->_movingAverage = 0.0;
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)addNumber:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  MovingAverageEntry *v10;
  void *v11;
  double v12;
  void *v13;
  _QWORD v14[5];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  if (-[MovingAverage windowSize](self, "windowSize"))
  {
    os_unfair_lock_lock_with_options();
    -[MovingAverage queue](self, "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    v7 = -[MovingAverage windowSize](self, "windowSize");

    if (v6 >= v7)
    {
      -[MovingAverage queue](self, "queue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmf_removeFirstObject");

    }
    -[MovingAverage queue](self, "queue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MovingAverageEntry initWithValue:]([MovingAverageEntry alloc], "initWithValue:", v4);
    objc_msgSend(v9, "addObject:", v10);

    v15 = 0;
    v16 = (double *)&v15;
    v17 = 0x2020000000;
    v18 = 0;
    -[MovingAverage queue](self, "queue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __27__MovingAverage_addNumber___block_invoke;
    v14[3] = &unk_24DBEA7E8;
    v14[4] = &v15;
    objc_msgSend(v11, "na_each:", v14);

    v12 = v16[3];
    -[MovingAverage queue](self, "queue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MovingAverage setMovingAverage:](self, "setMovingAverage:", v12 / (double)(unint64_t)objc_msgSend(v13, "count"));

    _Block_object_dispose(&v15, 8);
    os_unfair_lock_unlock(&self->_lock);
  }

}

void __27__MovingAverage_addNumber___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  objc_msgSend(a2, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);

}

- (double)movingAverageForInterval:(double)a3 defaultValue:(double)a4
{
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  id v10;
  int v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  double v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[MovingAverage queue](self, "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__MovingAverage_movingAverageForInterval_defaultValue___block_invoke;
  v13[3] = &unk_24DBEA810;
  v10 = v8;
  v17 = a3;
  v14 = v10;
  v15 = &v18;
  v16 = &v22;
  objc_msgSend(v9, "na_each:", v13);

  v11 = *((_DWORD *)v23 + 6);
  if (v11)
    a4 = v19[3] / (double)v11;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  os_unfair_lock_unlock(p_lock);
  return a4;
}

void __55__MovingAverage_movingAverageForInterval_defaultValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10 = v3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  if (v7 < *(double *)(a1 + 56))
  {
    objc_msgSend(v10, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);

    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

- (double)movingAverage
{
  return self->_movingAverage;
}

- (void)setMovingAverage:(double)a3
{
  self->_movingAverage = a3;
}

- (NSMutableArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)windowSize
{
  return self->_windowSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
