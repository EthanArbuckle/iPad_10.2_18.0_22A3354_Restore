@implementation CHDMonotonicTimer

- (void)activateWithTime:(unint64_t)a3 repeat:(int64_t)a4 block:(id)a5
{
  id v9;
  NSObject *v10;
  OS_dispatch_source *v11;
  OS_dispatch_source *timer;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a5;
  _CHDMonotonicNSEC(a3, (uint64_t)"time");
  if (a4 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHDMonotonicTimer.m"), 55, CFSTR("invalid interval"));

    if (v9)
      goto LABEL_3;
  }
  else if (v9)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHDMonotonicTimer.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_3:
  if (self->_timer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHDMonotonicTimer.m"), 57, CFSTR("already have a timer"));

  }
  dispatch_get_global_queue(17, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v10);
  timer = self->_timer;
  self->_timer = v11;

  if (a4 <= 0)
    v13 = -1;
  else
    v13 = a4;
  dispatch_source_set_timer((dispatch_source_t)self->_timer, a3, v13, 0);
  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, v9);

  dispatch_activate((dispatch_object_t)self->_timer);
}

- (void)invalidate
{
  NSObject *timer;
  void *v5;

  timer = self->_timer;
  if (!timer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHDMonotonicTimer.m"), 65, CFSTR("must have called activate"));

    timer = self->_timer;
  }
  dispatch_source_cancel(timer);
  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, &__block_literal_global);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
