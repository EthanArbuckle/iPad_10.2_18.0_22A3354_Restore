@implementation AEServiceXPCConnectionOrigin

- (_QWORD)initWithServiceName:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)AEServiceXPCConnectionOrigin;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

    }
  }

  return a1;
}

- (id)makeConnection
{
  id v3;
  NSString *serviceName;

  v3 = objc_alloc(MEMORY[0x24BDD1988]);
  if (self)
    serviceName = self->_serviceName;
  else
    serviceName = 0;
  return (id)objc_msgSend(v3, "initWithServiceName:", serviceName);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
