@implementation _MRSendCommandResultProtobuf

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (int)sendError
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_sendError;
  else
    return 0;
}

- (void)setSendError:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sendError = a3;
}

- (void)setHasSendError:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSendError
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)sendErrorAsString:(int)a3
{
  if (a3 < 0xB)
    return off_1E30C8708[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSendError:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ApplicationNotFound")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConnectionFailed")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Ignored")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CouldNotLaunchApplication")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TimedOut")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OriginDoesNotExist")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InvalidOptions")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoCommandHandlers")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ApplicationNotInstalled")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NotSupported")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearStatuses
{
  -[NSMutableArray removeAllObjects](self->_statuses, "removeAllObjects");
}

- (void)addStatuses:(id)a3
{
  id v4;
  NSMutableArray *statuses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  statuses = self->_statuses;
  v8 = v4;
  if (!statuses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_statuses;
    self->_statuses = v6;

    v4 = v8;
    statuses = self->_statuses;
  }
  -[NSMutableArray addObject:](statuses, "addObject:", v4);

}

- (unint64_t)statusesCount
{
  return -[NSMutableArray count](self->_statuses, "count");
}

- (id)statusesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_statuses, "objectAtIndex:", a3);
}

+ (Class)statusesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSendErrorDescription
{
  return self->_sendErrorDescription != 0;
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
  v8.super_class = (Class)_MRSendCommandResultProtobuf;
  -[_MRSendCommandResultProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  void *v5;
  uint64_t sendError;
  __CFString *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSString *sendErrorDescription;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  playerPath = self->_playerPath;
  if (playerPath)
  {
    -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](playerPath, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("playerPath"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    sendError = self->_sendError;
    if (sendError >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sendError);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E30C8708[sendError];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("sendError"));

  }
  if (-[NSMutableArray count](self->_statuses, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_statuses, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = self->_statuses;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("statuses"));
  }
  sendErrorDescription = self->_sendErrorDescription;
  if (sendErrorDescription)
    objc_msgSend(v3, "setObject:forKey:", sendErrorDescription, CFSTR("sendErrorDescription"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendCommandResultProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_playerPath)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_statuses;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_sendErrorDescription)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_playerPath)
  {
    objc_msgSend(v4, "setPlayerPath:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_sendError;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (-[_MRSendCommandResultProtobuf statusesCount](self, "statusesCount"))
  {
    objc_msgSend(v9, "clearStatuses");
    v5 = -[_MRSendCommandResultProtobuf statusesCount](self, "statusesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[_MRSendCommandResultProtobuf statusesAtIndex:](self, "statusesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addStatuses:", v8);

      }
    }
  }
  if (self->_sendErrorDescription)
    objc_msgSend(v9, "setSendErrorDescription:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRNowPlayingPlayerPathProtobuf copyWithZone:](self->_playerPath, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_sendError;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_statuses;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addStatuses:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_sendErrorDescription, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  NSMutableArray *statuses;
  NSString *sendErrorDescription;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((_QWORD *)v4 + 1))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_sendError != *((_DWORD *)v4 + 4))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  statuses = self->_statuses;
  if ((unint64_t)statuses | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](statuses, "isEqual:"))
  {
    goto LABEL_13;
  }
  sendErrorDescription = self->_sendErrorDescription;
  if ((unint64_t)sendErrorDescription | *((_QWORD *)v4 + 3))
    v8 = -[NSString isEqual:](sendErrorDescription, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[_MRNowPlayingPlayerPathProtobuf hash](self->_playerPath, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_sendError;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSMutableArray hash](self->_statuses, "hash");
  return v5 ^ v6 ^ -[NSString hash](self->_sendErrorDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  playerPath = self->_playerPath;
  v6 = *((_QWORD *)v4 + 1);
  if (playerPath)
  {
    if (v6)
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
  }
  else if (v6)
  {
    -[_MRSendCommandResultProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_sendError = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[_MRSendCommandResultProtobuf addStatuses:](self, "addStatuses:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 3))
    -[_MRSendCommandResultProtobuf setSendErrorDescription:](self, "setSendErrorDescription:");

}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_playerPath, a3);
}

- (NSMutableArray)statuses
{
  return self->_statuses;
}

- (void)setStatuses:(id)a3
{
  objc_storeStrong((id *)&self->_statuses, a3);
}

- (NSString)sendErrorDescription
{
  return self->_sendErrorDescription;
}

- (void)setSendErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_sendErrorDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statuses, 0);
  objc_storeStrong((id *)&self->_sendErrorDescription, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
}

@end
