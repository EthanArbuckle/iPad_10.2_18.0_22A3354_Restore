@implementation DSP_HostCallbacks

- (void)notifyClientsOfCustomPropertyChange:(AudioObjectPropertyAddress)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  AudioObjectPropertyAddress v7;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (-[DSP_HostCallbacks owner](self, "owner"))
  {
    -[DSP_HostCallbacks propertyChangeListener](self, "propertyChangeListener");
    v4 = v9;
    if (v9 == v8)
    {
      (*(void (**)(_QWORD *))(v8[0] + 32))(v8);
      if (!v4)
        return;
    }
    else
    {
      if (!v9)
        return;
      (*(void (**)(_QWORD *))(*v9 + 40))(v9);
    }
    -[DSP_HostCallbacks propertyChangeListener](self, "propertyChangeListener");
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(_QWORD *, AudioObjectPropertyAddress *))(*v9 + 48))(v9, &v7);
    v5 = v9;
    if (v9 == v8)
    {
      v6 = 4;
      v5 = v8;
    }
    else
    {
      if (!v9)
        return;
      v6 = 5;
    }
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
}

- (function<void)mutationRequestListener
{
  return (function<void (const DSP_Host_Types::MutationRequestConfiguration &)> *)std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_mutationRequestListener);
}

- (void)setMutationRequestListener:(function<void (const DSP_Host_Types::MutationRequestConfiguration)&
{
  function<void (const DSP_Host_Types::MutationRequestConfiguration &)> *p_mutationRequestListener;
  void *v5;
  function<void (const DSP_Host_Types::MutationRequestConfiguration &)> *f;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[3];
  _QWORD *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v9, (uint64_t)a3);
  p_mutationRequestListener = &self->_mutationRequestListener;
  if (&self->_mutationRequestListener != (function<void (const DSP_Host_Types::MutationRequestConfiguration &)> *)v9)
  {
    v5 = v10;
    f = (function<void (const DSP_Host_Types::MutationRequestConfiguration &)> *)self->_mutationRequestListener.__f_.__f_;
    if (v10 == v9)
    {
      if (f == p_mutationRequestListener)
      {
        (*(void (**)(_QWORD *, _QWORD *))(v9[0] + 24))(v9, v11);
        (*(void (**)(_QWORD *))(*v10 + 32))(v10);
        v10 = 0;
        (*(void (**)(void *, _QWORD *))(*(_QWORD *)self->_mutationRequestListener.__f_.__f_ + 24))(self->_mutationRequestListener.__f_.__f_, v9);
        (*(void (**)(void *))(*(_QWORD *)self->_mutationRequestListener.__f_.__f_ + 32))(self->_mutationRequestListener.__f_.__f_);
        self->_mutationRequestListener.__f_.__f_ = 0;
        v10 = v9;
        (*(void (**)(_QWORD *, function<void (const DSP_Host_Types::MutationRequestConfiguration &)> *))(v11[0] + 24))(v11, &self->_mutationRequestListener);
        (*(void (**)(_QWORD *))(v11[0] + 32))(v11);
      }
      else
      {
        (*(void (**)(_QWORD *, function<void (const DSP_Host_Types::MutationRequestConfiguration &)> *))(v9[0] + 24))(v9, &self->_mutationRequestListener);
        (*(void (**)(_QWORD *))(*v10 + 32))(v10);
        v10 = self->_mutationRequestListener.__f_.__f_;
      }
      self->_mutationRequestListener.__f_.__f_ = p_mutationRequestListener;
    }
    else if (f == p_mutationRequestListener)
    {
      (*(void (**)(function<void (const DSP_Host_Types::MutationRequestConfiguration &)> *, _QWORD *))(*(_QWORD *)p_mutationRequestListener->__f_.__buf_.__lx + 24))(&self->_mutationRequestListener, v9);
      (*(void (**)(void *))(*(_QWORD *)self->_mutationRequestListener.__f_.__f_ + 32))(self->_mutationRequestListener.__f_.__f_);
      self->_mutationRequestListener.__f_.__f_ = v10;
      v10 = v9;
    }
    else
    {
      v10 = self->_mutationRequestListener.__f_.__f_;
      self->_mutationRequestListener.__f_.__f_ = v5;
    }
  }
  v7 = v10;
  if (v10 == v9)
  {
    v8 = 4;
    v7 = v9;
  }
  else
  {
    if (!v10)
      return;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
}

- (function<void)propertyChangeListener
{
  return (function<void (const AudioObjectPropertyAddress &)> *)std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_propertyChangeListener);
}

- (void)setPropertyChangeListener:(function<void (const AudioObjectPropertyAddress)&
{
  function<void (const AudioObjectPropertyAddress &)> *p_propertyChangeListener;
  void *v5;
  function<void (const AudioObjectPropertyAddress &)> *f;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[3];
  _QWORD *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v9, (uint64_t)a3);
  p_propertyChangeListener = &self->_propertyChangeListener;
  if (&self->_propertyChangeListener != (function<void (const AudioObjectPropertyAddress &)> *)v9)
  {
    v5 = v10;
    f = (function<void (const AudioObjectPropertyAddress &)> *)self->_propertyChangeListener.__f_.__f_;
    if (v10 == v9)
    {
      if (f == p_propertyChangeListener)
      {
        (*(void (**)(_QWORD *, _QWORD *))(v9[0] + 24))(v9, v11);
        (*(void (**)(_QWORD *))(*v10 + 32))(v10);
        v10 = 0;
        (*(void (**)(void *, _QWORD *))(*(_QWORD *)self->_propertyChangeListener.__f_.__f_ + 24))(self->_propertyChangeListener.__f_.__f_, v9);
        (*(void (**)(void *))(*(_QWORD *)self->_propertyChangeListener.__f_.__f_ + 32))(self->_propertyChangeListener.__f_.__f_);
        self->_propertyChangeListener.__f_.__f_ = 0;
        v10 = v9;
        (*(void (**)(_QWORD *, function<void (const AudioObjectPropertyAddress &)> *))(v11[0] + 24))(v11, &self->_propertyChangeListener);
        (*(void (**)(_QWORD *))(v11[0] + 32))(v11);
      }
      else
      {
        (*(void (**)(_QWORD *, function<void (const AudioObjectPropertyAddress &)> *))(v9[0] + 24))(v9, &self->_propertyChangeListener);
        (*(void (**)(_QWORD *))(*v10 + 32))(v10);
        v10 = self->_propertyChangeListener.__f_.__f_;
      }
      self->_propertyChangeListener.__f_.__f_ = p_propertyChangeListener;
    }
    else if (f == p_propertyChangeListener)
    {
      (*(void (**)(function<void (const AudioObjectPropertyAddress &)> *, _QWORD *))(*(_QWORD *)p_propertyChangeListener->__f_.__buf_.__lx
                                                                                              + 24))(&self->_propertyChangeListener, v9);
      (*(void (**)(void *))(*(_QWORD *)self->_propertyChangeListener.__f_.__f_ + 32))(self->_propertyChangeListener.__f_.__f_);
      self->_propertyChangeListener.__f_.__f_ = v10;
      v10 = v9;
    }
    else
    {
      v10 = self->_propertyChangeListener.__f_.__f_;
      self->_propertyChangeListener.__f_.__f_ = v5;
    }
  }
  v7 = v10;
  if (v10 == v9)
  {
    v8 = 4;
    v7 = v9;
  }
  else
  {
    if (!v10)
      return;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
}

- (DSP_Host_IOProcessor)owner
{
  return self->_owner;
}

- (void)setOwner:(DSP_Host_IOProcessor *)a3
{
  self->_owner = a3;
}

- (void).cxx_destruct
{
  function<void (const AudioObjectPropertyAddress &)> *p_propertyChangeListener;
  function<void (const AudioObjectPropertyAddress &)> *f;
  uint64_t v5;
  DSP_HostCallbacks *p_mutationRequestListener;
  uint64_t v7;

  p_propertyChangeListener = &self->_propertyChangeListener;
  f = (function<void (const AudioObjectPropertyAddress &)> *)self->_propertyChangeListener.__f_.__f_;
  if (f == p_propertyChangeListener)
  {
    v5 = 4;
    f = p_propertyChangeListener;
  }
  else
  {
    if (!f)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)f->__f_.__buf_.__lx + 8 * v5))();
LABEL_6:
  p_mutationRequestListener = (DSP_HostCallbacks *)self->_mutationRequestListener.__f_.__f_;
  if (p_mutationRequestListener == (DSP_HostCallbacks *)&self->_mutationRequestListener)
  {
    v7 = 4;
    p_mutationRequestListener = (DSP_HostCallbacks *)&self->_mutationRequestListener;
  }
  else
  {
    if (!p_mutationRequestListener)
      return;
    v7 = 5;
  }
  (*((void (**)(void))p_mutationRequestListener->super.isa + v7))();
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 9) = 0;
  return self;
}

@end
