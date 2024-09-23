@implementation BCVirtualBrtControl

+ (id)newMonitorWithHandler:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  BCVirtualBrtControl *v9;
  BCBrtMonitor *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v5 = (void *)MEMORY[0x22E2D4EA4](a1, a2, a3, a4);
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCE60], "date");
  if (_failFrom)
    v7 = _failUntil == 0;
  else
    v7 = 1;
  if (!v7
    && (v8 = v6, (void *)objc_msgSend(v6, "laterDate:") == v6)
    && (void *)objc_msgSend(v8, "earlierDate:", _failUntil) == v8)
  {
    v12 = (void *)MEMORY[0x24BDBCF40];
    objc_msgSend((id)_failUntil, "timeIntervalSinceDate:", v8);
    v13 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __51__BCVirtualBrtControl_newMonitorWithHandler_error___block_invoke;
    v17[3] = &unk_24F2A7370;
    v17[4] = a3;
    v14 = (void *)objc_msgSend(v12, "scheduledTimerWithTimeInterval:repeats:block:", 0, v17);
    v15 = v14;
    v10 = objc_alloc_init(BCBrtMonitor);
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __51__BCVirtualBrtControl_newMonitorWithHandler_error___block_invoke_2;
    v16[3] = &unk_24F2A71B0;
    v16[4] = v14;
    -[BCBrtMonitor setCancelHandler:](v10, "setCancelHandler:", v16);
  }
  else
  {
    v9 = objc_alloc_init(BCVirtualBrtControl);
    (*((void (**)(id, BCVirtualBrtControl *))a3 + 2))(a3, v9);

    v10 = objc_alloc_init(BCBrtMonitor);
  }
  objc_autoreleasePoolPop(v5);
  return v10;
}

void __51__BCVirtualBrtControl_newMonitorWithHandler_error___block_invoke(uint64_t a1)
{
  BCVirtualBrtControl *v2;

  v2 = objc_alloc_init(BCVirtualBrtControl);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __51__BCVirtualBrtControl_newMonitorWithHandler_error___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

+ (void)failToCreateDisplaysFor:(double)a3
{

  _failFrom = 0;
  _failUntil = 0;
  _failFrom = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCE60]);
  _failUntil = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceNow:", a3);
}

- (BCVirtualBrtControl)init
{
  BCVirtualBrtControl *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BCVirtualBrtControl;
  v2 = -[BCBrtControl init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x22E2D4EA4]();
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCE60], "date");
    if (_failFrom)
      v5 = _failUntil == 0;
    else
      v5 = 1;
    if (!v5
      && (v6 = v4, (void *)objc_msgSend(v4, "laterDate:") == v4)
      && (void *)objc_msgSend(v6, "earlierDate:", _failUntil) == v6)
    {

      v2 = 0;
    }
    else
    {
      v2->_nits = 0.0;
    }
    objc_autoreleasePoolPop(v3);
  }
  return v2;
}

- (BOOL)setNits:(double)a3 error:(id *)a4
{
  OS_dispatch_queue *v6;
  _QWORD v8[6];

  v6 = -[BCBrtControl queue](self, "queue", a4);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__BCVirtualBrtControl_setNits_error___block_invoke;
  v8[3] = &unk_24F2A71D8;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  dispatch_async((dispatch_queue_t)v6, v8);
  return 1;
}

double __37__BCVirtualBrtControl_setNits_error___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 112) = result;
  return result;
}

- (double)getNitsWithError:(id *)a3
{
  OS_dispatch_queue *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = -[BCBrtControl queue](self, "queue", a3);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__BCVirtualBrtControl_getNitsWithError___block_invoke;
  v7[3] = &unk_24F2A7398;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync((dispatch_queue_t)v4, v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

double __40__BCVirtualBrtControl_getNitsWithError___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 112);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
