@implementation ICSharedFilterTypeSelection

- (id)copyWithZone:(_NSZone *)a3
{
  ICSharedFilterTypeSelection *v5;
  void *v6;
  void *v7;
  ICSharedFilterTypeSelection *v8;
  void *v9;
  void *v10;

  v5 = +[ICSharedFilterTypeSelection allocWithZone:](ICSharedFilterTypeSelection, "allocWithZone:");
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
  return 3;
}

- (id)filterName
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared"), CFSTR("Shared"), 0, 1);
}

- (id)emptySummaryTitle
{
  void *v2;

  if (-[ICParticipantsFilterTypeSelection isEmpty](self, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared Filter Incomplete"), CFSTR("Shared Filter Incomplete"), 0, 1);
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
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("You must select at least one person that you share a note with for the Shared filter."), CFSTR("You must select at least one person that you share a note with for the Shared filter."), 0, 1);
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
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Person for the Shared filter"), CFSTR("Person for the Shared filter"), 0, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
