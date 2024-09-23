@implementation GKVoiceChatDictionary

+ (id)inviteDictionaryToParticipantID:(id)a3 fromParticipantID:(id)a4 connectionData:(id)a5 callID:(unsigned int)a6 focus:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  GKVoiceChatDictionary *v12;
  NSMutableDictionary *v13;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v12 = objc_alloc_init(GKVoiceChatDictionary);
  v12->type = 256;
  v13 = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 9);
  v12->actualDictionary = v13;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", CFSTR("Invite"), CFSTR("action"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8), CFSTR("callID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", a5, CFSTR("connectionData"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", a3, CFSTR("participantID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", a4, CFSTR("fromParticipantID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7), CFSTR("isFocus"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", CFSTR("2.0"), CFSTR("version"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", random())), CFSTR("nonce"));
  v12->orignalCallID = -1;
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKVoiceChatDictionary;
  -[GKVoiceChatDictionary dealloc](&v3, sel_dealloc);
}

- (void)setCallID:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (self->orignalCallID == -1)
    self->orignalCallID = -[GKVoiceChatDictionary callID](self, "callID");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->actualDictionary, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3), CFSTR("callID"));
}

- (unsigned)originalCallID
{
  if (self->orignalCallID == -1)
    return -[GKVoiceChatDictionary callID](self, "callID");
  else
    return self->orignalCallID;
}

+ (id)dictionaryFromData:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("GKVoiceChatDictionary"), CFSTR("NSMutableDictionary"), CFSTR("NSDictionary"), CFSTR("NSObject"), CFSTR("NSString"), CFSTR("NSData"), CFSTR("NSNumber"), CFSTR("NSValue"), 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1890]), "initForReadingWithData:", a3);
  objc_msgSend(v6, "_setAllowedClasses:", v5);
  v7 = (id)objc_msgSend(v6, "decodeObject");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a1, "validateDictionary:", v7))
    return v7;

  return 0;
}

+ (BOOL)validateDictionary:(id)a3
{
  BOOL result;

  switch(*((_QWORD *)a3 + 2))
  {
    case 0x100:
      result = objc_msgSend(a1, "validateInvite:");
      break;
    case 0x101:
      result = objc_msgSend(a1, "validateReply:");
      break;
    case 0x102:
      result = objc_msgSend(a1, "validateCancel:");
      break;
    case 0x103:
      result = objc_msgSend(a1, "validateFocus:");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (BOOL)validateInvite:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "type") == 256)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(&unk_24D470270, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(&unk_24D470270);
        v8 = objc_msgSend(*((id *)a3 + 1), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        if (!v8)
          break;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(&unk_24D470270, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          LOBYTE(v8) = 1;
          if (v5)
            goto LABEL_4;
          return v8;
        }
      }
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

+ (BOOL)validateReply:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "type") == 257)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(&unk_24D470288, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(&unk_24D470288);
        v8 = objc_msgSend(*((id *)a3 + 1), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        if (!v8)
          break;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(&unk_24D470288, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          LOBYTE(v8) = 1;
          if (v5)
            goto LABEL_4;
          return v8;
        }
      }
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

+ (BOOL)validateCancel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "type") == 258)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(&unk_24D4702A0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(&unk_24D4702A0);
        v8 = objc_msgSend(*((id *)a3 + 1), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        if (!v8)
          break;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(&unk_24D4702A0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          LOBYTE(v8) = 1;
          if (v5)
            goto LABEL_4;
          return v8;
        }
      }
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

+ (BOOL)validateFocus:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "type") == 259)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(&unk_24D4702B8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(&unk_24D4702B8);
        v8 = objc_msgSend(*((id *)a3 + 1), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        if (!v8)
          break;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(&unk_24D4702B8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          LOBYTE(v8) = 1;
          if (v5)
            goto LABEL_4;
          return v8;
        }
      }
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)replyDictionary:(unint64_t)a3 connectionData:(id)a4 callID:(unsigned int)a5 focus:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  GKVoiceChatDictionary *v11;
  NSMutableDictionary *v12;

  if (self->type != 256)
    return 0;
  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v11 = objc_alloc_init(GKVoiceChatDictionary);
  v12 = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 9);
  v11->actualDictionary = v12;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", CFSTR("Reply"), CFSTR("action"));
  v11->type = 257;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7), CFSTR("callID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", a4, CFSTR("connectionData"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", -[GKVoiceChatDictionary fromParticipantID](self, "fromParticipantID"), CFSTR("participantID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", -[GKVoiceChatDictionary participantID](self, "participantID"), CFSTR("fromParticipantID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6), CFSTR("isFocus"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", CFSTR("2.0"), CFSTR("version"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[GKVoiceChatDictionary nonce](self, "nonce")), CFSTR("nonce"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3), CFSTR("replyCode"));
  if (-[GKVoiceChatDictionary remoteVCPartyID](self, "remoteVCPartyID"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", -[GKVoiceChatDictionary remoteVCPartyID](self, "remoteVCPartyID"), CFSTR("localVCPartyID"));
  if (-[GKVoiceChatDictionary localVCPartyID](self, "localVCPartyID"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", -[GKVoiceChatDictionary localVCPartyID](self, "localVCPartyID"), CFSTR("remoteVCPartyID"));
  v11->orignalCallID = -1;
  return v11;
}

- (id)cancelDictionary
{
  GKVoiceChatDictionary *v3;
  NSMutableDictionary *v4;

  v3 = objc_alloc_init(GKVoiceChatDictionary);
  v4 = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->actualDictionary);
  v3->actualDictionary = v4;
  v3->type = 258;
  -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", CFSTR("connectionData"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", CFSTR("Cancel"), CFSTR("action"));
  v3->orignalCallID = -1;
  return v3;
}

- (id)focusDictionary:(BOOL)a3
{
  _BOOL8 v3;
  GKVoiceChatDictionary *v5;
  NSMutableDictionary *v6;

  v3 = a3;
  v5 = objc_alloc_init(GKVoiceChatDictionary);
  v6 = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->actualDictionary);
  v5->actualDictionary = v6;
  v5->type = 259;
  -[NSMutableDictionary removeObjectForKey:](v6, "removeObjectForKey:", CFSTR("connectionData"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", CFSTR("Focus"), CFSTR("action"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3), CFSTR("isFocus"));
  v5->orignalCallID = -1;
  return v5;
}

- (BOOL)isInviteDictionary
{
  return self->type == 256;
}

- (BOOL)isCancelDictionary
{
  return self->type == 258;
}

- (BOOL)isReplyDictionary
{
  return self->type == 257;
}

- (BOOL)isFocusDictionary
{
  return self->type == 259;
}

- (BOOL)matchesResponse:(id)a3
{
  if (self->type == 256
    && -[GKVoiceChatDictionary matchesNonce:](self, "matchesNonce:", objc_msgSend(a3, "nonce"))
    && objc_msgSend(a3, "type") == 257)
  {
    return objc_msgSend(-[GKVoiceChatDictionary participantID](self, "participantID"), "isEqualToString:", objc_msgSend(a3, "fromParticipantID"));
  }
  else
  {
    return 0;
  }
}

- (unint64_t)type
{
  return self->type;
}

- (unint64_t)response
{
  if (self->type == 257)
    return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->actualDictionary, "objectForKeyedSubscript:", CFSTR("replyCode")), "integerValue");
  else
    return 0;
}

- (id)connectionData
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->actualDictionary, "objectForKeyedSubscript:", CFSTR("connectionData"));
}

- (id)fromParticipantID
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->actualDictionary, "objectForKeyedSubscript:", CFSTR("fromParticipantID"));
}

- (void)setFromParticipantID:(id)a3
{
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->actualDictionary, "setObject:forKeyedSubscript:", a3, CFSTR("fromParticipantID"));
}

- (id)participantID
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->actualDictionary, "objectForKeyedSubscript:", CFSTR("participantID"));
}

- (int64_t)nonce
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->actualDictionary, "objectForKeyedSubscript:", CFSTR("nonce")), "integerValue");
}

- (void)setNonce:(int64_t)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->actualDictionary, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3), CFSTR("nonce"));
}

- (BOOL)matchesNonce:(int64_t)a3
{
  return -[GKVoiceChatDictionary nonce](self, "nonce") == a3;
}

- (BOOL)isFocus
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->actualDictionary, "objectForKeyedSubscript:", CFSTR("isFocus")), "BOOLValue");
}

- (void)setFocus:(BOOL)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->actualDictionary, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("isFocus"));
}

- (id)version
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->actualDictionary, "objectForKeyedSubscript:", CFSTR("version"));
}

- (id)createBlob
{
  return (id)objc_msgSend(MEMORY[0x24BDD1440], "archivedDataWithRootObject:", self);
}

- (unsigned)callID
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->actualDictionary, "objectForKeyedSubscript:", CFSTR("callID")), "integerValue");
}

- (id)localVCPartyID
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->actualDictionary, "objectForKeyedSubscript:", CFSTR("localVCPartyID"));
}

- (id)remoteVCPartyID
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->actualDictionary, "objectForKeyedSubscript:", CFSTR("remoteVCPartyID"));
}

- (id)setLocalVCPartyID:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->actualDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("localVCPartyID"));

  return 0;
}

- (id)setRemoteVCPartyID:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->actualDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("remoteVCPartyID"));

  return 0;
}

- (GKVoiceChatDictionary)initWithCoder:(id)a3
{
  unsigned int v6;

  self->actualDictionary = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObject");
  self->orignalCallID = -1;
  v6 = 0;
  objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "I", &v6, 4);
  self->type = v6;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:", self->actualDictionary);
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "I", &self->type);
}

- (id)description
{
  return (id)-[NSMutableDictionary description](self->actualDictionary, "description");
}

+ (void)dictionaryFromData:(uint64_t)a3 .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = "+[GKVoiceChatDictionary dictionaryFromData:]";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 78;
  *((_WORD *)buf + 14) = 2080;
  *(_QWORD *)(buf + 30) = a1;
  _os_log_error_impl(&dword_215C5C000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d GKVoiceChatDictionary corrupted %s", buf, 0x26u);
}

@end
