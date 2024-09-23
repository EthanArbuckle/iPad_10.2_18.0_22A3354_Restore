@implementation IMDRelayGroupMutationMessage

+ (id)messageFromBlastDoorMessage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __objc2_class *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  v3 = a3;
  objc_msgSend(v3, "mutation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 1)
  {
    v7 = IMDRelayGroupParticipantsUpdateMessage;
    goto LABEL_5;
  }
  if (!v5)
  {
    v7 = IMDRelayGroupDisplayNameMutationMessage;
LABEL_5:
    v8 = (void *)objc_msgSend([v7 alloc], "_initWithBlastDoorMessage:", v3);
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Dropping unknown relay group mutation", v11, 2u);
    }

  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)_initWithBlastDoorMessage:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  void *v17;

  v3 = a3;
  HIDWORD(v15) = objc_msgSend(v3, "fromMe");
  objc_msgSend(v3, "mutation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v17, "type");
  objc_msgSend(v3, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "id");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalGroupID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "id");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "guid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destinationCallerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = BYTE4(v15);
  v13 = -[IMDRelayGroupMutationMessage _initWithType:sender:service:groupID:originalGroupID:guid:destinationCallerID:fromMe:](self, "_initWithType:sender:service:groupID:originalGroupID:guid:destinationCallerID:fromMe:", v4, v5, v6, v8, v10, v11, v12, v15);

  return v13;
}

+ (id)mutationMessageFromData:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  +[IMBlastdoor sendRelayGroupMutationData:error:](IMBlastdoor, "sendRelayGroupMutationData:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "messageFromBlastDoorMessage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_initWithType:(unint64_t)a3 sender:(id)a4 service:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 guid:(id)a8 destinationCallerID:(id)a9 fromMe:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  IMDRelayGroupMutationMessage *v22;
  IMDRelayGroupMutationMessage *v23;
  objc_super v25;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v25.receiver = self;
  v25.super_class = (Class)IMDRelayGroupMutationMessage;
  v22 = -[IMDRelayGroupMutationMessage init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    -[IMDRelayGroupMutationMessage setType:](v22, "setType:", a3);
    -[IMDRelayGroupMutationMessage setSender:](v23, "setSender:", v16);
    -[IMDRelayGroupMutationMessage setService:](v23, "setService:", v17);
    -[IMDRelayGroupMutationMessage setGroupID:](v23, "setGroupID:", v18);
    -[IMDRelayGroupMutationMessage setOriginalGroupID:](v23, "setOriginalGroupID:", v19);
    -[IMDRelayGroupMutationMessage setGuid:](v23, "setGuid:", v20);
    -[IMDRelayGroupMutationMessage setDestinationCallerID:](v23, "setDestinationCallerID:", v21);
    -[IMDRelayGroupMutationMessage setFromMe:](v23, "setFromMe:", a10);
  }

  return v23;
}

- (BOOL)failed
{
  return (-[IMDRelayGroupMutationMessage type](self, "type") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)createDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMDRelayGroupMutationMessage type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("t"));

  -[IMDRelayGroupMutationMessage sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IMDRelayGroupMutationMessage sender](self, "sender");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("s"));

  }
  -[IMDRelayGroupMutationMessage service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("S"));

  -[IMDRelayGroupMutationMessage groupID](self, "groupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("g"));

  -[IMDRelayGroupMutationMessage originalGroupID](self, "originalGroupID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("o"));

  -[IMDRelayGroupMutationMessage guid](self, "guid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("G"));

  -[IMDRelayGroupMutationMessage destinationCallerID](self, "destinationCallerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[IMDRelayGroupMutationMessage destinationCallerID](self, "destinationCallerID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("d"));

  }
  if (-[IMDRelayGroupMutationMessage fromMe](self, "fromMe"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMDRelayGroupMutationMessage fromMe](self, "fromMe"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("m"));

  }
  v15 = (void *)objc_msgSend(v3, "copy");

  return v15;
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)originalGroupID
{
  return self->_originalGroupID;
}

- (void)setOriginalGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSUUID)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)destinationCallerID
{
  return self->_destinationCallerID;
}

- (void)setDestinationCallerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)fromMe
{
  return self->_fromMe;
}

- (void)setFromMe:(BOOL)a3
{
  self->_fromMe = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationCallerID, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_originalGroupID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
