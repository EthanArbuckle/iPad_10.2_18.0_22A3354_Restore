@implementation DS_TDSHelperConnectionHandler

- (DS_TDSHelperConnectionHandler)initWithHelper:(void *)a3
{
  DS_TDSHelperConnectionHandler *result;

  result = -[DS_TDSHelperConnectionHandler init](self, "init");
  result->_helper = a3;
  return result;
}

- (void)handleHelperEvent:(id)a3
{
  _QWORD *helper;
  id v5;

  v5 = a3;
  TDSMutex::lock(&self->_mutex);
  helper = self->_helper;
  if (helper)
    TDSHelperContext::HandleHelperEvent(helper, v5);
  TDSMutex::unlock(&self->_mutex);

}

- (void)clearHelper
{
  TDSMutex *p_mutex;

  p_mutex = &self->_mutex;
  TDSMutex::lock(&self->_mutex);
  self->_helper = 0;
  TDSMutex::unlock(p_mutex);
}

- (void).cxx_destruct
{
  TDSMutex::~TDSMutex(&self->_mutex);
}

- (id).cxx_construct
{
  TDSMutex::TDSMutex(&self->_mutex, 0);
  return self;
}

@end
