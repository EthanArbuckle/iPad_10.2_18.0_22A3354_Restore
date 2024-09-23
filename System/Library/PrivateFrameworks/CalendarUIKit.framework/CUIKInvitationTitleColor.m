@implementation CUIKInvitationTitleColor

void __CUIKInvitationTitleColor_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0DC3658];
  CUIKBundle();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("calendarInvitationTitleColor"), v3, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CUIKInvitationTitleColor_sInvitationTitleColor;
  CUIKInvitationTitleColor_sInvitationTitleColor = v1;

}

@end
