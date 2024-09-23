@implementation CNSaveResponse

- (CNSaveResponse)init
{
  CNSaveResponse *v2;
  uint64_t v3;
  NSMutableDictionary *contactSnapshotsByIndexPath;
  uint64_t v5;
  NSMutableDictionary *groupSnapshotsByIndexPath;
  uint64_t v7;
  NSMutableDictionary *containerSnapshotsByIndexPath;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNSaveResponse;
  v2 = -[CNSaveResponse init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    contactSnapshotsByIndexPath = v2->_contactSnapshotsByIndexPath;
    v2->_contactSnapshotsByIndexPath = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    groupSnapshotsByIndexPath = v2->_groupSnapshotsByIndexPath;
    v2->_groupSnapshotsByIndexPath = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    containerSnapshotsByIndexPath = v2->_containerSnapshotsByIndexPath;
    v2->_containerSnapshotsByIndexPath = (NSMutableDictionary *)v7;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSaveResponse)initWithCoder:(id)a3
{
  id v4;
  CNSaveResponse *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *contactSnapshotsByIndexPath;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *groupSnapshotsByIndexPath;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *containerSnapshotsByIndexPath;
  CNSaveResponse *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CNSaveResponse;
  v5 = -[CNSaveResponse init](&v29, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_contactSnapshotsByIndexPath"));
    v11 = objc_claimAutoreleasedReturnValue();
    contactSnapshotsByIndexPath = v5->_contactSnapshotsByIndexPath;
    v5->_contactSnapshotsByIndexPath = (NSMutableDictionary *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("_groupSnapshotsByIndexPath"));
    v18 = objc_claimAutoreleasedReturnValue();
    groupSnapshotsByIndexPath = v5->_groupSnapshotsByIndexPath;
    v5->_groupSnapshotsByIndexPath = (NSMutableDictionary *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("_containerSnapshotsByIndexPath"));
    v25 = objc_claimAutoreleasedReturnValue();
    containerSnapshotsByIndexPath = v5->_containerSnapshotsByIndexPath;
    v5->_containerSnapshotsByIndexPath = (NSMutableDictionary *)v25;

    v5->_didAffectMeCard = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_didAffectMeCard"));
    v27 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *contactSnapshotsByIndexPath;
  id v5;

  contactSnapshotsByIndexPath = self->_contactSnapshotsByIndexPath;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactSnapshotsByIndexPath, CFSTR("_contactSnapshotsByIndexPath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupSnapshotsByIndexPath, CFSTR("_groupSnapshotsByIndexPath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerSnapshotsByIndexPath, CFSTR("_containerSnapshotsByIndexPath"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_didAffectMeCard, CFSTR("_didAffectMeCard"));

}

- (void)applySnapshotsToSaveRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *contactSnapshotsByIndexPath;
  void *v8;
  NSMutableDictionary *groupSnapshotsByIndexPath;
  id v10;
  void *v11;
  NSMutableDictionary *containerSnapshotsByIndexPath;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(v4, "allContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  contactSnapshotsByIndexPath = self->_contactSnapshotsByIndexPath;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __46__CNSaveResponse_applySnapshotsToSaveRequest___block_invoke;
  v19[3] = &unk_1E29FB8D0;
  v20 = v5;
  v14 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](contactSnapshotsByIndexPath, "enumerateKeysAndObjectsUsingBlock:", v19);
  objc_msgSend(v4, "allGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  groupSnapshotsByIndexPath = self->_groupSnapshotsByIndexPath;
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __46__CNSaveResponse_applySnapshotsToSaveRequest___block_invoke_2;
  v17[3] = &unk_1E29FB8F8;
  v18 = v8;
  v10 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](groupSnapshotsByIndexPath, "enumerateKeysAndObjectsUsingBlock:", v17);
  objc_msgSend(v4, "allContainers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  containerSnapshotsByIndexPath = self->_containerSnapshotsByIndexPath;
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __46__CNSaveResponse_applySnapshotsToSaveRequest___block_invoke_3;
  v15[3] = &unk_1E29FB920;
  v16 = v11;
  v13 = v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](containerSnapshotsByIndexPath, "enumerateKeysAndObjectsUsingBlock:", v15);

}

void __46__CNSaveResponse_applySnapshotsToSaveRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(v11, "indexAtPosition:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "length") < 2)
  {
    v9 = v6;
  }
  else
  {
    v7 = objc_msgSend(v11, "indexAtPosition:", 1);
    objc_msgSend(v6, "linkedContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*MEMORY[0x1E0D13880] + 16))();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateStateFromContact:", v10);

}

void __46__CNSaveResponse_applySnapshotsToSaveRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "objectAtIndex:", objc_msgSend(a2, "indexAtPosition:", 0));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*MEMORY[0x1E0D13880] + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "adoptValuesFromAndSetSnapshot:", v6);
}

void __46__CNSaveResponse_applySnapshotsToSaveRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "objectAtIndex:", objc_msgSend(a2, "indexAtPosition:", 0));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*MEMORY[0x1E0D13880] + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "adoptValuesFromAndSetSnapshot:", v6);
}

- (BOOL)didAffectMeCard
{
  return self->_didAffectMeCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerSnapshotsByIndexPath, 0);
  objc_storeStrong((id *)&self->_groupSnapshotsByIndexPath, 0);
  objc_storeStrong((id *)&self->_contactSnapshotsByIndexPath, 0);
}

@end
