@implementation MTRUnitTestingClusterSimpleStruct

- (MTRUnitTestingClusterSimpleStruct)init
{
  MTRUnitTestingClusterSimpleStruct *v2;
  MTRUnitTestingClusterSimpleStruct *v3;
  NSNumber *a;
  NSNumber *b;
  NSNumber *c;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSData *d;
  NSString *e;
  NSNumber *f;
  NSNumber *g;
  NSNumber *h;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MTRUnitTestingClusterSimpleStruct;
  v2 = -[MTRUnitTestingClusterSimpleStruct init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    a = v2->_a;
    v2->_a = (NSNumber *)&unk_250591B18;

    b = v3->_b;
    v3->_b = (NSNumber *)&unk_250591B18;

    c = v3->_c;
    v3->_c = (NSNumber *)&unk_250591B18;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    d = v3->_d;
    v3->_d = (NSData *)v9;

    e = v3->_e;
    v3->_e = (NSString *)&stru_2505249E8;

    f = v3->_f;
    v3->_f = (NSNumber *)&unk_250591B18;

    g = v3->_g;
    v3->_g = (NSNumber *)&unk_250591B18;

    h = v3->_h;
    v3->_h = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterSimpleStruct *v4;
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
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;

  v4 = objc_alloc_init(MTRUnitTestingClusterSimpleStruct);
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

  objc_msgSend_h(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setH_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *a;
  NSNumber *b;
  NSNumber *c;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  a = self->_a;
  b = self->_b;
  c = self->_c;
  objc_msgSend_base64EncodedStringWithOptions_(self->_d, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v11, (uint64_t)CFSTR("<%@: a:%@; b:%@; c:%@; d:%@; e:%@; f:%@; g:%@; h:%@; >"),
    v5,
    a,
    b,
    c,
    v10,
    self->_e,
    self->_f,
    self->_g,
    self->_h);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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

- (NSNumber)c
{
  return self->_c;
}

- (void)setC:(NSNumber *)c
{
  objc_setProperty_nonatomic_copy(self, a2, c, 24);
}

- (NSData)d
{
  return self->_d;
}

- (void)setD:(NSData *)d
{
  objc_setProperty_nonatomic_copy(self, a2, d, 32);
}

- (NSString)e
{
  return self->_e;
}

- (void)setE:(NSString *)e
{
  objc_setProperty_nonatomic_copy(self, a2, e, 40);
}

- (NSNumber)f
{
  return self->_f;
}

- (void)setF:(NSNumber *)f
{
  objc_setProperty_nonatomic_copy(self, a2, f, 48);
}

- (NSNumber)g
{
  return self->_g;
}

- (void)setG:(NSNumber *)g
{
  objc_setProperty_nonatomic_copy(self, a2, g, 56);
}

- (NSNumber)h
{
  return self->_h;
}

- (void)setH:(NSNumber *)h
{
  objc_setProperty_nonatomic_copy(self, a2, h, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_h, 0);
  objc_storeStrong((id *)&self->_g, 0);
  objc_storeStrong((id *)&self->_f, 0);
  objc_storeStrong((id *)&self->_e, 0);
  objc_storeStrong((id *)&self->_d, 0);
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

@end
