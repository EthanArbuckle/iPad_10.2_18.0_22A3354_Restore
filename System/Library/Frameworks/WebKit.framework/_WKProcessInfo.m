@implementation _WKProcessInfo

- (_WKProcessInfo)initWithTaskInfo:(const TaskInfo *)a3
{
  _WKProcessInfo *result;
  int var1;
  _BOOL8 v6;
  BOOL v7;
  int64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_WKProcessInfo;
  result = -[_WKProcessInfo init](&v9, sel_init);
  if (result)
  {
    result->_pid = a3->var0;
    var1 = a3->var1;
    v6 = var1 == 1;
    v7 = var1 == 0;
    v8 = 2;
    if (!v7)
      v8 = v6;
    result->_state = v8;
    result->_totalUserCPUTime = a3->var2.m_value;
    result->_totalSystemCPUTime = a3->var3.m_value;
    result->_physicalFootprint = a3->var4;
  }
  return result;
}

- (int)pid
{
  return self->_pid;
}

- (int64_t)state
{
  return self->_state;
}

- (double)totalUserCPUTime
{
  return self->_totalUserCPUTime;
}

- (double)totalSystemCPUTime
{
  return self->_totalSystemCPUTime;
}

- (unint64_t)physicalFootprint
{
  return self->_physicalFootprint;
}

@end
