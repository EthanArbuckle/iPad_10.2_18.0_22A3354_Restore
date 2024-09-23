@implementation XRFrameCommutator

+ (id)sharedCommutator
{
  if (qword_25583C918 != -1)
    dispatch_once(&qword_25583C918, &unk_24EDC2BF0);
  return (id)qword_25583C910;
}

- (XRFrameCommutator)initWithMinorFrameCount:(unsigned __int8)a3
{
  uint64_t v3;
  XRFrameCommutator *v4;
  void **value;
  uint64_t v6;
  void **v7;
  void **v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)XRFrameCommutator;
  v4 = -[XRFrameCommutator init](&v10, sel_init);
  if (v4)
  {
    sub_226365214(v3, (uint64_t *)&v9);
    value = (void **)v4->_commutatorImpl.__ptr_.__value_;
    v6 = (uint64_t)v9;
    v9 = 0;
    v4->_commutatorImpl.__ptr_.__value_ = (Commutator *)v6;
    if (value)
    {
      sub_22636541C((uint64_t)&v4->_commutatorImpl, value);
      v7 = v9;
      v9 = 0;
      if (v7)
        sub_22636541C((uint64_t)&v9, v7);
    }
  }
  return v4;
}

- (XRFrameCommutator)init
{
  return (XRFrameCommutator *)((uint64_t (*)(XRFrameCommutator *, char *, uint64_t))MEMORY[0x24BEDD108])(self, sel_initWithMinorFrameCount_, 8);
}

- (void)dealloc
{
  Commutator *value;
  unique_ptr<xray::scheduler::Commutator, std::default_delete<xray::scheduler::Commutator>> *p_commutatorImpl;
  void **v5;
  objc_super v6;

  p_commutatorImpl = &self->_commutatorImpl;
  value = self->_commutatorImpl.__ptr_.__value_;
  if (value)
  {
    sub_22636DCF4((uint64_t)value);
    v5 = (void **)p_commutatorImpl->__ptr_.__value_;
    p_commutatorImpl->__ptr_.__value_ = 0;
    if (v5)
      sub_22636541C((uint64_t)p_commutatorImpl, v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)XRFrameCommutator;
  -[XRFrameCommutator dealloc](&v6, sel_dealloc);
}

- (void)addRing:(id)a3
{
  ((void (*)(id, char *, Commutator *))MEMORY[0x24BEDD108])(a3, sel__moveToCommutator_, self->_commutatorImpl.__ptr_.__value_);
}

- (void)removeRing:(id)a3
{
  ((void (*)(id, char *, Commutator *))MEMORY[0x24BEDD108])(a3, sel__removeFromCommutator_, self->_commutatorImpl.__ptr_.__value_);
}

- (id)newRing
{
  XRFrameRing *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = [XRFrameRing alloc];
  return (id)MEMORY[0x24BEDD108](v3, sel_initWithMinorFrameCount_, *((unsigned __int8 *)self->_commutatorImpl.__ptr_.__value_ + 124), v4, v5);
}

- (void)start
{
  sub_22636DC0C((uint64_t)self->_commutatorImpl.__ptr_.__value_);
}

- (void)stop
{
  unique_ptr<xray::scheduler::Commutator, std::default_delete<xray::scheduler::Commutator>> *p_commutatorImpl;
  void **value;

  p_commutatorImpl = &self->_commutatorImpl;
  sub_22636DC0C((uint64_t)self->_commutatorImpl.__ptr_.__value_);
  value = (void **)p_commutatorImpl->__ptr_.__value_;
  p_commutatorImpl->__ptr_.__value_ = 0;
  if (value)
    sub_22636541C((uint64_t)p_commutatorImpl, value);
}

- (void)observedTopOfMajorFrame
{
  timeval v3;

  gettimeofday(&v3, 0);
  sub_22636DD74((uint64_t)self->_commutatorImpl.__ptr_.__value_, (uint64_t)&v3);
}

- (void)setPeriod:(unint64_t)a3
{
  sub_22636DF08((uint64_t)self->_commutatorImpl.__ptr_.__value_, a3);
}

- (void).cxx_destruct
{
  unique_ptr<xray::scheduler::Commutator, std::default_delete<xray::scheduler::Commutator>> *p_commutatorImpl;
  void **v3;
  Commutator *value;

  value = self->_commutatorImpl.__ptr_.__value_;
  p_commutatorImpl = &self->_commutatorImpl;
  v3 = (void **)value;
  p_commutatorImpl->__ptr_.__value_ = 0;
  if (value)
    sub_22636541C((uint64_t)p_commutatorImpl, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
