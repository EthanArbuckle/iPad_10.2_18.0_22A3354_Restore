@implementation CNSaveRequest

- (void)acceptChangeHistoryEventVisitor:(id)a3
{
  id v4;
  CNSaveRequestVisitationTask *v5;
  id v6;
  CNChangeHistoryEventFactory *v7;

  v4 = a3;
  v7 = objc_alloc_init(CNChangeHistoryEventFactory);
  v5 = -[CNSaveRequestVisitationTask initWithSaveRequest:visitor:factory:]([CNSaveRequestVisitationTask alloc], "initWithSaveRequest:visitor:factory:", self, v4, v7);

  v6 = -[CNSaveRequestVisitationTask run:](v5, "run:", 0);
}

- (void)withEachAddedContact:(id)a3
{
  id v4;
  NSMutableDictionary *addedContactsByIdentifier;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  addedContactsByIdentifier = self->_addedContactsByIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CNSaveRequest_Visitation__withEachAddedContact___block_invoke;
  v7[3] = &unk_1E29FC040;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary _cn_each:](addedContactsByIdentifier, "_cn_each:", v7);

}

void __50__CNSaveRequest_Visitation__withEachAddedContact___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D13880];
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)withEachUpdatedContact:(id)a3
{
  id v4;
  NSMutableArray *updatedContacts;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  updatedContacts = self->_updatedContacts;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CNSaveRequest_Visitation__withEachUpdatedContact___block_invoke;
  v7[3] = &unk_1E29FC068;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray _cn_each:](updatedContacts, "_cn_each:", v7);

}

uint64_t __52__CNSaveRequest_Visitation__withEachUpdatedContact___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)withEachDeletedContact:(id)a3
{
  id v4;
  NSMutableDictionary *deletedContactsByIdentifier;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  deletedContactsByIdentifier = self->_deletedContactsByIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CNSaveRequest_Visitation__withEachDeletedContact___block_invoke;
  v7[3] = &unk_1E29FC090;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary _cn_each:](deletedContactsByIdentifier, "_cn_each:", v7);

}

uint64_t __52__CNSaveRequest_Visitation__withEachDeletedContact___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)withEachAddedGroup:(id)a3
{
  id v4;
  NSMutableDictionary *addedGroupsByIdentifier;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  addedGroupsByIdentifier = self->_addedGroupsByIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CNSaveRequest_Visitation__withEachAddedGroup___block_invoke;
  v7[3] = &unk_1E29FC040;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary _cn_each:](addedGroupsByIdentifier, "_cn_each:", v7);

}

void __48__CNSaveRequest_Visitation__withEachAddedGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D13880];
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)withEachUpdatedGroup:(id)a3
{
  id v4;
  NSMutableArray *updatedGroups;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  updatedGroups = self->_updatedGroups;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CNSaveRequest_Visitation__withEachUpdatedGroup___block_invoke;
  v7[3] = &unk_1E29FC0B8;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray _cn_each:](updatedGroups, "_cn_each:", v7);

}

uint64_t __50__CNSaveRequest_Visitation__withEachUpdatedGroup___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)withEachDeletedGroup:(id)a3
{
  id v4;
  NSMutableDictionary *deletedGroupsByIdentifier;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  deletedGroupsByIdentifier = self->_deletedGroupsByIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CNSaveRequest_Visitation__withEachDeletedGroup___block_invoke;
  v7[3] = &unk_1E29FC090;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary _cn_each:](deletedGroupsByIdentifier, "_cn_each:", v7);

}

uint64_t __50__CNSaveRequest_Visitation__withEachDeletedGroup___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)withEachMemberAddedToGroup:(id)a3
{
  id v4;
  NSMutableDictionary *addedMembersByGroupIdentifier;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  addedMembersByGroupIdentifier = self->_addedMembersByGroupIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CNSaveRequest_Visitation__withEachMemberAddedToGroup___block_invoke;
  v7[3] = &unk_1E29FC108;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary _cn_each:](addedMembersByGroupIdentifier, "_cn_each:", v7);

}

void __56__CNSaveRequest_Visitation__withEachMemberAddedToGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__CNSaveRequest_Visitation__withEachMemberAddedToGroup___block_invoke_2;
  v10[3] = &unk_1E29FC0E0;
  v8 = *(id *)(a1 + 40);
  v11 = v7;
  v12 = v8;
  v9 = v7;
  objc_msgSend(v6, "_cn_each:", v10);

}

uint64_t __56__CNSaveRequest_Visitation__withEachMemberAddedToGroup___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 32));
}

- (void)withEachMemberRemovedFromGroup:(id)a3
{
  id v4;
  NSMutableDictionary *removedMembersByGroupIdentifier;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  removedMembersByGroupIdentifier = self->_removedMembersByGroupIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CNSaveRequest_Visitation__withEachMemberRemovedFromGroup___block_invoke;
  v7[3] = &unk_1E29FC108;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary _cn_each:](removedMembersByGroupIdentifier, "_cn_each:", v7);

}

void __60__CNSaveRequest_Visitation__withEachMemberRemovedFromGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__CNSaveRequest_Visitation__withEachMemberRemovedFromGroup___block_invoke_2;
  v10[3] = &unk_1E29FC0E0;
  v8 = *(id *)(a1 + 40);
  v11 = v7;
  v12 = v8;
  v9 = v7;
  objc_msgSend(v6, "_cn_each:", v10);

}

uint64_t __60__CNSaveRequest_Visitation__withEachMemberRemovedFromGroup___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 32));
}

- (void)withEachSubgroupAddedToGroup:(id)a3
{
  id v4;
  NSMutableDictionary *addedSubgroupsByGroupIdentifier;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  addedSubgroupsByGroupIdentifier = self->_addedSubgroupsByGroupIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CNSaveRequest_Visitation__withEachSubgroupAddedToGroup___block_invoke;
  v7[3] = &unk_1E29FC108;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary _cn_each:](addedSubgroupsByGroupIdentifier, "_cn_each:", v7);

}

void __58__CNSaveRequest_Visitation__withEachSubgroupAddedToGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__CNSaveRequest_Visitation__withEachSubgroupAddedToGroup___block_invoke_2;
  v10[3] = &unk_1E29FC130;
  v8 = *(id *)(a1 + 40);
  v11 = v7;
  v12 = v8;
  v9 = v7;
  objc_msgSend(v6, "_cn_each:", v10);

}

uint64_t __58__CNSaveRequest_Visitation__withEachSubgroupAddedToGroup___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 32));
}

- (void)withEachSubgroupRemovedFromGroup:(id)a3
{
  id v4;
  NSMutableDictionary *removedSubgroupsByGroupIdentifier;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  removedSubgroupsByGroupIdentifier = self->_removedSubgroupsByGroupIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CNSaveRequest_Visitation__withEachSubgroupRemovedFromGroup___block_invoke;
  v7[3] = &unk_1E29FC108;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary _cn_each:](removedSubgroupsByGroupIdentifier, "_cn_each:", v7);

}

void __62__CNSaveRequest_Visitation__withEachSubgroupRemovedFromGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__CNSaveRequest_Visitation__withEachSubgroupRemovedFromGroup___block_invoke_2;
  v10[3] = &unk_1E29FC130;
  v8 = *(id *)(a1 + 40);
  v11 = v7;
  v12 = v8;
  v9 = v7;
  objc_msgSend(v6, "_cn_each:", v10);

}

uint64_t __62__CNSaveRequest_Visitation__withEachSubgroupRemovedFromGroup___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 32));
}

- (void)withEachLinkedContact:(id)a3
{
  id v4;
  NSMutableArray *linkRequests;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  linkRequests = self->_linkRequests;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__CNSaveRequest_Visitation__withEachLinkedContact___block_invoke;
  v7[3] = &unk_1E29FC158;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray _cn_each:](linkRequests, "_cn_each:", v7);

}

void __51__CNSaveRequest_Visitation__withEachLinkedContact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "first");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)withEachUnlinkedContact:(id)a3
{
  id v4;
  NSMutableArray *unlinkRequests;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  unlinkRequests = self->_unlinkRequests;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CNSaveRequest_Visitation__withEachUnlinkedContact___block_invoke;
  v7[3] = &unk_1E29FC068;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray _cn_each:](unlinkRequests, "_cn_each:", v7);

}

uint64_t __53__CNSaveRequest_Visitation__withEachUnlinkedContact___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)withEachContactPreferredForName:(id)a3
{
  id v4;
  NSMutableArray *preferredForNameRequests;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  preferredForNameRequests = self->_preferredForNameRequests;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CNSaveRequest_Visitation__withEachContactPreferredForName___block_invoke;
  v7[3] = &unk_1E29FC158;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray _cn_each:](preferredForNameRequests, "_cn_each:", v7);

}

void __61__CNSaveRequest_Visitation__withEachContactPreferredForName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "first");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)withEachContactPreferredForImage:(id)a3
{
  id v4;
  NSMutableArray *preferredForImageRequests;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  preferredForImageRequests = self->_preferredForImageRequests;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CNSaveRequest_Visitation__withEachContactPreferredForImage___block_invoke;
  v7[3] = &unk_1E29FC158;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray _cn_each:](preferredForImageRequests, "_cn_each:", v7);

}

void __62__CNSaveRequest_Visitation__withEachContactPreferredForImage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "first");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)withDifferentMeCard:(id)a3
{
  void (**v4)(id, NSString *);
  NSString *meCardIdentifier;
  NSString *v6;
  NSString *v7;
  void (**v8)(id, NSString *);

  v4 = (void (**)(id, NSString *))a3;
  meCardIdentifier = self->_meCardIdentifier;
  if (meCardIdentifier)
  {
    v8 = v4;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (meCardIdentifier == v6
      || -[NSString isEqualToString:](self->_meCardIdentifier, "isEqualToString:", &stru_1E29FF900))
    {
      v7 = 0;
    }
    else
    {
      v7 = self->_meCardIdentifier;
    }
    v8[2](v8, v7);
    v4 = v8;
  }

}

- (CNSaveRequest)init
{
  CNSaveRequest *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *saveRequestIdentifier;
  NSMutableDictionary *v7;
  NSMutableDictionary *addedContactsByIdentifier;
  NSMutableArray *v9;
  NSMutableArray *updatedContacts;
  NSMutableDictionary *v11;
  NSMutableDictionary *deletedContactsByIdentifier;
  NSMutableDictionary *v13;
  NSMutableDictionary *addedGroupsByIdentifier;
  NSMutableArray *v15;
  NSMutableArray *updatedGroups;
  NSMutableDictionary *v17;
  NSMutableDictionary *deletedGroupsByIdentifier;
  NSMutableDictionary *v19;
  NSMutableDictionary *addedMembersByGroupIdentifier;
  NSMutableDictionary *v21;
  NSMutableDictionary *removedMembersByGroupIdentifier;
  NSMutableDictionary *v23;
  NSMutableDictionary *addedSubgroupsByGroupIdentifier;
  NSMutableDictionary *v25;
  NSMutableDictionary *removedSubgroupsByGroupIdentifier;
  NSMutableDictionary *v27;
  NSMutableDictionary *addedContainersByIdentifier;
  NSMutableArray *v29;
  NSMutableArray *updatedContainers;
  NSMutableDictionary *v31;
  NSMutableDictionary *deletedContainersByIdentifier;
  NSMutableDictionary *v33;
  NSMutableDictionary *movedContainersByIdentifier;
  NSMutableDictionary *v35;
  NSMutableDictionary *addedAccountContainersByIdentifier;
  NSMutableDictionary *v37;
  NSMutableDictionary *defaultAccountContainersByIdentifier;
  NSMutableArray *v39;
  NSMutableArray *contactChangeRequests;
  NSMutableArray *v41;
  NSMutableArray *addedAccounts;
  NSMutableArray *v43;
  NSMutableArray *removedAccounts;
  NSMutableArray *v45;
  NSMutableArray *linkRequests;
  NSMutableArray *v47;
  NSMutableArray *unlinkRequests;
  NSMutableArray *v49;
  NSMutableArray *preferredForNameRequests;
  NSMutableArray *v51;
  NSMutableArray *preferredForImageRequests;
  NSMutableDictionary *v53;
  NSMutableDictionary *parentRecordsByIdentifier;
  CNSaveRequest *v55;
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)CNSaveRequest;
  v2 = -[CNSaveRequest init](&v57, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    saveRequestIdentifier = v2->_saveRequestIdentifier;
    v2->_saveRequestIdentifier = (NSString *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    addedContactsByIdentifier = v2->_addedContactsByIdentifier;
    v2->_addedContactsByIdentifier = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    updatedContacts = v2->_updatedContacts;
    v2->_updatedContacts = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deletedContactsByIdentifier = v2->_deletedContactsByIdentifier;
    v2->_deletedContactsByIdentifier = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    addedGroupsByIdentifier = v2->_addedGroupsByIdentifier;
    v2->_addedGroupsByIdentifier = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    updatedGroups = v2->_updatedGroups;
    v2->_updatedGroups = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deletedGroupsByIdentifier = v2->_deletedGroupsByIdentifier;
    v2->_deletedGroupsByIdentifier = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    addedMembersByGroupIdentifier = v2->_addedMembersByGroupIdentifier;
    v2->_addedMembersByGroupIdentifier = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    removedMembersByGroupIdentifier = v2->_removedMembersByGroupIdentifier;
    v2->_removedMembersByGroupIdentifier = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    addedSubgroupsByGroupIdentifier = v2->_addedSubgroupsByGroupIdentifier;
    v2->_addedSubgroupsByGroupIdentifier = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    removedSubgroupsByGroupIdentifier = v2->_removedSubgroupsByGroupIdentifier;
    v2->_removedSubgroupsByGroupIdentifier = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    addedContainersByIdentifier = v2->_addedContainersByIdentifier;
    v2->_addedContainersByIdentifier = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    updatedContainers = v2->_updatedContainers;
    v2->_updatedContainers = v29;

    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deletedContainersByIdentifier = v2->_deletedContainersByIdentifier;
    v2->_deletedContainersByIdentifier = v31;

    v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    movedContainersByIdentifier = v2->_movedContainersByIdentifier;
    v2->_movedContainersByIdentifier = v33;

    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    addedAccountContainersByIdentifier = v2->_addedAccountContainersByIdentifier;
    v2->_addedAccountContainersByIdentifier = v35;

    v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    defaultAccountContainersByIdentifier = v2->_defaultAccountContainersByIdentifier;
    v2->_defaultAccountContainersByIdentifier = v37;

    v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    contactChangeRequests = v2->_contactChangeRequests;
    v2->_contactChangeRequests = v39;

    v41 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    addedAccounts = v2->_addedAccounts;
    v2->_addedAccounts = v41;

    v43 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    removedAccounts = v2->_removedAccounts;
    v2->_removedAccounts = v43;

    v45 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    linkRequests = v2->_linkRequests;
    v2->_linkRequests = v45;

    v47 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    unlinkRequests = v2->_unlinkRequests;
    v2->_unlinkRequests = v47;

    v49 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    preferredForNameRequests = v2->_preferredForNameRequests;
    v2->_preferredForNameRequests = v49;

    v51 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    preferredForImageRequests = v2->_preferredForImageRequests;
    v2->_preferredForImageRequests = v51;

    v53 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    parentRecordsByIdentifier = v2->_parentRecordsByIdentifier;
    v2->_parentRecordsByIdentifier = v53;

    v2->_shouldRefetchContacts = 1;
    v2->_suppressChangeNotifications = 0;
    v55 = v2;
  }

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSaveRequest)initWithCoder:(id)a3
{
  id v4;
  CNSaveRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *saveRequestIdentifier;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *addedContactsByIdentifier;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSMutableArray *updatedContacts;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSMutableDictionary *deletedContactsByIdentifier;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSMutableDictionary *addedGroupsByIdentifier;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSMutableArray *updatedGroups;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSMutableDictionary *deletedGroupsByIdentifier;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NSMutableDictionary *addedMembersByGroupIdentifier;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSMutableDictionary *removedMembersByGroupIdentifier;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSMutableDictionary *addedSubgroupsByGroupIdentifier;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  NSMutableDictionary *removedSubgroupsByGroupIdentifier;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  NSMutableDictionary *addedContainersByIdentifier;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  NSMutableArray *updatedContainers;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  NSMutableDictionary *deletedContainersByIdentifier;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  NSMutableDictionary *movedContainersByIdentifier;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  NSMutableDictionary *addedAccountContainersByIdentifier;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  NSMutableDictionary *defaultAccountContainersByIdentifier;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  NSMutableArray *contactChangeRequests;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  NSMutableArray *addedAccounts;
  void *v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  NSMutableArray *removedAccounts;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  NSMutableDictionary *parentRecordsByIdentifier;
  void *v132;
  uint64_t v133;
  NSString *transactionAuthor;
  CNSaveRequest *v135;
  objc_super v137;

  v4 = a3;
  v137.receiver = self;
  v137.super_class = (Class)CNSaveRequest;
  v5 = -[CNSaveRequest init](&v137, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_saveRequestIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    saveRequestIdentifier = v5->_saveRequestIdentifier;
    v5->_saveRequestIdentifier = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_addedContactsByIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    addedContactsByIdentifier = v5->_addedContactsByIdentifier;
    v5->_addedContactsByIdentifier = (NSMutableDictionary *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("_updatedContacts"));
    v20 = objc_claimAutoreleasedReturnValue();
    updatedContacts = v5->_updatedContacts;
    v5->_updatedContacts = (NSMutableArray *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("_deletedContactsByIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    deletedContactsByIdentifier = v5->_deletedContactsByIdentifier;
    v5->_deletedContactsByIdentifier = (NSMutableDictionary *)v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, v30, v31, v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("_addedGroupsByIdentifier"));
    v34 = objc_claimAutoreleasedReturnValue();
    addedGroupsByIdentifier = v5->_addedGroupsByIdentifier;
    v5->_addedGroupsByIdentifier = (NSMutableDictionary *)v34;

    v36 = (void *)MEMORY[0x1E0C99E60];
    v37 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("_updatedGroups"));
    v39 = objc_claimAutoreleasedReturnValue();
    updatedGroups = v5->_updatedGroups;
    v5->_updatedGroups = (NSMutableArray *)v39;

    v41 = (void *)MEMORY[0x1E0C99E60];
    v42 = objc_opt_class();
    v43 = objc_opt_class();
    objc_msgSend(v41, "setWithObjects:", v42, v43, objc_opt_class(), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("_deletedGroupsByIdentifier"));
    v45 = objc_claimAutoreleasedReturnValue();
    deletedGroupsByIdentifier = v5->_deletedGroupsByIdentifier;
    v5->_deletedGroupsByIdentifier = (NSMutableDictionary *)v45;

    v47 = (void *)MEMORY[0x1E0C99E60];
    v48 = objc_opt_class();
    v49 = objc_opt_class();
    objc_msgSend(v47, "setWithObjects:", v48, v49, objc_opt_class(), 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v50, CFSTR("_addedMembersByGroupIdentifier"));
    v51 = objc_claimAutoreleasedReturnValue();
    addedMembersByGroupIdentifier = v5->_addedMembersByGroupIdentifier;
    v5->_addedMembersByGroupIdentifier = (NSMutableDictionary *)v51;

    v53 = (void *)MEMORY[0x1E0C99E60];
    v54 = objc_opt_class();
    v55 = objc_opt_class();
    objc_msgSend(v53, "setWithObjects:", v54, v55, objc_opt_class(), 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v56, CFSTR("_removedMembersByGroupIdentifier"));
    v57 = objc_claimAutoreleasedReturnValue();
    removedMembersByGroupIdentifier = v5->_removedMembersByGroupIdentifier;
    v5->_removedMembersByGroupIdentifier = (NSMutableDictionary *)v57;

    v59 = (void *)MEMORY[0x1E0C99E60];
    v60 = objc_opt_class();
    v61 = objc_opt_class();
    objc_msgSend(v59, "setWithObjects:", v60, v61, objc_opt_class(), 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v62, CFSTR("_addedSubgroupsByGroupIdentifier"));
    v63 = objc_claimAutoreleasedReturnValue();
    addedSubgroupsByGroupIdentifier = v5->_addedSubgroupsByGroupIdentifier;
    v5->_addedSubgroupsByGroupIdentifier = (NSMutableDictionary *)v63;

    v65 = (void *)MEMORY[0x1E0C99E60];
    v66 = objc_opt_class();
    v67 = objc_opt_class();
    v68 = objc_opt_class();
    objc_msgSend(v65, "setWithObjects:", v66, v67, v68, objc_opt_class(), 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v69, CFSTR("_removedSubgroupsByGroupIdentifier"));
    v70 = objc_claimAutoreleasedReturnValue();
    removedSubgroupsByGroupIdentifier = v5->_removedSubgroupsByGroupIdentifier;
    v5->_removedSubgroupsByGroupIdentifier = (NSMutableDictionary *)v70;

    v72 = (void *)MEMORY[0x1E0C99E60];
    v73 = objc_opt_class();
    v74 = objc_opt_class();
    objc_msgSend(v72, "setWithObjects:", v73, v74, objc_opt_class(), 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v75, CFSTR("_addedContainersByIdentifier"));
    v76 = objc_claimAutoreleasedReturnValue();
    addedContainersByIdentifier = v5->_addedContainersByIdentifier;
    v5->_addedContainersByIdentifier = (NSMutableDictionary *)v76;

    v78 = (void *)MEMORY[0x1E0C99E60];
    v79 = objc_opt_class();
    objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v80, CFSTR("_updatedContainers"));
    v81 = objc_claimAutoreleasedReturnValue();
    updatedContainers = v5->_updatedContainers;
    v5->_updatedContainers = (NSMutableArray *)v81;

    v83 = (void *)MEMORY[0x1E0C99E60];
    v84 = objc_opt_class();
    v85 = objc_opt_class();
    objc_msgSend(v83, "setWithObjects:", v84, v85, objc_opt_class(), 0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v86, CFSTR("_deletedContainersByIdentifier"));
    v87 = objc_claimAutoreleasedReturnValue();
    deletedContainersByIdentifier = v5->_deletedContainersByIdentifier;
    v5->_deletedContainersByIdentifier = (NSMutableDictionary *)v87;

    v89 = (void *)MEMORY[0x1E0C99E60];
    v90 = objc_opt_class();
    v91 = objc_opt_class();
    objc_msgSend(v89, "setWithObjects:", v90, v91, objc_opt_class(), 0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v92, CFSTR("_movedContainersByIdentifier"));
    v93 = objc_claimAutoreleasedReturnValue();
    movedContainersByIdentifier = v5->_movedContainersByIdentifier;
    v5->_movedContainersByIdentifier = (NSMutableDictionary *)v93;

    v95 = (void *)MEMORY[0x1E0C99E60];
    v96 = objc_opt_class();
    v97 = objc_opt_class();
    v98 = objc_opt_class();
    v99 = objc_opt_class();
    objc_msgSend(v95, "setWithObjects:", v96, v97, v98, v99, objc_opt_class(), 0);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v100, CFSTR("_addedAccountContainersByIdentifier"));
    v101 = objc_claimAutoreleasedReturnValue();
    addedAccountContainersByIdentifier = v5->_addedAccountContainersByIdentifier;
    v5->_addedAccountContainersByIdentifier = (NSMutableDictionary *)v101;

    v103 = (void *)MEMORY[0x1E0C99E60];
    v104 = objc_opt_class();
    v105 = objc_opt_class();
    v106 = objc_opt_class();
    v107 = objc_opt_class();
    objc_msgSend(v103, "setWithObjects:", v104, v105, v106, v107, objc_opt_class(), 0);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v108, CFSTR("_defaultAccountContainersByIdentifier"));
    v109 = objc_claimAutoreleasedReturnValue();
    defaultAccountContainersByIdentifier = v5->_defaultAccountContainersByIdentifier;
    v5->_defaultAccountContainersByIdentifier = (NSMutableDictionary *)v109;

    v111 = (void *)MEMORY[0x1E0C99E60];
    v112 = objc_opt_class();
    objc_msgSend(v111, "setWithObjects:", v112, objc_opt_class(), 0);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v113, CFSTR("_contactChangeRequests"));
    v114 = objc_claimAutoreleasedReturnValue();
    contactChangeRequests = v5->_contactChangeRequests;
    v5->_contactChangeRequests = (NSMutableArray *)v114;

    v116 = (void *)MEMORY[0x1E0C99E60];
    v117 = objc_opt_class();
    objc_msgSend(v116, "setWithObjects:", v117, objc_opt_class(), 0);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v118, CFSTR("_addedAccounts"));
    v119 = objc_claimAutoreleasedReturnValue();
    addedAccounts = v5->_addedAccounts;
    v5->_addedAccounts = (NSMutableArray *)v119;

    v121 = (void *)MEMORY[0x1E0C99E60];
    v122 = objc_opt_class();
    objc_msgSend(v121, "setWithObjects:", v122, objc_opt_class(), 0);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v123, CFSTR("_removedAccounts"));
    v124 = objc_claimAutoreleasedReturnValue();
    removedAccounts = v5->_removedAccounts;
    v5->_removedAccounts = (NSMutableArray *)v124;

    v126 = (void *)MEMORY[0x1E0C99E60];
    v127 = objc_opt_class();
    v128 = objc_opt_class();
    objc_msgSend(v126, "setWithObjects:", v127, v128, objc_opt_class(), 0);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v129, CFSTR("_parentRecordsByIdentifier"));
    v130 = objc_claimAutoreleasedReturnValue();
    parentRecordsByIdentifier = v5->_parentRecordsByIdentifier;
    v5->_parentRecordsByIdentifier = (NSMutableDictionary *)v130;

    v5->_shouldRefetchContacts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldRefetchContacts"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transactionAuthor"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v132, "copy");
    transactionAuthor = v5->_transactionAuthor;
    v5->_transactionAuthor = (NSString *)v133;

    v5->_unsafeApplyChangesOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_unsafeApplyChangesOnly"));
    v5->_ignoresGuardianRestrictions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_ignoresGuardianRestrictions"));
    v5->_ignoresContactProviderRestrictions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_ignoresContactProviderRestrictions"));
    v5->_suppressChangeNotifications = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_suppressChangeNotifications"));
    v135 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *saveRequestIdentifier;
  id v5;

  saveRequestIdentifier = self->_saveRequestIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", saveRequestIdentifier, CFSTR("_saveRequestIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addedContactsByIdentifier, CFSTR("_addedContactsByIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_updatedContacts, CFSTR("_updatedContacts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deletedContactsByIdentifier, CFSTR("_deletedContactsByIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addedGroupsByIdentifier, CFSTR("_addedGroupsByIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_updatedGroups, CFSTR("_updatedGroups"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deletedGroupsByIdentifier, CFSTR("_deletedGroupsByIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addedMembersByGroupIdentifier, CFSTR("_addedMembersByGroupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_removedMembersByGroupIdentifier, CFSTR("_removedMembersByGroupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addedSubgroupsByGroupIdentifier, CFSTR("_addedSubgroupsByGroupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_removedSubgroupsByGroupIdentifier, CFSTR("_removedSubgroupsByGroupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addedContainersByIdentifier, CFSTR("_addedContainersByIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_updatedContainers, CFSTR("_updatedContainers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deletedContainersByIdentifier, CFSTR("_deletedContainersByIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_movedContainersByIdentifier, CFSTR("_movedContainersByIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addedAccountContainersByIdentifier, CFSTR("_addedAccountContainersByIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultAccountContainersByIdentifier, CFSTR("_defaultAccountContainersByIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parentRecordsByIdentifier, CFSTR("_parentRecordsByIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactChangeRequests, CFSTR("_contactChangeRequests"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addedAccounts, CFSTR("_addedAccounts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_removedAccounts, CFSTR("_removedAccounts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionAuthor, CFSTR("_transactionAuthor"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldRefetchContacts, CFSTR("_shouldRefetchContacts"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ignoresGuardianRestrictions, CFSTR("_ignoresGuardianRestrictions"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ignoresContactProviderRestrictions, CFSTR("_ignoresContactProviderRestrictions"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_suppressChangeNotifications, CFSTR("_suppressChangeNotifications"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_unsafeApplyChangesOnly, CFSTR("_unsafeApplyChangesOnly"));

}

- (NSString)storeIdentifier
{
  return 0;
}

- (void)_insertContact:(id)a3 intoDictionary:(id)a4 complementDictionary:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v7, "isSuggested") & 1) == 0 && (objc_msgSend(v7, "isImplicitAugmentation") & 1) == 0)
  {
    if (objc_msgSend(v7, "isUnified"))
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v7, "linkedContacts", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if ((objc_msgSend(v15, "isSuggested") & 1) == 0 && (objc_msgSend(v15, "isImplicitAugmentation") & 1) == 0)
            {
              objc_msgSend(v15, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "objectForKey:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v15, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
                objc_msgSend(v9, "removeObjectForKey:", v18);
              else
                objc_msgSend(v8, "setObject:forKey:", v7, v18);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v12);
      }
    }
    else
    {
      objc_msgSend(v7, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(v9, "removeObjectForKey:", v10);
      else
        objc_msgSend(v8, "setObject:forKey:", v7, v10);
    }

  }
}

- (void)addDistinctObject:(id)a3 intoArray:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = a4;
  v6 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v7);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "removeObjectAtIndex:", v6);
  objc_msgSend(v5, "addObject:", v7);

}

- (void)addContact:(CNMutableContact *)contact toContainerWithIdentifier:(NSString *)identifier
{
  CNMutableContact *v6;
  NSString *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *addedContactsByIdentifier;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *deletedContactsByIdentifier;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = contact;
  v7 = identifier;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_6;
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
  v8 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (!v7)
      goto LABEL_12;
  }
  else
  {
    -[CNSaveRequest addContact:toContainerWithIdentifier:].cold.2(v8);
    if (!v7)
      goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
    v9 = (void *)CNGuardOSLog_cn_once_object_0_9;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
      -[CNSaveRequest addContact:toContainerWithIdentifier:].cold.1(v9);
  }
LABEL_12:
  addedContactsByIdentifier = self->_addedContactsByIdentifier;
  v16[0] = v6;
  (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact identifier](v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](addedContactsByIdentifier, "setObject:forKey:", v12, v13);

  deletedContactsByIdentifier = self->_deletedContactsByIdentifier;
  -[CNContact identifier](v6, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](deletedContactsByIdentifier, "removeObjectForKey:", v15);

}

- (void)updateContact:(CNMutableContact *)contact
{
  CNMutableContact *v4;
  void *v5;

  v4 = contact;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
    v5 = (void *)CNGuardOSLog_cn_once_object_0_9;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
      -[CNSaveRequest addContact:toContainerWithIdentifier:].cold.2(v5);
  }
  -[CNSaveRequest addDistinctObject:intoArray:](self, "addDistinctObject:intoArray:", v4, self->_updatedContacts);

}

- (void)deleteContact:(CNMutableContact *)contact
{
  CNMutableContact *v4;
  void *v5;

  v4 = contact;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
    v5 = (void *)CNGuardOSLog_cn_once_object_0_9;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
      -[CNSaveRequest addContact:toContainerWithIdentifier:].cold.2(v5);
  }
  -[CNSaveRequest _insertContact:intoDictionary:complementDictionary:](self, "_insertContact:intoDictionary:complementDictionary:", v4, self->_deletedContactsByIdentifier, self->_addedContactsByIdentifier);

}

- (void)setMeCardIdentifier:(id)a3
{
  NSString *v4;
  NSString *meCardIdentifier;
  id v6;

  (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  meCardIdentifier = self->_meCardIdentifier;
  self->_meCardIdentifier = v4;

}

- (void)addGroup:(CNMutableGroup *)group toContainerWithIdentifier:(NSString *)identifier
{
  CNMutableGroup *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *addedGroupsByIdentifier;
  void *v13;
  NSMutableDictionary *deletedGroupsByIdentifier;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = group;
  v7 = identifier;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_6;
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
  v8 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (!v7)
      goto LABEL_12;
  }
  else
  {
    -[CNSaveRequest addGroup:toContainerWithIdentifier:].cold.2(v8);
    if (!v7)
      goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
    v9 = (void *)CNGuardOSLog_cn_once_object_0_9;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
      -[CNSaveRequest addContact:toContainerWithIdentifier:].cold.1(v9);
  }
LABEL_12:
  v16[0] = v6;
  (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  addedGroupsByIdentifier = self->_addedGroupsByIdentifier;
  -[CNMutableGroup identifier](v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](addedGroupsByIdentifier, "setObject:forKey:", v11, v13);

  deletedGroupsByIdentifier = self->_deletedGroupsByIdentifier;
  -[CNMutableGroup identifier](v6, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](deletedGroupsByIdentifier, "removeObjectForKey:", v15);

}

- (void)updateGroup:(CNMutableGroup *)group
{
  CNMutableGroup *v4;
  void *v5;

  v4 = group;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
    v5 = (void *)CNGuardOSLog_cn_once_object_0_9;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
      -[CNSaveRequest addGroup:toContainerWithIdentifier:].cold.2(v5);
  }
  -[CNSaveRequest addDistinctObject:intoArray:](self, "addDistinctObject:intoArray:", v4, self->_updatedGroups);

}

- (void)deleteGroup:(CNMutableGroup *)group
{
  CNMutableGroup *v4;
  void *v5;
  NSMutableDictionary *addedGroupsByIdentifier;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *deletedGroupsByIdentifier;

  v4 = group;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
    v5 = (void *)CNGuardOSLog_cn_once_object_0_9;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
      -[CNSaveRequest addGroup:toContainerWithIdentifier:].cold.2(v5);
  }
  addedGroupsByIdentifier = self->_addedGroupsByIdentifier;
  -[CNMutableGroup identifier](v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](addedGroupsByIdentifier, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = self->_addedGroupsByIdentifier;
    -[CNMutableGroup identifier](v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);
  }
  else
  {
    deletedGroupsByIdentifier = self->_deletedGroupsByIdentifier;
    -[CNMutableGroup identifier](v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](deletedGroupsByIdentifier, "setObject:forKey:", v4, v10);
  }

}

- (void)addMember:(CNContact *)contact toGroup:(CNGroup *)group
{
  CNContact *v6;
  CNGroup *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *addedMembersByGroupIdentifier;
  void *v12;
  void *v13;
  NSMutableDictionary *parentRecordsByIdentifier;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *removedMembersByGroupIdentifier;
  void *v20;
  void *v21;
  void *v22;

  v6 = contact;
  v7 = group;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_6;
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
  v8 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (v7)
      goto LABEL_7;
  }
  else
  {
    -[CNSaveRequest addMember:toGroup:].cold.2(v8);
    if (v7)
    {
LABEL_7:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_12;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
  v9 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
    -[CNSaveRequest addMember:toGroup:].cold.1(v9);
LABEL_12:
  v10 = (void *)-[CNContact copy](v6, "copy");

  addedMembersByGroupIdentifier = self->_addedMembersByGroupIdentifier;
  -[CNGroup identifier](v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](addedMembersByGroupIdentifier, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    parentRecordsByIdentifier = self->_parentRecordsByIdentifier;
    -[CNGroup identifier](v7, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](parentRecordsByIdentifier, "setObject:forKey:", v7, v15);

    v16 = self->_addedMembersByGroupIdentifier;
    -[CNGroup identifier](v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v13, v17);

  }
  objc_msgSend(v10, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v10, v18);

  removedMembersByGroupIdentifier = self->_removedMembersByGroupIdentifier;
  -[CNGroup identifier](v7, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](removedMembersByGroupIdentifier, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeObjectForKey:", v22);

}

- (void)removeMember:(CNContact *)contact fromGroup:(CNGroup *)group
{
  CNContact *v6;
  CNGroup *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *removedMembersByGroupIdentifier;
  void *v12;
  void *v13;
  NSMutableDictionary *parentRecordsByIdentifier;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *addedMembersByGroupIdentifier;
  void *v20;
  void *v21;
  void *v22;

  v6 = contact;
  v7 = group;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_6;
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
  v8 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (v7)
      goto LABEL_7;
  }
  else
  {
    -[CNSaveRequest addMember:toGroup:].cold.2(v8);
    if (v7)
    {
LABEL_7:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_12;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
  v9 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
    -[CNSaveRequest addMember:toGroup:].cold.1(v9);
LABEL_12:
  v10 = (void *)-[CNContact copy](v6, "copy");

  removedMembersByGroupIdentifier = self->_removedMembersByGroupIdentifier;
  -[CNGroup identifier](v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](removedMembersByGroupIdentifier, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    parentRecordsByIdentifier = self->_parentRecordsByIdentifier;
    -[CNGroup identifier](v7, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](parentRecordsByIdentifier, "setObject:forKey:", v7, v15);

    v16 = self->_removedMembersByGroupIdentifier;
    -[CNGroup identifier](v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v13, v17);

  }
  objc_msgSend(v10, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v10, v18);

  addedMembersByGroupIdentifier = self->_addedMembersByGroupIdentifier;
  -[CNGroup identifier](v7, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](addedMembersByGroupIdentifier, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeObjectForKey:", v22);

}

- (void)addSubgroup:(CNGroup *)subgroup toGroup:(CNGroup *)group
{
  CNGroup *v6;
  CNGroup *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *addedSubgroupsByGroupIdentifier;
  void *v12;
  void *v13;
  NSMutableDictionary *parentRecordsByIdentifier;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *removedSubgroupsByGroupIdentifier;
  void *v20;
  void *v21;
  void *v22;

  v6 = subgroup;
  v7 = group;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_6;
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
  v8 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (v7)
      goto LABEL_7;
  }
  else
  {
    -[CNSaveRequest addSubgroup:toGroup:].cold.2(v8);
    if (v7)
    {
LABEL_7:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_12;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
  v9 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
    -[CNSaveRequest addMember:toGroup:].cold.1(v9);
LABEL_12:
  v10 = (void *)-[CNGroup copy](v6, "copy");

  addedSubgroupsByGroupIdentifier = self->_addedSubgroupsByGroupIdentifier;
  -[CNGroup identifier](v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](addedSubgroupsByGroupIdentifier, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    parentRecordsByIdentifier = self->_parentRecordsByIdentifier;
    -[CNGroup identifier](v7, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](parentRecordsByIdentifier, "setObject:forKey:", v7, v15);

    v16 = self->_addedSubgroupsByGroupIdentifier;
    -[CNGroup identifier](v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v13, v17);

  }
  objc_msgSend(v10, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v10, v18);

  removedSubgroupsByGroupIdentifier = self->_removedSubgroupsByGroupIdentifier;
  -[CNGroup identifier](v7, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](removedSubgroupsByGroupIdentifier, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeObjectForKey:", v22);

}

- (void)removeSubgroup:(CNGroup *)subgroup fromGroup:(CNGroup *)group
{
  CNGroup *v6;
  CNGroup *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *removedSubgroupsByGroupIdentifier;
  void *v12;
  void *v13;
  NSMutableDictionary *parentRecordsByIdentifier;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *addedSubgroupsByGroupIdentifier;
  void *v20;
  void *v21;
  void *v22;

  v6 = subgroup;
  v7 = group;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_6;
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
  v8 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (v7)
      goto LABEL_7;
  }
  else
  {
    -[CNSaveRequest addSubgroup:toGroup:].cold.2(v8);
    if (v7)
    {
LABEL_7:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_12;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_291);
  v9 = (void *)CNGuardOSLog_cn_once_object_0_9;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
    -[CNSaveRequest addMember:toGroup:].cold.1(v9);
LABEL_12:
  v10 = (void *)-[CNGroup copy](v6, "copy");

  removedSubgroupsByGroupIdentifier = self->_removedSubgroupsByGroupIdentifier;
  -[CNGroup identifier](v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](removedSubgroupsByGroupIdentifier, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    parentRecordsByIdentifier = self->_parentRecordsByIdentifier;
    -[CNGroup identifier](v7, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](parentRecordsByIdentifier, "setObject:forKey:", v7, v15);

    v16 = self->_removedSubgroupsByGroupIdentifier;
    -[CNGroup identifier](v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v13, v17);

  }
  objc_msgSend(v10, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v10, v18);

  addedSubgroupsByGroupIdentifier = self->_addedSubgroupsByGroupIdentifier;
  -[CNGroup identifier](v7, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](addedSubgroupsByGroupIdentifier, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeObjectForKey:", v22);

}

- (id)flattenedDictionaryForDictionaryOfTuples:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__CNSaveRequest_flattenedDictionaryForDictionaryOfTuples___block_invoke;
  v8[3] = &unk_1E29FBFE0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __58__CNSaveRequest_flattenedDictionaryForDictionaryOfTuples___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "objectAtIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v4);
  }
  objc_msgSend(v7, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (id)_dictionaryOfArraysFromDictionaryOfDictionaries:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__CNSaveRequest__dictionaryOfArraysFromDictionaryOfDictionaries___block_invoke;
  v8[3] = &unk_1E29FBFE0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __65__CNSaveRequest__dictionaryOfArraysFromDictionaryOfDictionaries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "allValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (NSDictionary)addedContactsByContainerIdentifier
{
  return (NSDictionary *)-[CNSaveRequest flattenedDictionaryForDictionaryOfTuples:](self, "flattenedDictionaryForDictionaryOfTuples:", self->_addedContactsByIdentifier);
}

- (NSArray)updatedContacts
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_updatedContacts, "copy");
}

- (NSArray)deletedContacts
{
  cn_objectResultWithObjectLock();
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

id __32__CNSaveRequest_deletedContacts__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[4];
  if (!v3)
  {
    objc_msgSend(v2, "distinctDeletedContacts");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return v3;
}

- (id)distinctDeletedContacts
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__35;
  v11 = __Block_byref_object_dispose__35;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSMutableDictionary allValues](self->_deletedContactsByIdentifier, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__CNSaveRequest_distinctDeletedContacts__block_invoke;
  v6[3] = &unk_1E29FDDC0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "_cn_each:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __40__CNSaveRequest_distinctDeletedContacts__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addDistinctObject:intoArray:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (NSString)meCardIdentifier
{
  return self->_meCardIdentifier;
}

- (NSDictionary)addedGroupsByContainerIdentifier
{
  return (NSDictionary *)-[CNSaveRequest flattenedDictionaryForDictionaryOfTuples:](self, "flattenedDictionaryForDictionaryOfTuples:", self->_addedGroupsByIdentifier);
}

- (NSArray)updatedGroups
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_updatedGroups, "copy");
}

- (NSArray)deletedGroups
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_deletedGroupsByIdentifier, "allValues");
}

- (NSDictionary)addedMembersByGroupIdentifier
{
  return (NSDictionary *)-[CNSaveRequest _dictionaryOfArraysFromDictionaryOfDictionaries:](self, "_dictionaryOfArraysFromDictionaryOfDictionaries:", self->_addedMembersByGroupIdentifier);
}

- (NSDictionary)removedMembersByGroupIdentifier
{
  return (NSDictionary *)-[CNSaveRequest _dictionaryOfArraysFromDictionaryOfDictionaries:](self, "_dictionaryOfArraysFromDictionaryOfDictionaries:", self->_removedMembersByGroupIdentifier);
}

- (NSDictionary)addedSubgroupsByGroupIdentifier
{
  return (NSDictionary *)-[CNSaveRequest _dictionaryOfArraysFromDictionaryOfDictionaries:](self, "_dictionaryOfArraysFromDictionaryOfDictionaries:", self->_addedSubgroupsByGroupIdentifier);
}

- (NSDictionary)removedSubgroupsByGroupIdentifier
{
  return (NSDictionary *)-[CNSaveRequest _dictionaryOfArraysFromDictionaryOfDictionaries:](self, "_dictionaryOfArraysFromDictionaryOfDictionaries:", self->_removedSubgroupsByGroupIdentifier);
}

- (NSDictionary)addedContainersByParentContainerIdentifier
{
  return (NSDictionary *)-[CNSaveRequest flattenedDictionaryForDictionaryOfTuples:](self, "flattenedDictionaryForDictionaryOfTuples:", self->_addedContainersByIdentifier);
}

- (NSDictionary)addedAccountContainersByParentContainerIdentifier
{
  return (NSDictionary *)-[CNSaveRequest flattenedDictionaryForDictionaryOfTuples:](self, "flattenedDictionaryForDictionaryOfTuples:", self->_addedAccountContainersByIdentifier);
}

- (NSDictionary)defaultAccountContainersByAccountIdentifier
{
  return (NSDictionary *)-[CNSaveRequest flattenedDictionaryForDictionaryOfTuples:](self, "flattenedDictionaryForDictionaryOfTuples:", self->_defaultAccountContainersByIdentifier);
}

- (NSArray)deletedContainers
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_deletedContainersByIdentifier, "allValues");
}

- (NSArray)updatedContainers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_updatedContainers, "copy");
}

- (NSDictionary)movedContainersByParentContainerIdentifier
{
  return (NSDictionary *)-[CNSaveRequest flattenedDictionaryForDictionaryOfTuples:](self, "flattenedDictionaryForDictionaryOfTuples:", self->_movedContainersByIdentifier);
}

- (BOOL)hasConflictingSaveOperations
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CNSaveRequest contactChangeRequests](self, "contactChangeRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[CNSaveRequest addedContactsByContainerIdentifier](self, "addedContactsByContainerIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)addContainer:(id)a3 toContainerWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *addedContainersByIdentifier;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *deletedContainersByIdentifier;
  void *v13;
  NSMutableDictionary *addedAccountContainersByIdentifier;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  addedContainersByIdentifier = self->_addedContainersByIdentifier;
  v16[0] = v7;
  (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](addedContainersByIdentifier, "setObject:forKey:", v10, v11);

  deletedContainersByIdentifier = self->_deletedContainersByIdentifier;
  objc_msgSend(v7, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](deletedContainersByIdentifier, "removeObjectForKey:", v13);

  addedAccountContainersByIdentifier = self->_addedAccountContainersByIdentifier;
  objc_msgSend(v7, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](addedAccountContainersByIdentifier, "removeObjectForKey:", v15);

}

- (void)addContainer:(id)a3 toAccountWithIdentifier:(id)a4
{
  NSMutableDictionary *addedAccountContainersByIdentifier;
  uint64_t v7;
  void (*v8)(uint64_t, id);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *deletedContainersByIdentifier;
  void *v14;
  NSMutableDictionary *addedContainersByIdentifier;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  addedAccountContainersByIdentifier = self->_addedAccountContainersByIdentifier;
  v17[0] = a3;
  v7 = *MEMORY[0x1E0D13878];
  v8 = *(void (**)(uint64_t, id))(*MEMORY[0x1E0D13878] + 16);
  v9 = a3;
  v8(v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](addedAccountContainersByIdentifier, "setObject:forKey:", v11, v12);

  deletedContainersByIdentifier = self->_deletedContainersByIdentifier;
  objc_msgSend(v9, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](deletedContainersByIdentifier, "removeObjectForKey:", v14);

  addedContainersByIdentifier = self->_addedContainersByIdentifier;
  objc_msgSend(v9, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](addedContainersByIdentifier, "removeObjectForKey:", v16);

}

- (void)setContainer:(id)a3 asDefaultContainerOfAccountWithIdentifier:(id)a4
{
  NSMutableDictionary *defaultAccountContainersByIdentifier;
  uint64_t v6;
  void (*v7)(uint64_t, id);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  defaultAccountContainersByIdentifier = self->_defaultAccountContainersByIdentifier;
  v12[0] = a3;
  v6 = *MEMORY[0x1E0D13878];
  v7 = *(void (**)(uint64_t, id))(*MEMORY[0x1E0D13878] + 16);
  v8 = a3;
  v7(v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](defaultAccountContainersByIdentifier, "setObject:forKey:", v10, v11);

}

- (void)moveContainer:(id)a3 toContainerWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *movedContainersByIdentifier;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  movedContainersByIdentifier = self->_movedContainersByIdentifier;
  v12[0] = v7;
  (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](movedContainersByIdentifier, "setObject:forKey:", v10, v11);

}

- (void)deleteContainer:(id)a3
{
  NSMutableDictionary *deletedContainersByIdentifier;
  void *v5;
  NSMutableDictionary *addedContainersByIdentifier;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(a3, "copy");
  deletedContainersByIdentifier = self->_deletedContainersByIdentifier;
  objc_msgSend(v8, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](deletedContainersByIdentifier, "setObject:forKey:", v8, v5);

  addedContainersByIdentifier = self->_addedContainersByIdentifier;
  objc_msgSend(v8, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](addedContainersByIdentifier, "removeObjectForKey:", v7);

}

- (void)updateContainer:(id)a3
{
  -[CNSaveRequest addDistinctObject:intoArray:](self, "addDistinctObject:intoArray:", a3, self->_updatedContainers);
}

- (NSArray)contactChangeRequests
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_contactChangeRequests, "copy");
}

- (void)linkContact:(id)a3 toContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMutableArray *linkRequests;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 != v7 && v6 && v7)
  {
    if (objc_msgSend(v6, "isUnified"))
    {
      objc_msgSend(v6, "linkedContacts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v10;
    }
    if (objc_msgSend(v8, "isUnified"))
    {
      objc_msgSend(v8, "linkedContacts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
    v17[0] = v6;
    v17[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactChangeRequest contactChangeRequestWithKind:contacts:linkIdentifier:](CNContactChangeRequest, "contactChangeRequestWithKind:contacts:linkIdentifier:", 0, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObject:](self->_contactChangeRequests, "addObject:", v14);
    linkRequests = self->_linkRequests;
    objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v6, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](linkRequests, "addObject:", v16);

  }
}

- (void)unlinkContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _BYTE v22[128];
  _QWORD v23[3];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v23[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v5;
    if (objc_msgSend(v5, "isUnified"))
    {
      objc_msgSend(v5, "linkedContactsFromStoreWithIdentifier:", 0);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v21 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
          v13 = v21;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNContactChangeRequest contactChangeRequestWithKind:contacts:linkIdentifier:](CNContactChangeRequest, "contactChangeRequestWithKind:contacts:linkIdentifier:", 1, v14, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableArray addObject:](self->_contactChangeRequests, "addObject:", v15);
          -[NSMutableArray addObject:](self->_unlinkRequests, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

    v5 = v16;
  }

}

- (void)preferLinkedContactForName:(id)a3 inUnifiedContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *preferredForNameRequests;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && objc_msgSend(v7, "isUnified"))
    {
      objc_msgSend(v7, "linkedContactsFromStoreWithIdentifier:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    +[CNContactChangeRequest contactChangeRequestWithKind:contacts:linkIdentifier:](CNContactChangeRequest, "contactChangeRequestWithKind:contacts:linkIdentifier:", 2, v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_contactChangeRequests, "addObject:", v11);
    preferredForNameRequests = self->_preferredForNameRequests;
    objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](preferredForNameRequests, "addObject:", v13);

  }
}

- (void)preferLinkedContactForImage:(id)a3 inUnifiedContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *preferredForImageRequests;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && objc_msgSend(v7, "isUnified"))
    {
      objc_msgSend(v7, "linkedContactsFromStoreWithIdentifier:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    +[CNContactChangeRequest contactChangeRequestWithKind:contacts:linkIdentifier:](CNContactChangeRequest, "contactChangeRequestWithKind:contacts:linkIdentifier:", 3, v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_contactChangeRequests, "addObject:", v11);
    preferredForImageRequests = self->_preferredForImageRequests;
    objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](preferredForImageRequests, "addObject:", v13);

  }
}

- (void)addAccount:(id)a3
{
  NSMutableArray *addedAccounts;
  id v5;

  addedAccounts = self->_addedAccounts;
  v5 = a3;
  -[NSMutableArray addObject:](addedAccounts, "addObject:", v5);
  -[NSMutableArray removeObject:](self->_removedAccounts, "removeObject:", v5);

}

- (void)removeAccount:(id)a3
{
  NSMutableArray *removedAccounts;
  id v5;

  removedAccounts = self->_removedAccounts;
  v5 = a3;
  -[NSMutableArray addObject:](removedAccounts, "addObject:", v5);
  -[NSMutableArray removeObject:](self->_addedAccounts, "removeObject:", v5);

}

- (id)groupWithAddedMemberForGroupIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_parentRecordsByIdentifier, "objectForKey:", a3);
}

- (id)groupWithRemovedMemberForGroupIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_parentRecordsByIdentifier, "objectForKey:", a3);
}

- (id)groupWithAddedSubgroupForGroupIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_parentRecordsByIdentifier, "objectForKey:", a3);
}

- (id)groupWithRemovedSubgroupForGroupIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_parentRecordsByIdentifier, "objectForKey:", a3);
}

- (NSArray)allGroups
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *addedGroupsByIdentifier;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", self->_updatedGroups);
  -[NSMutableDictionary allValues](self->_deletedGroupsByIdentifier, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_137);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  addedGroupsByIdentifier = self->_addedGroupsByIdentifier;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __26__CNSaveRequest_allGroups__block_invoke_2;
  v11[3] = &unk_1E29FBFE0;
  v12 = v6;
  v8 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](addedGroupsByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v11);
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_137);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  return (NSArray *)v3;
}

uint64_t __26__CNSaveRequest_allGroups__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __26__CNSaveRequest_allGroups__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (NSArray)allGroupIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *addedSubgroupsByGroupIdentifier;
  uint64_t v13;
  id v14;
  NSMutableDictionary *removedSubgroupsByGroupIdentifier;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, void *);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E40];
  -[NSMutableArray _cn_map:](self->_updatedGroups, "_cn_map:", &__block_literal_global_75_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedSetWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  -[NSMutableDictionary allKeys](self->_deletedGroupsByIdentifier, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  -[NSMutableDictionary allKeys](self->_addedGroupsByIdentifier, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  -[NSMutableDictionary allKeys](self->_addedSubgroupsByGroupIdentifier, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  -[NSMutableDictionary allKeys](self->_removedSubgroupsByGroupIdentifier, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  addedSubgroupsByGroupIdentifier = self->_addedSubgroupsByGroupIdentifier;
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __36__CNSaveRequest_allGroupIdentifiers__block_invoke_2;
  v27[3] = &unk_1E29FBFE0;
  v14 = v3;
  v28 = v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](addedSubgroupsByGroupIdentifier, "enumerateKeysAndObjectsUsingBlock:", v27);
  removedSubgroupsByGroupIdentifier = self->_removedSubgroupsByGroupIdentifier;
  v22 = v13;
  v23 = 3221225472;
  v24 = __36__CNSaveRequest_allGroupIdentifiers__block_invoke_3;
  v25 = &unk_1E29FBFE0;
  v16 = v14;
  v26 = v16;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](removedSubgroupsByGroupIdentifier, "enumerateKeysAndObjectsUsingBlock:", &v22);
  -[NSMutableDictionary allKeys](self->_addedMembersByGroupIdentifier, "allKeys", v22, v23, v24, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v17);

  -[NSMutableDictionary allKeys](self->_removedMembersByGroupIdentifier, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v18);

  v19 = v26;
  v20 = (NSArray *)v16;

  return v20;
}

uint64_t __36__CNSaveRequest_allGroupIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __36__CNSaveRequest_allGroupIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allKeys");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

void __36__CNSaveRequest_allGroupIdentifiers__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allKeys");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

- (NSArray)allContacts
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *addedContactsByIdentifier;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", self->_updatedContacts);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_contactChangeRequests;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v7), "contacts");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  -[CNSaveRequest deletedContacts](self, "deletedContacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_77_2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__35;
  v19 = __Block_byref_object_dispose__35;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  addedContactsByIdentifier = self->_addedContactsByIdentifier;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __28__CNSaveRequest_allContacts__block_invoke_2;
  v14[3] = &unk_1E29FDE08;
  v14[4] = &v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](addedContactsByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v14);
  objc_msgSend((id)v16[5], "sortedArrayUsingComparator:", &__block_literal_global_77_2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v12);

  _Block_object_dispose(&v15, 8);
  return (NSArray *)v3;
}

uint64_t __28__CNSaveRequest_allContacts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __28__CNSaveRequest_allContacts__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (NSArray)allContactIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *addedMembersByGroupIdentifier;
  uint64_t v11;
  id v12;
  NSMutableDictionary *removedMembersByGroupIdentifier;
  id v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSArray *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E40];
  -[NSMutableArray _cn_map:](self->_updatedContacts, "_cn_map:", &__block_literal_global_80_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedSetWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  -[NSMutableDictionary allKeys](self->_deletedContactsByIdentifier, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  -[NSMutableDictionary allKeys](self->_addedContactsByIdentifier, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
    objc_msgSend(v3, "addObject:", self->_meCardIdentifier);
  addedMembersByGroupIdentifier = self->_addedMembersByGroupIdentifier;
  v11 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __38__CNSaveRequest_allContactIdentifiers__block_invoke_2;
  v39[3] = &unk_1E29FBFE0;
  v12 = v3;
  v40 = v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](addedMembersByGroupIdentifier, "enumerateKeysAndObjectsUsingBlock:", v39);
  removedMembersByGroupIdentifier = self->_removedMembersByGroupIdentifier;
  v37[0] = v11;
  v37[1] = 3221225472;
  v37[2] = __38__CNSaveRequest_allContactIdentifiers__block_invoke_3;
  v37[3] = &unk_1E29FBFE0;
  v14 = v12;
  v38 = v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](removedMembersByGroupIdentifier, "enumerateKeysAndObjectsUsingBlock:", v37);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = self->_contactChangeRequests;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v19);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v20, "contactIdentifiers", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v30;
          do
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v30 != v24)
                objc_enumerationMutation(v21);
              objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v25++));
            }
            while (v23 != v25);
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
          }
          while (v23);
        }

        ++v19;
      }
      while (v19 != v17);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v17);
  }

  v26 = v38;
  v27 = (NSArray *)v14;

  return v27;
}

uint64_t __38__CNSaveRequest_allContactIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __38__CNSaveRequest_allContactIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allKeys");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

void __38__CNSaveRequest_allContactIdentifiers__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allKeys");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

- (NSArray)allContainers
{
  void *v3;
  void *v4;
  NSMutableDictionary *addedAccountContainersByIdentifier;
  uint64_t v6;
  id v7;
  NSMutableDictionary *defaultAccountContainersByIdentifier;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", self->_updatedContainers);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  addedAccountContainersByIdentifier = self->_addedAccountContainersByIdentifier;
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __30__CNSaveRequest_allContainers__block_invoke_2;
  v18[3] = &unk_1E29FBFE0;
  v7 = v4;
  v19 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](addedAccountContainersByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v18);
  defaultAccountContainersByIdentifier = self->_defaultAccountContainersByIdentifier;
  v13 = v6;
  v14 = 3221225472;
  v15 = __30__CNSaveRequest_allContainers__block_invoke_3;
  v16 = &unk_1E29FBFE0;
  v17 = v7;
  v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](defaultAccountContainersByIdentifier, "enumerateKeysAndObjectsUsingBlock:", &v13);
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_82_0, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v11;
}

uint64_t __30__CNSaveRequest_allContainers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __30__CNSaveRequest_allContainers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __30__CNSaveRequest_allContainers__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (id)allContainerIdentifiers:(BOOL *)a3
{
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
  NSMutableDictionary *movedContainersByIdentifier;
  NSMutableDictionary *addedGroupsByIdentifier;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  BOOL *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[6];

  v33[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->_addedContainersByIdentifier, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  v7 = (void *)MEMORY[0x1E0C99E40];
  -[NSMutableArray _cn_map:](self->_updatedContainers, "_cn_map:", &__block_literal_global_84_3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orderedSetWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v10);

  -[NSMutableDictionary allKeys](self->_deletedContainersByIdentifier, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v11);

  -[NSMutableDictionary allKeys](self->_movedContainersByIdentifier, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v12);

  -[NSMutableDictionary allKeys](self->_addedAccountContainersByIdentifier, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v13);

  -[NSMutableDictionary allKeys](self->_defaultAccountContainersByIdentifier, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v14);

  movedContainersByIdentifier = self->_movedContainersByIdentifier;
  v33[0] = self->_addedContainersByIdentifier;
  v33[1] = movedContainersByIdentifier;
  addedGroupsByIdentifier = self->_addedGroupsByIdentifier;
  v33[2] = self->_addedContactsByIdentifier;
  v33[3] = addedGroupsByIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    v21 = MEMORY[0x1E0C809B0];
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v22);
        v25[0] = v21;
        v25[1] = 3221225472;
        v25[2] = __41__CNSaveRequest_allContainerIdentifiers___block_invoke_2;
        v25[3] = &unk_1E29FB988;
        v26 = v5;
        v27 = a3;
        objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v25);

        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v19);
  }

  return v5;
}

uint64_t __41__CNSaveRequest_allContainerIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __41__CNSaveRequest_allContainerIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  char v5;
  _BYTE *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "objectAtIndex:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = *(_BYTE **)(a1 + 40);
    v7 = v8;
    if (v6)
      *v6 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    v7 = v8;
  }

}

- (id)allContainerIdentifierStrings:(BOOL *)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CNSaveRequest allContainerIdentifiers:](self, "allContainerIdentifiers:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9))
          objc_msgSend(v4, "addObject:", (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)allAccountIdentifiers
{
  void *v3;
  NSMutableDictionary *addedAccountContainersByIdentifier;
  uint64_t v5;
  id v6;
  NSMutableDictionary *defaultAccountContainersByIdentifier;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  addedAccountContainersByIdentifier = self->_addedAccountContainersByIdentifier;
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __38__CNSaveRequest_allAccountIdentifiers__block_invoke;
  v14[3] = &unk_1E29FBFE0;
  v6 = v3;
  v15 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](addedAccountContainersByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v14);
  defaultAccountContainersByIdentifier = self->_defaultAccountContainersByIdentifier;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __38__CNSaveRequest_allAccountIdentifiers__block_invoke_2;
  v12[3] = &unk_1E29FBFE0;
  v8 = v6;
  v13 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](defaultAccountContainersByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

void __38__CNSaveRequest_allAccountIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "objectAtIndexedSubscript:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __38__CNSaveRequest_allAccountIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "objectAtIndexedSubscript:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (NSArray)allAccountIdentifierStrings
{
  void *v2;
  void *v3;
  id v4;
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

  v15 = *MEMORY[0x1E0C80C00];
  -[CNSaveRequest allAccountIdentifiers](self, "allAccountIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if (*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8))
          objc_msgSend(v3, "addObject:", (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSString)changeHistoryClientIdentifier
{
  return self->_transactionAuthor;
}

- (void)setChangeHistoryClientIdentifier:(id)a3
{
  NSString *v4;
  NSString *transactionAuthor;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  transactionAuthor = self->_transactionAuthor;
  self->_transactionAuthor = v4;

}

- (BOOL)canIgnoreError:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  char v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_msgSend(v7, "saveRequest:shouldProceedAfterError:", self, v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)unsafeApplyChangesOnly
{
  return self->_unsafeApplyChangesOnly;
}

- (void)setUnsafeApplyChangesOnly:(BOOL)a3
{
  self->_unsafeApplyChangesOnly = a3;
}

- (NSString)transactionAuthor
{
  return self->_transactionAuthor;
}

- (void)setTransactionAuthor:(NSString *)transactionAuthor
{
  objc_setProperty_nonatomic_copy(self, a2, transactionAuthor, 224);
}

- (BOOL)shouldRefetchContacts
{
  return self->_shouldRefetchContacts;
}

- (void)setShouldRefetchContacts:(BOOL)shouldRefetchContacts
{
  self->_shouldRefetchContacts = shouldRefetchContacts;
}

- (NSArray)addedAccounts
{
  return &self->_addedAccounts->super;
}

- (NSArray)removedAccounts
{
  return &self->_removedAccounts->super;
}

- (NSArray)linkRequests
{
  return &self->_linkRequests->super;
}

- (CNSaveRequestDelegate)delegate
{
  return (CNSaveRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)saveRequestIdentifier
{
  return self->_saveRequestIdentifier;
}

- (NSDictionary)deletedContactsByIdentifier
{
  return &self->_deletedContactsByIdentifier->super;
}

- (BOOL)ignoresGuardianRestrictions
{
  return self->_ignoresGuardianRestrictions;
}

- (void)setIgnoresGuardianRestrictions:(BOOL)a3
{
  self->_ignoresGuardianRestrictions = a3;
}

- (BOOL)ignoresContactProviderRestrictions
{
  return self->_ignoresContactProviderRestrictions;
}

- (void)setIgnoresContactProviderRestrictions:(BOOL)a3
{
  self->_ignoresContactProviderRestrictions = a3;
}

- (BOOL)suppressChangeNotifications
{
  return self->_suppressChangeNotifications;
}

- (void)setSuppressChangeNotifications:(BOOL)a3
{
  self->_suppressChangeNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveRequestIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transactionAuthor, 0);
  objc_storeStrong((id *)&self->_parentRecordsByIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredForImageRequests, 0);
  objc_storeStrong((id *)&self->_preferredForNameRequests, 0);
  objc_storeStrong((id *)&self->_unlinkRequests, 0);
  objc_storeStrong((id *)&self->_linkRequests, 0);
  objc_storeStrong((id *)&self->_removedAccounts, 0);
  objc_storeStrong((id *)&self->_addedAccounts, 0);
  objc_storeStrong((id *)&self->_contactChangeRequests, 0);
  objc_storeStrong((id *)&self->_defaultAccountContainersByIdentifier, 0);
  objc_storeStrong((id *)&self->_addedAccountContainersByIdentifier, 0);
  objc_storeStrong((id *)&self->_movedContainersByIdentifier, 0);
  objc_storeStrong((id *)&self->_deletedContainersByIdentifier, 0);
  objc_storeStrong((id *)&self->_updatedContainers, 0);
  objc_storeStrong((id *)&self->_addedContainersByIdentifier, 0);
  objc_storeStrong((id *)&self->_removedSubgroupsByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_addedSubgroupsByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_removedMembersByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_addedMembersByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_deletedGroupsByIdentifier, 0);
  objc_storeStrong((id *)&self->_updatedGroups, 0);
  objc_storeStrong((id *)&self->_addedGroupsByIdentifier, 0);
  objc_storeStrong((id *)&self->_meCardIdentifier, 0);
  objc_storeStrong((id *)&self->_deletedContacts, 0);
  objc_storeStrong((id *)&self->_deletedContactsByIdentifier, 0);
  objc_storeStrong((id *)&self->_updatedContacts, 0);
  objc_storeStrong((id *)&self->_addedContactsByIdentifier, 0);
}

- (void)setLinkIdentifier:(id)a3 forContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7 && objc_msgSend(v6, "length"))
  {
    if (objc_msgSend(v7, "isUnified"))
    {
      objc_msgSend(v7, "linkedContacts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v9;
    }
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactChangeRequest contactChangeRequestWithKind:contacts:linkIdentifier:](CNContactChangeRequest, "contactChangeRequestWithKind:contacts:linkIdentifier:", 4, v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObject:](self->_contactChangeRequests, "addObject:", v11);
  }

}

- (void)addContact:(void *)a1 toContainerWithIdentifier:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_1_0();
  v4 = OUTLINED_FUNCTION_1_5(v3);
  OUTLINED_FUNCTION_0_4(&dword_18F8BD000, v5, v6, "parameter ‘containerIdentifier’ must be of type %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

- (void)addContact:(void *)a1 toContainerWithIdentifier:.cold.2(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_1_0();
  v4 = OUTLINED_FUNCTION_1_5(v3);
  OUTLINED_FUNCTION_0_4(&dword_18F8BD000, v5, v6, "parameter ‘contact’ must be nonnull and of type %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

- (void)addGroup:(void *)a1 toContainerWithIdentifier:.cold.2(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_1_0();
  v4 = OUTLINED_FUNCTION_1_5(v3);
  OUTLINED_FUNCTION_0_4(&dword_18F8BD000, v5, v6, "parameter ‘group’ must be nonnull and of type %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

- (void)addMember:(void *)a1 toGroup:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_1_0();
  v4 = OUTLINED_FUNCTION_1_5(v3);
  OUTLINED_FUNCTION_0_4(&dword_18F8BD000, v5, v6, "parameter ‘group’ must be nonnull and of type %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

- (void)addMember:(void *)a1 toGroup:.cold.2(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_1_0();
  v4 = OUTLINED_FUNCTION_1_5(v3);
  OUTLINED_FUNCTION_0_4(&dword_18F8BD000, v5, v6, "parameter ‘contact’ must be nonnull and of type %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

- (void)addSubgroup:(void *)a1 toGroup:.cold.2(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_1_0();
  v4 = OUTLINED_FUNCTION_1_5(v3);
  OUTLINED_FUNCTION_0_4(&dword_18F8BD000, v5, v6, "parameter ‘subgroup’ must be nonnull and of type %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

@end
