@implementation NEIKEv2IntegrityProtocol

- (NEIKEv2IntegrityProtocol)initWithType:(unint64_t)a3
{
  NEIKEv2IntegrityProtocol *v4;
  NEIKEv2IntegrityProtocol *v5;
  NEIKEv2IntegrityProtocol *v6;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2IntegrityProtocol;
  v4 = -[NEIKEv2IntegrityProtocol init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = v4;
  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }

  }
  return v5;
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;

  v3 = -[NEIKEv2IntegrityProtocol type](self, "type");
  if (v3 >= 0xF)
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown[%llu]"), -[NEIKEv2IntegrityProtocol type](self, "type"));
  else
    v4 = off_1E3CC0D10[v3];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[NEIKEv2IntegrityProtocol type](self, "type");
    v7 = objc_msgSend(v5, "type");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NEIKEv2IntegrityProtocol initWithType:](+[NEIKEv2IntegrityProtocol allocWithZone:](NEIKEv2IntegrityProtocol, "allocWithZone:", a3), "initWithType:", -[NEIKEv2IntegrityProtocol type](self, "type"));
}

- (unint64_t)type
{
  return self->_type;
}

- (uint64_t)digestLength
{
  void *v1;
  unint64_t v2;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)result;
    v2 = objc_msgSend((id)result, "type") - 1;
    if (v2 < 0xE && ((0x3863u >> v2) & 1) != 0)
    {
      return dword_19BED6FEC[v2];
    }
    else
    {
      ne_log_obj();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        v4[0] = 67109120;
        v4[1] = objc_msgSend(v1, "type");
        _os_log_fault_impl(&dword_19BD16000, v3, OS_LOG_TYPE_FAULT, "Unknown Integrity type %u", (uint8_t *)v4, 8u);
      }

      return 20;
    }
  }
  return result;
}

- (uint64_t)keyLength
{
  void *v1;
  unint64_t v2;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)result;
    v2 = objc_msgSend((id)result, "type") - 1;
    if (v2 < 0xE && ((0x3863u >> v2) & 1) != 0)
    {
      return dword_19BED7024[v2];
    }
    else
    {
      ne_log_obj();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        v4[0] = 67109120;
        v4[1] = objc_msgSend(v1, "type");
        _os_log_fault_impl(&dword_19BD16000, v3, OS_LOG_TYPE_FAULT, "Unknown Integrity type %u", (uint8_t *)v4, 8u);
      }

      return 20;
    }
  }
  return result;
}

@end
