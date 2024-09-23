@implementation CoreLocationDelegate

- (CoreLocationDelegate)initWithQueue:(id)a3
{
  id v5;
  CoreLocationDelegate *v6;
  CoreLocationDelegate *v7;
  uint64_t v8;
  CLLocationManager *locationManager;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CoreLocationDelegate;
  v6 = -[CoreLocationDelegate init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    atomic_store(0, (unsigned int *)&v6->_authStatus);
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3C8]), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/WirelessDiagnostics.bundle"), v7, v5);
    locationManager = v7->_locationManager;
    v7->_locationManager = (CLLocationManager *)v8;

  }
  return v7;
}

- (BOOL)isLocationAuthorized
{
  unsigned int v2;

  v2 = atomic_load((unsigned int *)&self->_authStatus);
  return v2 > 2;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  uint64_t v5;
  void *__p[2];
  char v7;
  void *v8[2];
  char v9;

  v4 = a3;
  atomic_store(objc_msgSend(v4, "authorizationStatus"), (unsigned int *)&self->_authStatus);
  std::string::basic_string[abi:ne180100]<0>(v8, "loc.del");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v5 = ImsLogger::debug(ims::_logger, (uint64_t)v8, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v5 + 8), (uint64_t)"Auth status ", 12);
  *(_BYTE *)(v5 + 17) = 0;
  atomic_load((unsigned int *)&self->_authStatus);
  std::ostream::operator<<();
  *(_BYTE *)(v5 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v5 + 64))(v5, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v5 + 17) = 0;
  if (v7 < 0)
    operator delete(__p[0]);
  if (v9 < 0)
    operator delete(v8[0]);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 0;
  return self;
}

@end
