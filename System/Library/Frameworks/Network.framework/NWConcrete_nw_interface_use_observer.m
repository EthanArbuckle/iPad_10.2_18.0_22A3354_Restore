@implementation NWConcrete_nw_interface_use_observer

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = (void *)*((_QWORD *)self + 1);
  if (v3)
  {
    free(v3);
    *((_QWORD *)self + 1) = 0;
  }
  v4 = (void *)*((_QWORD *)self + 2);
  if ((*((_BYTE *)self + 24) & 1) != 0 && v4)
  {
    *((_QWORD *)self + 2) = 0;

    v4 = (void *)*((_QWORD *)self + 2);
  }
  *((_QWORD *)self + 2) = 0;

  v5 = (void *)*((_QWORD *)self + 2);
  *((_QWORD *)self + 2) = 0;

  *((_BYTE *)self + 24) |= 1u;
  v6 = (void *)*((_QWORD *)self + 4);
  if ((*((_BYTE *)self + 40) & 1) != 0 && v6)
  {
    *((_QWORD *)self + 4) = 0;

    v6 = (void *)*((_QWORD *)self + 4);
  }
  *((_QWORD *)self + 4) = 0;

  v7 = (void *)*((_QWORD *)self + 4);
  *((_QWORD *)self + 4) = 0;

  *((_BYTE *)self + 40) |= 1u;
  *((_DWORD *)self + 12) = -1;
  v8.receiver = self;
  v8.super_class = (Class)NWConcrete_nw_interface_use_observer;
  -[NWConcrete_nw_interface_use_observer dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  v3 = (void *)*((_QWORD *)self + 4);
  if ((*((_BYTE *)self + 40) & 1) != 0 && v3)
  {
    *((_QWORD *)self + 4) = 0;

    v3 = (void *)*((_QWORD *)self + 4);
  }
  *((_QWORD *)self + 4) = 0;

  v4 = (void *)*((_QWORD *)self + 2);
  if ((*((_BYTE *)self + 24) & 1) != 0 && v4)
  {
    *((_QWORD *)self + 2) = 0;

    v4 = (void *)*((_QWORD *)self + 2);
  }
  *((_QWORD *)self + 2) = 0;

}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
