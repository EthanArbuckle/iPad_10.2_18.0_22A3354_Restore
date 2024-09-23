@implementation HMDRemoteEventRouterProtoMessage

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasConnect
{
  return self->_connect != 0;
}

- (void)setConnect:(id)a3
{
  HMDRemoteEventRouterProtoConnectMessage *v4;
  HMDRemoteEventRouterProtoConnectMessage *connect;

  v4 = (HMDRemoteEventRouterProtoConnectMessage *)a3;
  -[HMDRemoteEventRouterProtoMessage clearOneofValuesForRequest](self, "clearOneofValuesForRequest");
  *(_BYTE *)&self->_has |= 1u;
  self->_request = 1;
  connect = self->_connect;
  self->_connect = v4;

}

- (BOOL)hasChangeRegistrations
{
  return self->_changeRegistrations != 0;
}

- (void)setChangeRegistrations:(id)a3
{
  HMDRemoteEventRouterProtoChangeRegistrationsMessage *v4;
  HMDRemoteEventRouterProtoChangeRegistrationsMessage *changeRegistrations;

  v4 = (HMDRemoteEventRouterProtoChangeRegistrationsMessage *)a3;
  -[HMDRemoteEventRouterProtoMessage clearOneofValuesForRequest](self, "clearOneofValuesForRequest");
  *(_BYTE *)&self->_has |= 1u;
  self->_request = 2;
  changeRegistrations = self->_changeRegistrations;
  self->_changeRegistrations = v4;

}

- (BOOL)hasKeepAlive
{
  return self->_keepAlive != 0;
}

- (void)setKeepAlive:(id)a3
{
  HMDRemoteEventRouterProtoKeepAliveMessage *v4;
  HMDRemoteEventRouterProtoKeepAliveMessage *keepAlive;

  v4 = (HMDRemoteEventRouterProtoKeepAliveMessage *)a3;
  -[HMDRemoteEventRouterProtoMessage clearOneofValuesForRequest](self, "clearOneofValuesForRequest");
  *(_BYTE *)&self->_has |= 1u;
  self->_request = 3;
  keepAlive = self->_keepAlive;
  self->_keepAlive = v4;

}

- (BOOL)hasDisconnect
{
  return self->_disconnect != 0;
}

- (void)setDisconnect:(id)a3
{
  HMDRemoteEventRouterProtoDisconnectMessage *v4;
  HMDRemoteEventRouterProtoDisconnectMessage *disconnect;

  v4 = (HMDRemoteEventRouterProtoDisconnectMessage *)a3;
  -[HMDRemoteEventRouterProtoMessage clearOneofValuesForRequest](self, "clearOneofValuesForRequest");
  *(_BYTE *)&self->_has |= 1u;
  self->_request = 4;
  disconnect = self->_disconnect;
  self->_disconnect = v4;

}

- (BOOL)hasFetchEvents
{
  return self->_fetchEvents != 0;
}

- (void)setFetchEvents:(id)a3
{
  HMDRemoteEventRouterProtoFetchEventsMessage *v4;
  HMDRemoteEventRouterProtoFetchEventsMessage *fetchEvents;

  v4 = (HMDRemoteEventRouterProtoFetchEventsMessage *)a3;
  -[HMDRemoteEventRouterProtoMessage clearOneofValuesForRequest](self, "clearOneofValuesForRequest");
  *(_BYTE *)&self->_has |= 1u;
  self->_request = 5;
  fetchEvents = self->_fetchEvents;
  self->_fetchEvents = v4;

}

- (int)request
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_request;
  else
    return 0;
}

- (void)setRequest:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_request = a3;
}

- (void)setHasRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequest
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)requestAsString:(int)a3
{
  if (a3 < 6)
    return off_1E89BFAF0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequest:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("connect")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("changeRegistrations")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("keepAlive")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("disconnect")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("fetchEvents")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForRequest
{
  HMDRemoteEventRouterProtoConnectMessage *connect;
  HMDRemoteEventRouterProtoChangeRegistrationsMessage *changeRegistrations;
  HMDRemoteEventRouterProtoKeepAliveMessage *keepAlive;
  HMDRemoteEventRouterProtoDisconnectMessage *disconnect;
  HMDRemoteEventRouterProtoFetchEventsMessage *fetchEvents;

  *(_BYTE *)&self->_has &= ~1u;
  self->_request = 0;
  connect = self->_connect;
  self->_connect = 0;

  changeRegistrations = self->_changeRegistrations;
  self->_changeRegistrations = 0;

  keepAlive = self->_keepAlive;
  self->_keepAlive = 0;

  disconnect = self->_disconnect;
  self->_disconnect = 0;

  fetchEvents = self->_fetchEvents;
  self->_fetchEvents = 0;

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
  v8.super_class = (Class)HMDRemoteEventRouterProtoMessage;
  -[HMDRemoteEventRouterProtoMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterProtoMessage dictionaryRepresentation](self, "dictionaryRepresentation");
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
  HMDRemoteEventRouterProtoConnectMessage *connect;
  void *v7;
  HMDRemoteEventRouterProtoChangeRegistrationsMessage *changeRegistrations;
  void *v9;
  HMDRemoteEventRouterProtoKeepAliveMessage *keepAlive;
  void *v11;
  HMDRemoteEventRouterProtoDisconnectMessage *disconnect;
  void *v13;
  HMDRemoteEventRouterProtoFetchEventsMessage *fetchEvents;
  void *v15;
  uint64_t request;
  __CFString *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  connect = self->_connect;
  if (connect)
  {
    -[HMDRemoteEventRouterProtoConnectMessage dictionaryRepresentation](connect, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("connect"));

  }
  changeRegistrations = self->_changeRegistrations;
  if (changeRegistrations)
  {
    -[HMDRemoteEventRouterProtoChangeRegistrationsMessage dictionaryRepresentation](changeRegistrations, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("changeRegistrations"));

  }
  keepAlive = self->_keepAlive;
  if (keepAlive)
  {
    -[HMDRemoteEventRouterProtoKeepAliveMessage dictionaryRepresentation](keepAlive, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("keepAlive"));

  }
  disconnect = self->_disconnect;
  if (disconnect)
  {
    -[HMDRemoteEventRouterProtoDisconnectMessage dictionaryRepresentation](disconnect, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("disconnect"));

  }
  fetchEvents = self->_fetchEvents;
  if (fetchEvents)
  {
    -[HMDRemoteEventRouterProtoFetchEventsMessage dictionaryRepresentation](fetchEvents, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("fetchEvents"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    request = self->_request;
    if (request >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_request);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E89BFAF0[request];
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Request"));

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
  HMDRemoteEventRouterProtoConnectMessage *v26;
  int v27;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
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
              goto LABEL_44;
            }
            v21 = v20 + 1;
            v22 = *(char *)(*(_QWORD *)((char *)a3 + *v8) + v20);
            *(_QWORD *)((char *)a3 + v19) = v21;
            if ((v22 & 0x80000000) == 0)
              break;
          }
          while (v18++ <= 8);
          goto LABEL_44;
        case 1u:
          PBReaderReadString();
          v24 = (NSString *)objc_claimAutoreleasedReturnValue();
          identifier = self->_identifier;
          self->_identifier = v24;

          goto LABEL_44;
        case 2u:
          -[HMDRemoteEventRouterProtoMessage clearOneofValuesForRequest](self, "clearOneofValuesForRequest");
          *(_BYTE *)&self->_has |= 1u;
          self->_request = 1;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoConnectMessage);
          objc_storeStrong((id *)&self->_connect, v26);
          if (!PBReaderPlaceMark()
            || (HMDRemoteEventRouterProtoConnectMessageReadFrom((uint64_t)v26, (uint64_t)a3) & 1) == 0)
          {
            goto LABEL_48;
          }
          goto LABEL_43;
        case 3u:
          -[HMDRemoteEventRouterProtoMessage clearOneofValuesForRequest](self, "clearOneofValuesForRequest");
          *(_BYTE *)&self->_has |= 1u;
          self->_request = 2;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoChangeRegistrationsMessage);
          objc_storeStrong((id *)&self->_changeRegistrations, v26);
          if (!PBReaderPlaceMark()
            || !HMDRemoteEventRouterProtoChangeRegistrationsMessageReadFrom(v26, (uint64_t)a3))
          {
            goto LABEL_48;
          }
          goto LABEL_43;
        case 4u:
          -[HMDRemoteEventRouterProtoMessage clearOneofValuesForRequest](self, "clearOneofValuesForRequest");
          *(_BYTE *)&self->_has |= 1u;
          self->_request = 3;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoKeepAliveMessage);
          objc_storeStrong((id *)&self->_keepAlive, v26);
          if (!PBReaderPlaceMark() || !HMDRemoteEventRouterProtoDisconnectMessageReadFrom((uint64_t)a3))
            goto LABEL_48;
          goto LABEL_43;
        case 5u:
          -[HMDRemoteEventRouterProtoMessage clearOneofValuesForRequest](self, "clearOneofValuesForRequest");
          *(_BYTE *)&self->_has |= 1u;
          self->_request = 4;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoDisconnectMessage);
          objc_storeStrong((id *)&self->_disconnect, v26);
          if (!PBReaderPlaceMark() || !HMDRemoteEventRouterProtoDisconnectMessageReadFrom((uint64_t)a3))
            goto LABEL_48;
          goto LABEL_43;
        case 7u:
          -[HMDRemoteEventRouterProtoMessage clearOneofValuesForRequest](self, "clearOneofValuesForRequest");
          *(_BYTE *)&self->_has |= 1u;
          self->_request = 5;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoFetchEventsMessage);
          objc_storeStrong((id *)&self->_fetchEvents, v26);
          if (!PBReaderPlaceMark()
            || (HMDRemoteEventRouterProtoFetchEventsMessageReadFrom((uint64_t)v26, (uint64_t)a3) & 1) == 0)
          {
LABEL_48:

            LOBYTE(v27) = 0;
            return v27;
          }
LABEL_43:
          PBReaderRecallMark();

LABEL_44:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_47;
          break;
        default:
          v27 = PBReaderSkipValueWithTag();
          if (!v27)
            return v27;
          goto LABEL_44;
      }
    }
  }
LABEL_47:
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
  if (self->_connect)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_changeRegistrations)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_keepAlive)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_disconnect)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_fetchEvents)
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
    v4[14] = self->_request;
    *((_BYTE *)v4 + 60) |= 1u;
  }
  v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v5;
  }
  if (self->_connect)
  {
    objc_msgSend(v5, "setConnect:");
    v4 = v5;
  }
  if (self->_changeRegistrations)
  {
    objc_msgSend(v5, "setChangeRegistrations:");
    v4 = v5;
  }
  if (self->_keepAlive)
  {
    objc_msgSend(v5, "setKeepAlive:");
    v4 = v5;
  }
  if (self->_disconnect)
  {
    objc_msgSend(v5, "setDisconnect:");
    v4 = v5;
  }
  if (self->_fetchEvents)
  {
    objc_msgSend(v5, "setFetchEvents:");
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
  id v17;
  void *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_request;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v8 = (void *)v6[5];
  v6[5] = v7;

  v9 = -[HMDRemoteEventRouterProtoConnectMessage copyWithZone:](self->_connect, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[HMDRemoteEventRouterProtoChangeRegistrationsMessage copyWithZone:](self->_changeRegistrations, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  v13 = -[HMDRemoteEventRouterProtoKeepAliveMessage copyWithZone:](self->_keepAlive, "copyWithZone:", a3);
  v14 = (void *)v6[6];
  v6[6] = v13;

  v15 = -[HMDRemoteEventRouterProtoDisconnectMessage copyWithZone:](self->_disconnect, "copyWithZone:", a3);
  v16 = (void *)v6[3];
  v6[3] = v15;

  v17 = -[HMDRemoteEventRouterProtoFetchEventsMessage copyWithZone:](self->_fetchEvents, "copyWithZone:", a3);
  v18 = (void *)v6[4];
  v6[4] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  HMDRemoteEventRouterProtoConnectMessage *connect;
  HMDRemoteEventRouterProtoChangeRegistrationsMessage *changeRegistrations;
  HMDRemoteEventRouterProtoKeepAliveMessage *keepAlive;
  HMDRemoteEventRouterProtoDisconnectMessage *disconnect;
  HMDRemoteEventRouterProtoFetchEventsMessage *fetchEvents;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_request != *((_DWORD *)v4 + 14))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](identifier, "isEqual:"))
    goto LABEL_19;
  connect = self->_connect;
  if ((unint64_t)connect | *((_QWORD *)v4 + 2))
  {
    if (!-[HMDRemoteEventRouterProtoConnectMessage isEqual:](connect, "isEqual:"))
      goto LABEL_19;
  }
  changeRegistrations = self->_changeRegistrations;
  if ((unint64_t)changeRegistrations | *((_QWORD *)v4 + 1))
  {
    if (!-[HMDRemoteEventRouterProtoChangeRegistrationsMessage isEqual:](changeRegistrations, "isEqual:"))
      goto LABEL_19;
  }
  keepAlive = self->_keepAlive;
  if ((unint64_t)keepAlive | *((_QWORD *)v4 + 6))
  {
    if (!-[HMDRemoteEventRouterProtoKeepAliveMessage isEqual:](keepAlive, "isEqual:"))
      goto LABEL_19;
  }
  disconnect = self->_disconnect;
  if ((unint64_t)disconnect | *((_QWORD *)v4 + 3))
  {
    if (!-[HMDRemoteEventRouterProtoDisconnectMessage isEqual:](disconnect, "isEqual:"))
      goto LABEL_19;
  }
  fetchEvents = self->_fetchEvents;
  if ((unint64_t)fetchEvents | *((_QWORD *)v4 + 4))
    v11 = -[HMDRemoteEventRouterProtoFetchEventsMessage isEqual:](fetchEvents, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_request;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_identifier, "hash") ^ v3;
  v5 = -[HMDRemoteEventRouterProtoConnectMessage hash](self->_connect, "hash");
  v6 = v4 ^ v5 ^ -[HMDRemoteEventRouterProtoChangeRegistrationsMessage hash](self->_changeRegistrations, "hash");
  v7 = -[HMDRemoteEventRouterProtoKeepAliveMessage hash](self->_keepAlive, "hash");
  v8 = v7 ^ -[HMDRemoteEventRouterProtoDisconnectMessage hash](self->_disconnect, "hash");
  return v6 ^ v8 ^ -[HMDRemoteEventRouterProtoFetchEventsMessage hash](self->_fetchEvents, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  HMDRemoteEventRouterProtoConnectMessage *connect;
  uint64_t v7;
  HMDRemoteEventRouterProtoChangeRegistrationsMessage *changeRegistrations;
  uint64_t v9;
  HMDRemoteEventRouterProtoKeepAliveMessage *keepAlive;
  uint64_t v11;
  HMDRemoteEventRouterProtoDisconnectMessage *disconnect;
  uint64_t v13;
  HMDRemoteEventRouterProtoFetchEventsMessage *fetchEvents;
  uint64_t v15;
  _QWORD *v16;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    self->_request = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 1u;
  }
  v16 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[HMDRemoteEventRouterProtoMessage setIdentifier:](self, "setIdentifier:");
    v5 = v16;
  }
  connect = self->_connect;
  v7 = v5[2];
  if (connect)
  {
    if (!v7)
      goto LABEL_11;
    -[HMDRemoteEventRouterProtoConnectMessage mergeFrom:](connect, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    -[HMDRemoteEventRouterProtoMessage setConnect:](self, "setConnect:");
  }
  v5 = v16;
LABEL_11:
  changeRegistrations = self->_changeRegistrations;
  v9 = v5[1];
  if (changeRegistrations)
  {
    if (!v9)
      goto LABEL_17;
    -[HMDRemoteEventRouterProtoChangeRegistrationsMessage mergeFrom:](changeRegistrations, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_17;
    -[HMDRemoteEventRouterProtoMessage setChangeRegistrations:](self, "setChangeRegistrations:");
  }
  v5 = v16;
LABEL_17:
  keepAlive = self->_keepAlive;
  v11 = v5[6];
  if (keepAlive)
  {
    if (!v11)
      goto LABEL_23;
    -[HMDRemoteEventRouterProtoKeepAliveMessage mergeFrom:](keepAlive, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_23;
    -[HMDRemoteEventRouterProtoMessage setKeepAlive:](self, "setKeepAlive:");
  }
  v5 = v16;
LABEL_23:
  disconnect = self->_disconnect;
  v13 = v5[3];
  if (disconnect)
  {
    if (!v13)
      goto LABEL_29;
    -[HMDRemoteEventRouterProtoDisconnectMessage mergeFrom:](disconnect, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_29;
    -[HMDRemoteEventRouterProtoMessage setDisconnect:](self, "setDisconnect:");
  }
  v5 = v16;
LABEL_29:
  fetchEvents = self->_fetchEvents;
  v15 = v5[4];
  if (fetchEvents)
  {
    if (v15)
    {
      -[HMDRemoteEventRouterProtoFetchEventsMessage mergeFrom:](fetchEvents, "mergeFrom:");
LABEL_34:
      v5 = v16;
    }
  }
  else if (v15)
  {
    -[HMDRemoteEventRouterProtoMessage setFetchEvents:](self, "setFetchEvents:");
    goto LABEL_34;
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

- (HMDRemoteEventRouterProtoConnectMessage)connect
{
  return self->_connect;
}

- (HMDRemoteEventRouterProtoChangeRegistrationsMessage)changeRegistrations
{
  return self->_changeRegistrations;
}

- (HMDRemoteEventRouterProtoKeepAliveMessage)keepAlive
{
  return self->_keepAlive;
}

- (HMDRemoteEventRouterProtoDisconnectMessage)disconnect
{
  return self->_disconnect;
}

- (HMDRemoteEventRouterProtoFetchEventsMessage)fetchEvents
{
  return self->_fetchEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fetchEvents, 0);
  objc_storeStrong((id *)&self->_disconnect, 0);
  objc_storeStrong((id *)&self->_connect, 0);
  objc_storeStrong((id *)&self->_changeRegistrations, 0);
}

@end
