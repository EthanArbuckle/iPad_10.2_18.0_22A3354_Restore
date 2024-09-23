@implementation BKHIDEventRecognizerEngine

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8;
  id v9;
  __IOHIDEvent *v10;
  os_unfair_lock_s *p_lock;
  void *v12;
  void *v13;
  id v14;
  int64_t v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  __IOHIDEvent *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v8 = a4;
  v9 = a5;
  v10 = *a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableArray count](self->_recognizers, "count"))
  {
    v12 = (void *)-[NSMutableArray copy](self->_recognizers, "copy");
    v13 = (void *)-[NSMutableArray copy](self->_blocks, "copy");
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__BKHIDEventRecognizerEngine_processEvent_sender_dispatcher___block_invoke;
  v17[3] = &unk_1E81F7A48;
  v20 = v10;
  v14 = v13;
  v18 = v14;
  v19 = &v21;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);
  v15 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v15;
}

- (BKHIDEventRecognizerEngine)init
{
  BKHIDEventRecognizerEngine *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKHIDEventRecognizerEngine;
  result = -[BKHIDEventRecognizerEngine init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)addRecognizer:(id)a3 recognitionBlock:(id)a4
{
  id v7;
  os_unfair_lock_s *p_lock;
  NSMutableArray *recognizers;
  NSMutableArray *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  NSMutableArray *blocks;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v7 = a4;
  if (v18)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKHIDEventRecognizerEngine.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recognizer != nil"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKHIDEventRecognizerEngine.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

LABEL_3:
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  recognizers = self->_recognizers;
  if (!recognizers)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = self->_recognizers;
    self->_recognizers = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    blocks = self->_blocks;
    self->_blocks = v12;

    recognizers = self->_recognizers;
  }
  -[NSMutableArray addObject:](recognizers, "addObject:", v18);
  v14 = self->_blocks;
  v15 = (void *)MEMORY[0x1CAA37E74](v7);
  -[NSMutableArray addObject:](v14, "addObject:", v15);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeRecognizer:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  uint64_t v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = -[NSMutableArray indexOfObject:](self->_recognizers, "indexOfObject:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_recognizers, "removeObjectAtIndex:", v6);
    -[NSMutableArray removeObjectAtIndex:](self->_blocks, "removeObjectAtIndex:", v6);
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSMutableArray)recognizers
{
  return self->_recognizers;
}

- (void)setRecognizers:(id)a3
{
  objc_storeStrong((id *)&self->_recognizers, a3);
}

- (NSMutableArray)blocks
{
  return self->_blocks;
}

- (void)setBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_blocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_recognizers, 0);
}

void __61__BKHIDEventRecognizerEngine_processEvent_sender_dispatcher___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void (**v5)(void);
  char v6;

  v6 = 0;
  if (objc_msgSend(a2, "processEvent:shouldConsume:", *(_QWORD *)(a1 + 48), &v6) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  if (v6)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

@end
