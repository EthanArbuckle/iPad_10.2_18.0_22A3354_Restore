@implementation GEOCluster

- (GEOCluster)init
{
  GEOCluster *v2;
  GEOCluster *v3;
  GEOCluster *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCluster;
  v2 = -[GEOCluster init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCluster)initWithData:(id)a3
{
  GEOCluster *v3;
  GEOCluster *v4;
  GEOCluster *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCluster;
  v3 = -[GEOCluster initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOCluster;
  -[GEOCluster dealloc](&v3, sel_dealloc);
}

- (void)_readContainer
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 60) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOClusterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContainer_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (id)container
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOCluster _readContainer]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setContainer:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 60) |= 2u;
  *(_BYTE *)(a1 + 60) |= 4u;
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
  v8.super_class = (Class)GEOCluster;
  -[GEOCluster description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCluster dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCluster _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    -[GEOCluster readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCluster container]((id *)a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("container"));

    }
    if (*(_QWORD *)(a1 + 24))
    {
      PBRepeatedInt32NSArray();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("index"));

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCluster _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_247_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_248_0;
      GEOClusterReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 40), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOClusterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  void *v8;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_indexs;
  unint64_t v10;
  id v11;

  v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_8;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_8;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((GEOPlaceResultIsDirty((os_unfair_lock_s *)self->_container) & 1) != 0)
      goto LABEL_8;
    flags = (char)self->_flags;
  }
  if ((flags & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
    v8 = v11;
    goto LABEL_13;
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCluster readAll:]((uint64_t)self, 0);
  if (self->_container)
    PBDataWriterWriteSubmessage();
  p_indexs = &self->_indexs;
  v8 = v11;
  if (p_indexs->count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v8 = v11;
      ++v10;
    }
    while (v10 < p_indexs->count);
  }
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOCluster readAll:]((uint64_t)self, 0);
    v8 = -[GEOPlaceResult copyWithZone:](self->_container, "copyWithZone:", a3);
    v9 = (void *)v5[5];
    v5[5] = v8;

    PBRepeatedInt32Copy();
    return v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOClusterReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPlaceResult *container;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOCluster readAll:]((uint64_t)self, 1),
         -[GEOCluster readAll:]((uint64_t)v4, 1),
         container = self->_container,
         !((unint64_t)container | v4[5]))
     || -[GEOPlaceResult isEqual:](container, "isEqual:")))
  {
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;

  -[GEOCluster readAll:]((uint64_t)self, 1);
  v3 = -[GEOPlaceResult hash](self->_container, "hash");
  return PBRepeatedInt32Hash() ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
