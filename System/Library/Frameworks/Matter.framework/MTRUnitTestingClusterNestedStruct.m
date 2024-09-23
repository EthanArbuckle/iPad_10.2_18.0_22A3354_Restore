@implementation MTRUnitTestingClusterNestedStruct

- (MTRUnitTestingClusterNestedStruct)init
{
  MTRUnitTestingClusterNestedStruct *v2;
  MTRUnitTestingClusterNestedStruct *v3;
  NSNumber *a;
  NSNumber *b;
  uint64_t v6;
  MTRUnitTestingClusterSimpleStruct *c;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRUnitTestingClusterNestedStruct;
  v2 = -[MTRUnitTestingClusterNestedStruct init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    a = v2->_a;
    v2->_a = (NSNumber *)&unk_250591B18;

    b = v3->_b;
    v3->_b = (NSNumber *)&unk_250591B18;

    v6 = objc_opt_new();
    c = v3->_c;
    v3->_c = (MTRUnitTestingClusterSimpleStruct *)v6;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterNestedStruct *v4;
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

  v4 = objc_alloc_init(MTRUnitTestingClusterNestedStruct);
  objc_msgSend_a(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setA_(v4, v8, (uint64_t)v7);

  objc_msgSend_b(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setB_(v4, v12, (uint64_t)v11);

  objc_msgSend_c(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setC_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: a:%@; b:%@; c:%@; >"), v5, self->_a, self->_b, self->_c);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)a
{
  return self->_a;
}

- (void)setA:(NSNumber *)a
{
  objc_setProperty_nonatomic_copy(self, a2, a, 8);
}

- (NSNumber)b
{
  return self->_b;
}

- (void)setB:(NSNumber *)b
{
  objc_setProperty_nonatomic_copy(self, a2, b, 16);
}

- (MTRUnitTestingClusterSimpleStruct)c
{
  return self->_c;
}

- (void)setC:(MTRUnitTestingClusterSimpleStruct *)c
{
  objc_setProperty_nonatomic_copy(self, a2, c, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

@end
