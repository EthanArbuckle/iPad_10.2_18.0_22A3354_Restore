@implementation MTRUnitTestingClusterDoubleNestedStructList

- (MTRUnitTestingClusterDoubleNestedStructList)init
{
  const char *v2;
  uint64_t v3;
  MTRUnitTestingClusterDoubleNestedStructList *v4;
  uint64_t v5;
  NSArray *a;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRUnitTestingClusterDoubleNestedStructList;
  v4 = -[MTRUnitTestingClusterDoubleNestedStructList init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCE30], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    a = v4->_a;
    v4->_a = (NSArray *)v5;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterDoubleNestedStructList *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v4 = objc_alloc_init(MTRUnitTestingClusterDoubleNestedStructList);
  objc_msgSend_a(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setA_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: a:%@; >"), v5, self->_a);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)a
{
  return self->_a;
}

- (void)setA:(NSArray *)a
{
  objc_setProperty_nonatomic_copy(self, a2, a, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_a, 0);
}

@end
