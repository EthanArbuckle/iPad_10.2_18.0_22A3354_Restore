@implementation IMDRelayGroupDisplayNameMutationMessage

- (id)_initWithBlastDoorMessage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMDRelayGroupDisplayNameMutationMessage;
  v5 = -[IMDRelayGroupMutationMessage _initWithBlastDoorMessage:](&v11, sel__initWithBlastDoorMessage_, v4);
  if (v5)
  {
    objc_msgSend(v4, "mutation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updatedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUpdatedName:", v9);

  }
  return v5;
}

- (IMDRelayGroupDisplayNameMutationMessage)initWithName:(id)a3 sender:(id)a4 service:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 guid:(id)a8 destinationCallerID:(id)a9 failed:(BOOL)a10 fromMe:(BOOL)a11
{
  id v17;
  uint64_t v18;
  IMDRelayGroupDisplayNameMutationMessage *v19;
  IMDRelayGroupDisplayNameMutationMessage *v20;
  objc_super v22;

  v17 = a3;
  if (a10)
    v18 = 2;
  else
    v18 = 0;
  v22.receiver = self;
  v22.super_class = (Class)IMDRelayGroupDisplayNameMutationMessage;
  v19 = -[IMDRelayGroupMutationMessage _initWithType:sender:service:groupID:originalGroupID:guid:destinationCallerID:fromMe:](&v22, sel__initWithType_sender_service_groupID_originalGroupID_guid_destinationCallerID_fromMe_, v18, a4, a5, a6, a7, a8, a9, a11);
  v20 = v19;
  if (v19)
    -[IMDRelayGroupDisplayNameMutationMessage setUpdatedName:](v19, "setUpdatedName:", v17);

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
  v9.super_class = (Class)IMDRelayGroupDisplayNameMutationMessage;
  -[IMDRelayGroupMutationMessage createDictionary](&v9, sel_createDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[IMDRelayGroupDisplayNameMutationMessage updatedName](self, "updatedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IMDRelayGroupDisplayNameMutationMessage updatedName](self, "updatedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("n"));

  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (NSString)updatedName
{
  return self->_updatedName;
}

- (void)setUpdatedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedName, 0);
}

@end
