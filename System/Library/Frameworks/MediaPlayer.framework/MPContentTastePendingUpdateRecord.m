@implementation MPContentTastePendingUpdateRecord

- (MPContentTastePendingUpdateRecord)initWithPlaylistGlobalID:(id)a3 tasteType:(int64_t)a4
{
  id v6;
  MPContentTastePendingUpdateRecord *v7;
  MPContentTastePendingUpdateRecord *v8;
  uint64_t v9;
  NSString *playlistGlobalID;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPContentTastePendingUpdateRecord;
  v7 = -[MPContentTastePendingUpdateRecord init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MPContentTastePendingUpdateRecord _initializeWithType:tasteType:](v7, "_initializeWithType:tasteType:", 0, a4);
    v9 = objc_msgSend(v6, "copy");
    playlistGlobalID = v8->_playlistGlobalID;
    v8->_playlistGlobalID = (NSString *)v9;

  }
  return v8;
}

- (MPContentTastePendingUpdateRecord)initWithStoreAdamID:(int64_t)a3 tasteType:(int64_t)a4
{
  MPContentTastePendingUpdateRecord *v6;
  MPContentTastePendingUpdateRecord *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPContentTastePendingUpdateRecord;
  v6 = -[MPContentTastePendingUpdateRecord init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[MPContentTastePendingUpdateRecord _initializeWithType:tasteType:](v6, "_initializeWithType:tasteType:", 1, a4);
    v7->_storeAdamID = a3;
  }
  return v7;
}

- (void)_initializeWithType:(int64_t)a3 tasteType:(int64_t)a4
{
  NSUUID *v5;
  NSUUID *UUID;

  self->_tasteType = a4;
  self->_type = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  UUID = self->_UUID;
  self->_UUID = v5;

}

- (NSString)playlistGlobalID
{
  return self->_playlistGlobalID;
}

- (int64_t)storeAdamID
{
  return self->_storeAdamID;
}

- (int64_t)tasteType
{
  return self->_tasteType;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_playlistGlobalID, 0);
}

@end
