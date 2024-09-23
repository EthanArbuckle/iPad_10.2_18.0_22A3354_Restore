@implementation ICMentionsFilterTypeSelection

- (NSString)currentUserID
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ICFilterTypeSelection accountObjectID](self, "accountObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (NSString *)0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__60;
  v12 = __Block_byref_object_dispose__60;
  v13 = 0;
  -[ICParticipantsFilterTypeSelection managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ICMentionsFilterTypeSelection_currentUserID__block_invoke;
  v7[3] = &unk_1E76C76B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __46__ICMentionsFilterTypeSelection_currentUserID__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "userRecordName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)summaryWithJoinOperatorMenu
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Show notes mentioning INLINE_MENU_PLEASE_READ_COMMENTS selected people."), CFSTR("Show notes mentioning INLINE_MENU_PLEASE_READ_COMMENTS selected people."), 0, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICMentionsFilterTypeSelection *v5;
  void *v6;
  void *v7;
  ICMentionsFilterTypeSelection *v8;
  void *v9;
  void *v10;

  v5 = +[ICMentionsFilterTypeSelection allocWithZone:](ICMentionsFilterTypeSelection, "allocWithZone:");
  -[ICParticipantsFilterTypeSelection managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFilterTypeSelection accountObjectID](self, "accountObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICParticipantsFilterTypeSelection initWithManagedObjectContext:accountObjectID:](v5, "initWithManagedObjectContext:accountObjectID:", v6, v7);

  -[ICParticipantsFilterTypeSelection setSelectionType:](v8, "setSelectionType:", -[ICParticipantsFilterTypeSelection selectionType](self, "selectionType"));
  -[ICParticipantsFilterTypeSelection setJoinOperator:](v8, "setJoinOperator:", -[ICParticipantsFilterTypeSelection joinOperator](self, "joinOperator"));
  -[ICParticipantsFilterTypeSelection participantUserIDs](self, "participantUserIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  -[ICParticipantsFilterTypeSelection setParticipantUserIDs:](v8, "setParticipantUserIDs:", v10);

  return v8;
}

- (int64_t)filterType
{
  return 4;
}

- (id)filterName
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Mentions"), CFSTR("Mentions"), 0, 1);
}

- (id)emptySummaryTitle
{
  void *v2;

  if (-[ICParticipantsFilterTypeSelection isEmpty](self, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Mentions Filter Incomplete"), CFSTR("Mentions Filter Incomplete"), 0, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)emptySummary
{
  void *v2;

  if (-[ICParticipantsFilterTypeSelection isEmpty](self, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("You must select at least one person that you share a note with for the Mentions filter."), CFSTR("You must select at least one person that you share a note with for the Mentions filter."), 0, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)shortEmptySummary
{
  void *v2;

  if (-[ICParticipantsFilterTypeSelection isEmpty](self, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Person for the Mentions filter"), CFSTR("Person for the Mentions filter"), 0, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
