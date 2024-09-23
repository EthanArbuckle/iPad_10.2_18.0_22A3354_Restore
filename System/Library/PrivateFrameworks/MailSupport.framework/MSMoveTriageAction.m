@implementation MSMoveTriageAction

- (MSMoveTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 destinationMailbox:(id)a7 flagChange:(id)a8 copyMessages:(BOOL)a9
{
  id v16;
  id v17;
  MSMoveTriageAction *v18;
  MSMoveTriageAction *v19;
  objc_super v21;

  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)MSMoveTriageAction;
  v18 = -[MSTriageAction initWithMessageListSelection:origin:actor:delegate:](&v21, sel_initWithMessageListSelection_origin_actor_delegate_, a3, a4, a5, a6);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_destinationMailbox, a7);
    objc_storeStrong((id *)&v19->_flagChange, a8);
    v19->_copyMessages = a9;
  }

  return v19;
}

- (MSMoveTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 destinationMailboxType:(int64_t)a7 flagChange:(id)a8 copyMessages:(BOOL)a9
{
  id v16;
  MSMoveTriageAction *v17;
  MSMoveTriageAction *v18;
  objc_super v20;

  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)MSMoveTriageAction;
  v17 = -[MSTriageAction initWithMessageListSelection:origin:actor:delegate:](&v20, sel_initWithMessageListSelection_origin_actor_delegate_, a3, a4, a5, a6);
  v18 = v17;
  if (v17)
  {
    v17->_destinationMailboxType = a7;
    objc_storeStrong((id *)&v17->_flagChange, a8);
    v18->_copyMessages = a9;
  }

  return v18;
}

- (MSMoveTriageAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 destinationMailboxType:(int64_t)a7 flagChange:(id)a8 copyMessages:(BOOL)a9
{
  id v16;
  MSMoveTriageAction *v17;
  MSMoveTriageAction *v18;
  objc_super v20;

  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)MSMoveTriageAction;
  v17 = -[MSTriageAction initWithQuery:origin:actor:delegate:](&v20, sel_initWithQuery_origin_actor_delegate_, a3, a4, a5, a6);
  v18 = v17;
  if (v17)
  {
    v17->_destinationMailboxType = a7;
    objc_storeStrong((id *)&v17->_flagChange, a8);
    v18->_copyMessages = a9;
  }

  return v18;
}

- (id)_changeAction
{
  void *v3;
  int v4;
  EMMailbox *destinationMailbox;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v17;
  id v18;

  -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSelectAll");

  destinationMailbox = self->_destinationMailbox;
  if (v4)
  {
    if (destinationMailbox)
    {
      v6 = objc_alloc(MEMORY[0x1E0D1E290]);
      -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mailboxes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "messageListItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "initWithMailboxes:messageListItemsToExclude:destinationMailbox:copyMessages:origin:actor:", v8, v10, self->_destinationMailbox, self->_copyMessages, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"));
LABEL_9:
      v14 = (void *)v11;

      goto LABEL_10;
    }
    if (self->_destinationMailboxType)
    {
      v15 = objc_alloc(MEMORY[0x1E0D1E290]);
      -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mailboxes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "messageListItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v15, "initWithMailboxes:messageListItemsToExclude:specialDestinationMailboxType:flagChange:copyMessages:origin:actor:", v8, v10, self->_destinationMailboxType, self->_flagChange, self->_copyMessages, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"));
      goto LABEL_9;
    }
LABEL_16:
    v14 = 0;
    return v14;
  }
  if (destinationMailbox)
  {
    v12 = objc_alloc(MEMORY[0x1E0D1E288]);
    -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageListItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "initWithMessageListItems:origin:actor:destinationMailbox:copyMessages:", v8, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), self->_destinationMailbox, self->_copyMessages);
  }
  else
  {
    if (!self->_destinationMailboxType)
      goto LABEL_16;
    -[MSTriageAction query](self, "query");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0D1E288]);
    if (v17)
    {
      -[MSTriageAction query](self, "query");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v18, "initWithQuery:origin:actor:specialDestinationMailboxType:flagChange:copyMessages:", v7, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), self->_destinationMailboxType, self->_flagChange, self->_copyMessages);
      goto LABEL_11;
    }
    -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageListItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v18, "initWithMessageListItems:origin:actor:specialDestinationMailboxType:flagChange:copyMessages:", v8, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), self->_destinationMailboxType, self->_flagChange, self->_copyMessages);
  }
  v14 = (void *)v13;
LABEL_10:

LABEL_11:
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagChange, 0);
  objc_storeStrong((id *)&self->_destinationMailbox, 0);
}

@end
