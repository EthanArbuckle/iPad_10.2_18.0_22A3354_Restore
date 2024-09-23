@implementation ATPMessage

- (int)messageType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_messageType;
  else
    return 0;
}

- (void)setMessageType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_messageType = a3;
}

- (void)setHasMessageType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMessageType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)messageTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E928C330[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMessageType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Request")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Response")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ResponsePartial")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RequestData")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ResponseData")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMessageID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_messageID = a3;
}

- (void)setHasMessageID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMessageID
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSessionID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionID
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasParameters
{
  return self->_parameters != 0;
}

- (BOOL)hasParamsSignature
{
  return self->_paramsSignature != 0;
}

- (BOOL)hasPayloadSignature
{
  return self->_payloadSignature != 0;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (void)setAdditionalPayload:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_additionalPayload = a3;
}

- (void)setHasAdditionalPayload:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAdditionalPayload
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasStreamError
{
  return self->_streamError != 0;
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
  v8.super_class = (Class)ATPMessage;
  -[ATPMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATPMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t messageType;
  __CFString *v6;
  void *v7;
  void *v8;
  NSData *parameters;
  NSData *paramsSignature;
  NSData *payloadSignature;
  ATPRequest *request;
  void *v13;
  ATPResponse *response;
  void *v15;
  NSData *payload;
  void *v17;
  ATPError *streamError;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    messageType = self->_messageType;
    if (messageType >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_messageType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E928C330[messageType];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("messageType"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_messageID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("messageID"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sessionID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("sessionID"));

  }
  parameters = self->_parameters;
  if (parameters)
    objc_msgSend(v3, "setObject:forKey:", parameters, CFSTR("parameters"));
  paramsSignature = self->_paramsSignature;
  if (paramsSignature)
    objc_msgSend(v3, "setObject:forKey:", paramsSignature, CFSTR("paramsSignature"));
  payloadSignature = self->_payloadSignature;
  if (payloadSignature)
    objc_msgSend(v3, "setObject:forKey:", payloadSignature, CFSTR("payloadSignature"));
  request = self->_request;
  if (request)
  {
    -[ATPRequest dictionaryRepresentation](request, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("request"));

  }
  response = self->_response;
  if (response)
  {
    -[ATPResponse dictionaryRepresentation](response, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("response"));

  }
  payload = self->_payload;
  if (payload)
    objc_msgSend(v3, "setObject:forKey:", payload, CFSTR("payload"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_additionalPayload);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("additionalPayload"));

  }
  streamError = self->_streamError;
  if (streamError)
  {
    -[ATPError dictionaryRepresentation](streamError, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("streamError"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  ATPRequest *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  objc_class *v36;
  uint64_t v37;
  void *v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  int v45;
  uint64_t v46;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      v18 = v11 >> 3;
      if ((int)(v11 >> 3) <= 19)
      {
        switch((int)v18)
        {
          case 1:
            v19 = 0;
            v20 = 0;
            v21 = 0;
            *(_BYTE *)&self->_has |= 2u;
            while (2)
            {
              v22 = *v4;
              v23 = *(_QWORD *)((char *)a3 + v22);
              if (v23 == -1 || v23 >= *(_QWORD *)((char *)a3 + *v5))
              {
                *((_BYTE *)a3 + *v6) = 1;
              }
              else
              {
                v24 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v23);
                *(_QWORD *)((char *)a3 + v22) = v23 + 1;
                v21 |= (unint64_t)(v24 & 0x7F) << v19;
                if (v24 < 0)
                {
                  v19 += 7;
                  v15 = v20++ >= 9;
                  if (v15)
                  {
                    LODWORD(v21) = 0;
                    goto LABEL_73;
                  }
                  continue;
                }
              }
              break;
            }
            if (*((_BYTE *)a3 + *v6))
              LODWORD(v21) = 0;
LABEL_73:
            v46 = 12;
            goto LABEL_82;
          case 2:
            v26 = 0;
            v27 = 0;
            v21 = 0;
            *(_BYTE *)&self->_has |= 1u;
            while (2)
            {
              v28 = *v4;
              v29 = *(_QWORD *)((char *)a3 + v28);
              if (v29 == -1 || v29 >= *(_QWORD *)((char *)a3 + *v5))
              {
                *((_BYTE *)a3 + *v6) = 1;
              }
              else
              {
                v30 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v29);
                *(_QWORD *)((char *)a3 + v28) = v29 + 1;
                v21 |= (unint64_t)(v30 & 0x7F) << v26;
                if (v30 < 0)
                {
                  v26 += 7;
                  v15 = v27++ >= 9;
                  if (v15)
                  {
                    LODWORD(v21) = 0;
                    goto LABEL_77;
                  }
                  continue;
                }
              }
              break;
            }
            if (*((_BYTE *)a3 + *v6))
              LODWORD(v21) = 0;
LABEL_77:
            v46 = 8;
            goto LABEL_82;
          case 3:
            v31 = 0;
            v32 = 0;
            v21 = 0;
            *(_BYTE *)&self->_has |= 4u;
            break;
          case 4:
            PBReaderReadData();
            v36 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v37 = 16;
            goto LABEL_57;
          case 5:
            PBReaderReadData();
            v36 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v37 = 24;
            goto LABEL_57;
          case 6:
            PBReaderReadData();
            v36 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v37 = 40;
            goto LABEL_57;
          default:
            goto LABEL_68;
        }
        while (1)
        {
          v33 = *v4;
          v34 = *(_QWORD *)((char *)a3 + v33);
          if (v34 == -1 || v34 >= *(_QWORD *)((char *)a3 + *v5))
            break;
          v35 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v34);
          *(_QWORD *)((char *)a3 + v33) = v34 + 1;
          v21 |= (unint64_t)(v35 & 0x7F) << v31;
          if ((v35 & 0x80) == 0)
            goto LABEL_79;
          v31 += 7;
          v15 = v32++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_81;
          }
        }
        *((_BYTE *)a3 + *v6) = 1;
LABEL_79:
        if (*((_BYTE *)a3 + *v6))
          LODWORD(v21) = 0;
LABEL_81:
        v46 = 64;
LABEL_82:
        *(_DWORD *)((char *)&self->super.super.isa + v46) = v21;
        continue;
      }
      if ((int)v18 <= 29)
      {
        if ((_DWORD)v18 == 20)
        {
          v25 = objc_alloc_init(ATPRequest);
          objc_storeStrong((id *)&self->_request, v25);
          if (!PBReaderPlaceMark() || !ATPRequestReadFrom((uint64_t)v25, (uint64_t)a3))
          {
LABEL_89:

            LOBYTE(v45) = 0;
            return v45;
          }
        }
        else
        {
          if ((_DWORD)v18 != 21)
          {
LABEL_68:
            v45 = PBReaderSkipValueWithTag();
            if (!v45)
              return v45;
            continue;
          }
          v25 = objc_alloc_init(ATPResponse);
          objc_storeStrong((id *)&self->_response, v25);
          if (!PBReaderPlaceMark() || (ATPResponseReadFrom((uint64_t)v25, (uint64_t)a3) & 1) == 0)
            goto LABEL_89;
        }
      }
      else
      {
        if ((_DWORD)v18 == 30)
        {
          PBReaderReadData();
          v36 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v37 = 32;
LABEL_57:
          v38 = *(Class *)((char *)&self->super.super.isa + v37);
          *(Class *)((char *)&self->super.super.isa + v37) = v36;

          continue;
        }
        if ((_DWORD)v18 == 31)
        {
          v39 = 0;
          v40 = 0;
          v41 = 0;
          *(_BYTE *)&self->_has |= 8u;
          while (1)
          {
            v42 = *v4;
            v43 = *(_QWORD *)((char *)a3 + v42);
            if (v43 == -1 || v43 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v44 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v43);
            *(_QWORD *)((char *)a3 + v42) = v43 + 1;
            v41 |= (unint64_t)(v44 & 0x7F) << v39;
            if ((v44 & 0x80) == 0)
              goto LABEL_84;
            v39 += 7;
            v15 = v40++ >= 9;
            if (v15)
            {
              v41 = 0;
              goto LABEL_86;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_84:
          if (*((_BYTE *)a3 + *v6))
            v41 = 0;
LABEL_86:
          self->_additionalPayload = v41 != 0;
          continue;
        }
        if ((_DWORD)v18 != 32)
          goto LABEL_68;
        v25 = objc_alloc_init(ATPError);
        objc_storeStrong((id *)&self->_streamError, v25);
        if (!PBReaderPlaceMark() || (ATPErrorReadFrom((uint64_t)v25, (uint64_t)a3) & 1) == 0)
          goto LABEL_89;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v45) = *((_BYTE *)a3 + *v6) == 0;
  return v45;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:
  if (self->_parameters)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_paramsSignature)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_payloadSignature)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_request)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_response)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_payload)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_streamError)
  {
    PBDataWriterWriteSubmessage();
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
  if ((has & 2) != 0)
  {
    v4[3] = self->_messageType;
    *((_BYTE *)v4 + 84) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_messageID;
  *((_BYTE *)v4 + 84) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[16] = self->_sessionID;
    *((_BYTE *)v4 + 84) |= 4u;
  }
LABEL_5:
  v6 = v4;
  if (self->_parameters)
  {
    objc_msgSend(v4, "setParameters:");
    v4 = v6;
  }
  if (self->_paramsSignature)
  {
    objc_msgSend(v6, "setParamsSignature:");
    v4 = v6;
  }
  if (self->_payloadSignature)
  {
    objc_msgSend(v6, "setPayloadSignature:");
    v4 = v6;
  }
  if (self->_request)
  {
    objc_msgSend(v6, "setRequest:");
    v4 = v6;
  }
  if (self->_response)
  {
    objc_msgSend(v6, "setResponse:");
    v4 = v6;
  }
  if (self->_payload)
  {
    objc_msgSend(v6, "setPayload:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v4 + 80) = self->_additionalPayload;
    *((_BYTE *)v4 + 84) |= 8u;
  }
  if (self->_streamError)
  {
    objc_msgSend(v6, "setStreamError:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_messageType;
    *(_BYTE *)(v5 + 84) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 8) = self->_messageID;
  *(_BYTE *)(v5 + 84) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 64) = self->_sessionID;
    *(_BYTE *)(v5 + 84) |= 4u;
  }
LABEL_5:
  v8 = -[NSData copyWithZone:](self->_parameters, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  v10 = -[NSData copyWithZone:](self->_paramsSignature, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v10;

  v12 = -[NSData copyWithZone:](self->_payloadSignature, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v12;

  v14 = -[ATPRequest copyWithZone:](self->_request, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v14;

  v16 = -[ATPResponse copyWithZone:](self->_response, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v16;

  v18 = -[NSData copyWithZone:](self->_payload, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v18;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v6 + 80) = self->_additionalPayload;
    *(_BYTE *)(v6 + 84) |= 8u;
  }
  v20 = -[ATPError copyWithZone:](self->_streamError, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v20;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *parameters;
  NSData *paramsSignature;
  NSData *payloadSignature;
  ATPRequest *request;
  ATPResponse *response;
  NSData *payload;
  char v11;
  ATPError *streamError;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) == 0 || self->_messageType != *((_DWORD *)v4 + 3))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 84) & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_messageID != *((_DWORD *)v4 + 2))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 4) == 0 || self->_sessionID != *((_DWORD *)v4 + 16))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 84) & 4) != 0)
  {
    goto LABEL_33;
  }
  parameters = self->_parameters;
  if ((unint64_t)parameters | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](parameters, "isEqual:"))
    goto LABEL_33;
  paramsSignature = self->_paramsSignature;
  if ((unint64_t)paramsSignature | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](paramsSignature, "isEqual:"))
      goto LABEL_33;
  }
  payloadSignature = self->_payloadSignature;
  if ((unint64_t)payloadSignature | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](payloadSignature, "isEqual:"))
      goto LABEL_33;
  }
  request = self->_request;
  if ((unint64_t)request | *((_QWORD *)v4 + 6))
  {
    if (!-[ATPRequest isEqual:](request, "isEqual:"))
      goto LABEL_33;
  }
  response = self->_response;
  if ((unint64_t)response | *((_QWORD *)v4 + 7))
  {
    if (!-[ATPResponse isEqual:](response, "isEqual:"))
      goto LABEL_33;
  }
  payload = self->_payload;
  if ((unint64_t)payload | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](payload, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 84) & 8) == 0)
      goto LABEL_39;
LABEL_33:
    v11 = 0;
    goto LABEL_34;
  }
  if ((*((_BYTE *)v4 + 84) & 8) == 0)
    goto LABEL_33;
  if (!self->_additionalPayload)
  {
    if (!*((_BYTE *)v4 + 80))
      goto LABEL_39;
    goto LABEL_33;
  }
  if (!*((_BYTE *)v4 + 80))
    goto LABEL_33;
LABEL_39:
  streamError = self->_streamError;
  if ((unint64_t)streamError | *((_QWORD *)v4 + 9))
    v11 = -[ATPError isEqual:](streamError, "isEqual:");
  else
    v11 = 1;
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v13 = 2654435761 * self->_messageType;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_messageID;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_sessionID;
    goto LABEL_8;
  }
LABEL_7:
  v4 = 0;
LABEL_8:
  v5 = -[NSData hash](self->_parameters, "hash");
  v6 = -[NSData hash](self->_paramsSignature, "hash");
  v7 = -[NSData hash](self->_payloadSignature, "hash");
  v8 = -[ATPRequest hash](self->_request, "hash");
  v9 = -[ATPResponse hash](self->_response, "hash");
  v10 = -[NSData hash](self->_payload, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v11 = 2654435761 * self->_additionalPayload;
  else
    v11 = 0;
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[ATPError hash](self->_streamError, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  ATPRequest *request;
  uint64_t v8;
  ATPResponse *response;
  uint64_t v10;
  ATPError *streamError;
  uint64_t v12;
  id v13;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 84);
  if ((v6 & 2) != 0)
  {
    self->_messageType = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 84);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_messageID = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 84) & 4) != 0)
  {
LABEL_4:
    self->_sessionID = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  v13 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[ATPMessage setParameters:](self, "setParameters:");
    v5 = v13;
  }
  if (*((_QWORD *)v5 + 3))
  {
    -[ATPMessage setParamsSignature:](self, "setParamsSignature:");
    v5 = v13;
  }
  if (*((_QWORD *)v5 + 5))
  {
    -[ATPMessage setPayloadSignature:](self, "setPayloadSignature:");
    v5 = v13;
  }
  request = self->_request;
  v8 = *((_QWORD *)v5 + 6);
  if (request)
  {
    if (!v8)
      goto LABEL_20;
    -[ATPRequest mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_20;
    -[ATPMessage setRequest:](self, "setRequest:");
  }
  v5 = v13;
LABEL_20:
  response = self->_response;
  v10 = *((_QWORD *)v5 + 7);
  if (response)
  {
    if (!v10)
      goto LABEL_26;
    -[ATPResponse mergeFrom:](response, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_26;
    -[ATPMessage setResponse:](self, "setResponse:");
  }
  v5 = v13;
LABEL_26:
  if (*((_QWORD *)v5 + 4))
  {
    -[ATPMessage setPayload:](self, "setPayload:");
    v5 = v13;
  }
  if ((*((_BYTE *)v5 + 84) & 8) != 0)
  {
    self->_additionalPayload = *((_BYTE *)v5 + 80);
    *(_BYTE *)&self->_has |= 8u;
  }
  streamError = self->_streamError;
  v12 = *((_QWORD *)v5 + 9);
  if (streamError)
  {
    if (v12)
    {
      -[ATPError mergeFrom:](streamError, "mergeFrom:");
LABEL_35:
      v5 = v13;
    }
  }
  else if (v12)
  {
    -[ATPMessage setStreamError:](self, "setStreamError:");
    goto LABEL_35;
  }

}

- (unsigned)messageID
{
  return self->_messageID;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (NSData)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (NSData)paramsSignature
{
  return self->_paramsSignature;
}

- (void)setParamsSignature:(id)a3
{
  objc_storeStrong((id *)&self->_paramsSignature, a3);
}

- (NSData)payloadSignature
{
  return self->_payloadSignature;
}

- (void)setPayloadSignature:(id)a3
{
  objc_storeStrong((id *)&self->_payloadSignature, a3);
}

- (ATPRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (ATPResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (BOOL)additionalPayload
{
  return self->_additionalPayload;
}

- (ATPError)streamError
{
  return self->_streamError;
}

- (void)setStreamError:(id)a3
{
  objc_storeStrong((id *)&self->_streamError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamError, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_payloadSignature, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_paramsSignature, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (id)formattedDescription
{
  int messageType;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t messageID;
  NSUInteger v12;
  NSUInteger v13;
  _BOOL8 v14;
  void *v15;
  void *v16;

  messageType = self->_messageType;
  if ((messageType - 2) >= 3)
  {
    if (messageType == 1)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      messageID = self->_messageID;
      v12 = -[NSData length](self->_parameters, "length");
      v13 = -[NSData length](self->_payload, "length");
      v14 = !self->_additionalPayload;
      -[ATPResponse error](self->_response, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("[ID=%d, %@, params=[%lu bytes], payload=[%lu bytes], EOF=%d, err=%@]"), messageID, CFSTR("Response"), v12, v13, v14, v15);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (messageType)
    {
      v4 = 0;
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = self->_messageID;
      -[ATPRequest command](self->_request, "command");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self->_messageType;
      if (v8 > 4)
        v9 = CFSTR("Unknown");
      else
        v9 = off_1E928C7D8[v8];
      -[ATPRequest dataClass](self->_request, "dataClass");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("[ID=%d, %@ %@, %@, params=[%lu bytes], payload=[%lu bytes], EOF=%d]"), v6, v7, v9, v16, -[NSData length](self->_parameters, "length"), -[NSData length](self->_payload, "length"), !self->_additionalPayload);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ID=%d, %@, params=[%lu bytes], payload=[%lu bytes], EOF=%d]"), self->_messageID, off_1E928C800[messageType - 2], -[NSData length](self->_parameters, "length"), -[NSData length](self->_payload, "length"), !self->_additionalPayload);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
