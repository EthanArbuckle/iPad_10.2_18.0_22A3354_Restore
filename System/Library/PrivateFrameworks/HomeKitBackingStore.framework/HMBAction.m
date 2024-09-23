@implementation HMBAction

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _BOOL4 v7;
  int v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    v7 = -[HMBAction shouldUpdateClients](self, "shouldUpdateClients");
    v8 = v7 ^ objc_msgSend(v6, "shouldUpdateClients") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[HMBAction shouldUpdateClients](self, "shouldUpdateClients");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMBMutableAction *v4;

  v4 = -[HMBMutableAction init](+[HMBMutableAction allocWithZone:](HMBMutableAction, "allocWithZone:", a3), "init");
  -[HMBAction setShouldUpdateClients:](v4, "setShouldUpdateClients:", -[HMBAction shouldUpdateClients](self, "shouldUpdateClients"));
  return v4;
}

- (BOOL)shouldUpdateClients
{
  return self->_shouldUpdateClients;
}

- (void)setShouldUpdateClients:(BOOL)a3
{
  self->_shouldUpdateClients = a3;
}

+ (id)shouldUpdateClientsAction
{
  HMBMutableAction *v2;
  void *v3;

  v2 = objc_alloc_init(HMBMutableAction);
  -[HMBAction setShouldUpdateClients:](v2, "setShouldUpdateClients:", 1);
  v3 = (void *)-[HMBMutableAction copy](v2, "copy");

  return v3;
}

@end
