@implementation _EARAlignmentState

- (void)incrementInsertions
{
  ++self->_numberOfInsertions;
}

- (void)incrementDeletions
{
  ++self->_numberOfDeletions;
}

- (void)incrementSubstitutions
{
  ++self->_numberOfSubstitutions;
}

- (void)incrementCost
{
  ++self->_totalCost;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _EARAlignmentState *v4;

  v4 = -[_EARAlignmentState init](+[_EARAlignmentState allocWithZone:](_EARAlignmentState, "allocWithZone:", a3), "init");
  -[_EARAlignmentState setNumberOfInsertions:](v4, "setNumberOfInsertions:", -[_EARAlignmentState numberOfInsertions](self, "numberOfInsertions"));
  -[_EARAlignmentState setNumberOfSubstitutions:](v4, "setNumberOfSubstitutions:", -[_EARAlignmentState numberOfSubstitutions](self, "numberOfSubstitutions"));
  -[_EARAlignmentState setNumberOfDeletions:](v4, "setNumberOfDeletions:", -[_EARAlignmentState numberOfDeletions](self, "numberOfDeletions"));
  -[_EARAlignmentState setTotalCost:](v4, "setTotalCost:", -[_EARAlignmentState totalCost](self, "totalCost"));
  return v4;
}

- (int64_t)numberOfInsertions
{
  return self->_numberOfInsertions;
}

- (void)setNumberOfInsertions:(int64_t)a3
{
  self->_numberOfInsertions = a3;
}

- (int64_t)numberOfDeletions
{
  return self->_numberOfDeletions;
}

- (void)setNumberOfDeletions:(int64_t)a3
{
  self->_numberOfDeletions = a3;
}

- (int64_t)numberOfSubstitutions
{
  return self->_numberOfSubstitutions;
}

- (void)setNumberOfSubstitutions:(int64_t)a3
{
  self->_numberOfSubstitutions = a3;
}

- (int64_t)totalCost
{
  return self->_totalCost;
}

- (void)setTotalCost:(int64_t)a3
{
  self->_totalCost = a3;
}

@end
