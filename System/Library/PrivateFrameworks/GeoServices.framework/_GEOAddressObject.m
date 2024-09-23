@implementation _GEOAddressObject

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_addrObjPtr);
}

- (_GEOAddressObject)init
{
  _GEOAddressObject *v2;
  _GEOAddressObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  _GEOAddressObject *v7;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GEOAddressObject;
  v2 = -[_GEOAddressObject init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v9 = 0uLL;
    std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100]((uint64_t)&v2->_addrObjPtr, &v9);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
    if (*((_QWORD *)&v9 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v7 = v3;
  }

  return v3;
}

@end
