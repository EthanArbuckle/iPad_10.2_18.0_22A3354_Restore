@implementation MPRemoteCommandEvent

- (MPRemoteCommandEvent)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@s cannot be initialized externally."), v6);

  return 0;
}

- (MPRemoteCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  id v8;
  id v9;
  MPRemoteCommandEvent *v10;
  MPRemoteCommandEvent *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  NSDictionary *mediaRemoteOptions;
  void *v20;
  uint64_t v21;
  NSString *contextID;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  void *commandID;
  void *v28;
  void *v29;
  uint64_t v30;
  NSString *v31;
  objc_super v33;

  v8 = a3;
  v9 = a5;
  v33.receiver = self;
  v33.super_class = (Class)MPRemoteCommandEvent;
  v10 = -[MPRemoteCommandEvent init](&v33, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_command, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v11->_timestamp = v12;
    objc_msgSend(v8, "timeout");
    v11->_timeout = v13;
    v14 = *MEMORY[0x1E0D4CBC0];
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CBC0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v11->_timeout = v17;

    }
    v18 = objc_msgSend(v9, "copy");
    mediaRemoteOptions = v11->_mediaRemoteOptions;
    v11->_mediaRemoteOptions = (NSDictionary *)v18;

    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D4CBD0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    contextID = v11->_contextID;
    v11->_contextID = (NSString *)v21;

    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D4CBB0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    v25 = v24;
    if (v24)
    {
      v26 = v24;
      commandID = v11->_commandID;
      v11->_commandID = v26;
    }
    else
    {
      v28 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      commandID = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(commandID, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("<missing: %@>"), v29);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v11->_commandID;
      v11->_commandID = (NSString *)v30;

    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPRemoteCommandEvent command](self, "command");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRemoteCommandEvent commandID](self, "commandID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRemoteCommandEvent sourceID](self, "sourceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p command=%@ commandID=%@ sourceID=%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)mediaRemoteCommandType
{
  void *v2;
  unsigned int v3;

  -[MPRemoteCommandEvent command](self, "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaRemoteCommandType");

  return v3;
}

- (NSDictionary)mediaRemoteOptions
{
  return self->_mediaRemoteOptions;
}

- (NSString)contextID
{
  return self->_contextID;
}

- (NSString)commandID
{
  return self->_commandID;
}

- (NSString)interfaceID
{
  void *v2;
  void *v3;

  -[MPRemoteCommandEvent mediaRemoteOptions](self, "mediaRemoteOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CCC0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sourceID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MPRemoteCommandEvent mediaRemoteOptions](self, "mediaRemoteOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionSenderID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPRemoteCommandEvent mediaRemoteOptions](self, "mediaRemoteOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CCC0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)associatedParticipantIdentifier
{
  void *v2;
  void *v3;

  -[MPRemoteCommandEvent mediaRemoteOptions](self, "mediaRemoteOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CBA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)contentItemID
{
  void *v2;
  void *v3;

  -[MPRemoteCommandEvent mediaRemoteOptions](self, "mediaRemoteOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CBC8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)playbackQueueOffset
{
  void *v2;
  void *v3;
  int64_t v4;

  -[MPRemoteCommandEvent mediaRemoteOptions](self, "mediaRemoteOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (MPRemoteCommand)command
{
  return self->_command;
}

- (NSTimeInterval)timestamp
{
  return self->_timestamp;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_commandID, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_mediaRemoteOptions, 0);
}

+ (MPRemoteCommandEvent)eventWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_opt_class();
  switch((int)v5)
  {
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 121:
    case 122:
    case 124:
    case 125:
    case 127:
    case 128:
    case 130:
    case 131:
    case 132:
    case 133:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 142:
LABEL_3:
      v9 = (void *)objc_opt_class();
      break;
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 123:
    case 126:
    case 129:
    case 134:
    case 141:
      break;
    default:
      switch((int)v5)
      {
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
          goto LABEL_3;
        default:
          goto LABEL_4;
      }
  }
LABEL_4:
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_retainAutorelease(v9)), "initWithCommand:mediaRemoteType:options:", v8, v5, v7);

  return (MPRemoteCommandEvent *)v10;
}

@end
