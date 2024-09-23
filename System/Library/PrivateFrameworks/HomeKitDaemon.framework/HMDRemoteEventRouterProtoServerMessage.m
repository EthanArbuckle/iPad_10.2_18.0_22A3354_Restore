@implementation HMDRemoteEventRouterProtoServerMessage

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasUpdatedEvents
{
  return self->_updatedEvents != 0;
}

- (void)setUpdatedEvents:(id)a3
{
  HMDRemoteEventRouterProtoEventsMessage *v4;
  HMDRemoteEventRouterProtoEventsMessage *updatedEvents;

  v4 = (HMDRemoteEventRouterProtoEventsMessage *)a3;
  -[HMDRemoteEventRouterProtoServerMessage clearOneofValuesForMessage](self, "clearOneofValuesForMessage");
  *(_BYTE *)&self->_has |= 1u;
  self->_message = 1;
  updatedEvents = self->_updatedEvents;
  self->_updatedEvents = v4;

}

- (BOOL)hasConnectResponse
{
  return self->_connectResponse != 0;
}

- (void)setConnectResponse:(id)a3
{
  HMDRemoteEventRouterProtoConnectResponse *v4;
  HMDRemoteEventRouterProtoConnectResponse *connectResponse;

  v4 = (HMDRemoteEventRouterProtoConnectResponse *)a3;
  -[HMDRemoteEventRouterProtoServerMessage clearOneofValuesForMessage](self, "clearOneofValuesForMessage");
  *(_BYTE *)&self->_has |= 1u;
  self->_message = 2;
  connectResponse = self->_connectResponse;
  self->_connectResponse = v4;

}

- (BOOL)hasChangeRegistrationsResponse
{
  return self->_changeRegistrationsResponse != 0;
}

- (void)setChangeRegistrationsResponse:(id)a3
{
  HMDRemoteEventRouterProtoChangeRegistrationsResponse *v4;
  HMDRemoteEventRouterProtoChangeRegistrationsResponse *changeRegistrationsResponse;

  v4 = (HMDRemoteEventRouterProtoChangeRegistrationsResponse *)a3;
  -[HMDRemoteEventRouterProtoServerMessage clearOneofValuesForMessage](self, "clearOneofValuesForMessage");
  *(_BYTE *)&self->_has |= 1u;
  self->_message = 3;
  changeRegistrationsResponse = self->_changeRegistrationsResponse;
  self->_changeRegistrationsResponse = v4;

}

- (BOOL)hasMultiHopFetchEventsResponse
{
  return self->_multiHopFetchEventsResponse != 0;
}

- (void)setMultiHopFetchEventsResponse:(id)a3
{
  HMDRemoteEventRouterProtoMultiHopFetchEventsResponse *v4;
  HMDRemoteEventRouterProtoMultiHopFetchEventsResponse *multiHopFetchEventsResponse;

  v4 = (HMDRemoteEventRouterProtoMultiHopFetchEventsResponse *)a3;
  -[HMDRemoteEventRouterProtoServerMessage clearOneofValuesForMessage](self, "clearOneofValuesForMessage");
  *(_BYTE *)&self->_has |= 1u;
  self->_message = 4;
  multiHopFetchEventsResponse = self->_multiHopFetchEventsResponse;
  self->_multiHopFetchEventsResponse = v4;

}

- (int)message
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_message;
  else
    return 0;
}

- (void)setMessage:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_message = a3;
}

- (void)setHasMessage:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMessage
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)messageAsString:(int)a3
{
  if (a3 < 5)
    return off_24E790860[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMessage:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("updatedEvents")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("connectResponse")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("changeRegistrationsResponse")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("multiHopFetchEventsResponse")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForMessage
{
  HMDRemoteEventRouterProtoEventsMessage *updatedEvents;
  HMDRemoteEventRouterProtoConnectResponse *connectResponse;
  HMDRemoteEventRouterProtoChangeRegistrationsResponse *changeRegistrationsResponse;
  HMDRemoteEventRouterProtoMultiHopFetchEventsResponse *multiHopFetchEventsResponse;

  *(_BYTE *)&self->_has &= ~1u;
  self->_message = 0;
  updatedEvents = self->_updatedEvents;
  self->_updatedEvents = 0;

  connectResponse = self->_connectResponse;
  self->_connectResponse = 0;

  changeRegistrationsResponse = self->_changeRegistrationsResponse;
  self->_changeRegistrationsResponse = 0;

  multiHopFetchEventsResponse = self->_multiHopFetchEventsResponse;
  self->_multiHopFetchEventsResponse = 0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)HMDRemoteEventRouterProtoServerMessage;
  -[HMDRemoteEventRouterProtoServerMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterProtoServerMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  HMDRemoteEventRouterProtoEventsMessage *updatedEvents;
  void *v7;
  HMDRemoteEventRouterProtoConnectResponse *connectResponse;
  void *v9;
  HMDRemoteEventRouterProtoChangeRegistrationsResponse *changeRegistrationsResponse;
  void *v11;
  HMDRemoteEventRouterProtoMultiHopFetchEventsResponse *multiHopFetchEventsResponse;
  void *v13;
  uint64_t message;
  __CFString *v15;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  updatedEvents = self->_updatedEvents;
  if (updatedEvents)
  {
    -[HMDRemoteEventRouterProtoEventsMessage dictionaryRepresentation](updatedEvents, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("updatedEvents"));

  }
  connectResponse = self->_connectResponse;
  if (connectResponse)
  {
    -[HMDRemoteEventRouterProtoConnectResponse dictionaryRepresentation](connectResponse, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("connectResponse"));

  }
  changeRegistrationsResponse = self->_changeRegistrationsResponse;
  if (changeRegistrationsResponse)
  {
    -[HMDRemoteEventRouterProtoChangeRegistrationsResponse dictionaryRepresentation](changeRegistrationsResponse, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("changeRegistrationsResponse"));

  }
  multiHopFetchEventsResponse = self->_multiHopFetchEventsResponse;
  if (multiHopFetchEventsResponse)
  {
    -[HMDRemoteEventRouterProtoMultiHopFetchEventsResponse dictionaryRepresentation](multiHopFetchEventsResponse, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("multiHopFetchEventsResponse"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    message = self->_message;
    if (message >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_message);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_24E790860[message];
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Message"));

  }
  return v4;
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
  int v16;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  NSString *v24;
  NSString *identifier;
  HMDRemoteEventRouterProtoEventsMessage *v26;
  int v27;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
    while (!*((_BYTE *)a3 + *v6))
    {
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
        if (v10++ >= 9)
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
        case 0u:
          v18 = 0;
          do
          {
            v19 = *v4;
            v20 = *(_QWORD *)((char *)a3 + v19);
            if (v20 == -1 || v20 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
              goto LABEL_41;
            }
            v21 = v20 + 1;
            v22 = *(char *)(*(_QWORD *)((char *)a3 + *v8) + v20);
            *(_QWORD *)((char *)a3 + v19) = v21;
            if ((v22 & 0x80000000) == 0)
              break;
          }
          while (v18++ <= 8);
          goto LABEL_41;
        case 1u:
          PBReaderReadString();
          v24 = (NSString *)objc_claimAutoreleasedReturnValue();
          identifier = self->_identifier;
          self->_identifier = v24;

          goto LABEL_41;
        case 2u:
          -[HMDRemoteEventRouterProtoServerMessage clearOneofValuesForMessage](self, "clearOneofValuesForMessage");
          *(_BYTE *)&self->_has |= 1u;
          self->_message = 1;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoEventsMessage);
          objc_storeStrong((id *)&self->_updatedEvents, v26);
          if (!PBReaderPlaceMark() || !HMDRemoteEventRouterProtoEventsMessageReadFrom(v26, (uint64_t)a3))
            goto LABEL_45;
          goto LABEL_40;
        case 4u:
          -[HMDRemoteEventRouterProtoServerMessage clearOneofValuesForMessage](self, "clearOneofValuesForMessage");
          *(_BYTE *)&self->_has |= 1u;
          self->_message = 2;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoConnectResponse);
          objc_storeStrong((id *)&self->_connectResponse, v26);
          if (!PBReaderPlaceMark()
            || (HMDRemoteEventRouterProtoConnectResponseReadFrom(v26, (uint64_t)a3) & 1) == 0)
          {
            goto LABEL_45;
          }
          goto LABEL_40;
        case 5u:
          -[HMDRemoteEventRouterProtoServerMessage clearOneofValuesForMessage](self, "clearOneofValuesForMessage");
          *(_BYTE *)&self->_has |= 1u;
          self->_message = 3;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoChangeRegistrationsResponse);
          objc_storeStrong((id *)&self->_changeRegistrationsResponse, v26);
          if (!PBReaderPlaceMark()
            || (HMDRemoteEventRouterProtoConnectResponseReadFrom(v26, (uint64_t)a3) & 1) == 0)
          {
            goto LABEL_45;
          }
          goto LABEL_40;
        case 6u:
          -[HMDRemoteEventRouterProtoServerMessage clearOneofValuesForMessage](self, "clearOneofValuesForMessage");
          *(_BYTE *)&self->_has |= 1u;
          self->_message = 4;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoMultiHopFetchEventsResponse);
          objc_storeStrong((id *)&self->_multiHopFetchEventsResponse, v26);
          if (!PBReaderPlaceMark()
            || (HMDRemoteEventRouterProtoMultiHopFetchEventsResponseReadFrom(v26, (uint64_t)a3) & 1) == 0)
          {
LABEL_45:

            LOBYTE(v27) = 0;
            return v27;
          }
LABEL_40:
          PBReaderRecallMark();

LABEL_41:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_44;
          break;
        default:
          v27 = PBReaderSkipValueWithTag();
          if (!v27)
            return v27;
          goto LABEL_41;
      }
    }
  }
LABEL_44:
  LOBYTE(v27) = *((_BYTE *)a3 + *v6) == 0;
  return v27;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_updatedEvents)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_connectResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_changeRegistrationsResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_multiHopFetchEventsResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[8] = self->_message;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v5;
  }
  if (self->_updatedEvents)
  {
    objc_msgSend(v5, "setUpdatedEvents:");
    v4 = v5;
  }
  if (self->_connectResponse)
  {
    objc_msgSend(v5, "setConnectResponse:");
    v4 = v5;
  }
  if (self->_changeRegistrationsResponse)
  {
    objc_msgSend(v5, "setChangeRegistrationsResponse:");
    v4 = v5;
  }
  if (self->_multiHopFetchEventsResponse)
  {
    objc_msgSend(v5, "setMultiHopFetchEventsResponse:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_message;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[HMDRemoteEventRouterProtoEventsMessage copyWithZone:](self->_updatedEvents, "copyWithZone:", a3);
  v10 = (void *)v6[6];
  v6[6] = v9;

  v11 = -[HMDRemoteEventRouterProtoConnectResponse copyWithZone:](self->_connectResponse, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  v13 = -[HMDRemoteEventRouterProtoChangeRegistrationsResponse copyWithZone:](self->_changeRegistrationsResponse, "copyWithZone:", a3);
  v14 = (void *)v6[1];
  v6[1] = v13;

  v15 = -[HMDRemoteEventRouterProtoMultiHopFetchEventsResponse copyWithZone:](self->_multiHopFetchEventsResponse, "copyWithZone:", a3);
  v16 = (void *)v6[5];
  v6[5] = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  HMDRemoteEventRouterProtoEventsMessage *updatedEvents;
  HMDRemoteEventRouterProtoConnectResponse *connectResponse;
  HMDRemoteEventRouterProtoChangeRegistrationsResponse *changeRegistrationsResponse;
  HMDRemoteEventRouterProtoMultiHopFetchEventsResponse *multiHopFetchEventsResponse;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_message != *((_DWORD *)v4 + 8))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](identifier, "isEqual:"))
    goto LABEL_17;
  updatedEvents = self->_updatedEvents;
  if ((unint64_t)updatedEvents | *((_QWORD *)v4 + 6))
  {
    if (!-[HMDRemoteEventRouterProtoEventsMessage isEqual:](updatedEvents, "isEqual:"))
      goto LABEL_17;
  }
  connectResponse = self->_connectResponse;
  if ((unint64_t)connectResponse | *((_QWORD *)v4 + 2))
  {
    if (!-[HMDRemoteEventRouterProtoConnectResponse isEqual:](connectResponse, "isEqual:"))
      goto LABEL_17;
  }
  changeRegistrationsResponse = self->_changeRegistrationsResponse;
  if ((unint64_t)changeRegistrationsResponse | *((_QWORD *)v4 + 1))
  {
    if (!-[HMDRemoteEventRouterProtoChangeRegistrationsResponse isEqual:](changeRegistrationsResponse, "isEqual:"))
      goto LABEL_17;
  }
  multiHopFetchEventsResponse = self->_multiHopFetchEventsResponse;
  if ((unint64_t)multiHopFetchEventsResponse | *((_QWORD *)v4 + 5))
    v10 = -[HMDRemoteEventRouterProtoMultiHopFetchEventsResponse isEqual:](multiHopFetchEventsResponse, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_message;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_identifier, "hash") ^ v3;
  v5 = -[HMDRemoteEventRouterProtoEventsMessage hash](self->_updatedEvents, "hash");
  v6 = v4 ^ v5 ^ -[HMDRemoteEventRouterProtoConnectResponse hash](self->_connectResponse, "hash");
  v7 = -[HMDRemoteEventRouterProtoChangeRegistrationsResponse hash](self->_changeRegistrationsResponse, "hash");
  return v6 ^ v7 ^ -[HMDRemoteEventRouterProtoMultiHopFetchEventsResponse hash](self->_multiHopFetchEventsResponse, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  HMDRemoteEventRouterProtoEventsMessage *updatedEvents;
  uint64_t v7;
  HMDRemoteEventRouterProtoConnectResponse *connectResponse;
  uint64_t v9;
  HMDRemoteEventRouterProtoChangeRegistrationsResponse *changeRegistrationsResponse;
  uint64_t v11;
  HMDRemoteEventRouterProtoMultiHopFetchEventsResponse *multiHopFetchEventsResponse;
  uint64_t v13;
  _QWORD *v14;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_message = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  v14 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[HMDRemoteEventRouterProtoServerMessage setIdentifier:](self, "setIdentifier:");
    v5 = v14;
  }
  updatedEvents = self->_updatedEvents;
  v7 = v5[6];
  if (updatedEvents)
  {
    if (!v7)
      goto LABEL_11;
    -[HMDRemoteEventRouterProtoEventsMessage mergeFrom:](updatedEvents, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    -[HMDRemoteEventRouterProtoServerMessage setUpdatedEvents:](self, "setUpdatedEvents:");
  }
  v5 = v14;
LABEL_11:
  connectResponse = self->_connectResponse;
  v9 = v5[2];
  if (connectResponse)
  {
    if (!v9)
      goto LABEL_17;
    -[HMDRemoteEventRouterProtoConnectResponse mergeFrom:](connectResponse, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_17;
    -[HMDRemoteEventRouterProtoServerMessage setConnectResponse:](self, "setConnectResponse:");
  }
  v5 = v14;
LABEL_17:
  changeRegistrationsResponse = self->_changeRegistrationsResponse;
  v11 = v5[1];
  if (changeRegistrationsResponse)
  {
    if (!v11)
      goto LABEL_23;
    -[HMDRemoteEventRouterProtoChangeRegistrationsResponse mergeFrom:](changeRegistrationsResponse, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_23;
    -[HMDRemoteEventRouterProtoServerMessage setChangeRegistrationsResponse:](self, "setChangeRegistrationsResponse:");
  }
  v5 = v14;
LABEL_23:
  multiHopFetchEventsResponse = self->_multiHopFetchEventsResponse;
  v13 = v5[5];
  if (multiHopFetchEventsResponse)
  {
    if (v13)
    {
      -[HMDRemoteEventRouterProtoMultiHopFetchEventsResponse mergeFrom:](multiHopFetchEventsResponse, "mergeFrom:");
LABEL_28:
      v5 = v14;
    }
  }
  else if (v13)
  {
    -[HMDRemoteEventRouterProtoServerMessage setMultiHopFetchEventsResponse:](self, "setMultiHopFetchEventsResponse:");
    goto LABEL_28;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (HMDRemoteEventRouterProtoEventsMessage)updatedEvents
{
  return self->_updatedEvents;
}

- (HMDRemoteEventRouterProtoConnectResponse)connectResponse
{
  return self->_connectResponse;
}

- (HMDRemoteEventRouterProtoChangeRegistrationsResponse)changeRegistrationsResponse
{
  return self->_changeRegistrationsResponse;
}

- (HMDRemoteEventRouterProtoMultiHopFetchEventsResponse)multiHopFetchEventsResponse
{
  return self->_multiHopFetchEventsResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedEvents, 0);
  objc_storeStrong((id *)&self->_multiHopFetchEventsResponse, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connectResponse, 0);
  objc_storeStrong((id *)&self->_changeRegistrationsResponse, 0);
}

@end
