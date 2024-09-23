@implementation NLPModelTrainingDelegate

- (NLPModelTrainingDelegate)initWithLogHandler:(id)a3
{
  id v4;
  NLPModelTrainingDelegate *v5;
  NLPModelTrainingDelegate *v6;
  uint64_t v7;
  id logHandler;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLPModelTrainingDelegate;
  v5 = -[NLPModelTrainingDelegate init](&v10, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = MEMORY[0x1A8592F80](v4);
    logHandler = v6->_logHandler;
    v6->_logHandler = (id)v7;

  }
  return v6;
}

- (void)modelTrainer:(id)a3 logMessage:(id)a4
{
  _QWORD *logHandler;
  void (*v6)(_QWORD *, id, char *);
  id v7;
  id v8;
  const char *v9;
  char v10;

  v10 = 0;
  logHandler = self->_logHandler;
  v6 = (void (*)(_QWORD *, id, char *))logHandler[2];
  v7 = a4;
  v6(logHandler, v7, &v10);
  v8 = objc_retainAutorelease(v7);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  puts(v9);
  if (v10)
    self->_stop = 1;
}

- (BOOL)modelTrainerShouldStop:(id)a3
{
  return self->_stop;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_logHandler, 0);
}

@end
