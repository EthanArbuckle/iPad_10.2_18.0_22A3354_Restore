@implementation FPXPCLogDelegate

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  fpfs_adopt_log(self->_log);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_setup_log_for_invocation(v8, v9, a5);
  objc_msgSend(v9, "invoke");
  __fp_pop_log(&v10);

}

+ (void)setupWithLog:(id)a3 forConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  const void *v10;
  _QWORD *value;

  v6 = a3;
  v7 = a4;
  value = objc_alloc_init((Class)a1);
  v8 = (void *)value[1];
  value[1] = v6;
  v9 = v6;

  objc_msgSend(v7, "setDelegate:", value);
  v10 = (const void *)objc_opt_class();

  objc_setAssociatedObject(v7, v10, value, (void *)0x301);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

@end
