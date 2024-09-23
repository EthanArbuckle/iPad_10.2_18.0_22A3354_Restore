@implementation AKFollowUpController

- (AKFollowUpController)initWithFLFollowupController:(id)a3
{
  id v5;
  AKFollowUpController *v6;
  AKFollowUpController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKFollowUpController;
  v6 = -[AKFollowUpController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_followupController, a3);

  return v7;
}

- (id)pendingFollowUpItems:(id *)a3
{
  return (id)-[FLFollowUpController pendingFollowUpItems:](self->_followupController, "pendingFollowUpItems:", a3);
}

- (BOOL)removeAllFollowUpItems:(id *)a3
{
  return -[FLFollowUpController clearPendingFollowUpItems:](self->_followupController, "clearPendingFollowUpItems:", a3);
}

- (BOOL)addFollowUpItems:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__9;
  v14 = __Block_byref_object_dispose__9;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__AKFollowUpController_addFollowUpItems_error___block_invoke;
  v9[3] = &unk_1E2E60E90;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  if (a4)
    *a4 = objc_retainAutorelease((id)v11[5]);
  v7 = v11[5] == 0;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __47__AKFollowUpController_addFollowUpItems_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  id obj;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v5 + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "postFollowUpItem:error:", a2, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if ((v8 & 1) == 0)
    *a4 = 1;
}

- (BOOL)removeFollowUpItems:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "aaf_map:", &__block_literal_global_35);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[AKFollowUpController removeFollowUpItemsWithIdentifiers:error:](self, "removeFollowUpItemsWithIdentifiers:error:", v6, a4);

  return (char)a4;
}

id __50__AKFollowUpController_removeFollowUpItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.authkit.hsa2-password-reset"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)removeFollowUpItemsWithIdentifiers:(id)a3 error:(id *)a4
{
  return -[FLFollowUpController clearPendingFollowUpItemsWithUniqueIdentifiers:error:](self->_followupController, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", a3, a4);
}

- (BOOL)clearNotificationsForItem:(id)a3 error:(id *)a4
{
  return -[FLFollowUpController clearNotificationForItem:error:](self->_followupController, "clearNotificationForItem:error:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followupController, 0);
}

@end
