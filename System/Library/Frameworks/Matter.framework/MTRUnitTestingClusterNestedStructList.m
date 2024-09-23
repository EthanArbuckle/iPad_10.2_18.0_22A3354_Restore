@implementation MTRUnitTestingClusterNestedStructList

- (MTRUnitTestingClusterNestedStructList)init
{
  MTRUnitTestingClusterNestedStructList *v2;
  MTRUnitTestingClusterNestedStructList *v3;
  NSNumber *a;
  NSNumber *b;
  uint64_t v6;
  MTRUnitTestingClusterSimpleStruct *c;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *d;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *e;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *f;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *g;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MTRUnitTestingClusterNestedStructList;
  v2 = -[MTRUnitTestingClusterNestedStructList init](&v25, sel_init);
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

    objc_msgSend_array(MEMORY[0x24BDBCE30], v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    d = v3->_d;
    v3->_d = (NSArray *)v10;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    e = v3->_e;
    v3->_e = (NSArray *)v14;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    f = v3->_f;
    v3->_f = (NSArray *)v18;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    g = v3->_g;
    v3->_g = (NSArray *)v22;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterNestedStructList *v4;
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
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;

  v4 = objc_alloc_init(MTRUnitTestingClusterNestedStructList);
  objc_msgSend_a(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setA_(v4, v8, (uint64_t)v7);

  objc_msgSend_b(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setB_(v4, v12, (uint64_t)v11);

  objc_msgSend_c(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setC_(v4, v16, (uint64_t)v15);

  objc_msgSend_d(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setD_(v4, v20, (uint64_t)v19);

  objc_msgSend_e(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setE_(v4, v24, (uint64_t)v23);

  objc_msgSend_f(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setF_(v4, v28, (uint64_t)v27);

  objc_msgSend_g(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setG_(v4, v32, (uint64_t)v31);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: a:%@; b:%@; c:%@; d:%@; e:%@; f:%@; g:%@; >"),
    v5,
    self->_a,
    self->_b,
    self->_c,
    self->_d,
    self->_e,
    self->_f,
    self->_g);
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

- (NSArray)d
{
  return self->_d;
}

- (void)setD:(NSArray *)d
{
  objc_setProperty_nonatomic_copy(self, a2, d, 32);
}

- (NSArray)e
{
  return self->_e;
}

- (void)setE:(NSArray *)e
{
  objc_setProperty_nonatomic_copy(self, a2, e, 40);
}

- (NSArray)f
{
  return self->_f;
}

- (void)setF:(NSArray *)f
{
  objc_setProperty_nonatomic_copy(self, a2, f, 48);
}

- (NSArray)g
{
  return self->_g;
}

- (void)setG:(NSArray *)g
{
  objc_setProperty_nonatomic_copy(self, a2, g, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_g, 0);
  objc_storeStrong((id *)&self->_f, 0);
  objc_storeStrong((id *)&self->_e, 0);
  objc_storeStrong((id *)&self->_d, 0);
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

@end
