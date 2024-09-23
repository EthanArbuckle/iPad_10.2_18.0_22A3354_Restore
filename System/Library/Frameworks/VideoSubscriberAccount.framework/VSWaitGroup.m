@implementation VSWaitGroup

- (VSWaitGroup)init
{
  VSWaitGroup *v2;
  dispatch_group_t v3;
  OS_dispatch_group *group;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSWaitGroup;
  v2 = -[VSWaitGroup init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;

  }
  return v2;
}

- (void)enter
{
  dispatch_group_enter((dispatch_group_t)self->_group);
}

- (void)leave
{
  dispatch_group_leave((dispatch_group_t)self->_group);
}

- (BOOL)waitWithMilliseconds:(unint64_t)a3
{
  dispatch_time_t v4;

  if (a3)
    v4 = dispatch_time(0, 1000000 * a3);
  else
    v4 = -1;
  return dispatch_group_wait((dispatch_group_t)self->_group, v4) == 0;
}

- (BOOL)wait
{
  return -[VSWaitGroup waitWithMilliseconds:](self, "waitWithMilliseconds:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

@end
