@implementation _MRSendCommandResultStatusProtobuf

- (int)statusCode
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_statusCode;
  else
    return 0;
}

- (void)setStatusCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_statusCode = a3;
}

- (void)setHasStatusCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatusCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)statusCodeAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 400)
  {
    if (a3 > 500)
    {
      if (a3 == 501)
        return CFSTR("MediaServicesUnavailable");
      if (a3 == 555)
        return CFSTR("Timeout");
    }
    else
    {
      if (a3 == 401)
        return CFSTR("AuthenticationFailure");
      if (a3 == 404)
      {
        v3 = CFSTR("UnsupportedCommand");
        return v3;
      }
    }
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  switch(a3)
  {
    case 'd':
      result = CFSTR("SkipAdProhibited");
      break;
    case 'e':
      result = CFSTR("QueueIsUserCurated");
      break;
    case 'f':
      result = CFSTR("UserModifiedQueueDisable");
      break;
    case 'g':
      result = CFSTR("UserQueueModificationNotSupportedForCurrentItem");
      break;
    case 'h':
      result = CFSTR("SubscriptionRequiredForSharedQueue");
      break;
    case 'i':
      result = CFSTR("InsertionPositionNotSpecified");
      break;
    case 'j':
      result = CFSTR("InvalidInsertionPosition");
      break;
    case 'k':
      result = CFSTR("RequestParametersOutOfBounds");
      break;
    case 'l':
      result = CFSTR("SkipLimitReached");
      break;
    case 'm':
      result = CFSTR("CannotModifyQueueWithPlaybackTokenItems");
      break;
    default:
      v3 = CFSTR("Success");
      switch(a3)
      {
        case 0:
          return v3;
        case 1:
          result = CFSTR("NoSuchContent");
          break;
        case 2:
          result = CFSTR("CommandFailed");
          break;
        case 3:
          result = CFSTR("UIKitLegacy");
          break;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          goto LABEL_19;
        case 10:
          result = CFSTR("NoActionableNowPlayingItem");
          break;
        default:
          if (a3 != 20)
            goto LABEL_19;
          result = CFSTR("DeviceNotFound");
          break;
      }
      break;
  }
  return result;
}

- (int)StringAsStatusCode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Success")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoSuchContent")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CommandFailed")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoActionableNowPlayingItem")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DeviceNotFound")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UIKitLegacy")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SkipAdProhibited")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QueueIsUserCurated")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserModifiedQueueDisable")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserQueueModificationNotSupportedForCurrentItem")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SubscriptionRequiredForSharedQueue")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InsertionPositionNotSpecified")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InvalidInsertionPosition")) & 1) != 0)
  {
    v4 = 106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RequestParametersOutOfBounds")) & 1) != 0)
  {
    v4 = 107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SkipLimitReached")) & 1) != 0)
  {
    v4 = 108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CannotModifyQueueWithPlaybackTokenItems")) & 1) != 0)
  {
    v4 = 109;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AuthenticationFailure")) & 1) != 0)
  {
    v4 = 401;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MediaServicesUnavailable")) & 1) != 0)
  {
    v4 = 501;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Timeout")) & 1) != 0)
  {
    v4 = 555;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UnsupportedCommand")))
  {
    v4 = 404;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 1)
  {
    if (a3 == 2)
      return CFSTR("Error");
    if (a3 == 999)
      return CFSTR("Custom");
    goto LABEL_10;
  }
  if (!a3)
    return CFSTR("Unknown");
  if (a3 != 1)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("Dialog");
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Dialog")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Error")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Custom")))
  {
    v4 = 999;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasDialog
{
  return self->_dialog != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (BOOL)hasCustomData
{
  return self->_customData != 0;
}

- (BOOL)hasCustomDataType
{
  return self->_customDataType != 0;
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
  v8.super_class = (Class)_MRSendCommandResultStatusProtobuf;
  -[_MRSendCommandResultStatusProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultStatusProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int statusCode;
  __CFString *v6;
  int type;
  __CFString *v8;
  _MRSendCommandResultHandlerDialogProtobuf *dialog;
  void *v10;
  _MRErrorProtobuf *error;
  void *v12;
  NSData *customData;
  NSString *customDataType;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    statusCode = self->_statusCode;
    if (statusCode <= 400)
    {
      switch(statusCode)
      {
        case 'd':
          v6 = CFSTR("SkipAdProhibited");
          break;
        case 'e':
          v6 = CFSTR("QueueIsUserCurated");
          break;
        case 'f':
          v6 = CFSTR("UserModifiedQueueDisable");
          break;
        case 'g':
          v6 = CFSTR("UserQueueModificationNotSupportedForCurrentItem");
          break;
        case 'h':
          v6 = CFSTR("SubscriptionRequiredForSharedQueue");
          break;
        case 'i':
          v6 = CFSTR("InsertionPositionNotSpecified");
          break;
        case 'j':
          v6 = CFSTR("InvalidInsertionPosition");
          break;
        case 'k':
          v6 = CFSTR("RequestParametersOutOfBounds");
          break;
        case 'l':
          v6 = CFSTR("SkipLimitReached");
          break;
        case 'm':
          v6 = CFSTR("CannotModifyQueueWithPlaybackTokenItems");
          break;
        default:
          v6 = CFSTR("Success");
          switch(statusCode)
          {
            case 0:
              goto LABEL_19;
            case 1:
              v6 = CFSTR("NoSuchContent");
              break;
            case 2:
              v6 = CFSTR("CommandFailed");
              break;
            case 3:
              v6 = CFSTR("UIKitLegacy");
              break;
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
              goto LABEL_18;
            case 10:
              v6 = CFSTR("NoActionableNowPlayingItem");
              break;
            default:
              if (statusCode != 20)
                goto LABEL_18;
              v6 = CFSTR("DeviceNotFound");
              break;
          }
          break;
      }
      goto LABEL_19;
    }
    if (statusCode > 500)
    {
      if (statusCode == 501)
      {
        v6 = CFSTR("MediaServicesUnavailable");
        goto LABEL_19;
      }
      if (statusCode == 555)
      {
        v6 = CFSTR("Timeout");
        goto LABEL_19;
      }
    }
    else
    {
      if (statusCode == 401)
      {
        v6 = CFSTR("AuthenticationFailure");
        goto LABEL_19;
      }
      if (statusCode == 404)
      {
        v6 = CFSTR("UnsupportedCommand");
LABEL_19:
        objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("statusCode"));

        has = (char)self->_has;
        goto LABEL_20;
      }
    }
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_statusCode);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_20:
  if ((has & 2) == 0)
    goto LABEL_32;
  type = self->_type;
  if (type > 1)
  {
    if (type == 2)
    {
      v8 = CFSTR("Error");
      goto LABEL_31;
    }
    if (type == 999)
    {
      v8 = CFSTR("Custom");
      goto LABEL_31;
    }
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (!type)
  {
    v8 = CFSTR("Unknown");
    goto LABEL_31;
  }
  if (type != 1)
    goto LABEL_30;
  v8 = CFSTR("Dialog");
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("type"));

LABEL_32:
  dialog = self->_dialog;
  if (dialog)
  {
    -[_MRSendCommandResultHandlerDialogProtobuf dictionaryRepresentation](dialog, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("dialog"));

  }
  error = self->_error;
  if (error)
  {
    -[_MRErrorProtobuf dictionaryRepresentation](error, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("error"));

  }
  customData = self->_customData;
  if (customData)
    objc_msgSend(v3, "setObject:forKey:", customData, CFSTR("customData"));
  customDataType = self->_customDataType;
  if (customDataType)
    objc_msgSend(v3, "setObject:forKey:", customDataType, CFSTR("customDataType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendCommandResultStatusProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_dialog)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_customData)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_customDataType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[10] = self->_statusCode;
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[11] = self->_type;
    *((_BYTE *)v4 + 48) |= 2u;
  }
  v6 = v4;
  if (self->_dialog)
  {
    objc_msgSend(v4, "setDialog:");
    v4 = v6;
  }
  if (self->_error)
  {
    objc_msgSend(v6, "setError:");
    v4 = v6;
  }
  if (self->_customData)
  {
    objc_msgSend(v6, "setCustomData:");
    v4 = v6;
  }
  if (self->_customDataType)
  {
    objc_msgSend(v6, "setCustomDataType:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_statusCode;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_type;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  v8 = -[_MRSendCommandResultHandlerDialogProtobuf copyWithZone:](self->_dialog, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  v10 = -[_MRErrorProtobuf copyWithZone:](self->_error, "copyWithZone:", a3);
  v11 = (void *)v6[4];
  v6[4] = v10;

  v12 = -[NSData copyWithZone:](self->_customData, "copyWithZone:", a3);
  v13 = (void *)v6[1];
  v6[1] = v12;

  v14 = -[NSString copyWithZone:](self->_customDataType, "copyWithZone:", a3);
  v15 = (void *)v6[2];
  v6[2] = v14;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRSendCommandResultHandlerDialogProtobuf *dialog;
  _MRErrorProtobuf *error;
  NSData *customData;
  NSString *customDataType;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_statusCode != *((_DWORD *)v4 + 10))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_type != *((_DWORD *)v4 + 11))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_20;
  }
  dialog = self->_dialog;
  if ((unint64_t)dialog | *((_QWORD *)v4 + 3)
    && !-[_MRSendCommandResultHandlerDialogProtobuf isEqual:](dialog, "isEqual:"))
  {
    goto LABEL_20;
  }
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 4))
  {
    if (!-[_MRErrorProtobuf isEqual:](error, "isEqual:"))
      goto LABEL_20;
  }
  customData = self->_customData;
  if ((unint64_t)customData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](customData, "isEqual:"))
      goto LABEL_20;
  }
  customDataType = self->_customDataType;
  if ((unint64_t)customDataType | *((_QWORD *)v4 + 2))
    v9 = -[NSString isEqual:](customDataType, "isEqual:");
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_statusCode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_type;
LABEL_6:
  v5 = v4 ^ v3 ^ -[_MRSendCommandResultHandlerDialogProtobuf hash](self->_dialog, "hash");
  v6 = -[_MRErrorProtobuf hash](self->_error, "hash");
  v7 = v5 ^ v6 ^ -[NSData hash](self->_customData, "hash");
  return v7 ^ -[NSString hash](self->_customDataType, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  _MRSendCommandResultHandlerDialogProtobuf *dialog;
  uint64_t v8;
  _MRErrorProtobuf *error;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 1) != 0)
  {
    self->_statusCode = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 48);
  }
  if ((v6 & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 2u;
  }
  dialog = self->_dialog;
  v8 = v5[3];
  v11 = v5;
  if (dialog)
  {
    if (!v8)
      goto LABEL_11;
    -[_MRSendCommandResultHandlerDialogProtobuf mergeFrom:](dialog, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    -[_MRSendCommandResultStatusProtobuf setDialog:](self, "setDialog:");
  }
  v5 = v11;
LABEL_11:
  error = self->_error;
  v10 = v5[4];
  if (error)
  {
    if (!v10)
      goto LABEL_17;
    -[_MRErrorProtobuf mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_17;
    -[_MRSendCommandResultStatusProtobuf setError:](self, "setError:");
  }
  v5 = v11;
LABEL_17:
  if (v5[1])
  {
    -[_MRSendCommandResultStatusProtobuf setCustomData:](self, "setCustomData:");
    v5 = v11;
  }
  if (v5[2])
  {
    -[_MRSendCommandResultStatusProtobuf setCustomDataType:](self, "setCustomDataType:");
    v5 = v11;
  }

}

- (_MRSendCommandResultHandlerDialogProtobuf)dialog
{
  return self->_dialog;
}

- (void)setDialog:(id)a3
{
  objc_storeStrong((id *)&self->_dialog, a3);
}

- (_MRErrorProtobuf)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSData)customData
{
  return self->_customData;
}

- (void)setCustomData:(id)a3
{
  objc_storeStrong((id *)&self->_customData, a3);
}

- (NSString)customDataType
{
  return self->_customDataType;
}

- (void)setCustomDataType:(id)a3
{
  objc_storeStrong((id *)&self->_customDataType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_customDataType, 0);
  objc_storeStrong((id *)&self->_customData, 0);
}

@end
