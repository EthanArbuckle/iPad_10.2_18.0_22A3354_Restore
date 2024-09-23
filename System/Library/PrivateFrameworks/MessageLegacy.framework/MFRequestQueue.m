@implementation MFRequestQueue

- (MFRequestQueue)init
{
  MFRequestQueue *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFRequestQueue;
  v2 = -[MFRequestQueue init](&v4, sel_init);
  if (v2)
  {
    v2->_condition = (NSConditionLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46070]), "initWithName:condition:andDelegate:", CFSTR("condition"), 0, v2);
    v2->_requests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_consumers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v2;
}

- (void)addRequest:(id)a3 consumer:(id)a4
{
  uint64_t v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = a3;
  v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = a4;
  -[MFRequestQueue addRequests:consumers:](self, "addRequests:consumers:", v6, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1));
}

- (void)addRequests:(id)a3 consumers:(id)a4
{
  unsigned int waitingOutside;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  _BOOL8 v12;

  _MFLockGlobalLock();
  ++self->_waitingOutside;
  -[MFRequestQueue willAddRequests:consumers:](self, "willAddRequests:consumers:", a3, a4);
  -[NSMutableArray addObjectsFromArray:](self->_requests, "addObjectsFromArray:", a3);
  -[NSMutableArray addObjectsFromArray:](self->_consumers, "addObjectsFromArray:", a4);
  _MFUnlockGlobalLock();
  -[NSConditionLock lockWhenCondition:](self->_condition, "lockWhenCondition:", 0);
  _MFLockGlobalLock();
  waitingOutside = self->_waitingOutside;
  v8 = self->_waitingInside + 1;
  self->_waitingInside = v8;
  if (waitingOutside != v8)
  {
    _MFUnlockGlobalLock();
    v10 = 0;
    goto LABEL_5;
  }
  v9 = (void *)-[NSMutableArray copy](self->_requests, "copy");
  -[NSMutableArray removeAllObjects](self->_requests, "removeAllObjects");
  self->_waitingOutside = 0;
  v10 = (void *)-[NSMutableArray copy](self->_consumers, "copy");
  -[NSMutableArray removeAllObjects](self->_consumers, "removeAllObjects");
  _MFUnlockGlobalLock();
  if (!v9)
  {
LABEL_5:

    -[NSConditionLock unlock](self->_condition, "unlock");
    -[NSConditionLock lockWhenCondition:](self->_condition, "lockWhenCondition:", 1);
    goto LABEL_6;
  }
  -[MFRequestQueue _processRequests:consumers:](self, "_processRequests:consumers:", v9, v10);

LABEL_6:
  _MFLockGlobalLock();
  v11 = self->_waitingInside - 1;
  self->_waitingInside = v11;
  v12 = v11 != 0;
  _MFUnlockGlobalLock();
  -[NSConditionLock unlockWithCondition:](self->_condition, "unlockWithCondition:", v12);
}

- (void)processRequest:(id)a3 consumer:(id)a4
{
  objc_msgSend(a4, "handleResponse:error:", a3, 0);
}

- (void)_processRequests:(id)a3 consumers:(id)a4
{
  -[MFRequestQueue processRequests:consumers:](self, "processRequests:consumers:", a3, a4);
}

- (void)processRequests:(id)a3 consumers:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t i;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v7 = objc_msgSend(a3, "count");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[MFRequestQueue processRequest:consumer:](self, "processRequest:consumer:", objc_msgSend(a3, "objectAtIndex:", i), objc_msgSend(a4, "objectAtIndex:", i));
  }
}

- (void)dealloc
{
  objc_super v4;

  if (self->_waitingInside)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RequestQueue.m"), 120, CFSTR("nobody should be waiting at -dealloc time"));
  if (self->_waitingOutside)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RequestQueue.m"), 121, CFSTR("nobody should be waiting at -dealloc time"));

  v4.receiver = self;
  v4.super_class = (Class)MFRequestQueue;
  -[MFRequestQueue dealloc](&v4, sel_dealloc);
}

@end
