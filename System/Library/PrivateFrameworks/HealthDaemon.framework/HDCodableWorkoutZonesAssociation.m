@implementation HDCodableWorkoutZonesAssociation

- (BOOL)hasWorkoutUUID
{
  return self->_workoutUUID != 0;
}

- (BOOL)hasZonesSampleUUID
{
  return self->_zonesSampleUUID != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
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
  v8.super_class = (Class)HDCodableWorkoutZonesAssociation;
  -[HDCodableWorkoutZonesAssociation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutZonesAssociation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *workoutUUID;
  NSData *zonesSampleUUID;
  HDCodableSyncIdentity *syncIdentity;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  workoutUUID = self->_workoutUUID;
  if (workoutUUID)
    objc_msgSend(v3, "setObject:forKey:", workoutUUID, CFSTR("workoutUUID"));
  zonesSampleUUID = self->_zonesSampleUUID;
  if (zonesSampleUUID)
    objc_msgSend(v4, "setObject:forKey:", zonesSampleUUID, CFSTR("zonesSampleUUID"));
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("syncIdentity"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutZonesAssociationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_workoutUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_zonesSampleUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_workoutUUID)
  {
    objc_msgSend(v4, "setWorkoutUUID:");
    v4 = v5;
  }
  if (self->_zonesSampleUUID)
  {
    objc_msgSend(v5, "setZonesSampleUUID:");
    v4 = v5;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v5, "setSyncIdentity:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_workoutUUID, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_zonesSampleUUID, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *workoutUUID;
  NSData *zonesSampleUUID;
  HDCodableSyncIdentity *syncIdentity;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((workoutUUID = self->_workoutUUID, !((unint64_t)workoutUUID | v4[2]))
     || -[NSData isEqual:](workoutUUID, "isEqual:"))
    && ((zonesSampleUUID = self->_zonesSampleUUID, !((unint64_t)zonesSampleUUID | v4[3]))
     || -[NSData isEqual:](zonesSampleUUID, "isEqual:")))
  {
    syncIdentity = self->_syncIdentity;
    if ((unint64_t)syncIdentity | v4[1])
      v8 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
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
  uint64_t v4;

  v3 = -[NSData hash](self->_workoutUUID, "hash");
  v4 = -[NSData hash](self->_zonesSampleUUID, "hash") ^ v3;
  return v4 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[HDCodableWorkoutZonesAssociation setWorkoutUUID:](self, "setWorkoutUUID:");
    v4 = v7;
  }
  if (v4[3])
  {
    -[HDCodableWorkoutZonesAssociation setZonesSampleUUID:](self, "setZonesSampleUUID:");
    v4 = v7;
  }
  syncIdentity = self->_syncIdentity;
  v6 = v4[1];
  if (syncIdentity)
  {
    if (v6)
    {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
LABEL_10:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[HDCodableWorkoutZonesAssociation setSyncIdentity:](self, "setSyncIdentity:");
    goto LABEL_10;
  }

}

- (NSData)workoutUUID
{
  return self->_workoutUUID;
}

- (void)setWorkoutUUID:(id)a3
{
  objc_storeStrong((id *)&self->_workoutUUID, a3);
}

- (NSData)zonesSampleUUID
{
  return self->_zonesSampleUUID;
}

- (void)setZonesSampleUUID:(id)a3
{
  objc_storeStrong((id *)&self->_zonesSampleUUID, a3);
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zonesSampleUUID, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
}

@end
