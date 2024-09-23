@implementation ICDateEditedFilterTypeSelection

- (id)copyWithZone:(_NSZone *)a3
{
  ICDateEditedFilterTypeSelection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[ICDateFilterTypeSelection initWithSelectionType:](+[ICDateEditedFilterTypeSelection allocWithZone:](ICDateEditedFilterTypeSelection, "allocWithZone:"), "initWithSelectionType:", -[ICDateFilterTypeSelection selectionType](self, "selectionType"));
  -[ICDateFilterTypeSelection primaryDate](self, "primaryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDateFilterTypeSelection setPrimaryDate:](v5, "setPrimaryDate:", v6);

  -[ICDateFilterTypeSelection secondaryDate](self, "secondaryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDateFilterTypeSelection setSecondaryDate:](v5, "setSecondaryDate:", v7);

  -[ICDateFilterTypeSelection setRelativeRangeSelectionType:](v5, "setRelativeRangeSelectionType:", -[ICDateFilterTypeSelection relativeRangeSelectionType](self, "relativeRangeSelectionType"));
  -[ICDateFilterTypeSelection relativeRangeAmount](self, "relativeRangeAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[ICDateFilterTypeSelection setRelativeRangeAmount:](v5, "setRelativeRangeAmount:", v9);

  return v5;
}

- (int64_t)filterType
{
  return 2;
}

- (id)filterName
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Date Edited"), CFSTR("Date Edited"), 0, 1);
}

- (id)emptySummaryTitle
{
  void *v3;

  if (-[ICDateFilterTypeSelection isEmpty](self, "isEmpty")
    && -[ICDateFilterTypeSelection selectionType](self, "selectionType") == 7)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Date Edited Filter Incomplete"), CFSTR("Date Edited Filter Incomplete"), 0, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)emptySummary
{
  void *v3;

  if (-[ICDateFilterTypeSelection isEmpty](self, "isEmpty")
    && -[ICDateFilterTypeSelection selectionType](self, "selectionType") == 7)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("You must enter a relative range number for the Date Edited filter."), CFSTR("You must enter a relative range number for the Date Edited filter."), 0, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)shortEmptySummary
{
  void *v3;

  if (-[ICDateFilterTypeSelection isEmpty](self, "isEmpty")
    && -[ICDateFilterTypeSelection selectionType](self, "selectionType") == 7)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Number for the Date Edited filter"), CFSTR("Number for the Date Edited filter"), 0, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
