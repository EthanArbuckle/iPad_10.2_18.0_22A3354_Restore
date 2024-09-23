@implementation EKUIInviteesViewProposedTimeCell

- (id)participantsTextColor
{
  if (-[EKUIInviteesViewProposedTimeCell conflicts](self, "conflicts"))
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)conflicts
{
  return self->_conflicts;
}

- (void)setConflicts:(BOOL)a3
{
  self->_conflicts = a3;
}

@end
