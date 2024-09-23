@implementation MPCQueueControllerEdit

- (MPCQueueControllerEdit)initWithQueueController:(id)a3 label:(id)a4
{
  id v7;
  id v8;
  MPCQueueControllerEdit *v9;
  MPCQueueControllerEdit *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSString *label;
  NSMutableDictionary *v15;
  NSMutableDictionary *suggestedContentItemIDs;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MPCQueueControllerEdit;
  v9 = -[MPCQueueControllerEdit init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queueController, a3);
    MSVNanoIDCreateTaggedPointer();
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v8, "copy");
    label = v10->_label;
    v10->_label = (NSString *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    suggestedContentItemIDs = v10->_suggestedContentItemIDs;
    v10->_suggestedContentItemIDs = v15;

    if (_MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sOnceToken != -1)
      dispatch_once(&_MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sOnceToken, &__block_literal_global_724);
    v10->_allowsChangingCurrentItem = pthread_getspecific(_MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sThreadKey) != 0;
  }

  return v10;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_committed)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 1705, CFSTR("Didn't call -commit/-rollback for edit: %@"), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)MPCQueueControllerEdit;
  -[MPCQueueControllerEdit dealloc](&v5, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p id=%@ label=\"%@\">"), objc_opt_class(), self, self->_identifier, self->_label);
}

- (void)setSuggestedContentItemIDForStart:(id)a3
{
  id v5;
  NSString *v6;
  NSString *suggestedStartingContentItemID;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 1713, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestedContentItemID != nil"));

    v5 = 0;
  }
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 1714, CFSTR("Attempt to modify committed edit: %@"), self);

    v5 = v10;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  suggestedStartingContentItemID = self->_suggestedStartingContentItemID;
  self->_suggestedStartingContentItemID = v6;

}

- (void)setSuggestedContentItemID:(id)a3 forDeletedContentItemID:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (v11)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 1720, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestedContentItemID != nil"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 1721, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deletedContentItemID != nil"));

LABEL_3:
  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 1722, CFSTR("Attempt to modify committed edit: %@"), self);

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_suggestedContentItemIDs, "setObject:forKeyedSubscript:", v11, v7);

}

- (void)commit
{
  MPCQueueController *queueController;
  void *v5;

  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 1728, CFSTR("Attempt to commit an already committed edit: %@"), self);

  }
  -[MPCQueueController _commitEdit:](self->_queueController, "_commitEdit:", self);
  queueController = self->_queueController;
  self->_queueController = 0;

  self->_committed = 1;
}

- (void)rollback
{
  MPCQueueController *queueController;
  void *v5;

  if (self->_committed)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 1736, CFSTR("Attempt to rollback an already committed edit: %@"), self);

  }
  -[MPCQueueController _rollbackEdit:](self->_queueController, "_rollbackEdit:", self);
  queueController = self->_queueController;
  self->_queueController = 0;

  self->_committed = 1;
}

- (NSDictionary)suggestedContentItemIDsForDeletedContentItemIDs
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_suggestedContentItemIDs, "copy");
}

- (MPCQueueController)queueController
{
  return self->_queueController;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)allowsChangingCurrentItem
{
  return self->_allowsChangingCurrentItem;
}

- (NSString)suggestedStartingContentItemID
{
  return self->_suggestedStartingContentItemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedStartingContentItemID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queueController, 0);
  objc_storeStrong((id *)&self->_suggestedContentItemIDs, 0);
}

@end
