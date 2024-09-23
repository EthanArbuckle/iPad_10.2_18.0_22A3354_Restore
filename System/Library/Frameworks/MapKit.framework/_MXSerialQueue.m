@implementation _MXSerialQueue

- (_MXSerialQueue)init
{
  _MXSerialQueue *v2;
  dispatch_group_t v3;
  OS_dispatch_group *previousTaskGroup;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MXSerialQueue;
  v2 = -[_MXSerialQueue init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_group_create();
    previousTaskGroup = v2->_previousTaskGroup;
    v2->_previousTaskGroup = (OS_dispatch_group *)v3;

  }
  return v2;
}

+ (id)taskInsertionQueue
{
  if (_MergedGlobals_167 != -1)
    dispatch_once(&_MergedGlobals_167, &__block_literal_global_94);
  return (id)qword_1ECE2DD80;
}

+ (id)taskCompletionQueue
{
  if (qword_1ECE2DD88 != -1)
    dispatch_once(&qword_1ECE2DD88, &__block_literal_global_2_0);
  return (id)qword_1ECE2DD90;
}

+ (id)taskQueue
{
  return dispatch_get_global_queue(21, 0);
}

- (void)addTask:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "taskInsertionQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26___MXSerialQueue_addTask___block_invoke;
    block[3] = &unk_1E20D8238;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTaskGroup, 0);
}

@end
