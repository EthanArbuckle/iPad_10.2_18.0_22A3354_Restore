@implementation _SYInputDataItem

- (_SYInputDataItem)initWithLength:(unint64_t)a3 callback:(id)a4
{
  id v6;
  _SYInputDataItem *v7;
  _SYInputDataItem *v8;
  uint64_t v9;
  NSMutableData *data;
  uint64_t v11;
  id callback;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SYInputDataItem;
  v7 = -[_SYInputDataItem init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v7->_lock);
    v9 = objc_opt_new();
    data = v8->_data;
    v8->_data = (NSMutableData *)v9;

    v8->_length = a3;
    v11 = MEMORY[0x212BE0F2C](v6);
    callback = v8->_callback;
    v8->_callback = (id)v11;

    os_unfair_lock_unlock(&v8->_lock);
  }

  return v8;
}

- (unint64_t)lengthRemaining
{
  os_unfair_lock_s *p_lock;
  unint64_t length;
  unint64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  length = self->_length;
  v5 = length - -[NSMutableData length](self->_data, "length");
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (NSMutableData)data
{
  return self->_data;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
