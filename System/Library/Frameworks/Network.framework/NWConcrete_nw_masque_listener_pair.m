@implementation NWConcrete_nw_masque_listener_pair

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 *v7;
  void *v8;
  objc_super v9;

  v3 = *((_QWORD *)self + 3);
  if (v3)
  {
    nw_connection_group_cancel(v3);
    v4 = (void *)*((_QWORD *)self + 3);
    *((_QWORD *)self + 3) = 0;

  }
  v5 = *((_QWORD *)self + 6);
  if (v5)
  {
    nw_connection_cancel(v5);
    v6 = (void *)*((_QWORD *)self + 6);
    *((_QWORD *)self + 6) = 0;

  }
  v7 = (unsigned __int8 *)*((_QWORD *)self + 7);
  if (v7)
  {
    nw_array_apply(v7, (uint64_t)&__block_literal_global_112);
    v8 = (void *)*((_QWORD *)self + 7);
    *((_QWORD *)self + 7) = 0;

  }
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_masque_listener_pair;
  -[NWConcrete_nw_masque_listener_pair dealloc](&v9, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 15, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end
