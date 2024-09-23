@implementation MTRSoftwareDiagnosticsClusterSoftwareFaultEvent

- (MTRSoftwareDiagnosticsClusterSoftwareFaultEvent)init
{
  MTRSoftwareDiagnosticsClusterSoftwareFaultEvent *v2;
  MTRSoftwareDiagnosticsClusterSoftwareFaultEvent *v3;
  NSNumber *id;
  NSString *name;
  NSData *faultRecording;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRSoftwareDiagnosticsClusterSoftwareFaultEvent;
  v2 = -[MTRSoftwareDiagnosticsClusterSoftwareFaultEvent init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    id = v2->_id;
    v2->_id = (NSNumber *)&unk_250591B18;

    name = v3->_name;
    v3->_name = 0;

    faultRecording = v3->_faultRecording;
    v3->_faultRecording = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRSoftwareDiagnosticsClusterSoftwareFaultEvent *v4;
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

  v4 = objc_alloc_init(MTRSoftwareDiagnosticsClusterSoftwareFaultEvent);
  objc_msgSend_id(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setId_(v4, v8, (uint64_t)v7);

  objc_msgSend_name(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v12, (uint64_t)v11);

  objc_msgSend_faultRecording(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFaultRecording_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *id;
  NSString *name;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id = self->_id;
  name = self->_name;
  objc_msgSend_base64EncodedStringWithOptions_(self->_faultRecording, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("<%@: id:%@; name:%@; faultRecording:%@; >"), v5, id, name, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSNumber)id
{
  return self->_id;
}

- (void)setId:(NSNumber *)id
{
  objc_setProperty_nonatomic_copy(self, a2, id, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 16);
}

- (NSData)faultRecording
{
  return self->_faultRecording;
}

- (void)setFaultRecording:(NSData *)faultRecording
{
  objc_setProperty_nonatomic_copy(self, a2, faultRecording, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faultRecording, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
