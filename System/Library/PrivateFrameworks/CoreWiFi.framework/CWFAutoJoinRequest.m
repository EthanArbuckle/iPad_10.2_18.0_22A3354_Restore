@implementation CWFAutoJoinRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reply, 0);
  objc_storeStrong((id *)&self->_addedAt, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (id)reply
{
  return self->_reply;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_UUIDString(self->_UUID, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v7, v8, 5, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B0630E50(self->_addedAt);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("uuid=%@, addedAt=%@, params=%@, autoHotspot=%d, throttled=%d"), v14, v15, v11, v12, self->_parameters, self->_allowAutoHotspotFallback, self->_throttled);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)allowAutoHotspotFallback
{
  return self->_allowAutoHotspotFallback;
}

- (CWFAutoJoinParameters)parameters
{
  return self->_parameters;
}

- (BOOL)throttled
{
  return self->_throttled;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setAllowAutoHotspotFallback:(BOOL)a3
{
  self->_allowAutoHotspotFallback = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFAutoJoinRequest, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setParameters_(v11, v15, (uint64_t)self->_parameters, v16, v17);
  objc_msgSend_setAllowAutoHotspotFallback_(v11, v18, self->_allowAutoHotspotFallback, v19, v20);
  objc_msgSend_setAddedAt_(v11, v21, (uint64_t)self->_addedAt, v22, v23);
  objc_msgSend_setThrottled_(v11, v24, self->_throttled, v25, v26);
  objc_msgSend_setReply_(v11, v27, (uint64_t)self->_reply, v28, v29);
  return v11;
}

- (NSDate)addedAt
{
  return self->_addedAt;
}

- (void)setAddedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setThrottled:(BOOL)a3
{
  self->_throttled = a3;
}

@end
