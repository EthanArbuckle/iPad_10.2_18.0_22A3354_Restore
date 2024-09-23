@implementation ATXComplicationSuggestionHeuristicsCache

- (unint64_t)numBluetoothConnectionsOverLastWeek
{
  return self->_numBluetoothConnectionsOverLastWeek;
}

- (void)setNumBluetoothConnectionsOverLastWeek:(unint64_t)a3
{
  self->_numBluetoothConnectionsOverLastWeek = a3;
}

- (unint64_t)numCalendarEventsOverLastAndNextWeek
{
  return self->_numCalendarEventsOverLastAndNextWeek;
}

- (void)setNumCalendarEventsOverLastAndNextWeek:(unint64_t)a3
{
  self->_numCalendarEventsOverLastAndNextWeek = a3;
}

- (unint64_t)numRemindersOverLastWeek
{
  return self->_numRemindersOverLastWeek;
}

- (void)setNumRemindersOverLastWeek:(unint64_t)a3
{
  self->_numRemindersOverLastWeek = a3;
}

@end
