@implementation EKCalendarCancelValidationEditItem

- (unint64_t)numberOfSubitems
{
  return -[EKCalendarCancelValidationEditItem hidden](self, "hidden") ^ 1;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

@end
