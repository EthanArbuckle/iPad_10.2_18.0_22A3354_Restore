@implementation NeuralNetCache

- (NeuralNetCache)initWithImpl:()unique_ptr<NeuralNetImpl
{
  NeuralNetCache *v4;
  NeuralNetCache *v5;
  NeuralNetImpl *v6;
  NeuralNetImpl *value;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NeuralNetCache;
  v4 = -[NeuralNetCache init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(NeuralNetImpl **)a3.__ptr_.__value_;
    *(_QWORD *)a3.__ptr_.__value_ = 0;
    value = v4->_impl.__ptr_.__value_;
    v5->_impl.__ptr_.__value_ = v6;
    if (value)
      (*(void (**)(NeuralNetImpl *))(*(_QWORD *)value + 8))(value);
  }
  return v5;
}

- (unique_ptr<NeuralNetImpl,)impl
{
  NeuralNetImpl **v2;
  NeuralNetImpl *value;

  value = self->_impl.__ptr_.__value_;
  self->_impl.__ptr_.__value_ = 0;
  *v2 = value;
  return (unique_ptr<NeuralNetImpl, std::default_delete<NeuralNetImpl>>)self;
}

- (void).cxx_destruct
{
  NeuralNetImpl *value;

  value = self->_impl.__ptr_.__value_;
  self->_impl.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(NeuralNetImpl *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

+ (id)sharedCache
{
  if (+[NeuralNetCache sharedCache]::onceToken != -1)
    dispatch_once(&+[NeuralNetCache sharedCache]::onceToken, &__block_literal_global_16886);
  return (id)sNeuralNetCache;
}

void __29__NeuralNetCache_sharedCache__block_invoke()
{
  id v0;
  void *v1;

  if (!sNeuralNetCache)
  {
    v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v1 = (void *)sNeuralNetCache;
    sNeuralNetCache = (uint64_t)v0;

  }
}

@end
