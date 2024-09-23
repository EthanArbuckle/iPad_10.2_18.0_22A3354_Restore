@implementation GEOPBTransitRoutingIncidentMessage

- (GEOPBTransitRoutingIncidentMessage)init
{
  GEOPBTransitRoutingIncidentMessage *v2;
  GEOPBTransitRoutingIncidentMessage *v3;
  GEOPBTransitRoutingIncidentMessage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitRoutingIncidentMessage;
  v2 = -[GEOPBTransitRoutingIncidentMessage init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitRoutingIncidentMessage)initWithData:(id)a3
{
  GEOPBTransitRoutingIncidentMessage *v3;
  GEOPBTransitRoutingIncidentMessage *v4;
  GEOPBTransitRoutingIncidentMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitRoutingIncidentMessage;
  v3 = -[GEOPBTransitRoutingIncidentMessage initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPBTransitRoutingIncidentMessage;
  -[GEOPBTransitRoutingIncidentMessage dealloc](&v3, sel_dealloc);
}

- (void)_readRoutingMessage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitRoutingIncidentMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutingMessage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)routingMessage
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPBTransitRoutingIncidentMessage _readRoutingMessage]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setRoutingMessage:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 72) |= 8u;
    *(_BYTE *)(a1 + 72) |= 0x10u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)_readTransitIncidentIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitRoutingIncidentMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitIncidentIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)addTransitIncidentIndex:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPBTransitRoutingIncidentMessage _readTransitIncidentIndexs](a1);
    PBRepeatedUInt32Add();
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 72) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 72) |= 0x10u;
  }
}

- (uint64_t)transitIncidentIndexAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOPBTransitRoutingIncidentMessage _readTransitIncidentIndexs](result);
    v4 = *(_QWORD *)(v3 + 32);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(unsigned int *)(*(_QWORD *)(v3 + 24) + 4 * a2);
  }
  return result;
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
  v8.super_class = (Class)GEOPBTransitRoutingIncidentMessage;
  -[GEOPBTransitRoutingIncidentMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitRoutingIncidentMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitRoutingIncidentMessage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  -[GEOPBTransitRoutingIncidentMessage readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("routingIncidentMessageIndex");
    else
      v6 = CFSTR("routing_incident_message_index");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  -[GEOPBTransitRoutingIncidentMessage routingMessage]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("routingMessage");
    else
      v8 = CFSTR("routing_message");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt32NSArray();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("transitIncidentIndex");
    else
      v10 = CFSTR("transit_incident_index");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  v11 = *(void **)(a1 + 16);
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __64__GEOPBTransitRoutingIncidentMessage__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitRoutingIncidentMessage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_745;
      else
        v6 = (int *)&readAll__nonRecursiveTag_746;
      GEOPBTransitRoutingIncidentMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __64__GEOPBTransitRoutingIncidentMessage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = objc_msgSend((id)a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("routingIncidentMessageIndex");
      else
        v6 = CFSTR("routing_incident_message_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_msgSend(v7, "unsignedIntValue");
        *(_BYTE *)(a1 + 72) |= 0x10u;
        *(_BYTE *)(a1 + 72) |= 1u;
        *(_DWORD *)(a1 + 68) = v8;
      }

      if (a3)
        v9 = CFSTR("routingMessage");
      else
        v9 = CFSTR("routing_message");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        -[GEOPBTransitRoutingIncidentMessage setRoutingMessage:](a1, v11);

      }
      if (a3)
        v12 = CFSTR("transitIncidentIndex");
      else
        v12 = CFSTR("transit_incident_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v22;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v22 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v18);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v19, "unsignedIntValue", (_QWORD)v21);
                -[GEOPBTransitRoutingIncidentMessage addTransitIncidentIndex:](a1);
              }
              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v16);
        }

      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitRoutingIncidentMessageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPBTransitRoutingIncidentMessage readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    v5 = v9;
    if (self->_routingMessage)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    if (self->_transitIncidentIndexs.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        v5 = v9;
        ++v6;
      }
      while (v6 < self->_transitIncidentIndexs.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  PBUnknownFields *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPBTransitRoutingIncidentMessageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitRoutingIncidentMessage readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_routingIncidentMessageIndex;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_routingMessage, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  PBRepeatedUInt32Copy();
  v11 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *routingMessage;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEOPBTransitRoutingIncidentMessage readAll:]((uint64_t)self, 1);
  -[GEOPBTransitRoutingIncidentMessage readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_routingIncidentMessageIndex != *((_DWORD *)v4 + 17))
      goto LABEL_10;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_10:
    IsEqual = 0;
    goto LABEL_11;
  }
  routingMessage = self->_routingMessage;
  if ((unint64_t)routingMessage | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](routingMessage, "isEqual:"))
  {
    goto LABEL_10;
  }
  IsEqual = PBRepeatedUInt32IsEqual();
LABEL_11:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  -[GEOPBTransitRoutingIncidentMessage readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_routingIncidentMessageIndex;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_routingMessage, "hash");
  return v4 ^ v3 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(uint64_t)a1
{
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  unint64_t i;
  _DWORD *v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    -[GEOPBTransitRoutingIncidentMessage readAll:]((uint64_t)v3, 0);
    if ((v7[18] & 1) != 0)
    {
      *(_DWORD *)(a1 + 68) = v7[17];
      *(_BYTE *)(a1 + 72) |= 1u;
    }
    v4 = (void *)*((_QWORD *)v7 + 6);
    if (v4)
      -[GEOPBTransitRoutingIncidentMessage setRoutingMessage:](a1, v4);
    -[GEOPBTransitRoutingIncidentMessage _readTransitIncidentIndexs]((uint64_t)v7);
    v3 = v7;
    v5 = *((_QWORD *)v7 + 4);
    if (v5)
    {
      for (i = 0; i != v5; ++i)
      {
        -[GEOPBTransitRoutingIncidentMessage transitIncidentIndexAtIndex:]((uint64_t)v7, i);
        -[GEOPBTransitRoutingIncidentMessage addTransitIncidentIndex:](a1);
        v3 = v7;
      }
    }
  }

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 72) |= 2u;
    *(_BYTE *)(a1 + 72) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
      -[GEOPBTransitRoutingIncidentMessage readAll:](a1, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingMessage, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
