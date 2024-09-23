@implementation AVSerializedMostlySynchronousReentrantBlockScheduler

- (AVSerializedMostlySynchronousReentrantBlockScheduler)init
{
  AVSerializedMostlySynchronousReentrantBlockScheduler *v2;
  AVSerializedMostlySynchronousReentrantBlockScheduler *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVSerializedMostlySynchronousReentrantBlockScheduler;
  v2 = -[AVSerializedMostlySynchronousReentrantBlockScheduler init](&v5, sel_init);
  if (v2)
  {
    v2->_ivarAccessLock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v2->_blocks = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v2->_blockSerializationLock = (OpaqueFigReentrantMutex *)FigReentrantMutexCreate();
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)scheduleBlock:(id)a3
{
  void *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD);
  NSArray *v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  MEMORY[0x194033BF8](self->_ivarAccessLock, a2);
  v5 = (void *)objc_msgSend(a3, "copy");
  v6 = -[NSArray arrayByAddingObject:](self->_blocks, "arrayByAddingObject:", v5);

  self->_blocks = (NSArray *)-[NSArray copy](v6, "copy");
  LODWORD(v6) = FigReentrantMutexTryLock();

  MEMORY[0x194033C04](self->_ivarAccessLock);
  if ((_DWORD)v6)
  {
    MEMORY[0x194033BF8](self->_ivarAccessLock);
    if (-[NSArray count](self->_blocks, "count"))
    {
      while (1)
      {
        v7 = objc_alloc(MEMORY[0x1E0CB3838]);
        v8 = objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
        v9 = (void *)objc_msgSend(v7, "initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:", v8, 0, objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0), 0);
        v10 = (void (**)(_QWORD))objc_msgSend(-[NSArray firstObject](self->_blocks, "firstObject"), "copy");
        v11 = -[NSArray arrayByApplyingDifference:](self->_blocks, "arrayByApplyingDifference:", v9);

        self->_blocks = (NSArray *)-[NSArray copy](v11, "copy");
        MEMORY[0x194033C04](self->_ivarAccessLock);
        if (!v10)
          break;
        v10[2](v10);

        MEMORY[0x194033BF8](self->_ivarAccessLock);
        if (!-[NSArray count](self->_blocks, "count"))
          goto LABEL_5;
      }
    }
    else
    {
LABEL_5:
      MEMORY[0x194033A48](self->_blockSerializationLock);
      MEMORY[0x194033C04](self->_ivarAccessLock);
    }

  }
  else if (dword_1ECDECEB8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVSerializedMostlySynchronousReentrantBlockScheduler;
  -[AVSerializedMostlySynchronousReentrantBlockScheduler dealloc](&v3, sel_dealloc);
}

@end
