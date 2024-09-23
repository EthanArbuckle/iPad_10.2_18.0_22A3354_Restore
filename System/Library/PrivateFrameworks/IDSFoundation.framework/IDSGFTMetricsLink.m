@implementation IDSGFTMetricsLink

- (void)setLinkType:(id)a3
{
  const char *v4;
  double v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend_setObject_forKeyedSubscript_(self->super._attributes, v4, (uint64_t)v6, v5, CFSTR("t"));
  os_unfair_lock_unlock(&self->super._lock);

}

- (void)setLocalRAT:(unsigned int)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  const char *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = IDSRadioAccessTechnologyToString(a3);
  objc_msgSend_stringWithUTF8String_(v6, v8, (uint64_t)v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->super._attributes, v11, (uint64_t)v10, v12, CFSTR("lrat"));

  os_unfair_lock_unlock(p_lock);
}

- (void)setRemoteRAT:(unsigned int)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  const char *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = IDSRadioAccessTechnologyToString(a3);
  objc_msgSend_stringWithUTF8String_(v6, v8, (uint64_t)v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->super._attributes, v11, (uint64_t)v10, v12, CFSTR("rrat"));

  os_unfair_lock_unlock(p_lock);
}

- (void)setIPVersion:(unsigned __int8)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;

  v3 = a3;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], v6, v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->super._attributes, v9, (uint64_t)v8, v10, CFSTR("ipver"));

  os_unfair_lock_unlock(p_lock);
}

- (void)setRelayProtocolStack:(id)a3
{
  const char *v4;
  double v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend_setObject_forKeyedSubscript_(self->super._attributes, v4, (uint64_t)v6, v5, CFSTR("rps"));
  os_unfair_lock_unlock(&self->super._lock);

}

- (void)setChannelDataProtocolStack:(id)a3
{
  const char *v4;
  double v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend_setObject_forKeyedSubscript_(self->super._attributes, v4, (uint64_t)v6, v5, CFSTR("cdps"));
  os_unfair_lock_unlock(&self->super._lock);

}

- (void)setIsTLEEnabled:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;

  v3 = a3;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v6, v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->super._attributes, v9, (uint64_t)v8, v10, CFSTR("tle"));

  os_unfair_lock_unlock(p_lock);
}

- (void)sendBindingRequest
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("sendbreq"), v2);
}

- (void)sendBindingResponse
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("sendbrsp"), v2);
}

- (void)receiveBindingRequest
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("recvbreq"), v2);
}

- (void)receiveBindingResponse
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("recvbrsp"), v2);
}

- (void)sendAllocbindRequest
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("sendabreq"), v2);
}

- (void)receiveAllocbindResponse
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("sendabrsp"), v2);
}

- (void)virtualRelayLinkConnected
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("lc-vr"), v2);
}

- (void)linkConnectedWithProtocolStack:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  id v11;

  v4 = a3;
  objc_msgSend_event_(self, v5, (uint64_t)CFSTR("lc"), v6);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("lc-%@"), v8, v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_event_(self, v9, (uint64_t)v11, v10);
}

- (void)allocBindRequestTimeOut
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("abtout"), v2);
}

@end
