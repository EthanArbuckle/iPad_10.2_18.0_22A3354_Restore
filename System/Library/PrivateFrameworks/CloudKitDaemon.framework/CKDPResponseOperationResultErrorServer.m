@implementation CKDPResponseOperationResultErrorServer

- (id)_typeCKLogValue
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  __CFString *v5;
  id result;

  v4 = objc_msgSend_type(self, a2, v2);
  v5 = CFSTR("unknown");
  switch((int)v4)
  {
    case 1:
      goto LABEL_16;
    case 2:
      result = CFSTR("overloaded");
      break;
    case 3:
      result = CFSTR("notFound");
      break;
    case 4:
      result = CFSTR("containerUnavailable");
      break;
    case 5:
LABEL_5:
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v3, (uint64_t)CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_16:
      result = v5;
      break;
    case 6:
      result = CFSTR("mescalSignatureParseError");
      break;
    case 7:
      result = CFSTR("zoneBusy");
      break;
    case 8:
      result = CFSTR("zoneUnavailable");
      break;
    case 9:
      result = CFSTR("transactionTimeout");
      break;
    default:
      switch((int)v4)
      {
        case 200001:
          result = CFSTR("partitionLookupFailed");
          break;
        case 200002:
          result = CFSTR("timeoutOnInternalBackends");
          break;
        case 200003:
          result = CFSTR("solrError");
          break;
        case 200004:
          result = CFSTR("userAssignmentLocked");
          break;
        case 200005:
          v5 = CFSTR("quotaServiceUnavailable");
          goto LABEL_16;
        default:
          goto LABEL_5;
      }
      break;
  }
  return result;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;
  id result;

  v3 = CFSTR("unknown");
  switch(a3)
  {
    case 1:
      goto LABEL_3;
    case 2:
      v3 = CFSTR("overloaded");
      goto LABEL_3;
    case 3:
      return CFSTR("notFound");
    case 4:
      return CFSTR("containerUnavailable");
    case 5:
LABEL_7:
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
      result = v3;
      break;
    case 6:
      result = CFSTR("mescalSignatureParseError");
      break;
    case 7:
      result = CFSTR("zoneBusy");
      break;
    case 8:
      result = CFSTR("zoneUnavailable");
      break;
    case 9:
      result = CFSTR("transactionTimeout");
      break;
    default:
      switch(a3)
      {
        case 200001:
          result = CFSTR("partitionLookupFailed");
          break;
        case 200002:
          result = CFSTR("timeoutOnInternalBackends");
          break;
        case 200003:
          result = CFSTR("solrError");
          break;
        case 200004:
          result = CFSTR("userAssignmentLocked");
          break;
        case 200005:
          result = CFSTR("quotaServiceUnavailable");
          break;
        default:
          goto LABEL_7;
      }
      break;
  }
  return result;
}

- (int)StringAsType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("unknown")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("overloaded")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("notFound")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("containerUnavailable")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("mescalSignatureParseError")) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("zoneBusy")) & 1) != 0)
  {
    v6 = 7;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("zoneUnavailable")) & 1) != 0)
  {
    v6 = 8;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v12, (uint64_t)CFSTR("transactionTimeout")) & 1) != 0)
  {
    v6 = 9;
  }
  else
  {
    v6 = 200001;
    if ((objc_msgSend_isEqualToString_(v3, v13, (uint64_t)CFSTR("partitionLookupFailed")) & 1) == 0)
    {
      if ((objc_msgSend_isEqualToString_(v3, v14, (uint64_t)CFSTR("timeoutOnInternalBackends")) & 1) != 0)
      {
        v6 = 200002;
      }
      else if ((objc_msgSend_isEqualToString_(v3, v15, (uint64_t)CFSTR("solrError")) & 1) != 0)
      {
        v6 = 200003;
      }
      else if ((objc_msgSend_isEqualToString_(v3, v16, (uint64_t)CFSTR("userAssignmentLocked")) & 1) != 0)
      {
        v6 = 200004;
      }
      else if (objc_msgSend_isEqualToString_(v3, v17, (uint64_t)CFSTR("quotaServiceUnavailable")))
      {
        v6 = 200005;
      }
      else
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPResponseOperationResultErrorServer;
  -[CKDPResponseOperationResultErrorServer description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  void *v5;
  uint64_t type;
  __CFString *v7;
  const char *v8;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    type = self->_type;
    v7 = CFSTR("unknown");
    switch((int)type)
    {
      case 1:
LABEL_17:
        objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)v7, CFSTR("type"));
        break;
      case 2:
        v7 = CFSTR("overloaded");
        objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("overloaded"), CFSTR("type"));
        break;
      case 3:
        v7 = CFSTR("notFound");
        objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("notFound"), CFSTR("type"));
        break;
      case 4:
        v7 = CFSTR("containerUnavailable");
        objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("containerUnavailable"), CFSTR("type"));
        break;
      case 5:
LABEL_6:
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), type);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, CFSTR("type"));
        break;
      case 6:
        v7 = CFSTR("mescalSignatureParseError");
        objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("mescalSignatureParseError"), CFSTR("type"));
        break;
      case 7:
        v7 = CFSTR("zoneBusy");
        objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("zoneBusy"), CFSTR("type"));
        break;
      case 8:
        v7 = CFSTR("zoneUnavailable");
        objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("zoneUnavailable"), CFSTR("type"));
        break;
      case 9:
        v7 = CFSTR("transactionTimeout");
        objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("transactionTimeout"), CFSTR("type"));
        break;
      default:
        switch((int)type)
        {
          case 200001:
            v7 = CFSTR("partitionLookupFailed");
            objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("partitionLookupFailed"), CFSTR("type"));
            break;
          case 200002:
            v7 = CFSTR("timeoutOnInternalBackends");
            objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("timeoutOnInternalBackends"), CFSTR("type"));
            break;
          case 200003:
            v7 = CFSTR("solrError");
            objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("solrError"), CFSTR("type"));
            break;
          case 200004:
            v7 = CFSTR("userAssignmentLocked");
            objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("userAssignmentLocked"), CFSTR("type"));
            break;
          case 200005:
            v7 = CFSTR("quotaServiceUnavailable");
            goto LABEL_17;
          default:
            goto LABEL_6;
        }
        break;
    }

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPResponseOperationResultErrorServerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_type;
    *((_BYTE *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id result;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  result = (id)objc_msgSend_init(v7, v8, v9);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_type;
    *((_BYTE *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_6;
  v7 = (*((_BYTE *)v4 + 12) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 12) & 1) != 0 && self->_type == *((_DWORD *)v4 + 2))
    {
      v7 = 1;
      goto LABEL_7;
    }
LABEL_6:
    v7 = 0;
  }
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761 * self->_type;
  else
    return 0;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 12) & 1) != 0)
  {
    self->_type = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
}

@end
