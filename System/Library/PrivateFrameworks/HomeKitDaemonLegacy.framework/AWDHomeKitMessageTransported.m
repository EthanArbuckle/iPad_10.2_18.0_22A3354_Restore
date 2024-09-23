@implementation AWDHomeKitMessageTransported

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPayloadSize:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_payloadSize = a3;
}

- (void)setHasPayloadSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPayloadSize
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasTransactionID
{
  return self->_transactionID != 0;
}

- (void)setIsSecure:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isSecure = a3;
}

- (void)setHasIsSecure:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsSecure
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (int)messageType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_messageType;
  else
    return 0;
}

- (void)setMessageType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_messageType = a3;
}

- (void)setHasMessageType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMessageType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)messageTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E89AD2F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMessageType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMessageType_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMessageType_Request")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMessageType_Response")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMessageType_Oneway")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)transport
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_transport;
  else
    return 0;
}

- (void)setTransport:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_transport = a3;
}

- (void)setHasTransport:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTransport
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)transportAsString:(int)a3
{
  if (a3 < 7)
    return off_1E89AD318[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransport:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMessageTransportType_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMessageTransportType_Secure")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMessageTransportType_IDS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMessageTransportType_LoXY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMessageTransportType_IDSProxy")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMessageTransportType_Legacy")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMessageTransportType_Rapport")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)direction
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_direction;
  else
    return 0;
}

- (void)setDirection:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_direction = a3;
}

- (void)setHasDirection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDirection
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)directionAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("HomeKitMessageDirection_Send");
  if (a3 == 1)
  {
    v3 = CFSTR("HomeKitMessageDirection_Receive");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDirection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMessageDirection_Send")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitMessageDirection_Receive"));

  return v4;
}

- (BOOL)hasMessageName
{
  return self->_messageName != 0;
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
  v8.super_class = (Class)AWDHomeKitMessageTransported;
  -[AWDHomeKitMessageTransported description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitMessageTransported dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSString *identifier;
  NSString *transactionID;
  char v9;
  void *v10;
  uint64_t messageType;
  __CFString *v12;
  uint64_t transport;
  __CFString *v14;
  int direction;
  __CFString *v16;
  NSString *messageName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_payloadSize);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("payloadSize"));

  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  transactionID = self->_transactionID;
  if (transactionID)
    objc_msgSend(v3, "setObject:forKey:", transactionID, CFSTR("transactionID"));
  v9 = (char)self->_has;
  if ((v9 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSecure);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("isSecure"));

    v9 = (char)self->_has;
    if ((v9 & 8) == 0)
    {
LABEL_11:
      if ((v9 & 0x10) == 0)
        goto LABEL_12;
LABEL_19:
      transport = self->_transport;
      if (transport >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transport);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = off_1E89AD318[transport];
      }
      objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("transport"));

      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_29;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  messageType = self->_messageType;
  if (messageType >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_messageType);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E89AD2F8[messageType];
  }
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("messageType"));

  v9 = (char)self->_has;
  if ((v9 & 0x10) != 0)
    goto LABEL_19;
LABEL_12:
  if ((v9 & 4) != 0)
  {
LABEL_23:
    direction = self->_direction;
    if (direction)
    {
      if (direction == 1)
      {
        v16 = CFSTR("HomeKitMessageDirection_Receive");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_direction);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v16 = CFSTR("HomeKitMessageDirection_Send");
    }
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("direction"));

  }
LABEL_29:
  messageName = self->_messageName;
  if (messageName)
    objc_msgSend(v3, "setObject:forKey:", messageName, CFSTR("messageName"));
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
  char v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  objc_class *v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;

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
      switch((v11 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (1)
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v22);
            *(_QWORD *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_68;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_70;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_68:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_70:
          v55 = 16;
          goto LABEL_75;
        case 2u:
          v25 = 0;
          v26 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (2)
          {
            v27 = *v4;
            v28 = *(_QWORD *)((char *)a3 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v28);
              *(_QWORD *)((char *)a3 + v27) = v28 + 1;
              v20 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_74:
          v55 = 8;
LABEL_75:
          *(Class *)((char *)&self->super.super.isa + v55) = (Class)v20;
          continue;
        case 3u:
          PBReaderReadString();
          v30 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v31 = 32;
          goto LABEL_66;
        case 4u:
          PBReaderReadString();
          v30 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v31 = 56;
          goto LABEL_66;
        case 5u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)&self->_has |= 0x20u;
          while (2)
          {
            v35 = *v4;
            v36 = *(_QWORD *)((char *)a3 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v36);
              *(_QWORD *)((char *)a3 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v15 = v33++ >= 9;
                if (v15)
                {
                  v34 = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v34 = 0;
LABEL_79:
          self->_isSecure = v34 != 0;
          continue;
        case 6u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_BYTE *)&self->_has |= 8u;
          while (2)
          {
            v41 = *v4;
            v42 = *(_QWORD *)((char *)a3 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v42);
              *(_QWORD *)((char *)a3 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v15 = v39++ >= 9;
                if (v15)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v40) = 0;
LABEL_83:
          v56 = 48;
          goto LABEL_92;
        case 7u:
          v44 = 0;
          v45 = 0;
          v40 = 0;
          *(_BYTE *)&self->_has |= 0x10u;
          while (2)
          {
            v46 = *v4;
            v47 = *(_QWORD *)((char *)a3 + v46);
            if (v47 == -1 || v47 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v47);
              *(_QWORD *)((char *)a3 + v46) = v47 + 1;
              v40 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                v15 = v45++ >= 9;
                if (v15)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v40) = 0;
LABEL_87:
          v56 = 64;
          goto LABEL_92;
        case 8u:
          v49 = 0;
          v50 = 0;
          v40 = 0;
          *(_BYTE *)&self->_has |= 4u;
          break;
        case 9u:
          PBReaderReadString();
          v30 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v31 = 40;
LABEL_66:
          v54 = *(Class *)((char *)&self->super.super.isa + v31);
          *(Class *)((char *)&self->super.super.isa + v31) = v30;

          continue;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          continue;
      }
      while (1)
      {
        v51 = *v4;
        v52 = *(_QWORD *)((char *)a3 + v51);
        if (v52 == -1 || v52 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v53 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v52);
        *(_QWORD *)((char *)a3 + v51) = v52 + 1;
        v40 |= (unint64_t)(v53 & 0x7F) << v49;
        if ((v53 & 0x80) == 0)
          goto LABEL_89;
        v49 += 7;
        v15 = v50++ >= 9;
        if (v15)
        {
          LODWORD(v40) = 0;
          goto LABEL_91;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_89:
      if (*((_BYTE *)a3 + *v6))
        LODWORD(v40) = 0;
LABEL_91:
      v56 = 24;
LABEL_92:
      *(_DWORD *)((char *)&self->super.super.isa + v56) = v40;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  has = (char)self->_has;
  v7 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v7;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_transactionID)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_11:
      if ((v6 & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  v4 = v7;
  v6 = (char)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_12:
    if ((v6 & 4) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
LABEL_14:
  if (self->_messageName)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((_BYTE *)v4 + 72) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[1] = self->_payloadSize;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  v7 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v7;
  }
  if (self->_transactionID)
  {
    objc_msgSend(v7, "setTransactionID:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_BYTE *)v4 + 68) = self->_isSecure;
    *((_BYTE *)v4 + 72) |= 0x20u;
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_11:
      if ((v6 & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 12) = self->_messageType;
  *((_BYTE *)v4 + 72) |= 8u;
  v6 = (char)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_12:
    if ((v6 & 4) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_19:
  *((_DWORD *)v4 + 16) = self->_transport;
  *((_BYTE *)v4 + 72) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 6) = self->_direction;
    *((_BYTE *)v4 + 72) |= 4u;
  }
LABEL_14:
  if (self->_messageName)
  {
    objc_msgSend(v7, "setMessageName:");
    v4 = v7;
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
  char v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 72) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_payloadSize;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_transactionID, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v10;

  v12 = (char)self->_has;
  if ((v12 & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 68) = self->_isSecure;
    *(_BYTE *)(v6 + 72) |= 0x20u;
    v12 = (char)self->_has;
    if ((v12 & 8) == 0)
    {
LABEL_7:
      if ((v12 & 0x10) == 0)
        goto LABEL_8;
LABEL_13:
      *(_DWORD *)(v6 + 64) = self->_transport;
      *(_BYTE *)(v6 + 72) |= 0x10u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 48) = self->_messageType;
  *(_BYTE *)(v6 + 72) |= 8u;
  v12 = (char)self->_has;
  if ((v12 & 0x10) != 0)
    goto LABEL_13;
LABEL_8:
  if ((v12 & 4) != 0)
  {
LABEL_9:
    *(_DWORD *)(v6 + 24) = self->_direction;
    *(_BYTE *)(v6 + 72) |= 4u;
  }
LABEL_10:
  v13 = -[NSString copyWithZone:](self->_messageName, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v13;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *transactionID;
  NSString *messageName;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_timestamp != *((_QWORD *)v4 + 2))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_payloadSize != *((_QWORD *)v4 + 1))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_41;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](identifier, "isEqual:"))
    goto LABEL_41;
  transactionID = self->_transactionID;
  if ((unint64_t)transactionID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](transactionID, "isEqual:"))
      goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x20) != 0)
    {
      if (self->_isSecure)
      {
        if (!*((_BYTE *)v4 + 68))
          goto LABEL_41;
        goto LABEL_24;
      }
      if (!*((_BYTE *)v4 + 68))
        goto LABEL_24;
    }
LABEL_41:
    v8 = 0;
    goto LABEL_42;
  }
  if ((*((_BYTE *)v4 + 72) & 0x20) != 0)
    goto LABEL_41;
LABEL_24:
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0 || self->_messageType != *((_DWORD *)v4 + 12))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x10) == 0 || self->_transport != *((_DWORD *)v4 + 16))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_direction != *((_DWORD *)v4 + 6))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_41;
  }
  messageName = self->_messageName;
  if ((unint64_t)messageName | *((_QWORD *)v4 + 5))
    v8 = -[NSString isEqual:](messageName, "isEqual:");
  else
    v8 = 1;
LABEL_42:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_payloadSize;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_identifier, "hash");
  v6 = -[NSString hash](self->_transactionID, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v7 = 2654435761 * self->_isSecure;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_8:
      v8 = 2654435761 * self->_messageType;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_9;
LABEL_13:
      v9 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_10;
LABEL_14:
      v10 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSString hash](self->_messageName, "hash");
    }
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_9:
  v9 = 2654435761 * self->_transport;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_14;
LABEL_10:
  v10 = 2654435761 * self->_direction;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSString hash](self->_messageName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 72);
  }
  if ((v5 & 1) != 0)
  {
    self->_payloadSize = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[AWDHomeKitMessageTransported setIdentifier:](self, "setIdentifier:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[AWDHomeKitMessageTransported setTransactionID:](self, "setTransactionID:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 72);
  if ((v6 & 0x20) != 0)
  {
    self->_isSecure = *((_BYTE *)v4 + 68);
    *(_BYTE *)&self->_has |= 0x20u;
    v6 = *((_BYTE *)v4 + 72);
    if ((v6 & 8) == 0)
    {
LABEL_11:
      if ((v6 & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 8) == 0)
  {
    goto LABEL_11;
  }
  self->_messageType = *((_DWORD *)v4 + 12);
  *(_BYTE *)&self->_has |= 8u;
  v6 = *((_BYTE *)v4 + 72);
  if ((v6 & 0x10) == 0)
  {
LABEL_12:
    if ((v6 & 4) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_19:
  self->_transport = *((_DWORD *)v4 + 16);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
LABEL_13:
    self->_direction = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 5))
  {
    -[AWDHomeKitMessageTransported setMessageName:](self, "setMessageName:");
    v4 = v7;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)payloadSize
{
  return self->_payloadSize;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(id)a3
{
  objc_storeStrong((id *)&self->_transactionID, a3);
}

- (BOOL)isSecure
{
  return self->_isSecure;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (void)setMessageName:(id)a3
{
  objc_storeStrong((id *)&self->_messageName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
