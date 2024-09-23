@implementation _MRSendCommandResultMessageProtobuf

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)_MRSendCommandResultMessageProtobuf;
  -[_MRSendCommandResultMessageProtobuf dealloc](&v3, sel_dealloc);
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
    return off_1E30CF8D0[a3];
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

- (unint64_t)handlerReturnStatusCount
{
  return self->_handlerReturnStatus.count;
}

- (int)handlerReturnStatus
{
  return self->_handlerReturnStatus.list;
}

- (void)clearHandlerReturnStatus
{
  PBRepeatedInt32Clear();
}

- (void)addHandlerReturnStatus:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)handlerReturnStatusAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_handlerReturnStatus;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_handlerReturnStatus = &self->_handlerReturnStatus;
  count = self->_handlerReturnStatus.count;
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
  return p_handlerReturnStatus->list[a3];
}

- (void)setHandlerReturnStatus:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)handlerReturnStatusAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 400)
  {
    if (a3 > 500)
    {
      if (a3 == 501)
        return CFSTR("MediaServicesUnavailable");
      if (a3 == 555)
        return CFSTR("Timeout");
    }
    else
    {
      if (a3 == 401)
        return CFSTR("AuthenticationFailure");
      if (a3 == 404)
      {
        v3 = CFSTR("UnsupportedCommand");
        return v3;
      }
    }
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  switch(a3)
  {
    case 'd':
      result = CFSTR("SkipAdProhibited");
      break;
    case 'e':
      result = CFSTR("QueueIsUserCurated");
      break;
    case 'f':
      result = CFSTR("UserModifiedQueueDisable");
      break;
    case 'g':
      result = CFSTR("UserQueueModificationNotSupportedForCurrentItem");
      break;
    case 'h':
      result = CFSTR("SubscriptionRequiredForSharedQueue");
      break;
    case 'i':
      result = CFSTR("InsertionPositionNotSpecified");
      break;
    case 'j':
      result = CFSTR("InvalidInsertionPosition");
      break;
    case 'k':
      result = CFSTR("RequestParametersOutOfBounds");
      break;
    case 'l':
      result = CFSTR("SkipLimitReached");
      break;
    case 'm':
      result = CFSTR("CannotModifyQueueWithPlaybackTokenItems");
      break;
    default:
      v3 = CFSTR("Success");
      switch(a3)
      {
        case 0:
          return v3;
        case 1:
          result = CFSTR("NoSuchContent");
          break;
        case 2:
          result = CFSTR("CommandFailed");
          break;
        case 3:
          result = CFSTR("UIKitLegacy");
          break;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          goto LABEL_19;
        case 10:
          result = CFSTR("NoActionableNowPlayingItem");
          break;
        default:
          if (a3 != 20)
            goto LABEL_19;
          result = CFSTR("DeviceNotFound");
          break;
      }
      break;
  }
  return result;
}

- (int)StringAsHandlerReturnStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Success")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoSuchContent")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CommandFailed")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoActionableNowPlayingItem")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DeviceNotFound")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UIKitLegacy")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SkipAdProhibited")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QueueIsUserCurated")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserModifiedQueueDisable")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserQueueModificationNotSupportedForCurrentItem")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SubscriptionRequiredForSharedQueue")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InsertionPositionNotSpecified")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InvalidInsertionPosition")) & 1) != 0)
  {
    v4 = 106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RequestParametersOutOfBounds")) & 1) != 0)
  {
    v4 = 107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SkipLimitReached")) & 1) != 0)
  {
    v4 = 108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CannotModifyQueueWithPlaybackTokenItems")) & 1) != 0)
  {
    v4 = 109;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AuthenticationFailure")) & 1) != 0)
  {
    v4 = 401;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MediaServicesUnavailable")) & 1) != 0)
  {
    v4 = 501;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Timeout")) & 1) != 0)
  {
    v4 = 555;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UnsupportedCommand")))
  {
    v4 = 404;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearHandlerReturnStatusDatas
{
  -[NSMutableArray removeAllObjects](self->_handlerReturnStatusDatas, "removeAllObjects");
}

- (void)addHandlerReturnStatusData:(id)a3
{
  id v4;
  NSMutableArray *handlerReturnStatusDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  handlerReturnStatusDatas = self->_handlerReturnStatusDatas;
  v8 = v4;
  if (!handlerReturnStatusDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_handlerReturnStatusDatas;
    self->_handlerReturnStatusDatas = v6;

    v4 = v8;
    handlerReturnStatusDatas = self->_handlerReturnStatusDatas;
  }
  -[NSMutableArray addObject:](handlerReturnStatusDatas, "addObject:", v4);

}

- (unint64_t)handlerReturnStatusDatasCount
{
  return -[NSMutableArray count](self->_handlerReturnStatusDatas, "count");
}

- (id)handlerReturnStatusDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_handlerReturnStatusDatas, "objectAtIndex:", a3);
}

+ (Class)handlerReturnStatusDataType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCommandID
{
  return self->_commandID != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (BOOL)hasCommandResult
{
  return self->_commandResult != 0;
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
  v8.super_class = (Class)_MRSendCommandResultMessageProtobuf;
  -[_MRSendCommandResultMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t sendError;
  __CFString *v5;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_handlerReturnStatus;
  void *v7;
  unint64_t i;
  int v9;
  __CFString *v10;
  NSMutableArray *handlerReturnStatusDatas;
  NSString *commandID;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  void *v14;
  _MRSendCommandResultProtobuf *commandResult;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    sendError = self->_sendError;
    if (sendError >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sendError);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E30CF8D0[sendError];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sendError"));

  }
  p_handlerReturnStatus = &self->_handlerReturnStatus;
  if (self->_handlerReturnStatus.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_handlerReturnStatus.count)
    {
      for (i = 0; i < self->_handlerReturnStatus.count; ++i)
      {
        v9 = p_handlerReturnStatus->list[i];
        if (v9 <= 400)
        {
          switch(v9)
          {
            case 'd':
              v10 = CFSTR("SkipAdProhibited");
              break;
            case 'e':
              v10 = CFSTR("QueueIsUserCurated");
              break;
            case 'f':
              v10 = CFSTR("UserModifiedQueueDisable");
              break;
            case 'g':
              v10 = CFSTR("UserQueueModificationNotSupportedForCurrentItem");
              break;
            case 'h':
              v10 = CFSTR("SubscriptionRequiredForSharedQueue");
              break;
            case 'i':
              v10 = CFSTR("InsertionPositionNotSpecified");
              break;
            case 'j':
              v10 = CFSTR("InvalidInsertionPosition");
              break;
            case 'k':
              v10 = CFSTR("RequestParametersOutOfBounds");
              break;
            case 'l':
              v10 = CFSTR("SkipLimitReached");
              break;
            case 'm':
              v10 = CFSTR("CannotModifyQueueWithPlaybackTokenItems");
              break;
            default:
              v10 = CFSTR("Success");
              switch(v9)
              {
                case 0:
                  goto LABEL_26;
                case 1:
                  v10 = CFSTR("NoSuchContent");
                  break;
                case 2:
                  v10 = CFSTR("CommandFailed");
                  break;
                case 3:
                  v10 = CFSTR("UIKitLegacy");
                  break;
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                  goto LABEL_25;
                case 10:
                  v10 = CFSTR("NoActionableNowPlayingItem");
                  break;
                default:
                  if (v9 != 20)
                    goto LABEL_25;
                  v10 = CFSTR("DeviceNotFound");
                  break;
              }
              break;
          }
          goto LABEL_26;
        }
        if (v9 > 500)
        {
          if (v9 == 501)
          {
            v10 = CFSTR("MediaServicesUnavailable");
          }
          else
          {
            if (v9 != 555)
            {
LABEL_25:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), p_handlerReturnStatus->list[i]);
              v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
              goto LABEL_26;
            }
            v10 = CFSTR("Timeout");
          }
        }
        else if (v9 == 401)
        {
          v10 = CFSTR("AuthenticationFailure");
        }
        else
        {
          if (v9 != 404)
            goto LABEL_25;
          v10 = CFSTR("UnsupportedCommand");
        }
LABEL_26:
        objc_msgSend(v7, "addObject:", v10);

      }
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("handlerReturnStatus"));

  }
  handlerReturnStatusDatas = self->_handlerReturnStatusDatas;
  if (handlerReturnStatusDatas)
    objc_msgSend(v3, "setObject:forKey:", handlerReturnStatusDatas, CFSTR("handlerReturnStatusData"));
  commandID = self->_commandID;
  if (commandID)
    objc_msgSend(v3, "setObject:forKey:", commandID, CFSTR("commandID"));
  playerPath = self->_playerPath;
  if (playerPath)
  {
    -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](playerPath, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("playerPath"));

  }
  commandResult = self->_commandResult;
  if (commandResult)
  {
    -[_MRSendCommandResultProtobuf dictionaryRepresentation](commandResult, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("commandResult"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendCommandResultMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_handlerReturnStatus.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_handlerReturnStatus.count);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_handlerReturnStatusDatas;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteDataField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_commandID)
    PBDataWriterWriteStringField();
  if (self->_playerPath)
    PBDataWriterWriteSubmessage();
  if (self->_commandResult)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_sendError;
    *((_BYTE *)v4 + 68) |= 1u;
  }
  v13 = v4;
  if (-[_MRSendCommandResultMessageProtobuf handlerReturnStatusCount](self, "handlerReturnStatusCount"))
  {
    objc_msgSend(v13, "clearHandlerReturnStatus");
    v5 = -[_MRSendCommandResultMessageProtobuf handlerReturnStatusCount](self, "handlerReturnStatusCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v13, "addHandlerReturnStatus:", -[_MRSendCommandResultMessageProtobuf handlerReturnStatusAtIndex:](self, "handlerReturnStatusAtIndex:", i));
    }
  }
  if (-[_MRSendCommandResultMessageProtobuf handlerReturnStatusDatasCount](self, "handlerReturnStatusDatasCount"))
  {
    objc_msgSend(v13, "clearHandlerReturnStatusDatas");
    v8 = -[_MRSendCommandResultMessageProtobuf handlerReturnStatusDatasCount](self, "handlerReturnStatusDatasCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[_MRSendCommandResultMessageProtobuf handlerReturnStatusDataAtIndex:](self, "handlerReturnStatusDataAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addHandlerReturnStatusData:", v11);

      }
    }
  }
  if (self->_commandID)
    objc_msgSend(v13, "setCommandID:");
  v12 = v13;
  if (self->_playerPath)
  {
    objc_msgSend(v13, "setPlayerPath:");
    v12 = v13;
  }
  if (self->_commandResult)
  {
    objc_msgSend(v13, "setCommandResult:");
    v12 = v13;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_sendError;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  PBRepeatedInt32Copy();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = self->_handlerReturnStatusDatas;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v6, "addHandlerReturnStatusData:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v13 = -[NSString copyWithZone:](self->_commandID, "copyWithZone:", a3);
  v14 = (void *)v6[4];
  v6[4] = v13;

  v15 = -[_MRNowPlayingPlayerPathProtobuf copyWithZone:](self->_playerPath, "copyWithZone:", a3);
  v16 = (void *)v6[7];
  v6[7] = v15;

  v17 = -[_MRSendCommandResultProtobuf copyWithZone:](self->_commandResult, "copyWithZone:", a3);
  v18 = (void *)v6[5];
  v6[5] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *handlerReturnStatusDatas;
  NSString *commandID;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  _MRSendCommandResultProtobuf *commandResult;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_sendError != *((_DWORD *)v4 + 16))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_16;
  handlerReturnStatusDatas = self->_handlerReturnStatusDatas;
  if ((unint64_t)handlerReturnStatusDatas | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](handlerReturnStatusDatas, "isEqual:"))
      goto LABEL_16;
  }
  commandID = self->_commandID;
  if ((unint64_t)commandID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](commandID, "isEqual:"))
      goto LABEL_16;
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((_QWORD *)v4 + 7))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:"))
      goto LABEL_16;
  }
  commandResult = self->_commandResult;
  if ((unint64_t)commandResult | *((_QWORD *)v4 + 5))
    v9 = -[_MRSendCommandResultProtobuf isEqual:](commandResult, "isEqual:");
  else
    v9 = 1;
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_sendError;
  else
    v3 = 0;
  v4 = PBRepeatedInt32Hash() ^ v3;
  v5 = v4 ^ -[NSMutableArray hash](self->_handlerReturnStatusDatas, "hash");
  v6 = -[NSString hash](self->_commandID, "hash");
  v7 = v5 ^ v6 ^ -[_MRNowPlayingPlayerPathProtobuf hash](self->_playerPath, "hash");
  return v7 ^ -[_MRSendCommandResultProtobuf hash](self->_commandResult, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  id v15;
  _MRSendCommandResultProtobuf *commandResult;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    self->_sendError = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = objc_msgSend(v4, "handlerReturnStatusCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[_MRSendCommandResultMessageProtobuf addHandlerReturnStatus:](self, "addHandlerReturnStatus:", objc_msgSend(v5, "handlerReturnStatusAtIndex:", i));
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v5[6];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        -[_MRSendCommandResultMessageProtobuf addHandlerReturnStatusData:](self, "addHandlerReturnStatusData:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  if (v5[4])
    -[_MRSendCommandResultMessageProtobuf setCommandID:](self, "setCommandID:");
  playerPath = self->_playerPath;
  v15 = v5[7];
  if (playerPath)
  {
    if (v15)
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
  }
  else if (v15)
  {
    -[_MRSendCommandResultMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  commandResult = self->_commandResult;
  v17 = v5[5];
  if (commandResult)
  {
    if (v17)
      -[_MRSendCommandResultProtobuf mergeFrom:](commandResult, "mergeFrom:");
  }
  else if (v17)
  {
    -[_MRSendCommandResultMessageProtobuf setCommandResult:](self, "setCommandResult:");
  }

}

- (NSMutableArray)handlerReturnStatusDatas
{
  return self->_handlerReturnStatusDatas;
}

- (void)setHandlerReturnStatusDatas:(id)a3
{
  objc_storeStrong((id *)&self->_handlerReturnStatusDatas, a3);
}

- (NSString)commandID
{
  return self->_commandID;
}

- (void)setCommandID:(id)a3
{
  objc_storeStrong((id *)&self->_commandID, a3);
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_playerPath, a3);
}

- (_MRSendCommandResultProtobuf)commandResult
{
  return self->_commandResult;
}

- (void)setCommandResult:(id)a3
{
  objc_storeStrong((id *)&self->_commandResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_handlerReturnStatusDatas, 0);
  objc_storeStrong((id *)&self->_commandResult, 0);
  objc_storeStrong((id *)&self->_commandID, 0);
}

@end
