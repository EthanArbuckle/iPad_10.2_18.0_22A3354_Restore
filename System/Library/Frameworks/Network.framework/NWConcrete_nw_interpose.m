@implementation NWConcrete_nw_interpose

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)*((_QWORD *)self + 7);
  *((_QWORD *)self + 7) = 0;

  v4 = (void *)*((_QWORD *)self + 5);
  if (v4)
  {
    nw_path_evaluator_cancel(v4);
    v5 = (void *)*((_QWORD *)self + 5);
    *((_QWORD *)self + 5) = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_interpose;
  -[NWConcrete_nw_interpose dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end
