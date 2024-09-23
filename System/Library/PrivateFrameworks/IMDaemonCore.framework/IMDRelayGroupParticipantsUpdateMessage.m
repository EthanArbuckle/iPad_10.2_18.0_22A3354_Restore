@implementation IMDRelayGroupParticipantsUpdateMessage

- (id)_initWithBlastDoorMessage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IMDRelayGroupParticipantsUpdateMessage;
  v5 = -[IMDRelayGroupMutationMessage _initWithBlastDoorMessage:](&v21, sel__initWithBlastDoorMessage_, v4);
  if (v5)
  {
    objc_msgSend(v4, "mutation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "participant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setParticipantChangeType:", objc_msgSend(v7, "type"));

    v8 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "mutation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "participant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "changedParticipants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v11, "count"));

    objc_msgSend(v4, "mutation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "participant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "changedParticipants");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1D14D390C;
    v19[3] = &unk_1E922B9C8;
    v20 = v12;
    v16 = v12;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v19);

    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v5, "setChangedParticipants:", v17);

  }
  return v5;
}

- (IMDRelayGroupParticipantsUpdateMessage)initWithChangeType:(unint64_t)a3 changedParticipants:(id)a4 sender:(id)a5 service:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 guid:(id)a9 destinationCallerID:(id)a10 failed:(BOOL)a11 fromMe:(BOOL)a12
{
  id v17;
  uint64_t v18;
  IMDRelayGroupParticipantsUpdateMessage *v19;
  IMDRelayGroupParticipantsUpdateMessage *v20;
  objc_super v23;

  v17 = a4;
  if (a11)
    v18 = 3;
  else
    v18 = 1;
  v23.receiver = self;
  v23.super_class = (Class)IMDRelayGroupParticipantsUpdateMessage;
  v19 = -[IMDRelayGroupMutationMessage _initWithType:sender:service:groupID:originalGroupID:guid:destinationCallerID:fromMe:](&v23, sel__initWithType_sender_service_groupID_originalGroupID_guid_destinationCallerID_fromMe_, v18, a5, a6, a7, a8, a9, a10, a12);
  v20 = v19;
  if (v19)
  {
    -[IMDRelayGroupParticipantsUpdateMessage setParticipantChangeType:](v19, "setParticipantChangeType:", a3);
    -[IMDRelayGroupParticipantsUpdateMessage setChangedParticipants:](v20, "setChangedParticipants:", v17);
  }

  return v20;
}

- (id)createDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMDRelayGroupParticipantsUpdateMessage;
  -[IMDRelayGroupMutationMessage createDictionary](&v9, sel_createDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMDRelayGroupParticipantsUpdateMessage participantChangeType](self, "participantChangeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("T"));

  -[IMDRelayGroupParticipantsUpdateMessage changedParticipants](self, "changedParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("p"));

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (unint64_t)participantChangeType
{
  return self->_participantChangeType;
}

- (void)setParticipantChangeType:(unint64_t)a3
{
  self->_participantChangeType = a3;
}

- (NSDictionary)changedParticipants
{
  return self->_changedParticipants;
}

- (void)setChangedParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedParticipants, 0);
}

@end
