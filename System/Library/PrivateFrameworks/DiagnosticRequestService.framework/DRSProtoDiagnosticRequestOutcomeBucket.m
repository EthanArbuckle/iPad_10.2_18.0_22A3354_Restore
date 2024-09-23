@implementation DRSProtoDiagnosticRequestOutcomeBucket

- (int)outcome
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_outcome;
  else
    return 1;
}

- (void)setOutcome:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_outcome = a3;
}

- (void)setHasOutcome:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOutcome
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)outcomeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1EA3D1D70[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOutcome:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ERROR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUCCESS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REJECTED")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)requestState
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_requestState;
  else
    return 4096;
}

- (void)setRequestState:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_requestState = a3;
}

- (void)setHasRequestState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRequestState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)requestStateAsString:(int)a3
{
  __CFString *v3;
  id result;

  v3 = CFSTR("REJECTED_RESOURCE_HYSTERESIS");
  switch(a3)
  {
    case 4096:
      goto LABEL_4;
    case 4097:
      result = CFSTR("REJECTED_RESOURCE_CAP");
      break;
    case 4098:
      result = CFSTR("REJECTED_RESOURCE_RANDOM_DOWNSAMPLING");
      break;
    case 4099:
      result = CFSTR("REJECTED_SIGNATURE_HYSTERESIS");
      break;
    case 4100:
      result = CFSTR("REJECTED_SIGNATURE_CAP");
      break;
    case 4101:
      result = CFSTR("REJECTED_SIGNATURE_RANDOM_DOWNSAMPLING");
      break;
    case 4102:
      result = CFSTR("REJECTED_TOTAL_CAP");
      break;
    case 4103:
      result = CFSTR("REJECTED_DISABLED_SERVICE");
      break;
    default:
      switch(a3)
      {
        case 4352:
          v3 = CFSTR("ERROR_ON_RECEIPT_WORK_FAILURE");
          break;
        case 4353:
          return CFSTR("REJECTED_REJECTED_BY_DS");
        case 4354:
          return CFSTR("ERROR_LOG_CULLED");
        case 4355:
          return CFSTR("ERROR_UPLOAD_ATTEMPTS_FAILED");
        case 4356:
          return CFSTR("REJECTED_CUSTOMER_DISABLED");
        case 4357:
          return CFSTR("ERROR_LOG_EXCEEDS_CAP");
        case 4358:
          return CFSTR("ERROR_INVALID_TRANSITION");
        case 4359:
          return CFSTR("ERROR_LOG_STATE_UPDATE_FAILURE");
        default:
          if (a3 == 0x2000)
            return CFSTR("SUCCESS_UPLOADED");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
LABEL_4:
      result = v3;
      break;
  }
  return result;
}

- (int)StringAsRequestState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REJECTED_RESOURCE_HYSTERESIS")) & 1) != 0)
  {
    v4 = 4096;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REJECTED_RESOURCE_CAP")) & 1) != 0)
  {
    v4 = 4097;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REJECTED_RESOURCE_RANDOM_DOWNSAMPLING")) & 1) != 0)
  {
    v4 = 4098;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REJECTED_SIGNATURE_HYSTERESIS")) & 1) != 0)
  {
    v4 = 4099;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REJECTED_SIGNATURE_CAP")) & 1) != 0)
  {
    v4 = 4100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REJECTED_SIGNATURE_RANDOM_DOWNSAMPLING")) & 1) != 0)
  {
    v4 = 4101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REJECTED_TOTAL_CAP")) & 1) != 0)
  {
    v4 = 4102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REJECTED_DISABLED_SERVICE")) & 1) != 0)
  {
    v4 = 4103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REJECTED_REJECTED_BY_DS")) & 1) != 0)
  {
    v4 = 4353;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REJECTED_CUSTOMER_DISABLED")) & 1) != 0)
  {
    v4 = 4356;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ERROR_ON_RECEIPT_WORK_FAILURE")) & 1) != 0)
  {
    v4 = 4352;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ERROR_LOG_CULLED")) & 1) != 0)
  {
    v4 = 4354;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ERROR_UPLOAD_ATTEMPTS_FAILED")) & 1) != 0)
  {
    v4 = 4355;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ERROR_LOG_EXCEEDS_CAP")) & 1) != 0)
  {
    v4 = 4357;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ERROR_INVALID_TRANSITION")) & 1) != 0)
  {
    v4 = 4358;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ERROR_LOG_STATE_UPDATE_FAILURE")) & 1) != 0)
  {
    v4 = 4359;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUCCESS_UPLOADED")))
  {
    v4 = 0x2000;
  }
  else
  {
    v4 = 4096;
  }

  return v4;
}

- (void)setCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoDiagnosticRequestOutcomeBucket;
  -[DRSProtoDiagnosticRequestOutcomeBucket description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoDiagnosticRequestOutcomeBucket dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v7;
  __CFString *v8;
  int requestState;
  __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_10:
    requestState = self->_requestState;
    v10 = CFSTR("REJECTED_RESOURCE_HYSTERESIS");
    switch(requestState)
    {
      case 4096:
        break;
      case 4097:
        v10 = CFSTR("REJECTED_RESOURCE_CAP");
        break;
      case 4098:
        v10 = CFSTR("REJECTED_RESOURCE_RANDOM_DOWNSAMPLING");
        break;
      case 4099:
        v10 = CFSTR("REJECTED_SIGNATURE_HYSTERESIS");
        break;
      case 4100:
        v10 = CFSTR("REJECTED_SIGNATURE_CAP");
        break;
      case 4101:
        v10 = CFSTR("REJECTED_SIGNATURE_RANDOM_DOWNSAMPLING");
        break;
      case 4102:
        v10 = CFSTR("REJECTED_TOTAL_CAP");
        break;
      case 4103:
        v10 = CFSTR("REJECTED_DISABLED_SERVICE");
        break;
      default:
        switch(requestState)
        {
          case 4352:
            v10 = CFSTR("ERROR_ON_RECEIPT_WORK_FAILURE");
            break;
          case 4353:
            v10 = CFSTR("REJECTED_REJECTED_BY_DS");
            break;
          case 4354:
            v10 = CFSTR("ERROR_LOG_CULLED");
            break;
          case 4355:
            v10 = CFSTR("ERROR_UPLOAD_ATTEMPTS_FAILED");
            break;
          case 4356:
            v10 = CFSTR("REJECTED_CUSTOMER_DISABLED");
            break;
          case 4357:
            v10 = CFSTR("ERROR_LOG_EXCEEDS_CAP");
            break;
          case 4358:
            v10 = CFSTR("ERROR_INVALID_TRANSITION");
            break;
          case 4359:
            v10 = CFSTR("ERROR_LOG_STATE_UPDATE_FAILURE");
            break;
          default:
            if (requestState == 0x2000)
            {
              v10 = CFSTR("SUCCESS_UPLOADED");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requestState);
              v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            break;
        }
        break;
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("request_state"));

    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
    return v3;
  }
  v7 = self->_outcome - 1;
  if (v7 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_outcome);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1EA3D1D70[v7];
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("outcome"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_10;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_count);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("count"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoDiagnosticRequestOutcomeBucketReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v4[5] = self->_requestState;
    *((_BYTE *)v4 + 24) |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[4] = self->_outcome;
  *((_BYTE *)v4 + 24) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *((_QWORD *)v4 + 1) = self->_count;
    *((_BYTE *)v4 + 24) |= 1u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_outcome;
    *((_BYTE *)result + 24) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_requestState;
  *((_BYTE *)result + 24) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_4:
  *((_QWORD *)result + 1) = self->_count;
  *((_BYTE *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_outcome != *((_DWORD *)v4 + 4))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_requestState != *((_DWORD *)v4 + 5))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_count != *((_QWORD *)v4 + 1))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_outcome;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_requestState;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761u * self->_count;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_requestState = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 24) & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_outcome = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 1) != 0)
  {
LABEL_4:
    self->_count = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:

}

- (unint64_t)count
{
  return self->_count;
}

@end
