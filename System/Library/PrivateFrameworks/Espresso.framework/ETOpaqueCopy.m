@implementation ETOpaqueCopy

- (ETOpaqueCopy)initWithAbstractBlobContainer:(void *)a3
{
  ETOpaqueCopy *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ETOpaqueCopy;
  v4 = -[ETOpaqueCopy init](&v10, sel_init);
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&v4->blob.__ptr_, *(_QWORD *)a3, *((_QWORD *)a3 + 1));
  v9 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)a3, &v9);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
  if (*((_QWORD *)&v9 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v4;
}

- (const)getBlob
{
  return &self->blob;
}

- (void).cxx_destruct
{
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->blob);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
