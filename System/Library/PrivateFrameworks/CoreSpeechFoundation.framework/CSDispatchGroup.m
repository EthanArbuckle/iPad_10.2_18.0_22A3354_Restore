@implementation CSDispatchGroup

- (CSDispatchGroup)init
{
  CSDispatchGroup *v2;
  CSDispatchGroup *v3;
  dispatch_group_t v4;
  OS_dispatch_group *dispatchGroup;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSDispatchGroup;
  v2 = -[CSDispatchGroup init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_dispatchGroupCounter = 0;
    v4 = dispatch_group_create();
    dispatchGroup = v3->_dispatchGroup;
    v3->_dispatchGroup = (OS_dispatch_group *)v4;

  }
  return v3;
}

- (void)enter
{
  ++self->_dispatchGroupCounter;
  dispatch_group_enter((dispatch_group_t)self->_dispatchGroup);
}

- (void)leave
{
  int dispatchGroupCounter;
  BOOL v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  dispatchGroupCounter = self->_dispatchGroupCounter;
  v4 = __OFSUB__(dispatchGroupCounter--, 1);
  self->_dispatchGroupCounter = dispatchGroupCounter;
  if (dispatchGroupCounter < 0 != v4)
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[CSDispatchGroup leave]";
      _os_log_error_impl(&dword_1B502E000, v5, OS_LOG_TYPE_ERROR, "%s unbalanced dispatch_group_enter and leave : ignore we are ignore dispatch_group_leave", (uint8_t *)&v6, 0xCu);
    }
    self->_dispatchGroupCounter = 0;
  }
  else
  {
    dispatch_group_leave((dispatch_group_t)self->_dispatchGroup);
  }
}

- (int64_t)waitWithTimeout:(unint64_t)a3
{
  return dispatch_group_wait((dispatch_group_t)self->_dispatchGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
}

@end
