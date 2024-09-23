@implementation _GCKeyboardEventImpl

- (_GCKeyboardEventImpl)init
{
  return -[_GCKeyboardEventImpl initWithTimestamp:usagePage:usage:down:sender:](self, "initWithTimestamp:usagePage:usage:down:sender:", 0, 0, 0, 0, 0);
}

- (_GCKeyboardEventImpl)initWithKeyboardEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "timestamp");
  v6 = objc_msgSend(v4, "usagePage");
  v7 = objc_msgSend(v4, "usage");
  v8 = objc_msgSend(v4, "down");
  v9 = objc_msgSend(v4, "sender");

  return -[_GCKeyboardEventImpl initWithTimestamp:usagePage:usage:down:sender:](self, "initWithTimestamp:usagePage:usage:down:sender:", v5, v6, v7, v8, v9);
}

- (_GCKeyboardEventImpl)initWithTimestamp:(unint64_t)a3 usagePage:(int64_t)a4 usage:(int64_t)a5 down:(int64_t)a6 sender:(unint64_t)a7
{
  _GCKeyboardEventImpl *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_GCKeyboardEventImpl;
  result = -[_GCKeyboardEventImpl init](&v13, sel_init);
  if (result)
  {
    result->_timestamp = a3;
    result->_usagePage = a4;
    result->_usage = a5;
    result->_down = a6;
    result->_sender = a7;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  objc_opt_class();
  result = (id)objc_opt_new();
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_timestamp;
  *((_QWORD *)result + 3) = self->_usage;
  *((_OWORD *)result + 2) = *(_OWORD *)&self->_down;
  return result;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (int64_t)usagePage
{
  return self->_usagePage;
}

- (void)setUsagePage:(int64_t)a3
{
  self->_usagePage = a3;
}

- (int64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(int64_t)a3
{
  self->_usage = a3;
}

- (int64_t)down
{
  return self->_down;
}

- (void)setDown:(int64_t)a3
{
  self->_down = a3;
}

- (unint64_t)sender
{
  return self->_sender;
}

- (void)setSender:(unint64_t)a3
{
  self->_sender = a3;
}

@end
