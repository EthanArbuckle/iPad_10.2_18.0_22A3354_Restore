@implementation AVOutputContextDestinationChange

- (AVOutputContextDestinationChange)init
{
  AVOutputContextDestinationChange *v2;
  AVOutputContextDestinationChangeInternal *v3;
  AVOutputContextDestinationChange *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVOutputContextDestinationChange;
  v2 = -[AVOutputContextDestinationChange init](&v6, sel_init);
  if (v2 && (v3 = objc_alloc_init(AVOutputContextDestinationChangeInternal), (v2->_ivars = v3) != 0))
  {
    v2->_ivars->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.outputcontext.destinationchange");
    v2->_ivars->status = 0;
    v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  AVOutputContextDestinationChangeInternal *ivars;
  NSObject *ivarAccessQueue;
  objc_super v5;

  ivars = self->_ivars;
  if (ivars)
  {
    ivarAccessQueue = ivars->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      ivars = self->_ivars;
    }

    ivars = self->_ivars;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVOutputContextDestinationChange;
  -[AVOutputContextDestinationChange dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, status=%d, cancellationReason=%@>"), NSStringFromClass(v4), self, -[AVOutputContextDestinationChange status](self, "status"), -[AVOutputContextDestinationChange cancellationReason](self, "cancellationReason"));
}

- (int64_t)status
{
  NSObject *ivarAccessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AVOutputContextDestinationChange_status__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__AVOutputContextDestinationChange_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 16);
  return result;
}

- (NSString)cancellationReason
{
  NSObject *ivarAccessQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVOutputContextDestinationChange_cancellationReason__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVOutputContextDestinationChange_cancellationReason__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)markAsInProgress
{
  -[AVOutputContextDestinationChange _setStatus:cancellationReason:](self, "_setStatus:cancellationReason:", 1, 0);
}

- (void)markAsFinished
{
  -[AVOutputContextDestinationChange _setStatus:cancellationReason:](self, "_setStatus:cancellationReason:", 2, 0);
}

- (void)markAsFailed
{
  -[AVOutputContextDestinationChange _setStatus:cancellationReason:](self, "_setStatus:cancellationReason:", 3, 0);
}

- (void)markAsCancelledWithReason:(id)a3
{
  -[AVOutputContextDestinationChange _setStatus:cancellationReason:](self, "_setStatus:cancellationReason:", 4, a3);
}

- (void)_setStatus:(int64_t)a3 cancellationReason:(id)a4
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];

  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AVOutputContextDestinationChange__setStatus_cancellationReason___block_invoke;
  block[3] = &unk_1E302FEE0;
  block[5] = a4;
  block[6] = a3;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

uint64_t __66__AVOutputContextDestinationChange__setStatus_cancellationReason___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16) = *(_QWORD *)(a1 + 48);
  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)changeToTerminalStatusBasedOnRouteChangeEndedReason:(__CFString *)a3
{
  AVOutputContextDestinationChange *v4;
  const __CFString *v5;

  if (FigCFEqual())
  {
    -[AVOutputContextDestinationChange markAsFinished](self, "markAsFinished");
    return;
  }
  if (FigCFEqual())
    goto LABEL_4;
  if (!FigCFEqual())
  {
    if (FigCFEqual())
    {
      v5 = CFSTR("AVOutputContextDestinationChangeCancellationReasonAuthorizationSkipped");
      v4 = self;
      goto LABEL_9;
    }
    if (!FigCFEqual())
    {
LABEL_4:
      -[AVOutputContextDestinationChange markAsFailed](self, "markAsFailed");
      return;
    }
  }
  v4 = self;
  v5 = 0;
LABEL_9:
  -[AVOutputContextDestinationChange markAsCancelledWithReason:](v4, "markAsCancelledWithReason:", v5);
}

- (void)changeToTerminalStatusBasedOnRouteConfigUpdatedReason:(__CFString *)a3
{
  AVOutputContextDestinationChange *v4;
  const __CFString *v5;

  if (FigCFEqual())
    goto LABEL_2;
  if (FigCFEqual())
    goto LABEL_4;
  if (FigCFEqual())
  {
    v4 = self;
    v5 = 0;
  }
  else
  {
    if (!FigCFEqual())
    {
      if (FigCFEqual() || FigCFEqual() || FigCFEqual())
      {
LABEL_2:
        -[AVOutputContextDestinationChange markAsFinished](self, "markAsFinished");
        return;
      }
LABEL_4:
      -[AVOutputContextDestinationChange markAsFailed](self, "markAsFailed");
      return;
    }
    v5 = CFSTR("AVOutputContextDestinationChangeCancellationReasonAuthorizationSkipped");
    v4 = self;
  }
  -[AVOutputContextDestinationChange markAsCancelledWithReason:](v4, "markAsCancelledWithReason:", v5);
}

@end
