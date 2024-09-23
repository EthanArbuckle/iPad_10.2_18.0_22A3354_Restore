@implementation GEOPDExternalActionDetail

- (GEOPDExternalActionDetail)init
{
  GEOPDExternalActionDetail *v2;
  GEOPDExternalActionDetail *v3;
  GEOPDExternalActionDetail *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDExternalActionDetail;
  v2 = -[GEOPDExternalActionDetail init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDExternalActionDetail)initWithData:(id)a3
{
  GEOPDExternalActionDetail *v3;
  GEOPDExternalActionDetail *v4;
  GEOPDExternalActionDetail *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDExternalActionDetail;
  v3 = -[GEOPDExternalActionDetail initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
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
  v8.super_class = (Class)GEOPDExternalActionDetail;
  -[GEOPDExternalActionDetail description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDExternalActionDetail dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDExternalActionDetail _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  const __CFString *v16;
  void *v17;
  id v18;
  id v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;

  if (!a1)
    return 0;
  -[GEOPDExternalActionDetail readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 2) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDExternalActionDetailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActionLabel_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v7 = *(id *)(a1 + 24);
  if (v7)
  {
    if (a2)
      v8 = CFSTR("actionLabel");
    else
      v8 = CFSTR("action_label");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEOPDExternalActionDetailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogoId_tags);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v11 = *(id *)(a1 + 48);
  if (v11)
  {
    if (a2)
      v12 = CFSTR("logoId");
    else
      v12 = CFSTR("logo_id");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 4) == 0)
  {
    v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = v13;
      objc_sync_enter(v14);
      GEOPDExternalActionDetailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActionUrlComponent_tags_3886);
      objc_sync_exit(v14);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v15 = *(id *)(a1 + 32);
  if (v15)
  {
    if (a2)
      v16 = CFSTR("actionUrlComponent");
    else
      v16 = CFSTR("action_url_component");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 8) == 0)
  {
    v17 = *(void **)(a1 + 8);
    if (v17)
    {
      v18 = v17;
      objc_sync_enter(v18);
      GEOPDExternalActionDetailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActionUrlVerb_tags);
      objc_sync_exit(v18);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v19 = *(id *)(a1 + 40);
  if (v19)
  {
    if (a2)
      v20 = CFSTR("actionUrlVerb");
    else
      v20 = CFSTR("action_url_verb");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);
  }

  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __55__GEOPDExternalActionDetail__dictionaryRepresentation___block_invoke;
      v28[3] = &unk_1E1C00600;
      v25 = v24;
      v29 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v28);
      v26 = v25;

      v23 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDExternalActionDetail _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_3899;
      else
        v6 = (int *)&readAll__nonRecursiveTag_3900;
      GEOPDExternalActionDetailReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __55__GEOPDExternalActionDetail__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDExternalActionDetailReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3E) == 0))
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDExternalActionDetail readAll:]((uint64_t)self, 0);
    if (self->_actionLabel)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_logoId)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_actionUrlComponent)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_actionUrlVerb)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDExternalActionDetail readAll:]((uint64_t)self, 0);
    v8 = -[NSString copyWithZone:](self->_actionLabel, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[NSString copyWithZone:](self->_logoId, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v10;

    v12 = -[NSString copyWithZone:](self->_actionUrlComponent, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    v14 = -[NSString copyWithZone:](self->_actionUrlVerb, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDExternalActionDetailReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *actionLabel;
  NSString *logoId;
  NSString *actionUrlComponent;
  NSString *actionUrlVerb;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDExternalActionDetail readAll:]((uint64_t)self, 1),
         -[GEOPDExternalActionDetail readAll:]((uint64_t)v4, 1),
         actionLabel = self->_actionLabel,
         !((unint64_t)actionLabel | v4[3]))
     || -[NSString isEqual:](actionLabel, "isEqual:"))
    && ((logoId = self->_logoId, !((unint64_t)logoId | v4[6]))
     || -[NSString isEqual:](logoId, "isEqual:"))
    && ((actionUrlComponent = self->_actionUrlComponent, !((unint64_t)actionUrlComponent | v4[4]))
     || -[NSString isEqual:](actionUrlComponent, "isEqual:")))
  {
    actionUrlVerb = self->_actionUrlVerb;
    if ((unint64_t)actionUrlVerb | v4[5])
      v9 = -[NSString isEqual:](actionUrlVerb, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  -[GEOPDExternalActionDetail readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_actionLabel, "hash");
  v4 = -[NSString hash](self->_logoId, "hash") ^ v3;
  v5 = -[NSString hash](self->_actionUrlComponent, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_actionUrlVerb, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoId, 0);
  objc_storeStrong((id *)&self->_actionUrlVerb, 0);
  objc_storeStrong((id *)&self->_actionUrlComponent, 0);
  objc_storeStrong((id *)&self->_actionLabel, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
