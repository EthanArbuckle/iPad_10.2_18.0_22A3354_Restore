@implementation DTActivityTraceTapMemo

- (DTActivityTraceTapMemo)initWithData:(id)a3
{
  id v5;
  DTActivityTraceTapMemo *v6;
  DTActivityTraceTapMemo *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DTActivityTraceTapMemo;
  v6 = -[DTActivityTraceTapMemo init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_message, a3);
    v8 = *(void **)&v7->super._supportsPeek;
    *(_QWORD *)&v7->super._supportsPeek = 0;

  }
  return v7;
}

- (DTActivityTraceTapMemo)initWithMessage:(id)a3
{
  id v5;
  id v6;
  DTActivityTraceTapMemo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTActivityTraceTapMemo;
  v6 = -[DTActivityTraceTapMemo init](&v9, sel_init);
  v7 = (DTActivityTraceTapMemo *)v6;
  if (v6)
    objc_storeStrong((id *)v6 + 2, a3);

  return v7;
}

- (const)getBufferWithLength:(unint64_t *)a3
{
  void *v5;
  const void *result;
  DTXMessage *message;
  unint64_t v8;

  v5 = *(void **)&self->super._supportsPeek;
  if (v5)
  {
    v8 = 0;
    result = (const void *)objc_msgSend(v5, "getBufferWithReturnedLength:", &v8);
    if (a3)
      *a3 = v8;
  }
  else
  {
    message = self->_message;
    if (message)
    {
      if (a3)
      {
        *a3 = -[DTXMessage length](message, "length");
        message = self->_message;
      }
      return (const void *)-[DTXMessage bytes](message, "bytes");
    }
    else
    {
      result = 0;
      if (a3)
        *a3 = 0;
    }
  }
  return result;
}

- (unint64_t)lastMachContinuousTimeSeen
{
  return (unint64_t)self->_data;
}

- (void)setLastMachContinuousTimeSeen:(unint64_t)a3
{
  self->_data = (NSData *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->super._supportsPeek, 0);
}

@end
