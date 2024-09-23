@implementation CNSaveRequestVisitationTask

- (CNSaveRequestVisitationTask)initWithSaveRequest:(id)a3 visitor:(id)a4 factory:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNSaveRequestVisitationTask *v12;
  CNSaveRequestVisitationTask *v13;
  CNSaveRequestVisitationTask *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNSaveRequestVisitationTask;
  v12 = -[CNTask init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_saveRequest, a3);
    objc_storeStrong((id *)&v13->_visitor, a4);
    objc_storeStrong((id *)&v13->_factory, a5);
    v14 = v13;
  }

  return v13;
}

- (id)run:(id *)a3
{
  -[CNSaveRequestVisitationTask sendAddedContactEvents](self, "sendAddedContactEvents", a3);
  -[CNSaveRequestVisitationTask sendUpdatedContactEvents](self, "sendUpdatedContactEvents");
  -[CNSaveRequestVisitationTask sendDeletedContactEvents](self, "sendDeletedContactEvents");
  -[CNSaveRequestVisitationTask sendAddedGroupEvents](self, "sendAddedGroupEvents");
  -[CNSaveRequestVisitationTask sendUpdatedGroupEvents](self, "sendUpdatedGroupEvents");
  -[CNSaveRequestVisitationTask sendDeletedGroupEvents](self, "sendDeletedGroupEvents");
  -[CNSaveRequestVisitationTask sendAddMemberToGroupEvents](self, "sendAddMemberToGroupEvents");
  -[CNSaveRequestVisitationTask sendRemoveMemberFromGroupEvents](self, "sendRemoveMemberFromGroupEvents");
  -[CNSaveRequestVisitationTask sendAddSubgroupToGroupEvents](self, "sendAddSubgroupToGroupEvents");
  -[CNSaveRequestVisitationTask sendRemoveSubgroupFromGroupEvents](self, "sendRemoveSubgroupFromGroupEvents");
  -[CNSaveRequestVisitationTask sendLinkContactsEvents](self, "sendLinkContactsEvents");
  -[CNSaveRequestVisitationTask sendUnlinkContactEvents](self, "sendUnlinkContactEvents");
  -[CNSaveRequestVisitationTask sendPreferredContactForNameEvents](self, "sendPreferredContactForNameEvents");
  -[CNSaveRequestVisitationTask sendPreferredContactForImageEvents](self, "sendPreferredContactForImageEvents");
  -[CNSaveRequestVisitationTask sendDifferentMeCardEvent](self, "sendDifferentMeCardEvent");
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
}

- (void)sendAddedContactEvents
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__CNSaveRequestVisitationTask_sendAddedContactEvents__block_invoke;
    v4[3] = &unk_1E29FC180;
    v4[4] = self;
    -[CNSaveRequest withEachAddedContact:](saveRequest, "withEachAddedContact:", v4);
  }
}

void __53__CNSaveRequestVisitationTask_sendAddedContactEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addContactEventWithContact:containerIdentifier:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitAddContactEvent:", v4);

}

- (void)sendUpdatedContactEvents
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__CNSaveRequestVisitationTask_sendUpdatedContactEvents__block_invoke;
    v4[3] = &unk_1E29FC1A8;
    v4[4] = self;
    -[CNSaveRequest withEachUpdatedContact:](saveRequest, "withEachUpdatedContact:", v4);
  }
}

void __55__CNSaveRequestVisitationTask_sendUpdatedContactEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "updateContactEventWithContact:imagesChanged:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitUpdateContactEvent:", v3);

}

- (void)sendDeletedContactEvents
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__CNSaveRequestVisitationTask_sendDeletedContactEvents__block_invoke;
    v4[3] = &unk_1E29FC1D0;
    v4[4] = self;
    -[CNSaveRequest withEachDeletedContact:](saveRequest, "withEachDeletedContact:", v4);
  }
}

void __55__CNSaveRequestVisitationTask_sendDeletedContactEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "deleteContactEventWithContactIdentifier:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitDeleteContactEvent:", v3);

}

- (void)sendAddedGroupEvents
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__CNSaveRequestVisitationTask_sendAddedGroupEvents__block_invoke;
    v4[3] = &unk_1E29FC1F8;
    v4[4] = self;
    -[CNSaveRequest withEachAddedGroup:](saveRequest, "withEachAddedGroup:", v4);
  }
}

void __51__CNSaveRequestVisitationTask_sendAddedGroupEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addGroupEventWithGroup:containerIdentifier:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitAddGroupEvent:", v4);

}

- (void)sendUpdatedGroupEvents
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__CNSaveRequestVisitationTask_sendUpdatedGroupEvents__block_invoke;
    v4[3] = &unk_1E29FC220;
    v4[4] = self;
    -[CNSaveRequest withEachUpdatedGroup:](saveRequest, "withEachUpdatedGroup:", v4);
  }
}

void __53__CNSaveRequestVisitationTask_sendUpdatedGroupEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "updateGroupEventWithGroup:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitUpdateGroupEvent:", v3);

}

- (void)sendDeletedGroupEvents
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__CNSaveRequestVisitationTask_sendDeletedGroupEvents__block_invoke;
    v4[3] = &unk_1E29FC1D0;
    v4[4] = self;
    -[CNSaveRequest withEachDeletedGroup:](saveRequest, "withEachDeletedGroup:", v4);
  }
}

void __53__CNSaveRequestVisitationTask_sendDeletedGroupEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "deleteGroupEventWithGroupIdentifier:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitDeleteGroupEvent:", v3);

}

- (void)sendAddMemberToGroupEvents
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57__CNSaveRequestVisitationTask_sendAddMemberToGroupEvents__block_invoke;
    v4[3] = &unk_1E29FC248;
    v4[4] = self;
    -[CNSaveRequest withEachMemberAddedToGroup:](saveRequest, "withEachMemberAddedToGroup:", v4);
  }
}

void __57__CNSaveRequestVisitationTask_sendAddMemberToGroupEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addMemberToGroupEventWithMember:group:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitAddMemberToGroupEvent:", v4);

}

- (void)sendRemoveMemberFromGroupEvents
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__CNSaveRequestVisitationTask_sendRemoveMemberFromGroupEvents__block_invoke;
    v4[3] = &unk_1E29FC248;
    v4[4] = self;
    -[CNSaveRequest withEachMemberRemovedFromGroup:](saveRequest, "withEachMemberRemovedFromGroup:", v4);
  }
}

void __62__CNSaveRequestVisitationTask_sendRemoveMemberFromGroupEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeMemberFromGroupEventWithMember:group:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitRemoveMemberFromGroupEvent:", v4);

}

- (void)sendAddSubgroupToGroupEvents
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__CNSaveRequestVisitationTask_sendAddSubgroupToGroupEvents__block_invoke;
    v4[3] = &unk_1E29FC270;
    v4[4] = self;
    -[CNSaveRequest withEachSubgroupAddedToGroup:](saveRequest, "withEachSubgroupAddedToGroup:", v4);
  }
}

void __59__CNSaveRequestVisitationTask_sendAddSubgroupToGroupEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addSubgroupToGroupEventWithSubgroup:group:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitAddSubgroupToGroupEvent:", v4);

}

- (void)sendRemoveSubgroupFromGroupEvents
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __64__CNSaveRequestVisitationTask_sendRemoveSubgroupFromGroupEvents__block_invoke;
    v4[3] = &unk_1E29FC270;
    v4[4] = self;
    -[CNSaveRequest withEachSubgroupRemovedFromGroup:](saveRequest, "withEachSubgroupRemovedFromGroup:", v4);
  }
}

void __64__CNSaveRequestVisitationTask_sendRemoveSubgroupFromGroupEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeSubgroupFromGroupEventWithSubgroup:group:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitRemoveSubgroupFromGroupEvent:", v4);

}

- (void)sendLinkContactsEvents
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__CNSaveRequestVisitationTask_sendLinkContactsEvents__block_invoke;
    v4[3] = &unk_1E29FC298;
    v4[4] = self;
    -[CNSaveRequest withEachLinkedContact:](saveRequest, "withEachLinkedContact:", v4);
  }
}

void __53__CNSaveRequestVisitationTask_sendLinkContactsEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "linkContactsEventWithFromContact:toContact:unifiedContact:", a2, a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitLinkContactsEvent:", v4);

}

- (void)sendUnlinkContactEvents
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __54__CNSaveRequestVisitationTask_sendUnlinkContactEvents__block_invoke;
    v4[3] = &unk_1E29FC1A8;
    v4[4] = self;
    -[CNSaveRequest withEachUnlinkedContact:](saveRequest, "withEachUnlinkedContact:", v4);
  }
}

void __54__CNSaveRequestVisitationTask_sendUnlinkContactEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "unlinkContactEventWithContact:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitUnlinkContactEvent:", v3);

}

- (void)sendPreferredContactForNameEvents
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  objc_opt_respondsToSelector();
  saveRequest = self->_saveRequest;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__CNSaveRequestVisitationTask_sendPreferredContactForNameEvents__block_invoke;
  v4[3] = &unk_1E29FC298;
  v4[4] = self;
  -[CNSaveRequest withEachContactPreferredForName:](saveRequest, "withEachContactPreferredForName:", v4);
}

void __64__CNSaveRequestVisitationTask_sendPreferredContactForNameEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "preferredContactForNameEventWithPreferredContact:unifiedContact:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitPreferredContactForNameEvent:", v4);

}

- (void)sendPreferredContactForImageEvents
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __65__CNSaveRequestVisitationTask_sendPreferredContactForImageEvents__block_invoke;
    v4[3] = &unk_1E29FC298;
    v4[4] = self;
    -[CNSaveRequest withEachContactPreferredForImage:](saveRequest, "withEachContactPreferredForImage:", v4);
  }
}

void __65__CNSaveRequestVisitationTask_sendPreferredContactForImageEvents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "preferredContactForImageEventWithPreferredContact:unifiedContact:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitPreferredContactForImageEvent:", v4);

}

- (void)sendDifferentMeCardEvent
{
  CNSaveRequest *saveRequest;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    saveRequest = self->_saveRequest;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__CNSaveRequestVisitationTask_sendDifferentMeCardEvent__block_invoke;
    v4[3] = &unk_1E29FC1D0;
    v4[4] = self;
    -[CNSaveRequest withDifferentMeCard:](saveRequest, "withDifferentMeCard:", v4);
  }
}

void __55__CNSaveRequestVisitationTask_sendDifferentMeCardEvent__block_invoke(uint64_t a1, const __CFString *a2)
{
  void *v3;
  const __CFString *v4;
  id v5;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (a2)
    v4 = a2;
  else
    v4 = &stru_1E29FF900;
  objc_msgSend(v3, "differentMeCardEventWithContactIdentifier:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "visitDifferentMeCardEvent:", v5);

}

- (CNSaveRequest)saveRequest
{
  return (CNSaveRequest *)objc_getProperty(self, a2, 24, 1);
}

- (CNChangeHistoryEventVisitorPrivate)visitor
{
  return (CNChangeHistoryEventVisitorPrivate *)objc_getProperty(self, a2, 32, 1);
}

- (CNChangeHistoryEventFactory)factory
{
  return (CNChangeHistoryEventFactory *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_visitor, 0);
  objc_storeStrong((id *)&self->_saveRequest, 0);
}

@end
