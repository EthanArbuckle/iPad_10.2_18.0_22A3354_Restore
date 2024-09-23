@implementation GTContinuation_replayer

- (GTContinuation_replayer)init
{
  -[GTContinuation_replayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GTContinuation_replayer)initWithQueue:(id)a3 block:(id)a4
{
  GTContinuation_replayer *v6;
  NSObject *v8;
  const char *v9;
  FILE *v10;
  const __CFString *v11;
  objc_super v12;
  uint8_t buf[16];

  if (!a3)
  {
    if (s_logUsingOsLog)
    {
      v8 = gt_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "fail: queue cannot be NULL";
        goto LABEL_12;
      }
LABEL_16:
      abort();
    }
    v10 = __stderrp;
    v11 = CFSTR("fail: queue cannot be NULL");
LABEL_15:
    fprintf(v10, "%s\n", -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, a4), "UTF8String"));
    goto LABEL_16;
  }
  if (!a4)
  {
    if (s_logUsingOsLog)
    {
      v8 = gt_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "fail: block cannot be NULL";
LABEL_12:
        _os_log_fault_impl(&dword_0, v8, OS_LOG_TYPE_FAULT, v9, buf, 2u);
        abort();
      }
      goto LABEL_16;
    }
    v10 = __stderrp;
    v11 = CFSTR("fail: block cannot be NULL");
    goto LABEL_15;
  }
  v12.receiver = self;
  v12.super_class = (Class)GTContinuation_replayer;
  v6 = -[GTContinuation_replayer init](&v12, "init");
  if (v6)
  {
    dispatch_retain((dispatch_object_t)a3);
    v6->queue = (OS_dispatch_queue *)a3;
    v6->block = objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->queue);
  v3.receiver = self;
  v3.super_class = (Class)GTContinuation_replayer;
  -[GTContinuation_replayer dealloc](&v3, "dealloc");
}

- (void)dispatch
{
  dispatch_async((dispatch_queue_t)self->queue, self->block);
}

@end
