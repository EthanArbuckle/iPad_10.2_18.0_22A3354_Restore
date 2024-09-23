@implementation MTREnergyEVSEClusterRFIDEvent

- (MTREnergyEVSEClusterRFIDEvent)init
{
  const char *v2;
  uint64_t v3;
  MTREnergyEVSEClusterRFIDEvent *v4;
  uint64_t v5;
  NSData *uid;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTREnergyEVSEClusterRFIDEvent;
  v4 = -[MTREnergyEVSEClusterRFIDEvent init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    uid = v4->_uid;
    v4->_uid = (NSData *)v5;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTREnergyEVSEClusterRFIDEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v4 = objc_alloc_init(MTREnergyEVSEClusterRFIDEvent);
  objc_msgSend_uid(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUid_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_uid, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: uid:%@; >"), v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
}

@end
