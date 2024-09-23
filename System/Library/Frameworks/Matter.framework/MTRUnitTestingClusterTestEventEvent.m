@implementation MTRUnitTestingClusterTestEventEvent

- (MTRUnitTestingClusterTestEventEvent)init
{
  MTRUnitTestingClusterTestEventEvent *v2;
  MTRUnitTestingClusterTestEventEvent *v3;
  NSNumber *arg1;
  NSNumber *arg2;
  NSNumber *arg3;
  uint64_t v7;
  MTRUnitTestingClusterSimpleStruct *arg4;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *arg5;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *arg6;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTRUnitTestingClusterTestEventEvent;
  v2 = -[MTRUnitTestingClusterTestEventEvent init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    arg1 = v2->_arg1;
    v2->_arg1 = (NSNumber *)&unk_250591B18;

    arg2 = v3->_arg2;
    v3->_arg2 = (NSNumber *)&unk_250591B18;

    arg3 = v3->_arg3;
    v3->_arg3 = (NSNumber *)&unk_250591B18;

    v7 = objc_opt_new();
    arg4 = v3->_arg4;
    v3->_arg4 = (MTRUnitTestingClusterSimpleStruct *)v7;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    arg5 = v3->_arg5;
    v3->_arg5 = (NSArray *)v11;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    arg6 = v3->_arg6;
    v3->_arg6 = (NSArray *)v15;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterTestEventEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;

  v4 = objc_alloc_init(MTRUnitTestingClusterTestEventEvent);
  objc_msgSend_arg1(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg1_(v4, v8, (uint64_t)v7);

  objc_msgSend_arg2(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg2_(v4, v12, (uint64_t)v11);

  objc_msgSend_arg3(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg3_(v4, v16, (uint64_t)v15);

  objc_msgSend_arg4(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg4_(v4, v20, (uint64_t)v19);

  objc_msgSend_arg5(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg5_(v4, v24, (uint64_t)v23);

  objc_msgSend_arg6(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg6_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: arg1:%@; arg2:%@; arg3:%@; arg4:%@; arg5:%@; arg6:%@; >"),
    v5,
    self->_arg1,
    self->_arg2,
    self->_arg3,
    self->_arg4,
    self->_arg5,
    self->_arg6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)arg1
{
  return self->_arg1;
}

- (void)setArg1:(NSNumber *)arg1
{
  objc_setProperty_nonatomic_copy(self, a2, arg1, 8);
}

- (NSNumber)arg2
{
  return self->_arg2;
}

- (void)setArg2:(NSNumber *)arg2
{
  objc_setProperty_nonatomic_copy(self, a2, arg2, 16);
}

- (NSNumber)arg3
{
  return self->_arg3;
}

- (void)setArg3:(NSNumber *)arg3
{
  objc_setProperty_nonatomic_copy(self, a2, arg3, 24);
}

- (MTRUnitTestingClusterSimpleStruct)arg4
{
  return self->_arg4;
}

- (void)setArg4:(MTRUnitTestingClusterSimpleStruct *)arg4
{
  objc_setProperty_nonatomic_copy(self, a2, arg4, 32);
}

- (NSArray)arg5
{
  return self->_arg5;
}

- (void)setArg5:(NSArray *)arg5
{
  objc_setProperty_nonatomic_copy(self, a2, arg5, 40);
}

- (NSArray)arg6
{
  return self->_arg6;
}

- (void)setArg6:(NSArray *)arg6
{
  objc_setProperty_nonatomic_copy(self, a2, arg6, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arg6, 0);
  objc_storeStrong((id *)&self->_arg5, 0);
  objc_storeStrong((id *)&self->_arg4, 0);
  objc_storeStrong((id *)&self->_arg3, 0);
  objc_storeStrong((id *)&self->_arg2, 0);
  objc_storeStrong((id *)&self->_arg1, 0);
}

@end
