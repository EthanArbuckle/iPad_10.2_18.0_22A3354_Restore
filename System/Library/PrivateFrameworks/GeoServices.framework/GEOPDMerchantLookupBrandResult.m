@implementation GEOPDMerchantLookupBrandResult

- (void)addMerchantBrandLookupResponse:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

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
  v8.super_class = (Class)GEOPDMerchantLookupBrandResult;
  -[GEOPDMerchantLookupBrandResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDMerchantLookupBrandResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMerchantLookupBrandResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    v5 = *(_DWORD *)(a1 + 24);
    if (v5 <= 29)
    {
      v6 = CFSTR("STATUS_SUCCESS");
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v6 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v6 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v6 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v5 != 20)
            goto LABEL_15;
          v6 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        v6 = CFSTR("STATUS_DEDUPED");
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        v6 = CFSTR("VERSION_MISMATCH");
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        v6 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        v6 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_20:
        if (a2)
          v7 = CFSTR("statusCode");
        else
          v7 = CFSTR("status_code");
        objc_msgSend(v4, "setObject:forKey:", v6, v7);

        goto LABEL_24;
      }
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 24));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_24:
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = *(id *)(a1 + 16);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }

    if (a2)
      v16 = CFSTR("merchantBrandLookupResponse");
    else
      v16 = CFSTR("merchant_brand_lookup_response");
    objc_msgSend(v4, "setObject:forKey:", v8, v16);

  }
  v17 = *(void **)(a1 + 8);
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __60__GEOPDMerchantLookupBrandResult__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMerchantLookupBrandResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEOPDMerchantLookupBrandResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDMerchantLookupBrandResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_merchantBrandLookupResponses;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (id *)v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_statusCode;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_merchantBrandLookupResponses;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v14);
        -[GEOPDMerchantLookupBrandResult addMerchantBrandLookupResponse:]((uint64_t)v6, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  objc_storeStrong(v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *merchantBrandLookupResponses;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_statusCode != *((_DWORD *)v4 + 6))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  merchantBrandLookupResponses = self->_merchantBrandLookupResponses;
  if ((unint64_t)merchantBrandLookupResponses | *((_QWORD *)v4 + 2))
    v6 = -[NSMutableArray isEqual:](merchantBrandLookupResponses, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v2 = 2654435761 * self->_statusCode;
  else
    v2 = 0;
  return -[NSMutableArray hash](self->_merchantBrandLookupResponses, "hash") ^ v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantBrandLookupResponses, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
