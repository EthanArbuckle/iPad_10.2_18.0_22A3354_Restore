@implementation _DKPRSource

- (uint64_t)setUserID:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 52) |= 1u;
    *(_DWORD *)(result + 48) = a2;
  }
  return result;
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
  v8.super_class = (Class)_DKPRSource;
  -[_DKPRSource description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRSource dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sourceID;
  NSString *bundleID;
  NSString *itemID;
  NSString *groupID;
  NSString *deviceID;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sourceID = self->_sourceID;
  if (sourceID)
    objc_msgSend(v3, "setObject:forKey:", sourceID, CFSTR("sourceID"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v4, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  itemID = self->_itemID;
  if (itemID)
    objc_msgSend(v4, "setObject:forKey:", itemID, CFSTR("itemID"));
  groupID = self->_groupID;
  if (groupID)
    objc_msgSend(v4, "setObject:forKey:", groupID, CFSTR("groupID"));
  deviceID = self->_deviceID;
  if (deviceID)
    objc_msgSend(v4, "setObject:forKey:", deviceID, CFSTR("deviceID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_userID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("userID"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPRSourceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sourceID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_itemID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_groupID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)setSourceID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setBundleID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void)setItemID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setGroupID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setDeviceID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sourceID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_itemID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_groupID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[NSString copyWithZone:](self->_deviceID, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_userID;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sourceID;
  NSString *bundleID;
  NSString *itemID;
  NSString *groupID;
  NSString *deviceID;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  sourceID = self->_sourceID;
  if ((unint64_t)sourceID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](sourceID, "isEqual:"))
      goto LABEL_16;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
      goto LABEL_16;
  }
  itemID = self->_itemID;
  if ((unint64_t)itemID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](itemID, "isEqual:"))
      goto LABEL_16;
  }
  groupID = self->_groupID;
  if ((unint64_t)groupID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](groupID, "isEqual:"))
      goto LABEL_16;
  }
  deviceID = self->_deviceID;
  if ((unint64_t)deviceID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceID, "isEqual:"))
      goto LABEL_16;
  }
  v10 = (*((_BYTE *)v4 + 52) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) != 0 && self->_userID == *((_DWORD *)v4 + 12))
    {
      v10 = 1;
      goto LABEL_17;
    }
LABEL_16:
    v10 = 0;
  }
LABEL_17:

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

  v3 = -[NSString hash](self->_sourceID, "hash");
  v4 = -[NSString hash](self->_bundleID, "hash");
  v5 = -[NSString hash](self->_itemID, "hash");
  v6 = -[NSString hash](self->_groupID, "hash");
  v7 = -[NSString hash](self->_deviceID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_userID;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (uint64_t)sourceID
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)bundleID
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)itemID
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)groupID
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)deviceID
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)userID
{
  if (result)
    return *(unsigned int *)(result + 48);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
