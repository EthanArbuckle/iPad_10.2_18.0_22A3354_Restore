@implementation GEOLPRUser

- (NSMutableDictionary)vehicles
{
  return self->_vehicles;
}

- (void)setVehicles:(id)a3
{
  objc_storeStrong((id *)&self->_vehicles, a3);
}

- (void)clearVehicles
{
  -[NSMutableDictionary removeAllObjects](self->_vehicles, "removeAllObjects");
}

- (void)setVehiclesValue:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *vehicles;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  vehicles = self->_vehicles;
  if (!vehicles)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_vehicles;
    self->_vehicles = v8;

    vehicles = self->_vehicles;
  }
  -[NSMutableDictionary setObject:forKey:](vehicles, "setObject:forKey:", v10, v6);

}

- (id)vehiclesForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_vehicles, "objectForKey:", a3);
}

- (void)enumerateVehiclesUsingBlock:(id)a3
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_vehicles, "enumerateKeysAndObjectsUsingBlock:", a3);
}

- (unint64_t)vehiclesCount
{
  return -[NSMutableDictionary count](self->_vehicles, "count");
}

+ (Class)vehiclesType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOLPRUser;
  -[GEOLPRUser description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRUser dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRUser _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  char v14;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[1], "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1[1], "count"));
    v6 = a1[1];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __40__GEOLPRUser__dictionaryRepresentation___block_invoke;
    v12 = &unk_1E1C20F20;
    v13 = v5;
    v14 = a2;
    v7 = v5;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v9);
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("vehicles"), v9, v10, v11, v12);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRUser _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

void __40__GEOLPRUser__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  int v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 40);
  v6 = a2;
  if (v5)
    objc_msgSend(a3, "jsonRepresentation");
  else
    objc_msgSend(a3, "dictionaryRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v6);

}

- (GEOLPRUser)initWithDictionary:(id)a3
{
  return (GEOLPRUser *)-[GEOLPRUser _initWithDictionary:isJSON:](self, a3);
}

- (_QWORD)_initWithDictionary:(_QWORD *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  GEOLPRVehicle *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    a1 = (_QWORD *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("vehicles"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v3;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = (void *)a1[1];
        a1[1] = v5;

        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v17 = v4;
        v7 = v4;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v20 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
              objc_msgSend(v7, "objectForKeyedSubscript:", v12, v17);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = (void *)a1[1];
              v15 = -[GEOLPRVehicle initWithDictionary:]([GEOLPRVehicle alloc], "initWithDictionary:", v13);
              objc_msgSend(v14, "setObject:forKey:", v15, v12);

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v9);
        }

        v4 = v17;
        v3 = v18;
      }

    }
  }

  return a1;
}

- (GEOLPRUser)initWithJSON:(id)a3
{
  return (GEOLPRUser *)-[GEOLPRUser _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRUserIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRUserReadAllFrom(self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableDictionary *vehicles;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  vehicles = self->_vehicles;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __22__GEOLPRUser_writeTo___block_invoke;
  v7[3] = &unk_1E1C20F48;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](vehicles, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __22__GEOLPRUser_writeTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a2;
  PBDataWriterPlaceMark();
  PBDataWriterWriteStringField();

  PBDataWriterWriteSubmessage();
  return PBDataWriterRecallMark();
}

- (void)copyTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *vehicles;
  _QWORD *v7;
  _QWORD v8[4];
  _QWORD *v9;

  v7 = a3;
  -[GEOLPRUser readAll:](self, "readAll:", 0);
  if (-[GEOLPRUser vehiclesCount](self, "vehiclesCount"))
  {
    objc_msgSend(v7, "clearVehicles");
    if (!v7[1])
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v5 = (void *)v7[1];
      v7[1] = v4;

    }
    vehicles = self->_vehicles;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __21__GEOLPRUser_copyTo___block_invoke;
    v8[3] = &unk_1E1C20F48;
    v9 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](vehicles, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

void __21__GEOLPRUser_copyTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableDictionary *vehicles;
  _QWORD v10[4];
  _QWORD *v11;
  _NSZone *v12;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (-[NSMutableDictionary count](self->_vehicles, "count"))
  {
    objc_msgSend(v5, "clearVehicles");
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)v5[1];
    v5[1] = v6;

    vehicles = self->_vehicles;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __27__GEOLPRUser_copyWithZone___block_invoke;
    v10[3] = &unk_1E1C20F70;
    v12 = a3;
    v11 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](vehicles, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
  return v5;
}

void __27__GEOLPRUser_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  v7 = (id)objc_msgSend(a3, "copyWithZone:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v7, v6);

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  NSMutableDictionary *vehicles;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOLPRUser readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    vehicles = self->_vehicles;
    if ((unint64_t)vehicles | v4[1])
      v5 = -[NSMutableDictionary isEqual:](vehicles, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOLPRUser readAll:](self, "readAll:", 1);
  return -[NSMutableDictionary hash](self->_vehicles, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSMutableDictionary *vehicles;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = (void *)v4[1];

  if (v5)
  {
    vehicles = self->_vehicles;
    if (vehicles)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](vehicles, "addEntriesFromDictionary:", v5);
    }
    else
    {
      v7 = (NSMutableDictionary *)objc_msgSend(v5, "copy");
      v8 = self->_vehicles;
      self->_vehicles = v7;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicles, 0);
}

@end
