@implementation EKUIInviteesViewAllInviteesCanAttendCell

- (id)timeTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (id)participantsTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

@end
