@implementation JFXCapturePreviewStats

- (JFXCapturePreviewStats)init
{
  JFXCapturePreviewStats *v2;
  JFXCapturePreviewFrameStats *v3;
  JFXCapturePreviewFrameStats *runningAverage;
  NSMutableArray *v5;
  NSMutableArray *stats;
  dispatch_queue_t v7;
  OS_dispatch_queue *q;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)JFXCapturePreviewStats;
  v2 = -[JFXCapturePreviewStats init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(JFXCapturePreviewFrameStats);
    runningAverage = v2->_runningAverage;
    v2->_runningAverage = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    stats = v2->_stats;
    v2->_stats = v5;

    v7 = dispatch_queue_create("com.apple.clips.previewStatsQ", 0);
    q = v2->_q;
    v2->_q = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (id)add:(id)a3
{
  id v4;
  NSObject *q;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  JFXCapturePreviewFrameStats *v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__5;
    v15 = __Block_byref_object_dispose__5;
    v16 = objc_alloc_init(JFXCapturePreviewFrameStats);
    q = self->_q;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__JFXCapturePreviewStats_add___block_invoke;
    block[3] = &unk_24EE583D0;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(q, block);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __30__JFXCapturePreviewStats_add___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t i;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "dropped");
  if ((result & 1) == 0)
  {
    for (i = 0; i != 48; i += 8)
    {
      v4 = *(double *)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "times") + i);
      v5 = (double)(unint64_t)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count") - 1);
      v6 = *(double *)(objc_msgSend(*(id *)(a1 + 40), "times") + i) + v4 * v5;
      v7 = v6 / (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
      *(double *)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "times") + i) = v7;
      v8 = *(_QWORD *)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "times") + i);
      result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "times");
      *(_QWORD *)(result + i) = v8;
    }
  }
  return result;
}

- (id)runningAverage
{
  NSObject *q;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  JFXCapturePreviewFrameStats *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = objc_alloc_init(JFXCapturePreviewFrameStats);
  q = self->_q;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__JFXCapturePreviewStats_runningAverage__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(q, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __40__JFXCapturePreviewStats_runningAverage__block_invoke(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t result;

  for (i = 0; i != 48; i += 8)
  {
    v3 = *(_QWORD *)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "times") + i);
    result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "times");
    *(_QWORD *)(result + i) = v3;
  }
  return result;
}

- (void)print
{
  NSObject *q;
  _QWORD block[5];

  q = self->_q;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__JFXCapturePreviewStats_print__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(q, block);
}

uint64_t __31__JFXCapturePreviewStats_print__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_print_NoLock");
}

- (void)printSync
{
  NSObject *q;
  _QWORD block[5];

  q = self->_q;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__JFXCapturePreviewStats_printSync__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_sync(q, block);
}

uint64_t __35__JFXCapturePreviewStats_printSync__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_print_NoLock");
}

- (void)_print_NoLock
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v2, v3, "------------ Jetty Frame Stats BEGIN [%@] -----------", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)clear
{
  NSObject *q;
  _QWORD block[5];

  q = self->_q;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__JFXCapturePreviewStats_clear__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(q, block);
}

void __31__JFXCapturePreviewStats_clear__block_invoke(uint64_t a1)
{
  JFXCapturePreviewFrameStats *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  v2 = objc_alloc_init(JFXCapturePreviewFrameStats);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_runningAverage, 0);
}

@end
