@implementation ATXAnchorModelPBActionKeyMetadata

- (BOOL)hasActionType
{
  return self->_actionType != 0;
}

- (BOOL)hasActionKeyLaunchHistory
{
  return self->_actionKeyLaunchHistory != 0;
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
  v8.super_class = (Class)ATXAnchorModelPBActionKeyMetadata;
  -[ATXAnchorModelPBActionKeyMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelPBActionKeyMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *actionType;
  ATXAnchorModelPBLaunchHistoryMetadata *actionKeyLaunchHistory;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  actionType = self->_actionType;
  if (actionType)
    objc_msgSend(v3, "setObject:forKey:", actionType, CFSTR("actionType"));
  actionKeyLaunchHistory = self->_actionKeyLaunchHistory;
  if (actionKeyLaunchHistory)
  {
    -[ATXAnchorModelPBLaunchHistoryMetadata dictionaryRepresentation](actionKeyLaunchHistory, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("actionKeyLaunchHistory"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBActionKeyMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_actionType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_actionKeyLaunchHistory)
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
  if (self->_actionType)
  {
    objc_msgSend(v4, "setActionType:");
    v4 = v5;
  }
  if (self->_actionKeyLaunchHistory)
  {
    objc_msgSend(v5, "setActionKeyLaunchHistory:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_actionType, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[ATXAnchorModelPBLaunchHistoryMetadata copyWithZone:](self->_actionKeyLaunchHistory, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *actionType;
  ATXAnchorModelPBLaunchHistoryMetadata *actionKeyLaunchHistory;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((actionType = self->_actionType, !((unint64_t)actionType | v4[2]))
     || -[NSString isEqual:](actionType, "isEqual:")))
  {
    actionKeyLaunchHistory = self->_actionKeyLaunchHistory;
    if ((unint64_t)actionKeyLaunchHistory | v4[1])
      v7 = -[ATXAnchorModelPBLaunchHistoryMetadata isEqual:](actionKeyLaunchHistory, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_actionType, "hash");
  return -[ATXAnchorModelPBLaunchHistoryMetadata hash](self->_actionKeyLaunchHistory, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  ATXAnchorModelPBLaunchHistoryMetadata *actionKeyLaunchHistory;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[ATXAnchorModelPBActionKeyMetadata setActionType:](self, "setActionType:");
    v4 = v7;
  }
  actionKeyLaunchHistory = self->_actionKeyLaunchHistory;
  v6 = v4[1];
  if (actionKeyLaunchHistory)
  {
    if (v6)
    {
      -[ATXAnchorModelPBLaunchHistoryMetadata mergeFrom:](actionKeyLaunchHistory, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[ATXAnchorModelPBActionKeyMetadata setActionKeyLaunchHistory:](self, "setActionKeyLaunchHistory:");
    goto LABEL_8;
  }

}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)setActionType:(id)a3
{
  objc_storeStrong((id *)&self->_actionType, a3);
}

- (ATXAnchorModelPBLaunchHistoryMetadata)actionKeyLaunchHistory
{
  return self->_actionKeyLaunchHistory;
}

- (void)setActionKeyLaunchHistory:(id)a3
{
  objc_storeStrong((id *)&self->_actionKeyLaunchHistory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_actionKeyLaunchHistory, 0);
}

@end
