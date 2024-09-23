@implementation HDCloudSyncZoneIdentifier

+ (id)identifierForZone:(id)a3 container:(id)a4 scope:(int64_t)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  v9 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:]([HDCloudSyncZoneIdentifier alloc], "initForZone:container:scope:", v8, v7, a5);

  return v9;
}

- (id)initForZone:(id)a3 container:(id)a4
{
  return -[HDCloudSyncZoneIdentifier initForZone:container:scope:](self, "initForZone:container:scope:", a3, a4, 2);
}

- (id)initForZone:(id)a3 container:(id)a4 scope:(int64_t)a5
{
  id v8;
  id v9;
  HDCloudSyncZoneIdentifier *v10;
  uint64_t v11;
  CKRecordZoneID *zoneIdentifier;
  uint64_t v13;
  NSString *containerIdentifier;
  id v15;
  char v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;
  id v21;
  char v22;
  char v24;
  id v25;
  char v26;
  id v27;
  char v28;
  id v29;
  int v30;
  id v31;
  objc_super v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v8 = a3;
  v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)HDCloudSyncZoneIdentifier;
  v10 = -[HDCloudSyncZoneIdentifier init](&v32, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    zoneIdentifier = v10->_zoneIdentifier;
    v10->_zoneIdentifier = (CKRecordZoneID *)v11;

    v13 = objc_msgSend(v9, "copy");
    containerIdentifier = v10->_containerIdentifier;
    v10->_containerIdentifier = (NSString *)v13;

    v10->_scope = a5;
    v15 = v8;
    objc_opt_self();
    v41 = 0;
    v16 = objc_msgSend(v15, "hd_isMasterZoneIDForSyncCircleIdentifier:", &v41);
    v17 = v41;
    v18 = v17;
    if ((v16 & 1) != 0)
    {
      v19 = 0;
    }
    else
    {
      v40 = v17;
      v20 = objc_msgSend(v15, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v40);
      v21 = v40;

      if ((v20 & 1) != 0)
      {
        v19 = 2;
LABEL_9:

        v10->_type = v19;
        goto LABEL_10;
      }
      v39 = v21;
      v22 = objc_msgSend(v15, "hd_isPrivateMetadataZoneIDForSyncCircleIdentifier:", &v39);
      v18 = v39;

      if ((v22 & 1) == 0)
      {
        v37 = 0;
        v38 = v18;
        v24 = objc_msgSend(v15, "hd_isStateSyncZoneIDForSyncCircleIdentifier:domain:", &v38, &v37);
        v21 = v38;

        v25 = v37;
        if ((v24 & 1) != 0)
        {
          v19 = 6;
        }
        else
        {
          v36 = v21;
          v26 = objc_msgSend(v15, "hd_isContextSyncZoneIDForSyncCircleIdentifier:", &v36);
          v27 = v36;

          if ((v26 & 1) != 0)
          {
            v19 = 7;
            v21 = v27;
          }
          else
          {
            v34 = v27;
            v35 = 0;
            v28 = objc_msgSend(v15, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v35, &v34);
            v29 = v35;
            v21 = v34;

            if ((v28 & 1) != 0)
            {
              v19 = 3;
            }
            else
            {
              v33 = v21;
              v30 = objc_msgSend(v15, "hd_isAttachmentZoneIDForSyncCircleIdentifier:", &v33);
              v31 = v33;

              if (v30)
                v19 = 5;
              else
                v19 = 1;
              v21 = v31;
            }

          }
        }

        goto LABEL_9;
      }
      v19 = 4;
    }
    v21 = v18;
    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDCloudSyncZoneIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  HDCloudSyncZoneIdentifier *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zone_id_record_zone_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zone_id_container_id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("zone_id_scope"));

  v8 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](self, "initForZone:container:scope:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  CKRecordZoneID *zoneIdentifier;
  id v5;

  zoneIdentifier = self->_zoneIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", zoneIdentifier, CFSTR("zone_id_record_zone_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerIdentifier, CFSTR("zone_id_container_id"));
  objc_msgSend(v5, "encodeInt:forKey:", LODWORD(self->_scope), CFSTR("zone_id_scope"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;

  -[CKRecordZoneID zoneName](self->_zoneIdentifier, "zoneName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_containerIdentifier, "hash") ^ self->_scope ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_scope == v4[3])
  {
    objc_msgSend(v4, "zoneIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HDCloudSyncZoneIdentifier isEquivalentToZone:container:](self, "isEquivalentToZone:container:", v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEquivalentToZone:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  -[CKRecordZoneID zoneName](self->_zoneIdentifier, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", v9))
  {
    -[CKRecordZoneID ownerName](self->_zoneIdentifier, "ownerName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ownerName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v11))
      v12 = -[NSString isEqualToString:](self->_containerIdentifier, "isEqualToString:", v7);
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEquivalentIgnoringOwnerToZone:(id)a3 container:(id)a4
{
  id v6;
  CKRecordZoneID *zoneIdentifier;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;

  v6 = a4;
  zoneIdentifier = self->_zoneIdentifier;
  v8 = a3;
  -[CKRecordZoneID zoneName](zoneIdentifier, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", v10))
    v11 = -[NSString isEqualToString:](self->_containerIdentifier, "isEqualToString:", v6);
  else
    v11 = 0;

  return v11;
}

- (BOOL)isEquivalentIgnoringOwnerToZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "zoneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[HDCloudSyncZoneIdentifier isEquivalentIgnoringOwnerToZone:container:](self, "isEquivalentIgnoringOwnerToZone:container:", v5, v6);
  return (char)self;
}

- (id)description
{
  void *v3;
  NSString *containerIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  containerIdentifier = self->_containerIdentifier;
  HDCKDatabaseScopeToString(self->_scope);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecordZoneID zoneName](self->_zoneIdentifier, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecordZoneID ownerName](self->_zoneIdentifier, "ownerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%@): %@ [%@]>"), containerIdentifier, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (CKRecordZoneID)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (int64_t)scope
{
  return self->_scope;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end
