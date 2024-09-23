@implementation BWNRFProcessorCompletionStatus

- (_QWORD)initWithCompletionStatus:(void *)a1
{
  _QWORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)BWNRFProcessorCompletionStatus;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
    v3[1] = a2;
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNRFProcessorCompletionStatus;
  -[BWNRFProcessorCompletionStatus dealloc](&v3, sel_dealloc);
}

- (BOOL)waitForCompletionWithDescriptionOut:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v13;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "waitForCompletion");
  v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "metalExecutionStatus"), "status");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  v7 = BWMTLCommandBufferStatusToShortString(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "metalExecutionStatus"), "status"));
  v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "metalExecutionStatus"), "completedCommandBuffersCount");
  v9 = v4 == 4;
  v10 = v4 == 4;
  if (v9)
    v11 = objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p>: Status: %@. Completed command buffers:%d"), v6, a1, v7, v8, v13);
  else
    v11 = objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p>: Status: %@. Completed command buffers:%d. Failed command buffers: %@"), v6, a1, v7, v8, objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "metalExecutionStatus"), "failedCommandBuffers"), "componentsJoinedByString:", CFSTR(",")));
  if (a2)
    *a2 = v11;
  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: Current status: %d"), objc_opt_class(), self, objc_msgSend((id)-[NRFCompletionStatus metalExecutionStatus](self->_completionStatus, "metalExecutionStatus"), "status"));
}

@end
