@implementation CKLStreamObserver

- (CKLStreamObserver)initWithLogTypes:(unint64_t)a3
{
  CKLStreamObserver *v4;
  uint64_t v5;
  NSDateFormatter *formatter;
  const char *v7;
  uint64_t v8;
  NSMutableDictionary *processNamesByPath;
  CKLEventFilter *v10;
  const char *v11;
  uint64_t v12;
  CKLEventFilter *filter;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKLStreamObserver;
  v4 = -[CKLStreamObserver init](&v15, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    formatter = v4->_formatter;
    v4->_formatter = (NSDateFormatter *)v5;

    objc_msgSend_setDateFormat_(v4->_formatter, v7, (uint64_t)CFSTR("yyyy-MM-dd HH:mm:ss.SSSSSSZZZ"));
    v8 = objc_opt_new();
    processNamesByPath = v4->_processNamesByPath;
    v4->_processNamesByPath = (NSMutableDictionary *)v8;

    v4->_colorOutput = 1;
    v10 = [CKLEventFilter alloc];
    v12 = objc_msgSend_initWithLogTypes_(v10, v11, a3);
    filter = v4->_filter;
    v4->_filter = (CKLEventFilter *)v12;

  }
  return v4;
}

- (void)setSimulatorOnly:(BOOL)a3
{
  MEMORY[0x1E0DE7D20](self->_filter, sel_setSimulatorMessagesOnly_, a3);
}

- (BOOL)simulatorOnly
{
  uint64_t v2;

  return objc_msgSend_simulatorMessagesOnly(self->_filter, a2, v2);
}

- (void)setOnlyTestLogs:(BOOL)a3
{
  objc_msgSend_setOnlyTestLogs_(self->_filter, a2, a3);
}

- (BOOL)onlyTestLogs
{
  uint64_t v2;

  return objc_msgSend_onlyTestLogs(self->_filter, a2, v2);
}

- (void)setProcessName:(id)a3
{
  objc_msgSend_setProcessName_(self->_filter, a2, (uint64_t)a3);
}

- (NSString)processName
{
  uint64_t v2;

  return (NSString *)objc_msgSend_processName(self->_filter, a2, v2);
}

- (id)_processNameForPath:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  v6 = a3;
  if (v6)
  {
    objc_msgSend_processNamesByPath(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend_lastPathComponent(v6, v10, v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_processNamesByPath(self, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v14, v15, (uint64_t)v9, v6);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_handleEvent:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  int v8;
  void *v9;
  const char *v10;
  id v11;

  v11 = a3;
  objc_msgSend_filter(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_matchesEvent_(v6, v7, (uint64_t)v11);

  if (v8)
  {
    v9 = (void *)MEMORY[0x1C3B83E24]();
    objc_msgSend_eventMatched_(self, v10, (uint64_t)v11);
    objc_autoreleasePoolPop(v9);
  }

}

- (void)eventMatched:(id)a3
{
  const char *v5;
  id v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v5, (uint64_t)a2, self, CFSTR("CKLStreamObserver.m"), 106, CFSTR("This must be called on a subclass"));

}

- (BOOL)colorOutput
{
  return self->_colorOutput;
}

- (void)setColorOutput:(BOOL)a3
{
  self->_colorOutput = a3;
}

- (CKLEventFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (NSDateFormatter)formatter
{
  return self->_formatter;
}

- (NSMutableDictionary)processNamesByPath
{
  return self->_processNamesByPath;
}

- (void)setProcessNamesByPath:(id)a3
{
  objc_storeStrong((id *)&self->_processNamesByPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processNamesByPath, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

@end
