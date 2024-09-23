@implementation EKUIInviteesViewOriginalConflictCell

- (id)participantsTextColor
{
  if (-[EKUIInviteesViewOriginalConflictCell conflict](self, "conflict"))
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)timeTextColor
{
  if (-[EKUIInviteesViewOriginalConflictCell conflict](self, "conflict"))
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)conflict
{
  return self->_conflict;
}

- (void)setConflict:(BOOL)a3
{
  self->_conflict = a3;
}

@end
