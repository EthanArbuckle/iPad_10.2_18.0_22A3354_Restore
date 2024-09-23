@implementation NWURLSessionRequestBodyData

- (int64_t)countOfBytesSent
{
  if (self)
  {
    if (*(_QWORD *)(self + 24) >= *(_QWORD *)(self + 16))
      return *(_QWORD *)(self + 16);
    else
      return *(_QWORD *)(self + 24);
  }
  return self;
}

- (void)readMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  void (**v7)(id, dispatch_data_t, BOOL, _QWORD);
  size_t offset;
  dispatch_data_t subrange;
  unint64_t length;
  unint64_t v11;
  void (**v12)(id, dispatch_data_t, BOOL, _QWORD);

  v7 = (void (**)(id, dispatch_data_t, BOOL, _QWORD))a5;
  v12 = v7;
  if (self && (offset = self->_offset, offset < self->_length))
  {
    subrange = dispatch_data_create_subrange((dispatch_data_t)self->_data, offset, a4);
    length = self->_length;
    v11 = self->_offset + a4;
    self->_offset = v11;
    v12[2](v12, subrange, v11 >= length, 0);

  }
  else
  {
    v7[2](v7, 0, 1, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
