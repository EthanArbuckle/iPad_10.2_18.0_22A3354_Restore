@implementation NELoopbackConnection

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating loopback connection", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)NELoopbackConnection;
  -[NELoopbackConnection dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)notifyInputHandler
{
  if (result)
  {
    objc_getProperty(result, a2, 120, 1);
    return (void *)nw_queue_context_async();
  }
  return result;
}

uint64_t __42__NELoopbackConnection_notifyInputHandler__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = v1 + 40;
  else
    v2 = 0;
  result = *(_QWORD *)(v2 + 48);
  if (result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 24) + 64))();
  return result;
}

uint64_t __90__NELoopbackConnection_addInputFramesToArray_maximumBytes_minimumBytes_maximumFrameCount___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += nw_frame_unclaimed_length();
  return 1;
}

@end
