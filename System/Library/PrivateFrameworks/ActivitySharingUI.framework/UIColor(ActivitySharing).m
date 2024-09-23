@implementation UIColor(ActivitySharing)

+ (uint64_t)as_lightCompetitionGold
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.866666667, 0.756862745, 0.450980392, 1.0);
}

+ (uint64_t)as_darkCompetitionGold
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.62745098, 0.564705882, 0.360784314, 1.0);
}

+ (uint64_t)as_brightCompetitionGold
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.878431373, 0.470588235, 1.0);
}

+ (id)as_competitionFriendListPlatterGold
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEBD4B8], "as_darkCompetitionGold");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.12);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)as_competitionNotificationPlatterGold
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEBD4B8], "as_lightCompetitionGold");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.18);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)as_competitionNotificationAccentGold
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEBD4B8], "as_lightCompetitionGold");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)as_competitionButtonGold
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEBD4B8], "as_lightCompetitionGold");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)as_competitionGraphBackgroundGold
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEBD4B8], "as_darkCompetitionGold");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)as_colorForParticipant:()ActivitySharing competition:
{
  if (objc_msgSend(a4, "isParticipantWinning:"))
    objc_msgSend(MEMORY[0x24BEBD4B8], "as_lightCompetitionGold");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "as_darkCompetitionGold");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
