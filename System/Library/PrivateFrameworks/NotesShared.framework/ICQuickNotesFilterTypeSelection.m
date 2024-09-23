@implementation ICQuickNotesFilterTypeSelection

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ICInclusionFilterTypeSelection initWithInclusionType:](+[ICQuickNotesFilterTypeSelection allocWithZone:](ICQuickNotesFilterTypeSelection, "allocWithZone:", a3), "initWithInclusionType:", -[ICInclusionFilterTypeSelection inclusionType](self, "inclusionType"));
}

- (int64_t)filterType
{
  return 8;
}

- (id)filterName
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Quick Notes"), CFSTR("Quick Notes"), 0, 1);
}

@end
