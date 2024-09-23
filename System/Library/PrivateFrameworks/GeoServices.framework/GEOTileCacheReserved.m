@implementation GEOTileCacheReserved

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 850045863;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = (char *)self + 72;
  *((_QWORD *)self + 10) = (char *)self + 72;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_QWORD *)self + 15) = 0;
  *((_DWORD *)self + 32) = 1065353216;
  return self;
}

- (void)dealloc
{
  uint64_t i;
  objc_super v3;

  for (i = *((_QWORD *)self + 10);
        (GEOTileCacheReserved *)i != (GEOTileCacheReserved *)((char *)self + 72);
  v3.receiver = self;
  v3.super_class = (Class)GEOTileCacheReserved;
  -[GEOTileCacheReserved dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;

  v3 = (_QWORD *)*((_QWORD *)self + 14);
  if (v3)
  {
    do
    {
      v4 = (_QWORD *)*v3;
      operator delete(v3);
      v3 = v4;
    }
    while (v4);
  }
  v5 = (void *)*((_QWORD *)self + 12);
  *((_QWORD *)self + 12) = 0;
  if (v5)
    operator delete(v5);
  std::__list_imp<CacheItem>::clear((uint64_t *)self + 9);
  std::mutex::~mutex((std::mutex *)((char *)self + 8));
}

@end
