@implementation ICPinnedNotesFilterTypeSelection

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ICInclusionFilterTypeSelection initWithInclusionType:](+[ICPinnedNotesFilterTypeSelection allocWithZone:](ICPinnedNotesFilterTypeSelection, "allocWithZone:", a3), "initWithInclusionType:", -[ICInclusionFilterTypeSelection inclusionType](self, "inclusionType"));
}

- (int64_t)filterType
{
  return 9;
}

- (id)filterName
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Pinned Notes"), CFSTR("Pinned Notes"), 0, 1);
}

@end
