@implementation GEORPAuxiliaryControl

- (GEORPAuxiliaryControl)init
{
  GEORPAuxiliaryControl *v2;
  GEORPAuxiliaryControl *v3;
  GEORPAuxiliaryControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPAuxiliaryControl;
  v2 = -[GEORPAuxiliaryControl init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPAuxiliaryControl)initWithData:(id)a3
{
  GEORPAuxiliaryControl *v3;
  GEORPAuxiliaryControl *v4;
  GEORPAuxiliaryControl *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPAuxiliaryControl;
  v3 = -[GEORPAuxiliaryControl initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readWatch
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPAuxiliaryControlReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWatch_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasWatch
{
  -[GEORPAuxiliaryControl _readWatch]((uint64_t)self);
  return self->_watch != 0;
}

- (GEORPWatchAuxiliaryControl)watch
{
  -[GEORPAuxiliaryControl _readWatch]((uint64_t)self);
  return self->_watch;
}

- (void)setWatch:(id)a3
{
  *(_BYTE *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_watch, a3);
}

- (void)_readCar
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPAuxiliaryControlReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCar_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasCar
{
  -[GEORPAuxiliaryControl _readCar]((uint64_t)self);
  return self->_car != 0;
}

- (GEORPCarPlayAuxiliaryControl)car
{
  -[GEORPAuxiliaryControl _readCar]((uint64_t)self);
  return self->_car;
}

- (void)setCar:(id)a3
{
  *(_BYTE *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_car, a3);
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
  v8.super_class = (Class)GEORPAuxiliaryControl;
  -[GEORPAuxiliaryControl description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPAuxiliaryControl dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPAuxiliaryControl _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "watch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("watch"));

    }
    objc_msgSend(a1, "car");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v8, "jsonRepresentation");
      else
        objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("car"));

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
  return -[GEORPAuxiliaryControl _dictionaryRepresentation:](self, 1);
}

- (GEORPAuxiliaryControl)initWithDictionary:(id)a3
{
  return (GEORPAuxiliaryControl *)-[GEORPAuxiliaryControl _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEORPWatchAuxiliaryControl *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEORPCarPlayAuxiliaryControl *v11;
  uint64_t v12;
  void *v13;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("watch"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEORPWatchAuxiliaryControl alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEORPWatchAuxiliaryControl initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEORPWatchAuxiliaryControl initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setWatch:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("car"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEORPCarPlayAuxiliaryControl alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEORPCarPlayAuxiliaryControl initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEORPCarPlayAuxiliaryControl initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setCar:", v12);

      }
    }
  }

  return a1;
}

- (GEORPAuxiliaryControl)initWithJSON:(id)a3
{
  return (GEORPAuxiliaryControl *)-[GEORPAuxiliaryControl _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_88;
    else
      v8 = (int *)&readAll__nonRecursiveTag_89;
    GEORPAuxiliaryControlReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPWatchAuxiliaryControl readAll:](self->_watch, "readAll:", 1);
    -[GEORPCarPlayAuxiliaryControl readAll:](self->_car, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPAuxiliaryControlIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPAuxiliaryControlReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPAuxiliaryControlIsDirty((uint64_t)self) & 1) == 0)
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPAuxiliaryControl readAll:](self, "readAll:", 0);
    if (self->_watch)
      PBDataWriterWriteSubmessage();
    if (self->_car)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEORPAuxiliaryControl readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_watch)
    objc_msgSend(v4, "setWatch:");
  if (self->_car)
    objc_msgSend(v4, "setCar:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;

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
    -[GEORPAuxiliaryControl readAll:](self, "readAll:", 0);
    v8 = -[GEORPWatchAuxiliaryControl copyWithZone:](self->_watch, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[GEORPCarPlayAuxiliaryControl copyWithZone:](self->_car, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPAuxiliaryControlReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPWatchAuxiliaryControl *watch;
  GEORPCarPlayAuxiliaryControl *car;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPAuxiliaryControl readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         watch = self->_watch,
         !((unint64_t)watch | v4[3]))
     || -[GEORPWatchAuxiliaryControl isEqual:](watch, "isEqual:")))
  {
    car = self->_car;
    if ((unint64_t)car | v4[2])
      v7 = -[GEORPCarPlayAuxiliaryControl isEqual:](car, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  -[GEORPAuxiliaryControl readAll:](self, "readAll:", 1);
  v3 = -[GEORPWatchAuxiliaryControl hash](self->_watch, "hash");
  return -[GEORPCarPlayAuxiliaryControl hash](self->_car, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEORPWatchAuxiliaryControl *watch;
  uint64_t v5;
  GEORPCarPlayAuxiliaryControl *car;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  watch = self->_watch;
  v5 = v8[3];
  if (watch)
  {
    if (v5)
      -[GEORPWatchAuxiliaryControl mergeFrom:](watch, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPAuxiliaryControl setWatch:](self, "setWatch:");
  }
  car = self->_car;
  v7 = v8[2];
  if (car)
  {
    if (v7)
      -[GEORPCarPlayAuxiliaryControl mergeFrom:](car, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPAuxiliaryControl setCar:](self, "setCar:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watch, 0);
  objc_storeStrong((id *)&self->_car, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
