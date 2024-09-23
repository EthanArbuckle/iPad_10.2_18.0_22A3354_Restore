@implementation TDRenditionsDistiller

- (TDRenditionsDistiller)initWithDocument:(id)a3 shouldCompressCSIDataFlag:(BOOL)a4
{
  TDRenditionsDistiller *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TDRenditionsDistiller;
  v6 = -[TDRenditionsDistiller init](&v8, sel_init);
  if (v6)
  {
    v6->document = (CoreThemeDocument *)a3;
    v6->shouldCompressCSIDataFlag = a4;
    v6->renditionInQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6->csiDataInfoOutQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6->inQueueLock = (NSConditionLock *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
    v6->outQueueLock = (NSConditionLock *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
    v6->_group = (OS_dispatch_group *)dispatch_group_create();
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_group);
  -[TDRenditionsDistiller setLogger:](self, "setLogger:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TDRenditionsDistiller;
  -[TDRenditionsDistiller dealloc](&v3, sel_dealloc);
}

- (void)_enqueueOnQueue:(id)a3 withQueueLock:(id)a4 object:(id)a5
{
  objc_msgSend(a4, "lock");
  objc_msgSend(a3, "addObject:", a5);
  objc_msgSend(a4, "unlockWithCondition:", 1);
}

- (void)_enqueueOnInQueueTheObject:(id)a3
{
  -[TDRenditionsDistiller _enqueueOnQueue:withQueueLock:object:](self, "_enqueueOnQueue:withQueueLock:object:", self->renditionInQueue, self->inQueueLock, a3);
}

- (void)_enqueueOnOutQueueTheObject:(id)a3
{
  -[TDRenditionsDistiller _enqueueOnQueue:withQueueLock:object:](self, "_enqueueOnQueue:withQueueLock:object:", self->csiDataInfoOutQueue, self->outQueueLock, a3);
}

- (void)_enqueueLastCSIDataInfoFlag
{
  -[TDRenditionsDistiller _enqueueOnOutQueueTheObject:](self, "_enqueueOnOutQueueTheObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0));
}

- (void)_enqueueDistillingAbortedInfo
{
  -[NSConditionLock lock](self->outQueueLock, "lock");
  -[NSMutableArray insertObject:atIndex:](self->csiDataInfoOutQueue, "insertObject:atIndex:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1), CFSTR("DistillingAborted")), 0);
  -[NSConditionLock unlockWithCondition:](self->outQueueLock, "unlockWithCondition:", 1);
}

- (id)_nextObjectFromInQueue
{
  id v2;
  uint64_t v5;
  uint64_t v6;

  if (self->noMoreRenditions)
    return 0;
  -[NSConditionLock lockWhenCondition:](self->inQueueLock, "lockWhenCondition:", 1);
  v5 = -[NSMutableArray count](self->renditionInQueue, "count");
  if (!v5)
  {
    -[NSConditionLock unlockWithCondition:](self->inQueueLock, "unlockWithCondition:", 0);
    return 0;
  }
  v6 = v5;
  v2 = (id)-[NSMutableArray objectAtIndex:](self->renditionInQueue, "objectAtIndex:", 0);
  -[NSMutableArray removeObjectAtIndex:](self->renditionInQueue, "removeObjectAtIndex:", 0);
  -[NSConditionLock unlockWithCondition:](self->inQueueLock, "unlockWithCondition:", v6 != 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v2, "integerValue"))
    {
      if (objc_msgSend(v2, "integerValue") != 1)
        return v2;
    }
    else
    {
      v2 = 0;
    }
    self->noMoreRenditions = 1;
  }
  return v2;
}

- (void)_distill:(id)a3
{
  TDLogger *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *context;
  _QWORD v16[8];

  context = (void *)MEMORY[0x2276A576C](self, a2, a3);
  v4 = -[TDRenditionsDistiller logger](self, "logger");
  *(_WORD *)&self->noMoreCSIDataInfo = 0;
  v5 = 5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
  do
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
    objc_msgSend(v7, "setPersistentStoreCoordinator:", objc_msgSend((id)objc_msgSend(-[CoreThemeDocument mocOrganizer](self->document, "mocOrganizer"), "mainMOC"), "persistentStoreCoordinator"));
    objc_msgSend(v7, "setUndoManager:", 0);
    objc_msgSend(v6, "addObject:", v7);

    --v5;
  }
  while (v5);
  v8 = -[TDRenditionsDistiller _nextObjectFromInQueue](self, "_nextObjectFromInQueue");
  if (v8)
  {
    v9 = v8;
    v10 = 1;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      v12 = (void *)MEMORY[0x2276A576C]();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v9, "integerValue") == 1)
        {
          -[TDRenditionsDistiller _enqueueDistillingAbortedInfo](self, "_enqueueDistillingAbortedInfo");
          objc_autoreleasePoolPop(v12);
          break;
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDRenditionsDistiller.m"), 196, CFSTR("TDRenditionsDistiller unrecognized flag in renditionsInQueue."));
      }
      v13 = (void *)objc_msgSend(v6, "objectAtIndex:", v10 % 5);
      dispatch_group_enter((dispatch_group_t)self->_group);
      v16[0] = v11;
      v16[1] = 3221225472;
      v16[2] = __34__TDRenditionsDistiller__distill___block_invoke;
      v16[3] = &unk_24EF2C848;
      v16[4] = v13;
      v16[5] = v9;
      v16[6] = self;
      v16[7] = v4;
      objc_msgSend(v13, "performBlock:", v16);
      objc_autoreleasePoolPop(v12);
      v9 = -[TDRenditionsDistiller _nextObjectFromInQueue](self, "_nextObjectFromInQueue");
      ++v10;
    }
    while (v9);
  }
  -[TDRenditionsDistiller waitUntilFinished](self, "waitUntilFinished");
  -[TDRenditionsDistiller _enqueueLastCSIDataInfoFlag](self, "_enqueueLastCSIDataInfoFlag");

  objc_autoreleasePoolPop(context);
}

void __34__TDRenditionsDistiller__distill___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectWithID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "updateRenditionSpec:", v2);
  v3 = objc_msgSend(v2, "createCSIRepresentationWithCompression:colorSpaceID:document:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 48), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "colorSpaceID"), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "_enqueueCSIDataInfo:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v3, CFSTR("CSIData"), *(_QWORD *)(a1 + 40), CFSTR("RenditionSpec"), 0));
    objc_msgSend(*(id *)(a1 + 32), "reset");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "logErrorWithFormat:", CFSTR("ERROR: CSI Data was nil for rendition spec %@"), v2);
    objc_msgSend(*(id *)(a1 + 48), "_enqueueDistillingAbortedInfo");
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 48) + 56));
}

- (void)waitUntilFinished
{
  dispatch_group_wait((dispatch_group_t)self->_group, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)detachDistillationThread
{
  objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel__distill_, self, 0);
}

- (void)enqueueLastRenditionFlag
{
  -[TDRenditionsDistiller _enqueueOnInQueueTheObject:](self, "_enqueueOnInQueueTheObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0));
}

- (void)enqueueAbortFlag
{
  -[NSConditionLock lock](self->inQueueLock, "lock");
  -[NSMutableArray insertObject:atIndex:](self->renditionInQueue, "insertObject:atIndex:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1), 0);
  -[NSConditionLock unlockWithCondition:](self->inQueueLock, "unlockWithCondition:", 1);
}

- (void)enqueueRenditionSpec:(id)a3
{
  -[TDRenditionsDistiller _enqueueOnInQueueTheObject:](self, "_enqueueOnInQueueTheObject:", objc_msgSend(a3, "objectID"));
}

- (id)nextCSIDataInfoFromQueue
{
  id v2;
  uint64_t v6;
  uint64_t v7;

  if (!self->noMoreCSIDataInfo)
  {
    -[NSConditionLock lockWhenCondition:](self->outQueueLock, "lockWhenCondition:", 1);
    v6 = -[NSMutableArray count](self->csiDataInfoOutQueue, "count");
    if (v6)
    {
      v7 = v6;
      v2 = (id)-[NSMutableArray objectAtIndex:](self->csiDataInfoOutQueue, "objectAtIndex:", 0);
      -[NSMutableArray removeObjectAtIndex:](self->csiDataInfoOutQueue, "removeObjectAtIndex:", 0);
      -[NSConditionLock unlockWithCondition:](self->outQueueLock, "unlockWithCondition:", v7 != 1);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v2;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v2, "integerValue"))
      {
        v2 = 0;
        self->noMoreCSIDataInfo = 1;
        return v2;
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDRenditionsDistiller.m"), 290, CFSTR("TDRenditionsDistiller found unexpected object in outQueue"));
    }
    else
    {
      -[NSConditionLock unlockWithCondition:](self->outQueueLock, "unlockWithCondition:", 0);
    }
  }
  return 0;
}

- (TDLogger)logger
{
  return (TDLogger *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

@end
