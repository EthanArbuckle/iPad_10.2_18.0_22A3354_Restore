@implementation GEOPDJoeColor

- (GEOPDJoeColor)init
{
  GEOPDJoeColor *v2;
  GEOPDJoeColor *v3;
  GEOPDJoeColor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDJoeColor;
  v2 = -[GEOPDJoeColor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDJoeColor)initWithData:(id)a3
{
  GEOPDJoeColor *v3;
  GEOPDJoeColor *v4;
  GEOPDJoeColor *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDJoeColor;
  v3 = -[GEOPDJoeColor initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBackgroundColor
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDJoeColorReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBackgroundColor_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)backgroundColor
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDJoeColor _readBackgroundColor]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setBackgroundColor:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 80) |= 4u;
  *(_BYTE *)(a1 + 80) |= 0x80u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)setPrimaryTextColor:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 80) |= 8u;
  *(_BYTE *)(a1 + 80) |= 0x80u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)setSecondaryTextColor:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 80) |= 0x20u;
  *(_BYTE *)(a1 + 80) |= 0x80u;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)setTertiaryTextColor:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 80) |= 0x40u;
  *(_BYTE *)(a1 + 80) |= 0x80u;
  objc_storeStrong((id *)(a1 + 56), a2);

}

- (void)setQuaternaryTextColor:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 80) |= 0x10u;
  *(_BYTE *)(a1 + 80) |= 0x80u;
  objc_storeStrong((id *)(a1 + 40), a2);

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
  v8.super_class = (Class)GEOPDJoeColor;
  -[GEOPDJoeColor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDJoeColor dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDJoeColor _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;
  const __CFString *v14;
  void *v15;
  id v16;
  id v17;
  const __CFString *v18;
  void *v19;
  id v20;
  id v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;

  if (!a1)
    return 0;
  -[GEOPDJoeColor readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDJoeColor backgroundColor]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("backgroundColor");
    else
      v6 = CFSTR("background_color");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 80) & 8) == 0)
  {
    v7 = *(void **)(a1 + 8);
    if (v7)
    {
      v8 = v7;
      objc_sync_enter(v8);
      GEOPDJoeColorReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrimaryTextColor_tags);
      objc_sync_exit(v8);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v9 = *(id *)(a1 + 32);
  if (v9)
  {
    if (a2)
      v10 = CFSTR("primaryTextColor");
    else
      v10 = CFSTR("primary_text_color");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = v11;
      objc_sync_enter(v12);
      GEOPDJoeColorReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSecondaryTextColor_tags);
      objc_sync_exit(v12);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v13 = *(id *)(a1 + 48);
  if (v13)
  {
    if (a2)
      v14 = CFSTR("secondaryTextColor");
    else
      v14 = CFSTR("secondary_text_color");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 80) & 0x40) == 0)
  {
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = v15;
      objc_sync_enter(v16);
      GEOPDJoeColorReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTertiaryTextColor_tags);
      objc_sync_exit(v16);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v17 = *(id *)(a1 + 56);
  if (v17)
  {
    if (a2)
      v18 = CFSTR("tertiaryTextColor");
    else
      v18 = CFSTR("tertiary_text_color");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
  {
    v19 = *(void **)(a1 + 8);
    if (v19)
    {
      v20 = v19;
      objc_sync_enter(v20);
      GEOPDJoeColorReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuaternaryTextColor_tags);
      objc_sync_exit(v20);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v21 = *(id *)(a1 + 40);
  if (v21)
  {
    if (a2)
      v22 = CFSTR("quaternaryTextColor");
    else
      v22 = CFSTR("quaternary_text_color");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);
  }

  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 76));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("curated"));

  }
  v24 = *(void **)(a1 + 16);
  if (v24)
  {
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __43__GEOPDJoeColor__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E1C00600;
      v28 = v27;
      v32 = v28;
      objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v31);
      v29 = v28;

      v26 = v29;
    }
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDJoeColor _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_4550;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4551;
      GEOPDJoeColorReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __43__GEOPDJoeColor__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDJoeColorReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 3u))
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
    -[GEOPDJoeColor readAll:]((uint64_t)self, 0);
    if (self->_backgroundColor)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_primaryTextColor)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_secondaryTextColor)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_tertiaryTextColor)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_quaternaryTextColor)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteBOOLField();
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
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  PBUnknownFields *v19;

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
      GEOPDJoeColorReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDJoeColor readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_backgroundColor, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_primaryTextColor, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[NSString copyWithZone:](self->_secondaryTextColor, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  v15 = -[NSString copyWithZone:](self->_tertiaryTextColor, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  v17 = -[NSString copyWithZone:](self->_quaternaryTextColor, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v17;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 76) = self->_curated;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v19 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *backgroundColor;
  NSString *primaryTextColor;
  NSString *secondaryTextColor;
  NSString *tertiaryTextColor;
  NSString *quaternaryTextColor;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOPDJoeColor readAll:]((uint64_t)self, 1);
  -[GEOPDJoeColor readAll:]((uint64_t)v4, 1);
  backgroundColor = self->_backgroundColor;
  if ((unint64_t)backgroundColor | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](backgroundColor, "isEqual:"))
      goto LABEL_14;
  }
  primaryTextColor = self->_primaryTextColor;
  if ((unint64_t)primaryTextColor | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](primaryTextColor, "isEqual:"))
      goto LABEL_14;
  }
  secondaryTextColor = self->_secondaryTextColor;
  if ((unint64_t)secondaryTextColor | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](secondaryTextColor, "isEqual:"))
      goto LABEL_14;
  }
  tertiaryTextColor = self->_tertiaryTextColor;
  if ((unint64_t)tertiaryTextColor | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](tertiaryTextColor, "isEqual:"))
      goto LABEL_14;
  }
  quaternaryTextColor = self->_quaternaryTextColor;
  if ((unint64_t)quaternaryTextColor | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](quaternaryTextColor, "isEqual:"))
      goto LABEL_14;
  }
  v10 = (*((_BYTE *)v4 + 80) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0)
    {
LABEL_14:
      v10 = 0;
      goto LABEL_15;
    }
    if (self->_curated)
    {
      if (!*((_BYTE *)v4 + 76))
        goto LABEL_14;
    }
    else if (*((_BYTE *)v4 + 76))
    {
      goto LABEL_14;
    }
    v10 = 1;
  }
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;

  -[GEOPDJoeColor readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_backgroundColor, "hash");
  v4 = -[NSString hash](self->_primaryTextColor, "hash");
  v5 = -[NSString hash](self->_secondaryTextColor, "hash");
  v6 = -[NSString hash](self->_tertiaryTextColor, "hash");
  v7 = -[NSString hash](self->_quaternaryTextColor, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v8 = 2654435761 * self->_curated;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_quaternaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
