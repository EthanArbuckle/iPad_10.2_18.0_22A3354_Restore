@implementation BUBufferedReadChannelHelper

- (BUBufferedReadChannelHelper)initWithBufferedReadChannel:(id)a3
{
  id v4;
  BUBufferedReadChannelHelper *v5;
  BUBufferedReadChannelHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BUBufferedReadChannelHelper;
  v5 = -[BUBufferedReadChannelHelper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_bufferedReadChannel, v4);

  return v6;
}

- (BUBufferedReadChannelHelper)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@: %s"), CFSTR("Do not call method"), "-[BUBufferedReadChannelHelper init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v5, v3, v4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)readWithHandler:(id)a3
{
  BUBufferedReadChannel **p_bufferedReadChannel;
  id v4;
  const char *v5;
  id WeakRetained;

  p_bufferedReadChannel = &self->_bufferedReadChannel;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_bufferedReadChannel);
  objc_msgSend_setStreamReadChannelSourceHandler_(WeakRetained, v5, (uint64_t)v4);

}

- (BUBufferedReadChannel)bufferedReadChannel
{
  return (BUBufferedReadChannel *)objc_loadWeakRetained((id *)&self->_bufferedReadChannel);
}

- (void)setBufferedReadChannel:(id)a3
{
  objc_storeWeak((id *)&self->_bufferedReadChannel, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bufferedReadChannel);
}

@end
