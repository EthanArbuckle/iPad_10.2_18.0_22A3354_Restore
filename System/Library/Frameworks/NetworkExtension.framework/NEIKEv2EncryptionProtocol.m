@implementation NEIKEv2EncryptionProtocol

- (id)description
{
  id v3;
  __CFString *String;
  const char *v5;
  unint64_t wireType;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
  {
    String = NEIKEv2EncryptionWireTypeCreateString(self->_wireType);
    v5 = "";
    if (self->_is256Bit)
    {
      wireType = self->_wireType;
      if (wireType != 31 && wireType != 28)
        v5 = "_256";
    }
  }
  else
  {
    v5 = "";
    String = CFSTR("Invalid");
  }
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@%s"), String, v5);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL is256Bit;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    if (self)
    {
      if (self->_wireType != v5[2])
      {
        LOBYTE(self) = 0;
        goto LABEL_9;
      }
      is256Bit = self->_is256Bit;
    }
    else
    {
      is256Bit = 0;
      if (v5[2])
        goto LABEL_9;
    }
    LOBYTE(self) = is256Bit ^ ((v5[1] & 1) == 0);
LABEL_9:

    goto LABEL_10;
  }
  LOBYTE(self) = 0;
LABEL_10:

  return (char)self;
}

- (unint64_t)hash
{
  if (self)
  {
    if ((*(_BYTE *)(self + 8) & 1) != 0)
      return *(_QWORD *)(self + 16) + 0x10000;
    else
      return *(_QWORD *)(self + 16);
  }
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NEIKEv2EncryptionProtocol *v4;
  unint64_t wireType;
  char is256Bit;

  v4 = +[NEIKEv2EncryptionProtocol allocWithZone:](NEIKEv2EncryptionProtocol, "allocWithZone:", a3);
  if (self)
  {
    wireType = self->_wireType;
    is256Bit = self->_is256Bit;
  }
  else
  {
    wireType = 0;
    is256Bit = 0;
  }
  return -[NEIKEv2EncryptionProtocol initWithEncryptionWireType:is256Bit:](v4, wireType, is256Bit);
}

- (NEIKEv2EncryptionProtocol)initWithEncryptionType:(unint64_t)a3
{
  NSObject *p_super;
  char v4;
  char v5;
  char v6;
  unint64_t v7;
  NSObject *v9;
  NEIKEv2EncryptionProtocol *result;
  __CFString *String;
  objc_super v12;
  uint8_t buf[4];
  __CFString *v14;
  uint64_t v15;

  p_super = &self->super;
  v15 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 11;
  switch(a3)
  {
    case 1uLL:
      goto LABEL_17;
    case 2uLL:
      v4 = 0;
      v5 = 0;
      v6 = 0;
      goto LABEL_8;
    case 3uLL:
      v5 = 0;
      v6 = 0;
      v4 = 1;
LABEL_8:
      v7 = 12;
      goto LABEL_17;
    case 4uLL:
      v4 = 0;
      v5 = 0;
      v6 = 0;
      goto LABEL_11;
    case 5uLL:
      v5 = 0;
      v6 = 0;
      v4 = 1;
LABEL_11:
      v7 = 20;
      goto LABEL_17;
    case 6uLL:
      v6 = 0;
      v4 = 1;
      v7 = 28;
      v5 = 1;
      goto LABEL_17;
    case 7uLL:
      v5 = 0;
      v4 = 1;
      v7 = 31;
      v6 = 1;
      goto LABEL_17;
    case 8uLL:
      v4 = 0;
      v5 = 0;
      v6 = 0;
      goto LABEL_16;
    case 9uLL:
      v5 = 0;
      v6 = 0;
      v4 = 1;
LABEL_16:
      v7 = 30;
LABEL_17:
      v12.receiver = self;
      v12.super_class = (Class)NEIKEv2EncryptionProtocol;
      result = -[NEIKEv2EncryptionProtocol init](&v12, sel_init);
      if (result)
      {
        result->_wireType = v7;
        result->_is256Bit = v4 | v5 | v6;
      }
      else
      {
        ne_log_obj();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
        }
LABEL_6:

        return 0;
      }
      return result;
    default:
      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        String = NEIKEv2EncryptionTypeCreateString(a3);
        *(_DWORD *)buf = 138412290;
        v14 = String;
        _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, "Invalid NEIKEv2EncryptionType %@", buf, 0xCu);

      }
      goto LABEL_6;
  }
}

- (id)initWithEncryptionWireType:(char)a3 is256Bit:
{
  BOOL v6;
  char v7;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  if (result)
  {
    v10.receiver = result;
    v10.super_class = (Class)NEIKEv2EncryptionProtocol;
    result = objc_msgSendSuper2(&v10, sel_init);
    if (result)
    {
      *((_QWORD *)result + 2) = a2;
      v6 = a2 == 28 || a2 == 31;
      v7 = (a3 & 1) != 0 || v6;
      *((_BYTE *)result + 8) = v7;
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

      return 0;
    }
  }
  return result;
}

- (uint64_t)ivLength
{
  if (result)
  {
    if ((*(_QWORD *)(result + 16) | 8) == 0x1C)
      return 8;
    else
      return -[NEIKEv2EncryptionProtocol blockLength](result);
  }
  return result;
}

- (uint64_t)blockLength
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  __CFString *String;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 16);
    if (v2 > 19)
    {
      if (v2 == 20 || v2 == 28)
        return 0;
    }
    else
    {
      if ((unint64_t)(v2 - 2) < 2)
        return 8;
      if (v2 == 12)
        return 16;
    }
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      String = NEIKEv2EncryptionWireTypeCreateString(*(_QWORD *)(v1 + 16));
      v6 = 138412290;
      v7 = String;
      _os_log_fault_impl(&dword_19BD16000, v4, OS_LOG_TYPE_FAULT, "Unknown encryption wire type %@", (uint8_t *)&v6, 0xCu);

    }
    return 8;
  }
  return result;
}

- (uint64_t)keyLength
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  unsigned int v4;
  unsigned int v5;
  NSObject *v6;
  __CFString *String;
  int v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 16);
    if (v2 <= 19)
    {
      switch(v2)
      {
        case 2:
          return 8;
        case 3:
          return 24;
        case 12:
          v3 = (*(_BYTE *)(result + 8) & 1) == 0;
          v4 = 32;
          v5 = 16;
          goto LABEL_15;
      }
    }
    else
    {
      if (v2 <= 29)
      {
        if (v2 != 20)
        {
          if (v2 != 28)
            goto LABEL_19;
          return 36;
        }
        goto LABEL_14;
      }
      if (v2 == 30)
      {
LABEL_14:
        v3 = (*(_BYTE *)(result + 8) & 1) == 0;
        v4 = 36;
        v5 = 20;
LABEL_15:
        if (v3)
          return v5;
        else
          return v4;
      }
      if (v2 == 31)
        return 36;
    }
LABEL_19:
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      String = NEIKEv2EncryptionWireTypeCreateString(*(_QWORD *)(v1 + 16));
      v8 = 138412290;
      v9 = String;
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "Unknown encryption wire type %@", (uint8_t *)&v8, 0xCu);

    }
    return 24;
  }
  return result;
}

@end
