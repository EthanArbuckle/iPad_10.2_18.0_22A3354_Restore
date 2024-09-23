@implementation GEOPDLink

- (GEOPDLink)init
{
  GEOPDLink *v2;
  GEOPDLink *v3;
  GEOPDLink *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDLink;
  v2 = -[GEOPDLink init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDLink)initWithData:(id)a3
{
  GEOPDLink *v3;
  GEOPDLink *v4;
  GEOPDLink *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDLink;
  v3 = -[GEOPDLink initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)linkType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 68);
    else
      return 0;
  }
  return result;
}

- (void)_readQuickLinkParams
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuickLinkParams_tags_4589);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)quickLinkParams
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDLink _readQuickLinkParams]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readAppClipParams
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppClipParams_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)appClipParams
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDLink _readAppClipParams]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readExtensionParams
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExtensionParams_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)extensionParams
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDLink _readExtensionParams]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_readWebLinkParams
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWebLinkParams_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)webLinkParams
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDLink _readWebLinkParams]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
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
  v8.super_class = (Class)GEOPDLink;
  -[GEOPDLink description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDLink dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLink _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v33[4];
  id v34;

  if (!a1)
    return 0;
  -[GEOPDLink readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    v5 = *(int *)(a1 + 68);
    if (v5 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C0BB88[v5];
    }
    if (a2)
      v7 = CFSTR("linkType");
    else
      v7 = CFSTR("link_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  -[GEOPDLink quickLinkParams]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("quickLinkParams");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("quick_link_params");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  -[GEOPDLink appClipParams]((id *)a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("appClipParams");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("app_clip_params");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  -[GEOPDLink extensionParams]((id *)a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("extensionParams");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("extension_params");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  -[GEOPDLink webLinkParams]((id *)a1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "jsonRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("webLinkParams");
    }
    else
    {
      objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("web_link_params");
    }
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  if ((*(_BYTE *)(a1 + 76) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("ownerProvidedRank");
    else
      v25 = CFSTR("owner_provided_rank");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  v26 = *(void **)(a1 + 16);
  if (v26)
  {
    objc_msgSend(v26, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __39__GEOPDLink__dictionaryRepresentation___block_invoke;
      v33[3] = &unk_1E1C00600;
      v30 = v29;
      v34 = v30;
      objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v33);
      v31 = v30;

      v28 = v31;
    }
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDLink _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_4610;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4611;
      GEOPDLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDLinkCallReadAllRecursiveWithoutSynchronized((uint64_t *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __39__GEOPDLink__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDLinkReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOPDLinkIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDLink readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_quickLinkParams)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_appClipParams)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_extensionParams)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_webLinkParams)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
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
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  PBUnknownFields *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDLinkReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDLink readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_linkType;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v9 = -[GEOPDQuickLinkActionDataParams copyWithZone:](self->_quickLinkParams, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[GEOPDAppClipParams copyWithZone:](self->_appClipParams, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[GEOPDExtensionParams copyWithZone:](self->_extensionParams, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  v15 = -[GEOPDWebLinkParams copyWithZone:](self->_webLinkParams, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_ownerProvidedRank;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDQuickLinkActionDataParams *quickLinkParams;
  GEOPDAppClipParams *appClipParams;
  GEOPDExtensionParams *extensionParams;
  GEOPDWebLinkParams *webLinkParams;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOPDLink readAll:]((uint64_t)self, 1);
  -[GEOPDLink readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_linkType != *((_DWORD *)v4 + 17))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  quickLinkParams = self->_quickLinkParams;
  if ((unint64_t)quickLinkParams | *((_QWORD *)v4 + 5)
    && !-[GEOPDQuickLinkActionDataParams isEqual:](quickLinkParams, "isEqual:"))
  {
    goto LABEL_19;
  }
  appClipParams = self->_appClipParams;
  if ((unint64_t)appClipParams | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDAppClipParams isEqual:](appClipParams, "isEqual:"))
      goto LABEL_19;
  }
  extensionParams = self->_extensionParams;
  if ((unint64_t)extensionParams | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDExtensionParams isEqual:](extensionParams, "isEqual:"))
      goto LABEL_19;
  }
  webLinkParams = self->_webLinkParams;
  if ((unint64_t)webLinkParams | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDWebLinkParams isEqual:](webLinkParams, "isEqual:"))
      goto LABEL_19;
  }
  v9 = (*((_BYTE *)v4 + 76) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_ownerProvidedRank != *((_DWORD *)v4 + 18))
      goto LABEL_19;
    v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  -[GEOPDLink readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_linkType;
  else
    v3 = 0;
  v4 = -[GEOPDQuickLinkActionDataParams hash](self->_quickLinkParams, "hash");
  v5 = -[GEOPDAppClipParams hash](self->_appClipParams, "hash");
  v6 = -[GEOPDExtensionParams hash](self->_extensionParams, "hash");
  v7 = -[GEOPDWebLinkParams hash](self->_webLinkParams, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v8 = 2654435761 * self->_ownerProvidedRank;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webLinkParams, 0);
  objc_storeStrong((id *)&self->_quickLinkParams, 0);
  objc_storeStrong((id *)&self->_extensionParams, 0);
  objc_storeStrong((id *)&self->_appClipParams, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
