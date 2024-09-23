@implementation MTRDemandResponseLoadControlClusterAverageLoadControlStruct

- (MTRDemandResponseLoadControlClusterAverageLoadControlStruct)init
{
  MTRDemandResponseLoadControlClusterAverageLoadControlStruct *v2;
  MTRDemandResponseLoadControlClusterAverageLoadControlStruct *v3;
  NSNumber *loadAdjustment;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTRDemandResponseLoadControlClusterAverageLoadControlStruct;
  v2 = -[MTRDemandResponseLoadControlClusterAverageLoadControlStruct init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    loadAdjustment = v2->_loadAdjustment;
    v2->_loadAdjustment = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDemandResponseLoadControlClusterAverageLoadControlStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterAverageLoadControlStruct);
  objc_msgSend_loadAdjustment(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLoadAdjustment_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: loadAdjustment:%@; >"), v5, self->_loadAdjustment);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)loadAdjustment
{
  return self->_loadAdjustment;
}

- (void)setLoadAdjustment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadAdjustment, 0);
}

@end
