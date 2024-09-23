@implementation _CDPSimpleDataPoint

- (BOOL)userIsSender
{
  return self->_userIsSender;
}

- (void)setUserIsSender:(BOOL)a3
{
  self->_userIsSender = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSArray)peopleIdentifiers
{
  return self->_peopleIdentifiers;
}

- (void)setPeopleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_peopleIdentifiers, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)userIsThreadInitiator
{
  return self->_userIsThreadInitiator;
}

- (void)setUserIsThreadInitiator:(BOOL)a3
{
  self->_userIsThreadInitiator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_peopleIdentifiers, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
