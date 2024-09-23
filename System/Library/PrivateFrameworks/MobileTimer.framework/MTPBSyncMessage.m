@implementation MTPBSyncMessage

- (BOOL)hasSnoozeAction
{
  return self->_snoozeAction != 0;
}

- (BOOL)hasDismissAction
{
  return self->_dismissAction != 0;
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
  v8.super_class = (Class)MTPBSyncMessage;
  -[MTPBSyncMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPBSyncMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MTPBSnoozeAction *snoozeAction;
  void *v5;
  MTPBDismissAction *dismissAction;
  void *v7;
  void *v8;
  NSString *syncID;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  snoozeAction = self->_snoozeAction;
  if (snoozeAction)
  {
    -[MTPBSnoozeAction dictionaryRepresentation](snoozeAction, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("snoozeAction"));

  }
  dismissAction = self->_dismissAction;
  if (dismissAction)
  {
    -[MTPBDismissAction dictionaryRepresentation](dismissAction, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("dismissAction"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_syncDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("syncDate"));

  syncID = self->_syncID;
  if (syncID)
    objc_msgSend(v3, "setObject:forKey:", syncID, CFSTR("syncID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_syncVersion);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("syncVersion"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTPBSyncMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_snoozeAction)
    PBDataWriterWriteSubmessage();
  if (self->_dismissAction)
    PBDataWriterWriteSubmessage();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  v5 = v4;
  if (self->_snoozeAction)
  {
    objc_msgSend(v4, "setSnoozeAction:");
    v4 = v5;
  }
  if (self->_dismissAction)
  {
    objc_msgSend(v5, "setDismissAction:");
    v4 = v5;
  }
  v4[1] = self->_syncDate;
  objc_msgSend(v4, "setSyncID:", self->_syncID);
  v5[2] = self->_syncVersion;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MTPBSnoozeAction copyWithZone:](self->_snoozeAction, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[MTPBDismissAction copyWithZone:](self->_dismissAction, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  *(double *)(v5 + 8) = self->_syncDate;
  v10 = -[NSString copyWithZone:](self->_syncID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  *(double *)(v5 + 16) = self->_syncVersion;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MTPBSnoozeAction *snoozeAction;
  MTPBDismissAction *dismissAction;
  NSString *syncID;
  BOOL v8;

  v4 = a3;
  v8 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((snoozeAction = self->_snoozeAction, !((unint64_t)snoozeAction | *((_QWORD *)v4 + 4)))
     || -[MTPBSnoozeAction isEqual:](snoozeAction, "isEqual:"))
    && ((dismissAction = self->_dismissAction, !((unint64_t)dismissAction | *((_QWORD *)v4 + 3)))
     || -[MTPBDismissAction isEqual:](dismissAction, "isEqual:"))
    && self->_syncDate == *((double *)v4 + 1)
    && ((syncID = self->_syncID, !((unint64_t)syncID | *((_QWORD *)v4 + 5)))
     || -[NSString isEqual:](syncID, "isEqual:"))
    && self->_syncVersion == *((double *)v4 + 2);

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  double syncDate;
  double v6;
  long double v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSUInteger v14;
  double syncVersion;
  double v16;
  long double v17;
  double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  v3 = -[MTPBSnoozeAction hash](self->_snoozeAction, "hash");
  v4 = -[MTPBDismissAction hash](self->_dismissAction, "hash");
  syncDate = self->_syncDate;
  v6 = -syncDate;
  if (syncDate >= 0.0)
    v6 = self->_syncDate;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = fmod(v7, 1.84467441e19);
  v10 = 2654435761u * (unint64_t)v9;
  v11 = v10 + (unint64_t)v8;
  if (v8 <= 0.0)
    v11 = 2654435761u * (unint64_t)v9;
  v12 = v10 - (unint64_t)fabs(v8);
  if (v8 < 0.0)
    v13 = v12;
  else
    v13 = v11;
  v14 = -[NSString hash](self->_syncID, "hash");
  syncVersion = self->_syncVersion;
  v16 = -syncVersion;
  if (syncVersion >= 0.0)
    v16 = self->_syncVersion;
  v17 = floor(v16 + 0.5);
  v18 = (v16 - v17) * 1.84467441e19;
  v19 = fmod(v17, 1.84467441e19);
  v20 = 2654435761u * (unint64_t)v19;
  v21 = v20 + (unint64_t)v18;
  if (v18 <= 0.0)
    v21 = 2654435761u * (unint64_t)v19;
  v22 = v20 - (unint64_t)fabs(v18);
  if (v18 >= 0.0)
    v22 = v21;
  return v4 ^ v3 ^ v22 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  MTPBSnoozeAction *snoozeAction;
  uint64_t v6;
  MTPBDismissAction *dismissAction;
  uint64_t v8;
  id v9;

  v4 = a3;
  snoozeAction = self->_snoozeAction;
  v6 = *((_QWORD *)v4 + 4);
  v9 = v4;
  if (snoozeAction)
  {
    if (!v6)
      goto LABEL_7;
    -[MTPBSnoozeAction mergeFrom:](snoozeAction, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[MTPBSyncMessage setSnoozeAction:](self, "setSnoozeAction:");
  }
  v4 = v9;
LABEL_7:
  dismissAction = self->_dismissAction;
  v8 = *((_QWORD *)v4 + 3);
  if (dismissAction)
  {
    if (!v8)
      goto LABEL_13;
    -[MTPBDismissAction mergeFrom:](dismissAction, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[MTPBSyncMessage setDismissAction:](self, "setDismissAction:");
  }
  v4 = v9;
LABEL_13:
  self->_syncDate = *((double *)v4 + 1);
  if (*((_QWORD *)v4 + 5))
  {
    -[MTPBSyncMessage setSyncID:](self, "setSyncID:");
    v4 = v9;
  }
  self->_syncVersion = *((double *)v4 + 2);

}

- (MTPBSnoozeAction)snoozeAction
{
  return self->_snoozeAction;
}

- (void)setSnoozeAction:(id)a3
{
  objc_storeStrong((id *)&self->_snoozeAction, a3);
}

- (MTPBDismissAction)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
  objc_storeStrong((id *)&self->_dismissAction, a3);
}

- (double)syncDate
{
  return self->_syncDate;
}

- (void)setSyncDate:(double)a3
{
  self->_syncDate = a3;
}

- (NSString)syncID
{
  return self->_syncID;
}

- (void)setSyncID:(id)a3
{
  objc_storeStrong((id *)&self->_syncID, a3);
}

- (double)syncVersion
{
  return self->_syncVersion;
}

- (void)setSyncVersion:(double)a3
{
  self->_syncVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncID, 0);
  objc_storeStrong((id *)&self->_snoozeAction, 0);
  objc_storeStrong((id *)&self->_dismissAction, 0);
}

@end
