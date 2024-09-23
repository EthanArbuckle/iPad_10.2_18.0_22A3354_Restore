@implementation CNChangeHistoryEventFactory

- (id)dropEverythingEvent
{
  return objc_alloc_init(CNChangeHistoryDropEverythingEvent);
}

- (id)addContactEventWithContact:(id)a3 containerIdentifier:(id)a4
{
  id v5;
  id v6;
  CNChangeHistoryAddContactEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNChangeHistoryAddContactEvent initWithContact:containerIdentifier:]([CNChangeHistoryAddContactEvent alloc], "initWithContact:containerIdentifier:", v6, v5);

  return v7;
}

- (id)addContactEventWithContactIdentifier:(id)a3 containerIdentifier:(id)a4
{
  id v5;
  id v6;
  CNChangeHistoryAddContactEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNChangeHistoryAddContactEvent initWithContactIdentifier:containerIdentifier:]([CNChangeHistoryAddContactEvent alloc], "initWithContactIdentifier:containerIdentifier:", v6, v5);

  return v7;
}

- (id)updateContactEventWithContact:(id)a3 imagesChanged:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  CNChangeHistoryUpdateContactEvent *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[CNChangeHistoryUpdateContactEvent initWithContact:imagesChanged:]([CNChangeHistoryUpdateContactEvent alloc], "initWithContact:imagesChanged:", v5, v4);

  return v6;
}

- (id)updateContactEventWithContactIdentifier:(id)a3 imagesChanged:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  CNChangeHistoryUpdateContactEvent *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[CNChangeHistoryUpdateContactEvent initWithContactIdentifier:imagesChanged:]([CNChangeHistoryUpdateContactEvent alloc], "initWithContactIdentifier:imagesChanged:", v5, v4);

  return v6;
}

- (id)deleteContactEventWithContactIdentifier:(id)a3
{
  id v3;
  CNChangeHistoryDeleteContactEvent *v4;

  v3 = a3;
  v4 = -[CNChangeHistoryDeleteContactEvent initWithContactIdentifier:]([CNChangeHistoryDeleteContactEvent alloc], "initWithContactIdentifier:", v3);

  return v4;
}

- (id)deleteContactEventWithContactIdentifier:(id)a3 externalURI:(id)a4 externalModificationTag:(id)a5
{
  id v7;
  id v8;
  id v9;
  CNChangeHistoryDeleteContactEvent *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CNChangeHistoryDeleteContactEvent initWithContactIdentifier:externalURI:externalModificationTag:]([CNChangeHistoryDeleteContactEvent alloc], "initWithContactIdentifier:externalURI:externalModificationTag:", v9, v8, v7);

  return v10;
}

- (id)addGroupEventWithGroup:(id)a3 containerIdentifier:(id)a4
{
  id v5;
  id v6;
  CNChangeHistoryAddGroupEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNChangeHistoryAddGroupEvent initWithGroup:containerIdentifier:]([CNChangeHistoryAddGroupEvent alloc], "initWithGroup:containerIdentifier:", v6, v5);

  return v7;
}

- (id)updateGroupEventWithGroup:(id)a3
{
  id v3;
  CNChangeHistoryUpdateGroupEvent *v4;

  v3 = a3;
  v4 = -[CNChangeHistoryUpdateGroupEvent initWithGroup:]([CNChangeHistoryUpdateGroupEvent alloc], "initWithGroup:", v3);

  return v4;
}

- (id)deleteGroupEventWithGroupIdentifier:(id)a3
{
  id v3;
  CNChangeHistoryDeleteGroupEvent *v4;

  v3 = a3;
  v4 = -[CNChangeHistoryDeleteGroupEvent initWithGroupIdentifier:]([CNChangeHistoryDeleteGroupEvent alloc], "initWithGroupIdentifier:", v3);

  return v4;
}

- (id)deleteGroupEventWithGroupIdentifier:(id)a3 externalURI:(id)a4 externalModificationTag:(id)a5
{
  id v7;
  id v8;
  id v9;
  CNChangeHistoryDeleteGroupEvent *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CNChangeHistoryDeleteGroupEvent initWithGroupIdentifier:externalURI:externalModificationTag:]([CNChangeHistoryDeleteGroupEvent alloc], "initWithGroupIdentifier:externalURI:externalModificationTag:", v9, v8, v7);

  return v10;
}

- (id)addMemberToGroupEventWithMember:(id)a3 group:(id)a4
{
  id v5;
  id v6;
  CNChangeHistoryAddMemberToGroupEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNChangeHistoryAddMemberToGroupEvent initWithMember:group:]([CNChangeHistoryAddMemberToGroupEvent alloc], "initWithMember:group:", v6, v5);

  return v7;
}

- (id)removeMemberFromGroupEventWithMember:(id)a3 group:(id)a4
{
  id v5;
  id v6;
  CNChangeHistoryRemoveMemberFromGroupEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNChangeHistoryRemoveMemberFromGroupEvent initWithMember:group:]([CNChangeHistoryRemoveMemberFromGroupEvent alloc], "initWithMember:group:", v6, v5);

  return v7;
}

- (id)addSubgroupToGroupEventWithSubgroup:(id)a3 group:(id)a4
{
  id v5;
  id v6;
  CNChangeHistoryAddSubgroupToGroupEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNChangeHistoryAddSubgroupToGroupEvent initWithSubgroup:group:]([CNChangeHistoryAddSubgroupToGroupEvent alloc], "initWithSubgroup:group:", v6, v5);

  return v7;
}

- (id)removeSubgroupFromGroupEventWithSubgroup:(id)a3 group:(id)a4
{
  id v5;
  id v6;
  CNChangeHistoryRemoveSubgroupFromGroupEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNChangeHistoryRemoveSubgroupFromGroupEvent initWithSubgroup:group:]([CNChangeHistoryRemoveSubgroupFromGroupEvent alloc], "initWithSubgroup:group:", v6, v5);

  return v7;
}

- (id)linkContactsEventWithFromContact:(id)a3 toContact:(id)a4 unifiedContact:(id)a5
{
  id v7;
  id v8;
  id v9;
  CNChangeHistoryLinkContactsEvent *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CNChangeHistoryLinkContactsEvent initWithFromContact:toContact:unifiedContact:]([CNChangeHistoryLinkContactsEvent alloc], "initWithFromContact:toContact:unifiedContact:", v9, v8, v7);

  return v10;
}

- (id)unlinkContactEventWithContact:(id)a3
{
  id v3;
  CNChangeHistoryUnlinkContactEvent *v4;

  v3 = a3;
  v4 = -[CNChangeHistoryUnlinkContactEvent initWithContact:]([CNChangeHistoryUnlinkContactEvent alloc], "initWithContact:", v3);

  return v4;
}

- (id)preferredContactForNameEventWithPreferredContact:(id)a3 unifiedContact:(id)a4
{
  id v5;
  id v6;
  CNChangeHistoryPreferredContactForNameEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNChangeHistoryPreferredContactForNameEvent initWithPreferredContact:unifiedContact:]([CNChangeHistoryPreferredContactForNameEvent alloc], "initWithPreferredContact:unifiedContact:", v6, v5);

  return v7;
}

- (id)preferredContactForImageEventWithPreferredContact:(id)a3 unifiedContact:(id)a4
{
  id v5;
  id v6;
  CNChangeHistoryPreferredContactForImageEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNChangeHistoryPreferredContactForImageEvent initWithPreferredContact:unifiedContact:]([CNChangeHistoryPreferredContactForImageEvent alloc], "initWithPreferredContact:unifiedContact:", v6, v5);

  return v7;
}

- (id)differentMeCardEventWithContactIdentifier:(id)a3
{
  id v3;
  CNChangeHistoryDifferentMeCardEvent *v4;

  v3 = a3;
  v4 = -[CNChangeHistoryDifferentMeCardEvent initWithContactIdentifier:]([CNChangeHistoryDifferentMeCardEvent alloc], "initWithContactIdentifier:", v3);

  return v4;
}

@end
