@implementation JPCallbackStream

- (JPCallbackStream)initWithReadCallback:(id)a3 seekForwardCallback:(id)a4 seekToEndCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  JPCallbackStream *v12;
  uint64_t v13;
  id readCallback;
  uint64_t v15;
  id seekForwardCallback;
  uint64_t v17;
  id seekToEndCallback;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = JetPackStreamCreate((uint64_t)self, (uint64_t)readStreamCallback, 0, 0);
  v20.receiver = self;
  v20.super_class = (Class)JPCallbackStream;
  v12 = -[JPStream initWithBacking:releaseOnDealloc:](&v20, sel_initWithBacking_releaseOnDealloc_, v11, 1);
  if (v12)
  {
    v13 = MEMORY[0x212BAD854](v8);
    readCallback = v12->_readCallback;
    v12->_readCallback = (id)v13;

    v15 = MEMORY[0x212BAD854](v9);
    seekForwardCallback = v12->_seekForwardCallback;
    v12->_seekForwardCallback = (id)v15;

    v17 = MEMORY[0x212BAD854](v10);
    seekToEndCallback = v12->_seekToEndCallback;
    v12->_seekToEndCallback = (id)v17;

  }
  return v12;
}

- (id)readCallback
{
  return self->_readCallback;
}

- (void)setReadCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)seekForwardCallback
{
  return self->_seekForwardCallback;
}

- (void)setSeekForwardCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)seekToEndCallback
{
  return self->_seekToEndCallback;
}

- (void)setSeekToEndCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_seekToEndCallback, 0);
  objc_storeStrong(&self->_seekForwardCallback, 0);
  objc_storeStrong(&self->_readCallback, 0);
}

@end
