@implementation MRContentItemMetadataAudioRoute

- (MRContentItemMetadataAudioRoute)initWithProtobuf:(id)a3
{
  id v4;
  MRContentItemMetadataAudioRoute *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  MRContentItemMetadataAudioRoute *v9;
  objc_super v11;

  v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)MRContentItemMetadataAudioRoute;
    v5 = -[MRContentItemMetadataAudioRoute init](&v11, sel_init);
    if (v5)
    {
      v5->_type = (int)objc_msgSend(v4, "type");
      v5->_hasType = objc_msgSend(v4, "hasType");
      v5->_supportsSpatialization = objc_msgSend(v4, "supportsSpatialization");
      v5->_hasSupportsSpatialization = objc_msgSend(v4, "hasSupportsSpatialization");
      v5->_spatializationEnabled = objc_msgSend(v4, "spatializationEnabled");
      v5->_hasSpatializationEnabled = objc_msgSend(v4, "hasSpatializationEnabled");
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      name = v5->_name;
      v5->_name = (NSString *)v7;

    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_MRAudioRouteProtobuf)protobuf
{
  _MRAudioRouteProtobuf *v3;
  char v4;
  char v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(_MRAudioRouteProtobuf);
  v3->_type = -[MRContentItemMetadataAudioRoute type](self, "type");
  *(_BYTE *)&v3->_has = *(_BYTE *)&v3->_has & 0xFE | -[MRContentItemMetadataAudioRoute hasType](self, "hasType");
  v3->_supportsSpatialization = -[MRContentItemMetadataAudioRoute supportsSpatialization](self, "supportsSpatialization");
  if (-[MRContentItemMetadataAudioRoute hasSupportsSpatialization](self, "hasSupportsSpatialization"))
    v4 = 4;
  else
    v4 = 0;
  *(_BYTE *)&v3->_has = *(_BYTE *)&v3->_has & 0xFB | v4;
  v3->_spatializationEnabled = -[MRContentItemMetadataAudioRoute isSpatializationEnabled](self, "isSpatializationEnabled");
  if (-[MRContentItemMetadataAudioRoute hasSpatializationEnabled](self, "hasSpatializationEnabled"))
    v5 = 2;
  else
    v5 = 0;
  *(_BYTE *)&v3->_has = *(_BYTE *)&v3->_has & 0xFD | v5;
  -[MRContentItemMetadataAudioRoute name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[_MRAudioRouteProtobuf setName:](v3, "setName:", v7);

  return v3;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  self->_hasType = 1;
}

- (void)setSupportsSpatialization:(BOOL)a3
{
  self->_supportsSpatialization = a3;
  self->_hasSupportsSpatialization = 1;
}

- (void)setSpatializationEnabled:(BOOL)a3
{
  self->_spatializationEnabled = a3;
  self->_hasSpatializationEnabled = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init((Class)objc_opt_class());
  if (-[MRContentItemMetadataAudioRoute hasType](self, "hasType"))
    objc_msgSend(v5, "setType:", -[MRContentItemMetadataAudioRoute type](self, "type"));
  -[MRContentItemMetadataAudioRoute name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setName:", v7);

  if (-[MRContentItemMetadataAudioRoute hasSupportsSpatialization](self, "hasSupportsSpatialization"))
    objc_msgSend(v5, "setSupportsSpatialization:", -[MRContentItemMetadataAudioRoute supportsSpatialization](self, "supportsSpatialization"));
  if (-[MRContentItemMetadataAudioRoute hasSpatializationEnabled](self, "hasSpatializationEnabled"))
    objc_msgSend(v5, "setSpatializationEnabled:", -[MRContentItemMetadataAudioRoute isSpatializationEnabled](self, "isSpatializationEnabled"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MRContentItemMetadataAudioRoute *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  BOOL v16;
  _BOOL4 v17;

  v4 = (MRContentItemMetadataAudioRoute *)a3;
  if (v4 == self)
    goto LABEL_20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  v5 = -[MRContentItemMetadataAudioRoute hasType](v4, "hasType");
  if (v5 != -[MRContentItemMetadataAudioRoute hasType](self, "hasType"))
    goto LABEL_16;
  if (-[MRContentItemMetadataAudioRoute hasType](v4, "hasType"))
  {
    if (-[MRContentItemMetadataAudioRoute hasType](self, "hasType"))
    {
      v6 = -[MRContentItemMetadataAudioRoute type](v4, "type");
      if (v6 != -[MRContentItemMetadataAudioRoute type](self, "type"))
        goto LABEL_16;
    }
  }
  -[MRContentItemMetadataAudioRoute name](v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadataAudioRoute name](self, "name");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v8)
  {

LABEL_11:
    v13 = -[MRContentItemMetadataAudioRoute hasSupportsSpatialization](v4, "hasSupportsSpatialization");
    if (v13 != -[MRContentItemMetadataAudioRoute hasSupportsSpatialization](self, "hasSupportsSpatialization"))
      goto LABEL_16;
    if (-[MRContentItemMetadataAudioRoute hasSupportsSpatialization](v4, "hasSupportsSpatialization"))
    {
      if (-[MRContentItemMetadataAudioRoute hasSupportsSpatialization](self, "hasSupportsSpatialization"))
      {
        v14 = -[MRContentItemMetadataAudioRoute supportsSpatialization](v4, "supportsSpatialization");
        if (v14 != -[MRContentItemMetadataAudioRoute supportsSpatialization](self, "supportsSpatialization"))
          goto LABEL_16;
      }
    }
    v15 = -[MRContentItemMetadataAudioRoute hasSpatializationEnabled](v4, "hasSpatializationEnabled");
    if (v15 != -[MRContentItemMetadataAudioRoute hasSpatializationEnabled](self, "hasSpatializationEnabled"))
      goto LABEL_16;
    if (-[MRContentItemMetadataAudioRoute hasSpatializationEnabled](v4, "hasSpatializationEnabled"))
    {
      if (-[MRContentItemMetadataAudioRoute hasSpatializationEnabled](self, "hasSpatializationEnabled"))
      {
        v17 = -[MRContentItemMetadataAudioRoute isSpatializationEnabled](v4, "isSpatializationEnabled");
        if (v17 != -[MRContentItemMetadataAudioRoute isSpatializationEnabled](self, "isSpatializationEnabled"))
          goto LABEL_16;
      }
    }
LABEL_20:
    v16 = 1;
    goto LABEL_21;
  }
  v9 = (void *)v8;
  -[MRContentItemMetadataAudioRoute name](v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadataAudioRoute name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
    goto LABEL_11;
LABEL_16:
  v16 = 0;
LABEL_21:

  return v16;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[MRContentItemMetadataAudioRoute hasType](self, "hasType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadataAudioRoute type](self, "type"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  }
  -[MRContentItemMetadataAudioRoute name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("name"));

  if (-[MRContentItemMetadataAudioRoute hasSupportsSpatialization](self, "hasSupportsSpatialization"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadataAudioRoute supportsSpatialization](self, "supportsSpatialization"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("supportsSpatialization"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadataAudioRoute isSpatializationEnabled](self, "isSpatializationEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isSpatializationEnabled"));

  }
  return (NSDictionary *)v3;
}

- (BOOL)hasType
{
  return self->_hasType;
}

- (void)setHasType:(BOOL)a3
{
  self->_hasType = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)hasSupportsSpatialization
{
  return self->_hasSupportsSpatialization;
}

- (void)setHasSupportsSpatialization:(BOOL)a3
{
  self->_hasSupportsSpatialization = a3;
}

- (BOOL)supportsSpatialization
{
  return self->_supportsSpatialization;
}

- (BOOL)hasSpatializationEnabled
{
  return self->_hasSpatializationEnabled;
}

- (void)setHasSpatializationEnabled:(BOOL)a3
{
  self->_hasSpatializationEnabled = a3;
}

- (BOOL)isSpatializationEnabled
{
  return self->_spatializationEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
