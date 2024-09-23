@implementation GEOPDExtensionParams

- (GEOPDExtensionParams)init
{
  GEOPDExtensionParams *v2;
  GEOPDExtensionParams *v3;
  GEOPDExtensionParams *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDExtensionParams;
  v2 = -[GEOPDExtensionParams init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDExtensionParams)initWithData:(id)a3
{
  GEOPDExtensionParams *v3;
  GEOPDExtensionParams *v4;
  GEOPDExtensionParams *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDExtensionParams;
  v3 = -[GEOPDExtensionParams initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDExtensionParams;
  -[GEOPDExtensionParams dealloc](&v3, sel_dealloc);
}

- (void)_readVendorId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDExtensionParamsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVendorId_tags_3854);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)vendorId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDExtensionParams _readVendorId]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)_readExternalItemId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDExtensionParamsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExternalItemId_tags_3855);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)externalItemId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDExtensionParams _readExternalItemId]((uint64_t)a1);
    a1 = (id *)v1[7];
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
  v8.super_class = (Class)GEOPDExtensionParams;
  -[GEOPDExtensionParams description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDExtensionParams dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDExtensionParams _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  id v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;

  if (!a1)
    return 0;
  -[GEOPDExtensionParams readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDExtensionParams vendorId]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("vendorId");
    else
      v6 = CFSTR("vendor_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  -[GEOPDExtensionParams externalItemId]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("externalItemId");
    else
      v8 = CFSTR("external_item_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v11 = 0;
      do
      {
        v12 = *(int *)(*v10 + 4 * v11);
        if (v12 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = off_1E1C0BA50[v12];
        }
        objc_msgSend(v9, "addObject:", v13);

        ++v11;
        v10 = (_QWORD *)(a1 + 24);
      }
      while (v11 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v14 = CFSTR("extensionType");
    else
      v14 = CFSTR("extension_type");
    objc_msgSend(v4, "setObject:forKey:", v9, v14);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_BYTE *)(a1 + 84) & 4) == 0)
  {
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = v15;
      objc_sync_enter(v16);
      GEOPDExtensionParamsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppAdamId_tags_3856);
      objc_sync_exit(v16);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v17 = *(id *)(a1 + 48);
  if (v17)
  {
    if (a2)
      v18 = CFSTR("appAdamId");
    else
      v18 = CFSTR("app_adam_id");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  v19 = *(void **)(a1 + 16);
  if (v19)
  {
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __50__GEOPDExtensionParams__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v23 = v22;
      v27 = v23;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v26);
      v24 = v23;

      v21 = v24;
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDExtensionParams _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_3861;
      else
        v6 = (int *)&readAll__nonRecursiveTag_3862;
      GEOPDExtensionParamsReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __50__GEOPDExtensionParams__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDExtensionParamsReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3E) == 0))
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
    -[GEOPDExtensionParams readAll:]((uint64_t)self, 0);
    if (self->_vendorId)
      PBDataWriterWriteStringField();
    v5 = v9;
    if (self->_externalItemId)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    if (self->_extensionTypes.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v9;
        ++v6;
      }
      while (v6 < self->_extensionTypes.count);
    }
    if (self->_appAdamId)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
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
    -[GEOPDExtensionParams readAll:]((uint64_t)self, 0);
    v8 = -[NSString copyWithZone:](self->_vendorId, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v8;

    v10 = -[NSString copyWithZone:](self->_externalItemId, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v10;

    PBRepeatedInt32Copy();
    v12 = -[NSString copyWithZone:](self->_appAdamId, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDExtensionParamsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *vendorId;
  NSString *externalItemId;
  NSString *appAdamId;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDExtensionParams readAll:]((uint64_t)self, 1),
         -[GEOPDExtensionParams readAll:]((uint64_t)v4, 1),
         vendorId = self->_vendorId,
         !((unint64_t)vendorId | v4[8]))
     || -[NSString isEqual:](vendorId, "isEqual:"))
    && ((externalItemId = self->_externalItemId, !((unint64_t)externalItemId | v4[7]))
     || -[NSString isEqual:](externalItemId, "isEqual:"))
    && PBRepeatedInt32IsEqual())
  {
    appAdamId = self->_appAdamId;
    if ((unint64_t)appAdamId | v4[6])
      v8 = -[NSString isEqual:](appAdamId, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  -[GEOPDExtensionParams readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_vendorId, "hash");
  v4 = -[NSString hash](self->_externalItemId, "hash") ^ v3;
  v5 = v4 ^ PBRepeatedInt32Hash();
  return v5 ^ -[NSString hash](self->_appAdamId, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_externalItemId, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
