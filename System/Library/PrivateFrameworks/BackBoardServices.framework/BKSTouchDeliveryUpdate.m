@implementation BKSTouchDeliveryUpdate

- (BKSTouchDeliveryUpdate)initWithCoder:(id)a3
{
  id v4;
  BKSTouchDeliveryUpdate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSTouchDeliveryUpdate;
  v5 = -[BKSTouchDeliveryUpdate init](&v7, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("updateType"));
    v5->_touchIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("touchIdentifier"));
    v5->_isDetached = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDetached"));
    v5->_contextID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contextID"));
    v5->_pid = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pid"));
  }

  return v5;
}

- (unsigned)touchIdentifier
{
  return self->_touchIdentifier;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (int)pid
{
  return self->_pid;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isDetached
{
  return self->_isDetached;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("updateType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_touchIdentifier, CFSTR("touchIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDetached, CFSTR("isDetached"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contextID, CFSTR("contextID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pid, CFSTR("pid"));

}

- (void)setTouchIdentifier:(unsigned int)a3
{
  self->_touchIdentifier = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[BKSTouchDeliveryUpdate init](+[BKSTouchDeliveryUpdate allocWithZone:](BKSTouchDeliveryUpdate, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 3) = self->_type;
  *((_DWORD *)result + 3) = self->_touchIdentifier;
  *((_BYTE *)result + 8) = self->_isDetached;
  *((_DWORD *)result + 4) = self->_contextID;
  *((_DWORD *)result + 5) = self->_pid;
  return result;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setIsDetached:(BOOL)a3
{
  self->_isDetached = a3;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD *v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = v8
    && self->_type == v8[3]
    && self->_touchIdentifier == *((_DWORD *)v8 + 3)
    && self->_isDetached == *((unsigned __int8 *)v8 + 8)
    && self->_contextID == *((_DWORD *)v8 + 4)
    && self->_pid == *((_DWORD *)v8 + 5);

  return v9;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BKSTouchDeliveryUpdate *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__BKSTouchDeliveryUpdate_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

id __52__BKSTouchDeliveryUpdate_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id result;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  NSStringFromBKSTouchDeliveryUpdateType(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, 0);

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(unsigned int *)(v4 + 12);
  if ((_DWORD)v5)
  {
    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", v5, CFSTR("touchIdentifier"));
    v4 = *(_QWORD *)(a1 + 40);
  }
  if (*(_BYTE *)(v4 + 8))
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", 1, CFSTR("detached"));
    v4 = *(_QWORD *)(a1 + 40);
  }
  result = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(int *)(v4 + 20), CFSTR("pid"));
  v9 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 16);
  if ((_DWORD)v9)
    return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", v9, CFSTR("contextID"));
  return result;
}

@end
