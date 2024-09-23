@implementation MTRSampleMEIClusterPingCountEventEvent

- (MTRSampleMEIClusterPingCountEventEvent)init
{
  MTRSampleMEIClusterPingCountEventEvent *v2;
  MTRSampleMEIClusterPingCountEventEvent *v3;
  NSNumber *count;
  NSNumber *fabricIndex;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRSampleMEIClusterPingCountEventEvent;
  v2 = -[MTRSampleMEIClusterPingCountEventEvent init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    count = v2->_count;
    v2->_count = (NSNumber *)&unk_250591B18;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRSampleMEIClusterPingCountEventEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRSampleMEIClusterPingCountEventEvent);
  objc_msgSend_getCount(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCount_(v4, v8, (uint64_t)v7);

  objc_msgSend_fabricIndex(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: count:%@; fabricIndex:%@; >"),
    v5,
    self->_count,
    self->_fabricIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)getCount
{
  return self->_count;
}

- (void)setCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_count, 0);
}

@end
