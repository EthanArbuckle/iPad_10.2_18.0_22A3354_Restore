@implementation ML3ContainerItemDiffMetadata

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(int64_t)a3
{
  self->_persistentID = a3;
}

- (int64_t)containerPersistentID
{
  return self->_containerPersistentID;
}

- (void)setContainerPersistentID:(int64_t)a3
{
  self->_containerPersistentID = a3;
}

- (int64_t)itemPersistentID
{
  return self->_itemPersistentID;
}

- (void)setItemPersistentID:(int64_t)a3
{
  self->_itemPersistentID = a3;
}

- (int64_t)newPosition
{
  return self->_newPosition;
}

- (void)setNewPosition:(int64_t)a3
{
  self->_newPosition = a3;
}

- (int64_t)previousPosition
{
  return self->_previousPosition;
}

- (void)setPreviousPosition:(int64_t)a3
{
  self->_previousPosition = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)positionUUID
{
  return self->_positionUUID;
}

- (void)setPositionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)occurrenceID
{
  return self->_occurrenceID;
}

- (void)setOccurrenceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceID, 0);
  objc_storeStrong((id *)&self->_positionUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)diffMetadataWithPersistentID:(int64_t)a3
{
  ML3ContainerItemDiffMetadata *v4;

  v4 = objc_alloc_init(ML3ContainerItemDiffMetadata);
  -[ML3ContainerItemDiffMetadata setPersistentID:](v4, "setPersistentID:", a3);
  return v4;
}

+ (id)diffMetadataWithPersistentID:(int64_t)a3 containerPersistentID:(int64_t)a4 itemPersistentID:(int64_t)a5 newPosition:(int64_t)a6 previousPosition:(int64_t)a7 uuid:(id)a8 positionUUD:(id)a9 occurrenceID:(id)a10
{
  id v15;
  id v16;
  id v17;
  void *v18;

  v15 = a8;
  v16 = a9;
  v17 = a10;
  +[ML3ContainerItemDiffMetadata diffMetadataWithPersistentID:](ML3ContainerItemDiffMetadata, "diffMetadataWithPersistentID:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContainerPersistentID:", a4);
  objc_msgSend(v18, "setItemPersistentID:", a5);
  objc_msgSend(v18, "setNewPosition:", a6);
  objc_msgSend(v18, "setPreviousPosition:", a7);
  objc_msgSend(v18, "setUuid:", v15);
  objc_msgSend(v18, "setPositionUUID:", v16);
  objc_msgSend(v18, "setOccurrenceID:", v17);

  return v18;
}

@end
