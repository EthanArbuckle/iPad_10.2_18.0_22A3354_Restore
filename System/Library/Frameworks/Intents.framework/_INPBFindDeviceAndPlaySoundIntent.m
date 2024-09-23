@implementation _INPBFindDeviceAndPlaySoundIntent

- (void)setDevices:(id)a3
{
  NSArray *v4;
  NSArray *devices;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  devices = self->_devices;
  self->_devices = v4;

}

- (void)clearDevices
{
  -[NSArray removeAllObjects](self->_devices, "removeAllObjects");
}

- (void)addDevice:(id)a3
{
  id v4;
  NSArray *devices;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  devices = self->_devices;
  v8 = v4;
  if (!devices)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_devices;
    self->_devices = v6;

    v4 = v8;
    devices = self->_devices;
  }
  -[NSArray addObject:](devices, "addObject:", v4);

}

- (unint64_t)devicesCount
{
  return -[NSArray count](self->_devices, "count");
}

- (id)deviceAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_devices, "objectAtIndexedSubscript:", a3);
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIsStopRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isStopRequest = a3;
}

- (BOOL)hasIsStopRequest
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsStopRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFindDeviceAndPlaySoundIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_devices;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[_INPBFindDeviceAndPlaySoundIntent intentMetadata](self, "intentMetadata", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBFindDeviceAndPlaySoundIntent intentMetadata](self, "intentMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBFindDeviceAndPlaySoundIntent hasIsStopRequest](self, "hasIsStopRequest"))
    PBDataWriterWriteBOOLField();

}

- (_INPBFindDeviceAndPlaySoundIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBFindDeviceAndPlaySoundIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBFindDeviceAndPlaySoundIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBFindDeviceAndPlaySoundIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBFindDeviceAndPlaySoundIntent initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBFindDeviceAndPlaySoundIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBFindDeviceAndPlaySoundIntent *v5;
  void *v6;
  id v7;

  v5 = -[_INPBFindDeviceAndPlaySoundIntent init](+[_INPBFindDeviceAndPlaySoundIntent allocWithZone:](_INPBFindDeviceAndPlaySoundIntent, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_devices, "copyWithZone:", a3);
  -[_INPBFindDeviceAndPlaySoundIntent setDevices:](v5, "setDevices:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBFindDeviceAndPlaySoundIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  if (-[_INPBFindDeviceAndPlaySoundIntent hasIsStopRequest](self, "hasIsStopRequest"))
    -[_INPBFindDeviceAndPlaySoundIntent setIsStopRequest:](v5, "setIsStopRequest:", -[_INPBFindDeviceAndPlaySoundIntent isStopRequest](self, "isStopRequest"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  int v19;
  int isStopRequest;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBFindDeviceAndPlaySoundIntent devices](self, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBFindDeviceAndPlaySoundIntent devices](self, "devices");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBFindDeviceAndPlaySoundIntent devices](self, "devices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "devices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBFindDeviceAndPlaySoundIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[_INPBFindDeviceAndPlaySoundIntent intentMetadata](self, "intentMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBFindDeviceAndPlaySoundIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  v19 = -[_INPBFindDeviceAndPlaySoundIntent hasIsStopRequest](self, "hasIsStopRequest");
  if (v19 == objc_msgSend(v4, "hasIsStopRequest"))
  {
    if (!-[_INPBFindDeviceAndPlaySoundIntent hasIsStopRequest](self, "hasIsStopRequest")
      || !objc_msgSend(v4, "hasIsStopRequest")
      || (isStopRequest = self->_isStopRequest, isStopRequest == objc_msgSend(v4, "isStopRequest")))
    {
      v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSArray hash](self->_devices, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBFindDeviceAndPlaySoundIntent hasIsStopRequest](self, "hasIsStopRequest"))
    v5 = 2654435761 * self->_isStopRequest;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_devices, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = self->_devices;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("device"));
  }
  -[_INPBFindDeviceAndPlaySoundIntent intentMetadata](self, "intentMetadata", (_QWORD)v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("intentMetadata"));

  if (-[_INPBFindDeviceAndPlaySoundIntent hasIsStopRequest](self, "hasIsStopRequest"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBFindDeviceAndPlaySoundIntent isStopRequest](self, "isStopRequest"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isStopRequest"));

  }
  return v3;
}

- (NSArray)devices
{
  return self->_devices;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (BOOL)isStopRequest
{
  return self->_isStopRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

+ (Class)deviceType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
