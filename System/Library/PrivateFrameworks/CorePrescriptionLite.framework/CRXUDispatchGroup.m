@implementation CRXUDispatchGroup

- (CRXUDispatchGroup)initWithName:(id)a3
{
  id v4;
  CRXUDispatchGroup *v5;
  dispatch_group_t v6;
  OS_dispatch_group *group;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRXUDispatchGroup;
  v5 = -[CRXUDispatchGroup init](&v11, sel_init);
  if (v5)
  {
    v6 = dispatch_group_create();
    group = v5->_group;
    v5->_group = (OS_dispatch_group *)v6;

    v8 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v8;

  }
  return v5;
}

- (void)enter
{
  dispatch_group_enter((dispatch_group_t)self->_group);
}

- (void)leave
{
  dispatch_group_leave((dispatch_group_t)self->_group);
}

- (void)onQueue:(id)a3 dispatchAsync:(id)a4
{
  NSObject *group;
  id v6;
  NSObject *v7;

  group = self->_group;
  v6 = a4;
  objc_msgSend(a3, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_group_async(group, v7, v6);

}

- (void)wait
{
  dispatch_group_wait((dispatch_group_t)self->_group, 0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)waitFor:(double)a3
{
  dispatch_time_t v4;

  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  return dispatch_group_wait((dispatch_group_t)self->_group, v4) == 0;
}

- (void)notifyOnQueue:(id)a3 withBlock:(id)a4
{
  NSObject *group;
  id v6;
  NSObject *v7;

  group = self->_group;
  v6 = a4;
  objc_msgSend(a3, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(group, v7, v6);

}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRXUDispatchGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
