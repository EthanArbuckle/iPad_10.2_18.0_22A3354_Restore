@implementation AEMachServiceXPCConnectionOrigin

- (_QWORD)initWithMachServiceName:(uint64_t)a3 options:
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v5 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)AEMachServiceXPCConnectionOrigin;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      v6 = objc_msgSend(v5, "copy");
      v7 = (void *)a1[1];
      a1[1] = v6;

      a1[2] = a3;
    }
  }

  return a1;
}

- (id)makeConnection
{
  id v3;
  NSString *v4;
  unint64_t options;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD1988]);
  if (self)
  {
    v4 = self->_machServiceName;
    options = self->_options;
  }
  else
  {
    v4 = 0;
    options = 0;
  }
  v6 = (void *)objc_msgSend(v3, "initWithMachServiceName:options:", v4, options);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end
