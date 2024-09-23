@implementation RPBServer_Listener

- (RPBServer_Listener)initWithServer:(id)a3
{
  id v4;
  RPBServer_Listener *v5;
  RPBServer_Listener *v6;
  id WeakRetained;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPBServer_Listener;
  v5 = -[RPBServer_Listener init](&v9, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_server, v4);
  WeakRetained = objc_loadWeakRetained((id *)&v6->_server);
  objc_msgSend(WeakRetained, "addListener:", v6);

  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  objc_msgSend(WeakRetained, "removeListener:", self);

  v4.receiver = self;
  v4.super_class = (Class)RPBServer_Listener;
  -[RPBServer_Listener dealloc](&v4, sel_dealloc);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *f;
  objc_super v5;

  if (sel_remoteProcessingBlockServerWillStartRunning_ == a3)
  {
    f = self->will_start_running_callback.__f_.__f_;
  }
  else if (sel_remoteProcessingBlockServerDidStartRunning_ == a3)
  {
    f = self->did_start_running_callback.__f_.__f_;
  }
  else if (sel_remoteProcessingBlockServerWillStopRunning_ == a3)
  {
    f = self->will_stop_running_callback.__f_.__f_;
  }
  else
  {
    if (sel_remoteProcessingBlockServerDidStopRunning_ != a3)
    {
      v5.receiver = self;
      v5.super_class = (Class)RPBServer_Listener;
      return -[RPBServer_Listener respondsToSelector:](&v5, sel_respondsToSelector_);
    }
    f = self->did_stop_running_callback.__f_.__f_;
  }
  return f != 0;
}

- (void)remoteProcessingBlockServerWillStartRunning:(id)a3
{
  void *f;

  f = self->will_start_running_callback.__f_.__f_;
  if (f)
    (*(void (**)(void *))(*(_QWORD *)f + 48))(f);
}

- (void)remoteProcessingBlockServerDidStartRunning:(id)a3
{
  void *f;

  f = self->did_start_running_callback.__f_.__f_;
  if (f)
    (*(void (**)(void *))(*(_QWORD *)f + 48))(f);
}

- (void)remoteProcessingBlockServerWillStopRunning:(id)a3
{
  void *f;

  f = self->will_stop_running_callback.__f_.__f_;
  if (f)
    (*(void (**)(void *))(*(_QWORD *)f + 48))(f);
}

- (void)remoteProcessingBlockServerDidStopRunning:(id)a3
{
  void *f;

  f = self->did_stop_running_callback.__f_.__f_;
  if (f)
    (*(void (**)(void *))(*(_QWORD *)f + 48))(f);
}

- (void).cxx_destruct
{
  function<void ()> *p_did_stop_running_callback;
  function<void ()> *f;
  uint64_t v5;
  RPBServer_Listener *p_will_stop_running_callback;
  uint64_t v7;
  RPBServer_Listener *p_did_start_running_callback;
  uint64_t v9;
  RPBServer_Listener *p_will_start_running_callback;
  uint64_t v11;

  p_did_stop_running_callback = &self->did_stop_running_callback;
  f = (function<void ()> *)self->did_stop_running_callback.__f_.__f_;
  if (f == p_did_stop_running_callback)
  {
    v5 = 4;
    f = p_did_stop_running_callback;
  }
  else
  {
    if (!f)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)f->__f_.__buf_.__lx + 8 * v5))();
LABEL_6:
  p_will_stop_running_callback = (RPBServer_Listener *)self->will_stop_running_callback.__f_.__f_;
  if (p_will_stop_running_callback == (RPBServer_Listener *)&self->will_stop_running_callback)
  {
    v7 = 4;
    p_will_stop_running_callback = (RPBServer_Listener *)&self->will_stop_running_callback;
  }
  else
  {
    if (!p_will_stop_running_callback)
      goto LABEL_11;
    v7 = 5;
  }
  (*((void (**)(void))p_will_stop_running_callback->super.isa + v7))();
LABEL_11:
  p_did_start_running_callback = (RPBServer_Listener *)self->did_start_running_callback.__f_.__f_;
  if (p_did_start_running_callback == (RPBServer_Listener *)&self->did_start_running_callback)
  {
    v9 = 4;
    p_did_start_running_callback = (RPBServer_Listener *)&self->did_start_running_callback;
  }
  else
  {
    if (!p_did_start_running_callback)
      goto LABEL_16;
    v9 = 5;
  }
  (*((void (**)(void))p_did_start_running_callback->super.isa + v9))();
LABEL_16:
  p_will_start_running_callback = (RPBServer_Listener *)self->will_start_running_callback.__f_.__f_;
  if (p_will_start_running_callback == (RPBServer_Listener *)&self->will_start_running_callback)
  {
    v11 = 4;
    p_will_start_running_callback = (RPBServer_Listener *)&self->will_start_running_callback;
    goto LABEL_20;
  }
  if (p_will_start_running_callback)
  {
    v11 = 5;
LABEL_20:
    (*((void (**)(void))p_will_start_running_callback->super.isa + v11))();
  }
  objc_destroyWeak((id *)&self->_server);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 17) = 0;
  return self;
}

@end
