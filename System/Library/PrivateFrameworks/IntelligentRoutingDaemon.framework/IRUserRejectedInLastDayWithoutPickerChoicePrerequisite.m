@implementation IRUserRejectedInLastDayWithoutPickerChoicePrerequisite

- (NSArray)filteredHistoryEvents
{
  return self->_filteredHistoryEvents;
}

- (void)setFilteredHistoryEvents:(id)a3
{
  objc_storeStrong((id *)&self->_filteredHistoryEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredHistoryEvents, 0);
}

@end
