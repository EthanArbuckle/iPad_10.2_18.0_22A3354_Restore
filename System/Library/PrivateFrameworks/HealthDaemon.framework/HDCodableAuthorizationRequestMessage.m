@implementation HDCodableAuthorizationRequestMessage

- (id)decodedReadTypes
{
  unint64_t v3;
  id v4;
  uint64_t i;
  void *v6;
  void *v7;

  v3 = -[HDCodableAuthorizationRequestMessage typesToReadsCount](self, "typesToReadsCount");
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      -[HDCodableAuthorizationRequestMessage _objectTypeForCode:](self, -[HDCodableAuthorizationRequestMessage typesToReadAtIndex:](self, "typesToReadAtIndex:", i));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(v4, "addObject:", v6);

    }
  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (id)_objectTypeForCode:(void *)a1
{
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (_HKValidDataTypeCode())
    {
      objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", a2);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      v3 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v5 = 134217984;
        v6 = a2;
        _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "Codable authorization request contains an invalid object type code (%ld) which will be ignored.", (uint8_t *)&v5, 0xCu);
      }
      a1 = 0;
    }
  }
  return a1;
}

- (id)decodedWriteTypes
{
  unint64_t v3;
  id v4;
  uint64_t i;
  void *v6;

  v3 = -[HDCodableAuthorizationRequestMessage typesToWritesCount](self, "typesToWritesCount");
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      -[HDCodableAuthorizationRequestMessage _objectTypeForCode:](self, -[HDCodableAuthorizationRequestMessage typesToWriteAtIndex:](self, "typesToWriteAtIndex:", i));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v6);
      }

    }
  }
  return v4;
}

+ (id)codableAuthorizationRequestWithRecord:(id)a3
{
  id v3;
  HDCodableAuthorizationRequestMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(HDCodableAuthorizationRequestMessage);
  objc_msgSend(v3, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableAuthorizationRequestMessage setAppBundleIdentifier:](v4, "setAppBundleIdentifier:", v8);

  }
  objc_msgSend(v3, "sessionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "sessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hk_dataForUUIDBytes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableAuthorizationRequestMessage setRequestIdentifier:](v4, "setRequestIdentifier:", v11);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v3, "typesRequiringReadAuthorization");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        -[HDCodableAuthorizationRequestMessage addTypesToRead:](v4, "addTypesToRead:", objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v16++), "code"));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v14);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v3, "typesRequiringShareAuthorization", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        -[HDCodableAuthorizationRequestMessage addTypesToWrite:](v4, "addTypesToWrite:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v21++), "code"));
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v19);
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)HDCodableAuthorizationRequestMessage;
  -[HDCodableAuthorizationRequestMessage dealloc](&v3, sel_dealloc);
}

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
}

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (unint64_t)typesToReadsCount
{
  return self->_typesToReads.count;
}

- (int64_t)typesToReads
{
  return self->_typesToReads.list;
}

- (void)clearTypesToReads
{
  PBRepeatedInt64Clear();
}

- (void)addTypesToRead:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)typesToReadAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_typesToReads;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_typesToReads = &self->_typesToReads;
  count = self->_typesToReads.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_typesToReads->list[a3];
}

- (void)setTypesToReads:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)typesToWritesCount
{
  return self->_typesToWrites.count;
}

- (int64_t)typesToWrites
{
  return self->_typesToWrites.list;
}

- (void)clearTypesToWrites
{
  PBRepeatedInt64Clear();
}

- (void)addTypesToWrite:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)typesToWriteAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_typesToWrites;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_typesToWrites = &self->_typesToWrites;
  count = self->_typesToWrites.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_typesToWrites->list[a3];
}

- (void)setTypesToWrites:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
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
  v8.super_class = (Class)HDCodableAuthorizationRequestMessage;
  -[HDCodableAuthorizationRequestMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableAuthorizationRequestMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *appBundleIdentifier;
  NSData *requestIdentifier;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  appBundleIdentifier = self->_appBundleIdentifier;
  if (appBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", appBundleIdentifier, CFSTR("appBundleIdentifier"));
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier)
    objc_msgSend(v4, "setObject:forKey:", requestIdentifier, CFSTR("requestIdentifier"));
  PBRepeatedInt64NSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("typesToRead"));

  PBRepeatedInt64NSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("typesToWrite"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableAuthorizationRequestMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  $A58966F474337DCABE012981F76706F5 *p_typesToWrites;
  unint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_appBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_requestIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v8;
  }
  if (self->_typesToReads.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      v4 = v8;
      ++v5;
    }
    while (v5 < self->_typesToReads.count);
  }
  p_typesToWrites = &self->_typesToWrites;
  if (p_typesToWrites->count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      v4 = v8;
      ++v7;
    }
    while (v7 < p_typesToWrites->count);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  id v10;

  v10 = a3;
  if (self->_appBundleIdentifier)
    objc_msgSend(v10, "setAppBundleIdentifier:");
  if (self->_requestIdentifier)
    objc_msgSend(v10, "setRequestIdentifier:");
  if (-[HDCodableAuthorizationRequestMessage typesToReadsCount](self, "typesToReadsCount"))
  {
    objc_msgSend(v10, "clearTypesToReads");
    v4 = -[HDCodableAuthorizationRequestMessage typesToReadsCount](self, "typesToReadsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v10, "addTypesToRead:", -[HDCodableAuthorizationRequestMessage typesToReadAtIndex:](self, "typesToReadAtIndex:", i));
    }
  }
  if (-[HDCodableAuthorizationRequestMessage typesToWritesCount](self, "typesToWritesCount"))
  {
    objc_msgSend(v10, "clearTypesToWrites");
    v7 = -[HDCodableAuthorizationRequestMessage typesToWritesCount](self, "typesToWritesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v10, "addTypesToWrite:", -[HDCodableAuthorizationRequestMessage typesToWriteAtIndex:](self, "typesToWriteAtIndex:", j));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_appBundleIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  v8 = -[NSData copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[8];
  v5[8] = v8;

  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *appBundleIdentifier;
  NSData *requestIdentifier;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((appBundleIdentifier = self->_appBundleIdentifier, !((unint64_t)appBundleIdentifier | v4[7]))
     || -[NSString isEqual:](appBundleIdentifier, "isEqual:"))
    && ((requestIdentifier = self->_requestIdentifier, !((unint64_t)requestIdentifier | v4[8]))
     || -[NSData isEqual:](requestIdentifier, "isEqual:"))
    && PBRepeatedInt64IsEqual())
  {
    IsEqual = PBRepeatedInt64IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_appBundleIdentifier, "hash");
  v4 = -[NSData hash](self->_requestIdentifier, "hash") ^ v3;
  v5 = PBRepeatedInt64Hash();
  return v4 ^ v5 ^ PBRepeatedInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  _QWORD *v11;

  v4 = a3;
  v11 = v4;
  if (v4[7])
  {
    -[HDCodableAuthorizationRequestMessage setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
    v4 = v11;
  }
  if (v4[8])
  {
    -[HDCodableAuthorizationRequestMessage setRequestIdentifier:](self, "setRequestIdentifier:");
    v4 = v11;
  }
  v5 = objc_msgSend(v4, "typesToReadsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[HDCodableAuthorizationRequestMessage addTypesToRead:](self, "addTypesToRead:", objc_msgSend(v11, "typesToReadAtIndex:", i));
  }
  v8 = objc_msgSend(v11, "typesToWritesCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[HDCodableAuthorizationRequestMessage addTypesToWrite:](self, "addTypesToWrite:", objc_msgSend(v11, "typesToWriteAtIndex:", j));
  }

}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, a3);
}

- (NSData)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
