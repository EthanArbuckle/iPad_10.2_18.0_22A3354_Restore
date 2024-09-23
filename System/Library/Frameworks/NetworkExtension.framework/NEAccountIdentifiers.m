@implementation NEAccountIdentifiers

- (NSArray)mailAccountIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMailAccountIdentifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSArray)calendarAccountIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCalendarAccountIdentifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)contactsAccountIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContactsAccountIdentifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_calendarAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_mailAccountIdentifiers, 0);
}

@end
