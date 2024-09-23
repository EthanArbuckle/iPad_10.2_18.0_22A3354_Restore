@implementation _CFStreamDelegate

- (_CFStreamDelegate)initWithStreamEvents:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  _CFStreamDelegate *v8;
  _CFStreamDelegate *v9;
  __int128 v10;
  __int128 v11;
  uint64_t (*retain)(void *);
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_CFStreamDelegate;
  v8 = -[_CFStreamDelegate init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_flags = a3;
    v8->_cb._rcb = a4;
    v10 = *(_OWORD *)&a5->var0;
    v11 = *(_OWORD *)&a5->var2;
    v8->_client.copyDescription = a5->var4;
    *(_OWORD *)&v8->_client.version = v10;
    *(_OWORD *)&v8->_client.retain = v11;
    retain = (uint64_t (*)(void *))v8->_client.retain;
    if (retain)
    {
      if (v8->_client.release)
        v8->_client.info = (void *)retain(v8->_client.info);
    }
  }
  return v9;
}

- (void)dealloc
{
  void (*release)(void *, SEL);
  void *info;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  release = (void (*)(void *, SEL))self->_client.release;
  if (release)
  {
    info = self->_client.info;
    if (info)
      release(info, a2);
  }
  v5.receiver = self;
  v5.super_class = (Class)_CFStreamDelegate;
  -[_CFStreamDelegate dealloc](&v5, sel_dealloc);
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  if ((self->_flags & a4) != 0)
    ((void (*)(id, unint64_t, void *))self->_cb._rcb)(a3, a4, self->_client.info);
}

@end
