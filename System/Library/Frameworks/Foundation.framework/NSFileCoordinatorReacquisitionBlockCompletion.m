@implementation NSFileCoordinatorReacquisitionBlockCompletion

+ (id)completionWithBlock:(id)a3 queue:(id)a4
{
  dispatch_group_t *v6;
  NSObject *v7;

  if (!a3)
    return 0;
  v6 = (dispatch_group_t *)(id)objc_opt_new();
  v7 = dispatch_group_create();
  v6[1] = v7;
  dispatch_group_enter(v7);
  dispatch_group_notify(v6[1], (dispatch_queue_t)a4, a3);
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  dispatch_release((dispatch_object_t)self->group);
  v3.receiver = self;
  v3.super_class = (Class)NSFileCoordinatorReacquisitionBlockCompletion;
  -[NSFileCoordinatorReacquisitionBlockCompletion dealloc](&v3, sel_dealloc);
}

- (void)increment
{
  dispatch_group_enter((dispatch_group_t)self->group);
}

- (void)decrement
{
  dispatch_group_leave((dispatch_group_t)self->group);
}

@end
