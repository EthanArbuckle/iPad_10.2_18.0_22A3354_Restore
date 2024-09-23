@implementation HDCodableRoutineRequestMessage

- (int)requestType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_requestType;
  else
    return 1;
}

- (void)setRequestType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requestType = a3;
}

- (void)setHasRequestType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)requestTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E6CFEC88[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FetchLocation")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FetchNextLocations")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ScenarioTriggered")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasFetchLocationRequest
{
  return self->_fetchLocationRequest != 0;
}

- (BOOL)hasScenarioTriggeredRequest
{
  return self->_scenarioTriggeredRequest != 0;
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
  v8.super_class = (Class)HDCodableRoutineRequestMessage;
  -[HDCodableRoutineRequestMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableRoutineRequestMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  NSString *requestIdentifier;
  HDCodableRoutineLocationRequest *fetchLocationRequest;
  void *v8;
  HDCodableRoutineScenarioTriggeredRequest *scenarioTriggeredRequest;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = self->_requestType - 1;
    if (v4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requestType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E6CFEC88[v4];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("requestType"));

  }
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", requestIdentifier, CFSTR("requestIdentifier"));
  fetchLocationRequest = self->_fetchLocationRequest;
  if (fetchLocationRequest)
  {
    -[HDCodableRoutineLocationRequest dictionaryRepresentation](fetchLocationRequest, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("fetchLocationRequest"));

  }
  scenarioTriggeredRequest = self->_scenarioTriggeredRequest;
  if (scenarioTriggeredRequest)
  {
    -[HDCodableRoutineScenarioTriggeredRequest dictionaryRepresentation](scenarioTriggeredRequest, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("scenarioTriggeredRequest"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutineRequestMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_requestIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_fetchLocationRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_scenarioTriggeredRequest)
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
    v4[6] = self->_requestType;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v5 = v4;
  if (self->_requestIdentifier)
  {
    objc_msgSend(v4, "setRequestIdentifier:");
    v4 = v5;
  }
  if (self->_fetchLocationRequest)
  {
    objc_msgSend(v5, "setFetchLocationRequest:");
    v4 = v5;
  }
  if (self->_scenarioTriggeredRequest)
  {
    objc_msgSend(v5, "setScenarioTriggeredRequest:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_requestType;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[HDCodableRoutineLocationRequest copyWithZone:](self->_fetchLocationRequest, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[HDCodableRoutineScenarioTriggeredRequest copyWithZone:](self->_scenarioTriggeredRequest, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *requestIdentifier;
  HDCodableRoutineLocationRequest *fetchLocationRequest;
  HDCodableRoutineScenarioTriggeredRequest *scenarioTriggeredRequest;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_requestType != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  requestIdentifier = self->_requestIdentifier;
  if ((unint64_t)requestIdentifier | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](requestIdentifier, "isEqual:"))
  {
    goto LABEL_13;
  }
  fetchLocationRequest = self->_fetchLocationRequest;
  if ((unint64_t)fetchLocationRequest | *((_QWORD *)v4 + 1))
  {
    if (!-[HDCodableRoutineLocationRequest isEqual:](fetchLocationRequest, "isEqual:"))
      goto LABEL_13;
  }
  scenarioTriggeredRequest = self->_scenarioTriggeredRequest;
  if ((unint64_t)scenarioTriggeredRequest | *((_QWORD *)v4 + 4))
    v8 = -[HDCodableRoutineScenarioTriggeredRequest isEqual:](scenarioTriggeredRequest, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_requestType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_requestIdentifier, "hash") ^ v3;
  v5 = -[HDCodableRoutineLocationRequest hash](self->_fetchLocationRequest, "hash");
  return v4 ^ v5 ^ -[HDCodableRoutineScenarioTriggeredRequest hash](self->_scenarioTriggeredRequest, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  HDCodableRoutineLocationRequest *fetchLocationRequest;
  uint64_t v7;
  HDCodableRoutineScenarioTriggeredRequest *scenarioTriggeredRequest;
  uint64_t v9;
  _QWORD *v10;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_requestType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  v10 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[HDCodableRoutineRequestMessage setRequestIdentifier:](self, "setRequestIdentifier:");
    v5 = v10;
  }
  fetchLocationRequest = self->_fetchLocationRequest;
  v7 = v5[1];
  if (fetchLocationRequest)
  {
    if (!v7)
      goto LABEL_11;
    -[HDCodableRoutineLocationRequest mergeFrom:](fetchLocationRequest, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    -[HDCodableRoutineRequestMessage setFetchLocationRequest:](self, "setFetchLocationRequest:");
  }
  v5 = v10;
LABEL_11:
  scenarioTriggeredRequest = self->_scenarioTriggeredRequest;
  v9 = v5[4];
  if (scenarioTriggeredRequest)
  {
    if (v9)
    {
      -[HDCodableRoutineScenarioTriggeredRequest mergeFrom:](scenarioTriggeredRequest, "mergeFrom:");
LABEL_16:
      v5 = v10;
    }
  }
  else if (v9)
  {
    -[HDCodableRoutineRequestMessage setScenarioTriggeredRequest:](self, "setScenarioTriggeredRequest:");
    goto LABEL_16;
  }

}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (HDCodableRoutineLocationRequest)fetchLocationRequest
{
  return self->_fetchLocationRequest;
}

- (void)setFetchLocationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_fetchLocationRequest, a3);
}

- (HDCodableRoutineScenarioTriggeredRequest)scenarioTriggeredRequest
{
  return self->_scenarioTriggeredRequest;
}

- (void)setScenarioTriggeredRequest:(id)a3
{
  objc_storeStrong((id *)&self->_scenarioTriggeredRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenarioTriggeredRequest, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_fetchLocationRequest, 0);
}

@end
