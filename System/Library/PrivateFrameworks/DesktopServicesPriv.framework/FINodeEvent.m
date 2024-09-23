@implementation FINodeEvent

- (void).cxx_destruct
{
  TNodeEvent::~TNodeEvent(&self->_event);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_DWORD *)self + 6) = 0;
  *((_DWORD *)self + 12) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

- (id)init:(const void *)a3
{
  FINodeEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FINodeEvent;
  v4 = -[FINodeEvent init](&v6, sel_init);
  v4->_event.fEventKind = *(_DWORD *)a3;
  objc_storeStrong((id *)&v4->_event.fFINode, *((id *)a3 + 1));
  v4->_event.fProperty = *((_DWORD *)a3 + 4);
  TPropertyValue::operator=(&v4->_event.fPropertyValue, (TPropertyValue *)a3 + 1);
  std::shared_ptr<TCFURLInfo>::operator=[abi:ne180100](&v4->_event.fTask.__ptr_, (uint64_t *)a3 + 6);
  TRef<TDSNotifier *,TRetainReleasePolicy<TDSNotifier *>>::operator=(&v4->_event.fNotifier.fRef, *((TDSNotifier **)a3 + 8));
  return v4;
}

@end
