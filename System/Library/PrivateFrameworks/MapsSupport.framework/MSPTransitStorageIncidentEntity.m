@implementation MSPTransitStorageIncidentEntity

- (MSPTransitStorageIncidentEntity)initWithIncidentEntity:(id)a3
{
  id v4;
  MSPTransitStorageIncidentEntity *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MSPTransitStorageIncidentEntity;
  v5 = -[MSPTransitStorageIncidentEntity init](&v16, sel_init);
  if (v5)
  {
    -[MSPTransitStorageIncidentEntity setMuid:](v5, "setMuid:", objc_msgSend(v4, "muid"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "nextStopIDs", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[MSPTransitStorageIncidentEntity addNextStopsMuids:](v5, "addNextStopsMuids:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "unsignedLongLongValue"));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (NSSet)nextStopIDs
{
  void *v3;
  unint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[MSPTransitStorageIncidentEntity nextStopsMuidsCount](self, "nextStopsMuidsCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MSPTransitStorageIncidentEntity nextStopsMuidsCount](self, "nextStopsMuidsCount"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MSPTransitStorageIncidentEntity nextStopsMuidsAtIndex:](self, "nextStopsMuidsAtIndex:", v4));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[MSPTransitStorageIncidentEntity nextStopsMuidsCount](self, "nextStopsMuidsCount"));
  }
  return (NSSet *)v3;
}

- (BOOL)hasNextStopIDs
{
  return -[MSPTransitStorageIncidentEntity nextStopsMuidsCount](self, "nextStopsMuidsCount") != 0;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)MSPTransitStorageIncidentEntity;
  -[MSPTransitStorageIncidentEntity dealloc](&v3, sel_dealloc);
}

- (void)setMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMuid
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)nextStopsMuidsCount
{
  return self->_nextStopsMuids.count;
}

- (unint64_t)nextStopsMuids
{
  return self->_nextStopsMuids.list;
}

- (void)clearNextStopsMuids
{
  PBRepeatedUInt64Clear();
}

- (void)addNextStopsMuids:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)nextStopsMuidsAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_nextStopsMuids;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_nextStopsMuids = &self->_nextStopsMuids;
  count = self->_nextStopsMuids.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_nextStopsMuids->list[a3];
}

- (void)setNextStopsMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageIncidentEntity;
  -[MSPTransitStorageIncidentEntity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPTransitStorageIncidentEntity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  PBUnknownFields *unknownFields;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_muid);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("muid"));

  }
  PBRepeatedUInt64NSArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("next_stops_muids"));

  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageIncidentEntityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
  if (self->_nextStopsMuids.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v6;
      ++v5;
    }
    while (v5 < self->_nextStopsMuids.count);
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  id v8;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[5] = self->_muid;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v8 = v4;
  if (-[MSPTransitStorageIncidentEntity nextStopsMuidsCount](self, "nextStopsMuidsCount"))
  {
    objc_msgSend(v8, "clearNextStopsMuids");
    v5 = -[MSPTransitStorageIncidentEntity nextStopsMuidsCount](self, "nextStopsMuidsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v8, "addNextStopsMuids:", -[MSPTransitStorageIncidentEntity nextStopsMuidsAtIndex:](self, "nextStopsMuidsAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v4 + 40) = self->_muid;
    *(_BYTE *)(v4 + 48) |= 1u;
  }
  PBRepeatedUInt64Copy();
  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_muid != *((_QWORD *)v4 + 5))
      goto LABEL_8;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_8:
    IsEqual = 0;
    goto LABEL_9;
  }
  IsEqual = PBRepeatedUInt64IsEqual();
LABEL_9:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_muid;
  else
    v2 = 0;
  return PBRepeatedUInt64Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;

  v4 = a3;
  if ((v4[6] & 1) != 0)
  {
    self->_muid = v4[5];
    *(_BYTE *)&self->_has |= 1u;
  }
  v8 = v4;
  v5 = objc_msgSend(v4, "nextStopsMuidsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[MSPTransitStorageIncidentEntity addNextStopsMuids:](self, "addNextStopsMuids:", objc_msgSend(v8, "nextStopsMuidsAtIndex:", i));
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
