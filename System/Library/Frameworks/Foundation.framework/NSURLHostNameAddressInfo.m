@implementation NSURLHostNameAddressInfo

+ (id)addressInfoForHost:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  id v7;
  id v8;

  pthread_once(&initControl_0, (void (*)(void))NSURLHostNameAddressInfoInit);
  objc_msgSend((id)_MergedGlobals_125, "lock");
  v4 = (void *)objc_msgSend((id)qword_1ECD0A238, "objectForKey:", a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_timestamp");
    if (v6 + 600.0 <= CFAbsoluteTimeGetCurrent())
    {
      objc_msgSend((id)qword_1ECD0A238, "removeObjectForKey:", a3);
      v5 = 0;
    }
    else
    {
      v7 = v5;
      v8 = v5;
    }
  }
  objc_msgSend((id)_MergedGlobals_125, "unlock");
  return v5;
}

+ (void)asyncResolveWithCallbackClient:(id)a3
{
  id v4;
  qos_class_t v5;
  pthread_t v6;
  pthread_attr_t __attr;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  pthread_once(&initControl_0, (void (*)(void))NSURLHostNameAddressInfoInit);
  v4 = a3;
  __dmb(0xBu);
  v6 = 0;
  memset(&__attr, 0, sizeof(__attr));
  pthread_attr_init(&__attr);
  pthread_attr_setdetachstate(&__attr, 2);
  v5 = qos_class_main();
  pthread_attr_set_qos_class_np(&__attr, v5, 0);
  pthread_create(&v6, &__attr, (void *(__cdecl *)(void *))resolveHostName, a3);
  pthread_attr_destroy(&__attr);
}

- (id)_initWithAddressInfo:(addrinfo *)a3
{
  NSURLHostNameAddressInfo *v4;
  NSURLHostNameAddressInfo *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSURLHostNameAddressInfo;
  v4 = -[NSURLHostNameAddressInfo init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->addressInfo = a3;
    v4->timestamp = CFAbsoluteTimeGetCurrent();
  }
  return v5;
}

- (addrinfo)addrinfo
{
  return self->addressInfo;
}

- (double)_timestamp
{
  return self->timestamp;
}

- (void)dealloc
{
  addrinfo *addressInfo;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  addressInfo = self->addressInfo;
  if (addressInfo)
    freeaddrinfo(addressInfo);
  v4.receiver = self;
  v4.super_class = (Class)NSURLHostNameAddressInfo;
  -[NSURLHostNameAddressInfo dealloc](&v4, sel_dealloc);
}

@end
