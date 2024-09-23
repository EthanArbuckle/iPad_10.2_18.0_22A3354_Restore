@implementation SYChange

- (id)typeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CC66C28[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ObjectAdded")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ObjectUpdated")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ObjectDeleted")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasChangeData
{
  return self->_changeData != 0;
}

- (BOOL)hasSequencer
{
  return self->_sequencer != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SYChange;
  -[SYChange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYChange dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t type;
  __CFString *v5;
  NSString *objectId;
  void *v7;
  NSData *changeData;
  NSString *sequencer;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24CC66C28[type];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  objectId = self->_objectId;
  if (objectId)
    objc_msgSend(v3, "setObject:forKey:", objectId, CFSTR("objectId"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_version);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("version"));

  changeData = self->_changeData;
  if (changeData)
    objc_msgSend(v3, "setObject:forKey:", changeData, CFSTR("changeData"));
  sequencer = self->_sequencer;
  if (sequencer)
    objc_msgSend(v3, "setObject:forKey:", sequencer, CFSTR("sequencer"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_objectId)
    -[SYChange writeTo:].cold.1();
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();
  if (self->_changeData)
    PBDataWriterWriteDataField();
  if (self->_sequencer)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  void *v4;
  _DWORD *v5;

  v5 = a3;
  v5[10] = self->_type;
  objc_msgSend(v5, "setObjectId:", self->_objectId);
  v4 = v5;
  *((_QWORD *)v5 + 1) = self->_version;
  if (self->_changeData)
  {
    objc_msgSend(v5, "setChangeData:");
    v4 = v5;
  }
  if (self->_sequencer)
  {
    objc_msgSend(v5, "setSequencer:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 40) = self->_type;
  v6 = -[NSString copyWithZone:](self->_objectId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(_QWORD *)(v5 + 8) = self->_version;
  v8 = -[NSData copyWithZone:](self->_changeData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_sequencer, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *objectId;
  NSData *changeData;
  NSString *sequencer;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_type == *((_DWORD *)v4 + 10)
    && ((objectId = self->_objectId, !((unint64_t)objectId | v4[3]))
     || -[NSString isEqual:](objectId, "isEqual:"))
    && self->_version == v4[1]
    && ((changeData = self->_changeData, !((unint64_t)changeData | v4[2]))
     || -[NSData isEqual:](changeData, "isEqual:")))
  {
    sequencer = self->_sequencer;
    if ((unint64_t)sequencer | v4[4])
      v8 = -[NSString isEqual:](sequencer, "isEqual:");
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
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;

  v3 = 2654435761 * self->_type;
  v4 = -[NSString hash](self->_objectId, "hash") ^ v3;
  v5 = 2654435761u * self->_version;
  v6 = v4 ^ v5 ^ -[NSData hash](self->_changeData, "hash");
  return v6 ^ -[NSString hash](self->_sequencer, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;

  v4 = (unint64_t *)a3;
  self->_type = *((_DWORD *)v4 + 10);
  v5 = v4;
  if (v4[3])
    -[SYChange setObjectId:](self, "setObjectId:");
  self->_version = v5[1];
  if (v5[2])
    -[SYChange setChangeData:](self, "setChangeData:");
  if (v5[4])
    -[SYChange setSequencer:](self, "setSequencer:");

}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
  objc_storeStrong((id *)&self->_objectId, a3);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSData)changeData
{
  return self->_changeData;
}

- (void)setChangeData:(id)a3
{
  objc_storeStrong((id *)&self->_changeData, a3);
}

- (NSString)sequencer
{
  return self->_sequencer;
}

- (void)setSequencer:(id)a3
{
  objc_storeStrong((id *)&self->_sequencer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequencer, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_changeData, 0);
}

+ (id)changeWithObject:(id)a3 updateType:(int)a4 store:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  SYChange *v11;
  void *v12;
  void *v13;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "syncId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v10 = qword_253D84AD8;
    if (os_log_type_enabled((os_log_t)qword_253D84AD8, OS_LOG_TYPE_FAULT))
      +[SYChange(Additions) changeWithObject:updateType:store:].cold.1((uint64_t)v7, v10);
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("SYObject %@ does not provide the required syncId!"), v7);
  }
  v11 = objc_alloc_init(SYChange);
  -[SYChange setType:](v11, "setType:", v6);
  objc_msgSend(v7, "syncId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYChange setObjectId:](v11, "setObjectId:", v12);

  if (v7)
  {
    if ((_DWORD)v6 != 2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(v8, "encodeSYObject:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYChange setChangeData:](v11, "setChangeData:", v13);

    }
  }

  return v11;
}

- (id)objectForStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SYDeletedObject *v7;
  SYDeletedObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  -[SYChange changeData](self, "changeData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SYChange changeData](self, "changeData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeSYObject:", v6);
    v7 = (SYDeletedObject *)objc_claimAutoreleasedReturnValue();

  }
  else if (-[SYChange type](self, "type") == 2)
  {
    v8 = [SYDeletedObject alloc];
    -[SYChange objectId](self, "objectId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SYDeletedObject initWithSyncId:](v8, "initWithSyncId:", v9);

  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v10 = qword_253D84AD8;
    if (os_log_type_enabled((os_log_t)qword_253D84AD8, OS_LOG_TYPE_ERROR))
      -[SYChange(Additions) objectForStore:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    v7 = 0;
  }

  return v7;
}

+ (id)changeWithChangeObject:(id)a3 serializer:(id)a4
{
  return (id)objc_msgSend(a1, "changeWithChangeObject:serializer:encodeUsingVersion:", a3, a4, 2);
}

+ (id)changeWithChangeObject:(id)a3 serializer:(id)a4 encodeUsingVersion:(int64_t)a5
{
  id v7;
  id v8;
  SYChange *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (SYChange *)v7;
  }
  else
  {
    objc_msgSend(v7, "objectIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v11 = (void *)qword_253D84AD8;
      if (os_log_type_enabled((os_log_t)qword_253D84AD8, OS_LOG_TYPE_ERROR))
        +[SYChange(SYSessionAdditions) changeWithChangeObject:serializer:encodeUsingVersion:].cold.2(v11, v7);
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("SYChange object %@ does not provide the required objectIdentifier!"), v7);
    }
    v9 = objc_alloc_init(SYChange);
    objc_msgSend(v7, "objectIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYChange setObjectId:](v9, "setObjectId:", v12);

    v13 = objc_msgSend(v7, "changeType");
    if (v13 == 3)
      v14 = 2;
    else
      v14 = v13 == 2;
    -[SYChange setType:](v9, "setType:", v14);
    objc_msgSend(v7, "sequencer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYChange setSequencer:](v9, "setSequencer:", v15);

    if (-[SYChange type](v9, "type") != 3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (a5 == 1)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "encodeSYChangeForBackwardCompatibility:protocolVersion:", v7, 1);
          v16 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          v17 = qword_253D84AD8;
          if (os_log_type_enabled((os_log_t)qword_253D84AD8, OS_LOG_TYPE_ERROR))
            +[SYChange(SYSessionAdditions) changeWithChangeObject:serializer:encodeUsingVersion:].cold.1(v17);
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("SYChangeSerializer does not implement -encodeSYChangeForBackwardCompatibility:protocolVersion: or -dataWithSYObject:"));
            goto LABEL_29;
          }
          if (_sync_log_facilities_pred != -1)
            _os_once();
          v18 = qword_253D84AD8;
          if (os_log_type_enabled((os_log_t)qword_253D84AD8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_211704000, v18, OS_LOG_TYPE_DEFAULT, "Serializing via -dataWithSYObject:, which may fail spectacularly", buf, 2u);
          }
          objc_msgSend(v8, "dataWithSYObject:", v7);
          v16 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_msgSend(v8, "dataFromChange:", v7);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v19 = (void *)v16;
      -[SYChange setChangeData:](v9, "setChangeData:", v16);

    }
  }
LABEL_29:

  return v9;
}

- (id)changeObjectWithSerializer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  SYDeletedObject *v10;
  SYDeletedObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  -[SYChange changeData](self, "changeData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SYChange changeData](self, "changeData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SYChange type](self, "type");
    v8 = 1;
    if (v7 == 1)
      v8 = 2;
    if (v7 == 2)
      v9 = 3;
    else
      v9 = v8;
    objc_msgSend(v4, "changeFromData:ofType:", v6, v9);
    v10 = (SYDeletedObject *)objc_claimAutoreleasedReturnValue();

  }
  else if (-[SYChange type](self, "type") == 2)
  {
    v11 = [SYDeletedObject alloc];
    -[SYChange objectId](self, "objectId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYChange sequencer](self, "sequencer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SYDeletedObject initWithObjectID:sequencer:](v11, "initWithObjectID:sequencer:", v12, v13);

  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v14 = qword_253D84AD8;
    if (os_log_type_enabled((os_log_t)qword_253D84AD8, OS_LOG_TYPE_ERROR))
      -[SYChange(SYSessionAdditions) changeObjectWithSerializer:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    v10 = 0;
  }

  return v10;
}

- (id)changeObjectWithSerializer:(id)a3 encodedByVersion:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  SYDeletedObject *v13;
  void *v14;
  uint64_t v15;
  _SYObjectCompatibilityWrapper *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  -[SYChange changeData](self, "changeData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SYChange changeData](self, "changeData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SYChange type](self, "type");
      v10 = 1;
      if (v9 == 1)
        v10 = 2;
      if (v9 == 2)
        v11 = 3;
      else
        v11 = v10;
      objc_msgSend(v6, "decodeChangeData:fromProtocolVersion:ofType:", v8, a4, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if (a4 <= 1 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = [_SYObjectCompatibilityWrapper alloc];
      -[SYChange changeData](self, "changeData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "SYObjectWithData:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SYChange type](self, "type");
      v18 = 1;
      if (v17 == 1)
        v18 = 2;
      if (v17 == 2)
        v19 = 3;
      else
        v19 = v18;
      v15 = -[_SYObjectCompatibilityWrapper initWithSYObject:changeType:](v16, "initWithSYObject:changeType:", v14, v19);
      goto LABEL_19;
    }
LABEL_25:
    v12 = 0;
    goto LABEL_26;
  }
  if (-[SYChange type](self, "type") != 2)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v20 = qword_253D84AD8;
    if (os_log_type_enabled((os_log_t)qword_253D84AD8, OS_LOG_TYPE_ERROR))
      -[SYChange(SYSessionAdditions) changeObjectWithSerializer:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_25;
  }
  v13 = [SYDeletedObject alloc];
  -[SYChange objectId](self, "objectId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYChange sequencer](self, "sequencer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SYDeletedObject initWithObjectID:sequencer:](v13, "initWithObjectID:sequencer:", v8, v14);
LABEL_19:
  v12 = (void *)v15;

LABEL_20:
LABEL_26:

  return v12;
}

- (int64_t)changeType
{
  int v2;
  int64_t v3;

  v2 = -[SYChange type](self, "type");
  v3 = 1;
  if (v2 == 1)
    v3 = 2;
  if (v2 == 2)
    return 3;
  else
    return v3;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYChange writeTo:]", "SYChange.m", 128, "nil != self->_objectId");
}

@end
