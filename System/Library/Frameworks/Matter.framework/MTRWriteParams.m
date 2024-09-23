@implementation MTRWriteParams

- (MTRWriteParams)init
{
  MTRWriteParams *v2;
  MTRWriteParams *v3;
  NSNumber *timedWriteTimeout;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTRWriteParams;
  v2 = -[MTRWriteParams init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    timedWriteTimeout = v2->_timedWriteTimeout;
    v2->_timedWriteTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRWriteParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRWriteParams);
  objc_msgSend_timedWriteTimeout(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedWriteTimeout_(v4, v8, (uint64_t)v7);

  objc_msgSend_dataVersion(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDataVersion_(v4, v12, (uint64_t)v11);

  return v4;
}

- (NSNumber)timedWriteTimeout
{
  return self->_timedWriteTimeout;
}

- (void)setTimedWriteTimeout:(NSNumber *)timedWriteTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, timedWriteTimeout, 8);
}

- (NSNumber)dataVersion
{
  return self->_dataVersion;
}

- (void)setDataVersion:(NSNumber *)dataVersion
{
  objc_setProperty_nonatomic_copy(self, a2, dataVersion, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataVersion, 0);
  objc_storeStrong((id *)&self->_timedWriteTimeout, 0);
}

@end
