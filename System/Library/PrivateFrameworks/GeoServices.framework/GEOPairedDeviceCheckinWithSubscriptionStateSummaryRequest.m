@implementation GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest

- (BOOL)hasSummarySHA256Hash
{
  return self->_summarySHA256Hash != 0;
}

- (NSData)summarySHA256Hash
{
  return self->_summarySHA256Hash;
}

- (void)setSummarySHA256Hash:(id)a3
{
  objc_storeStrong((id *)&self->_summarySHA256Hash, a3);
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
  v8.super_class = (Class)GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest;
  -[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "summarySHA256Hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("summarySHA256Hash"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("summarySHA256Hash"));
    }
  }

  v8 = (void *)a1[1];
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __87__GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest__dictionaryRepresentation___block_invoke;
      v15[3] = &unk_1E1C00600;
      v12 = v11;
      v16 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest _dictionaryRepresentation:](self, 1);
}

void __87__GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)-[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("summarySHA256Hash"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 0);
        objc_msgSend(a1, "setSummarySHA256Hash:", v5);

      }
    }
  }

  return a1;
}

- (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest)initWithJSON:(id)a3
{
  return (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)-[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_summarySHA256Hash)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest readAll:](self, "readAll:", 0);
  if (self->_summarySHA256Hash)
    objc_msgSend(v4, "setSummarySHA256Hash:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_summarySHA256Hash, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  NSData *summarySHA256Hash;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    summarySHA256Hash = self->_summarySHA256Hash;
    if ((unint64_t)summarySHA256Hash | v4[2])
      v5 = -[NSData isEqual:](summarySHA256Hash, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest readAll:](self, "readAll:", 1);
  return -[NSData hash](self->_summarySHA256Hash, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = v4[2];

  if (v5)
    -[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest setSummarySHA256Hash:](self, "setSummarySHA256Hash:", v5);
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summarySHA256Hash, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
