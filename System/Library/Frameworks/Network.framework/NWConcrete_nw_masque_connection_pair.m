@implementation NWConcrete_nw_masque_connection_pair

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_super v11;

  nw_masque_connection_pair_cancel_waiting_timer(self);
  v3 = *((_QWORD *)self + 3);
  if (v3)
  {
    nw_connection_cancel(v3);
    v4 = (void *)*((_QWORD *)self + 3);
    *((_QWORD *)self + 3) = 0;

  }
  v5 = *((_QWORD *)self + 4);
  if (v5)
  {
    nw_connection_cancel(v5);
    v6 = (void *)*((_QWORD *)self + 4);
    *((_QWORD *)self + 4) = 0;

  }
  v7 = (unsigned __int8 *)*((_QWORD *)self + 5);
  if (v7)
  {
    nw_array_apply(v7, (uint64_t)&__block_literal_global_29158);
    v8 = (void *)*((_QWORD *)self + 5);
    *((_QWORD *)self + 5) = 0;

  }
  v9 = *((_QWORD *)self + 6);
  if (v9)
  {
    nw_connection_cancel(v9);
    v10 = (void *)*((_QWORD *)self + 6);
    *((_QWORD *)self + 6) = 0;

  }
  v11.receiver = self;
  v11.super_class = (Class)NWConcrete_nw_masque_connection_pair;
  -[NWConcrete_nw_masque_connection_pair dealloc](&v11, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 35, 0);
  objc_storeStrong((id *)self + 34, 0);
  objc_storeStrong((id *)self + 30, 0);
  objc_storeStrong((id *)self + 29, 0);
  objc_storeStrong((id *)self + 28, 0);
  objc_storeStrong((id *)self + 24, 0);
  objc_storeStrong((id *)self + 8, 0);
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
