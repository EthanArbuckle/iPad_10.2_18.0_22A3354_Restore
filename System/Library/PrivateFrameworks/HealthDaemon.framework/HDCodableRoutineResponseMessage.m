@implementation HDCodableRoutineResponseMessage

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
    return off_1E6D01A08[a3 - 1];
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

- (BOOL)hasFetchLocationResponse
{
  return self->_fetchLocationResponse != 0;
}

- (BOOL)hasFetchNextLocationResponse
{
  return self->_fetchNextLocationResponse != 0;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
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
  v8.super_class = (Class)HDCodableRoutineResponseMessage;
  -[HDCodableRoutineResponseMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableRoutineResponseMessage dictionaryRepresentation](self, "dictionaryRepresentation");
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
  HDCodableRoutineLocationResponse *fetchLocationResponse;
  void *v8;
  HDCodableRoutinePredictedLocationsResponse *fetchNextLocationResponse;
  void *v10;
  NSString *errorDescription;

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
      v5 = off_1E6D01A08[v4];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("requestType"));

  }
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", requestIdentifier, CFSTR("requestIdentifier"));
  fetchLocationResponse = self->_fetchLocationResponse;
  if (fetchLocationResponse)
  {
    -[HDCodableRoutineLocationResponse dictionaryRepresentation](fetchLocationResponse, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("fetchLocationResponse"));

  }
  fetchNextLocationResponse = self->_fetchNextLocationResponse;
  if (fetchNextLocationResponse)
  {
    -[HDCodableRoutinePredictedLocationsResponse dictionaryRepresentation](fetchNextLocationResponse, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("fetchNextLocationResponse"));

  }
  errorDescription = self->_errorDescription;
  if (errorDescription)
    objc_msgSend(v3, "setObject:forKey:", errorDescription, CFSTR("errorDescription"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutineResponseMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_fetchLocationResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_fetchNextLocationResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
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
    v4[10] = self->_requestType;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  v5 = v4;
  if (self->_requestIdentifier)
  {
    objc_msgSend(v4, "setRequestIdentifier:");
    v4 = v5;
  }
  if (self->_fetchLocationResponse)
  {
    objc_msgSend(v5, "setFetchLocationResponse:");
    v4 = v5;
  }
  if (self->_fetchNextLocationResponse)
  {
    objc_msgSend(v5, "setFetchNextLocationResponse:");
    v4 = v5;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v5, "setErrorDescription:");
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
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_requestType;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[HDCodableRoutineLocationResponse copyWithZone:](self->_fetchLocationResponse, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[HDCodableRoutinePredictedLocationsResponse copyWithZone:](self->_fetchNextLocationResponse, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  v13 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  v14 = (void *)v6[1];
  v6[1] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *requestIdentifier;
  HDCodableRoutineLocationResponse *fetchLocationResponse;
  HDCodableRoutinePredictedLocationsResponse *fetchNextLocationResponse;
  NSString *errorDescription;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_requestType != *((_DWORD *)v4 + 10))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  requestIdentifier = self->_requestIdentifier;
  if ((unint64_t)requestIdentifier | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](requestIdentifier, "isEqual:"))
  {
    goto LABEL_15;
  }
  fetchLocationResponse = self->_fetchLocationResponse;
  if ((unint64_t)fetchLocationResponse | *((_QWORD *)v4 + 2))
  {
    if (!-[HDCodableRoutineLocationResponse isEqual:](fetchLocationResponse, "isEqual:"))
      goto LABEL_15;
  }
  fetchNextLocationResponse = self->_fetchNextLocationResponse;
  if ((unint64_t)fetchNextLocationResponse | *((_QWORD *)v4 + 3))
  {
    if (!-[HDCodableRoutinePredictedLocationsResponse isEqual:](fetchNextLocationResponse, "isEqual:"))
      goto LABEL_15;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((_QWORD *)v4 + 1))
    v9 = -[NSString isEqual:](errorDescription, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_requestType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_requestIdentifier, "hash") ^ v3;
  v5 = -[HDCodableRoutineLocationResponse hash](self->_fetchLocationResponse, "hash");
  v6 = v4 ^ v5 ^ -[HDCodableRoutinePredictedLocationsResponse hash](self->_fetchNextLocationResponse, "hash");
  return v6 ^ -[NSString hash](self->_errorDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  HDCodableRoutineLocationResponse *fetchLocationResponse;
  uint64_t v7;
  HDCodableRoutinePredictedLocationsResponse *fetchNextLocationResponse;
  uint64_t v9;
  _QWORD *v10;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_requestType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  v10 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCodableRoutineResponseMessage setRequestIdentifier:](self, "setRequestIdentifier:");
    v5 = v10;
  }
  fetchLocationResponse = self->_fetchLocationResponse;
  v7 = v5[2];
  if (fetchLocationResponse)
  {
    if (!v7)
      goto LABEL_11;
    -[HDCodableRoutineLocationResponse mergeFrom:](fetchLocationResponse, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    -[HDCodableRoutineResponseMessage setFetchLocationResponse:](self, "setFetchLocationResponse:");
  }
  v5 = v10;
LABEL_11:
  fetchNextLocationResponse = self->_fetchNextLocationResponse;
  v9 = v5[3];
  if (fetchNextLocationResponse)
  {
    if (!v9)
      goto LABEL_17;
    -[HDCodableRoutinePredictedLocationsResponse mergeFrom:](fetchNextLocationResponse, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_17;
    -[HDCodableRoutineResponseMessage setFetchNextLocationResponse:](self, "setFetchNextLocationResponse:");
  }
  v5 = v10;
LABEL_17:
  if (v5[1])
  {
    -[HDCodableRoutineResponseMessage setErrorDescription:](self, "setErrorDescription:");
    v5 = v10;
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

- (HDCodableRoutineLocationResponse)fetchLocationResponse
{
  return self->_fetchLocationResponse;
}

- (void)setFetchLocationResponse:(id)a3
{
  objc_storeStrong((id *)&self->_fetchLocationResponse, a3);
}

- (HDCodableRoutinePredictedLocationsResponse)fetchNextLocationResponse
{
  return self->_fetchNextLocationResponse;
}

- (void)setFetchNextLocationResponse:(id)a3
{
  objc_storeStrong((id *)&self->_fetchNextLocationResponse, a3);
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_errorDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_fetchNextLocationResponse, 0);
  objc_storeStrong((id *)&self->_fetchLocationResponse, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
}

@end
