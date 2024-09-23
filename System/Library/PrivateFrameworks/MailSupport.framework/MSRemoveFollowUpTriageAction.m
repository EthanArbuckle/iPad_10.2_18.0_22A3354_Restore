@implementation MSRemoveFollowUpTriageAction

- (MSRemoveFollowUpTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 followUp:(id)a7
{
  id v13;
  MSRemoveFollowUpTriageAction *v14;
  MSRemoveFollowUpTriageAction *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)MSRemoveFollowUpTriageAction;
  v14 = -[MSTriageAction initWithMessageListSelection:origin:actor:delegate:](&v17, sel_initWithMessageListSelection_origin_actor_delegate_, a3, a4, a5, a6);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_followUp, a7);

  return v15;
}

- (id)_changeAction
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0D1E220]);
  -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageListItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MSTriageAction origin](self, "origin");
  v7 = -[MSTriageAction actor](self, "actor");
  -[MSRemoveFollowUpTriageAction followUp](self, "followUp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithMessageListItems:origin:actor:followUp:", v5, v6, v7, v8);

  return v9;
}

- (EMFollowUp)followUp
{
  return self->_followUp;
}

- (void)setFollowUp:(id)a3
{
  objc_storeStrong((id *)&self->_followUp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUp, 0);
}

@end
