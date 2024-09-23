@implementation MTROccupancySensingClusterHoldTimeLimitsStruct

- (MTROccupancySensingClusterHoldTimeLimitsStruct)init
{
  MTROccupancySensingClusterHoldTimeLimitsStruct *v2;
  MTROccupancySensingClusterHoldTimeLimitsStruct *v3;
  NSNumber *holdTimeMin;
  NSNumber *holdTimeMax;
  NSNumber *holdTimeDefault;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTROccupancySensingClusterHoldTimeLimitsStruct;
  v2 = -[MTROccupancySensingClusterHoldTimeLimitsStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    holdTimeMin = v2->_holdTimeMin;
    v2->_holdTimeMin = (NSNumber *)&unk_250591B18;

    holdTimeMax = v3->_holdTimeMax;
    v3->_holdTimeMax = (NSNumber *)&unk_250591B18;

    holdTimeDefault = v3->_holdTimeDefault;
    v3->_holdTimeDefault = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROccupancySensingClusterHoldTimeLimitsStruct *v4;
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

  v4 = objc_alloc_init(MTROccupancySensingClusterHoldTimeLimitsStruct);
  objc_msgSend_holdTimeMin(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHoldTimeMin_(v4, v8, (uint64_t)v7);

  objc_msgSend_holdTimeMax(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHoldTimeMax_(v4, v12, (uint64_t)v11);

  objc_msgSend_holdTimeDefault(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHoldTimeDefault_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: holdTimeMin:%@; holdTimeMax:%@; holdTimeDefault:%@; >"),
    v5,
    self->_holdTimeMin,
    self->_holdTimeMax,
    self->_holdTimeDefault);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)holdTimeMin
{
  return self->_holdTimeMin;
}

- (void)setHoldTimeMin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)holdTimeMax
{
  return self->_holdTimeMax;
}

- (void)setHoldTimeMax:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)holdTimeDefault
{
  return self->_holdTimeDefault;
}

- (void)setHoldTimeDefault:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdTimeDefault, 0);
  objc_storeStrong((id *)&self->_holdTimeMax, 0);
  objc_storeStrong((id *)&self->_holdTimeMin, 0);
}

@end
