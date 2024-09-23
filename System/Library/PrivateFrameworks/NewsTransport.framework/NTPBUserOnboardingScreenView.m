@implementation NTPBUserOnboardingScreenView

- (int)onboardingScreenType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_onboardingScreenType;
  else
    return 0;
}

- (void)setOnboardingScreenType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_onboardingScreenType = a3;
}

- (void)setHasOnboardingScreenType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOnboardingScreenType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasReferringSourceApplication
{
  return self->_referringSourceApplication != 0;
}

- (BOOL)hasReferringUrl
{
  return self->_referringUrl != 0;
}

- (BOOL)hasUserActivityType
{
  return self->_userActivityType != 0;
}

- (int)userAction
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_userAction;
  else
    return 0;
}

- (void)setUserAction:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUserAction
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setCountOfNotificationsSelected:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_countOfNotificationsSelected = a3;
}

- (void)setHasCountOfNotificationsSelected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCountOfNotificationsSelected
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)previouslyCompletedOnboardingOsVersion
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_previouslyCompletedOnboardingOsVersion;
  else
    return 0;
}

- (void)setPreviouslyCompletedOnboardingOsVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_previouslyCompletedOnboardingOsVersion = a3;
}

- (void)setHasPreviouslyCompletedOnboardingOsVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPreviouslyCompletedOnboardingOsVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setFromPersonalizeNews:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_fromPersonalizeNews = a3;
}

- (void)setHasFromPersonalizeNews:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFromPersonalizeNews
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (int)channelPickerPresentationReason
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_channelPickerPresentationReason;
  else
    return 0;
}

- (void)setChannelPickerPresentationReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_channelPickerPresentationReason = a3;
}

- (void)setHasChannelPickerPresentationReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelPickerPresentationReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)channelPickerPresentationReasonAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD50B48[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsChannelPickerPresentationReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CHANNEL_PICKER_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PICK_FAVORITES_FOR_YOU_CHANNEL_PICKER_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PICK_FAVORITES_FAVORITES_CHANNEL_PICKER_PRESENTATION_REASON")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBUserOnboardingScreenView;
  -[NTPBUserOnboardingScreenView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBUserOnboardingScreenView dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *referringSourceApplication;
  NSString *referringUrl;
  NSString *userActivityType;
  char has;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t channelPickerPresentationReason;
  __CFString *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_onboardingScreenType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("onboarding_screen_type"));

  }
  referringSourceApplication = self->_referringSourceApplication;
  if (referringSourceApplication)
    objc_msgSend(v3, "setObject:forKey:", referringSourceApplication, CFSTR("referring_source_application"));
  referringUrl = self->_referringUrl;
  if (referringUrl)
    objc_msgSend(v3, "setObject:forKey:", referringUrl, CFSTR("referring_url"));
  userActivityType = self->_userActivityType;
  if (userActivityType)
    objc_msgSend(v3, "setObject:forKey:", userActivityType, CFSTR("user_activity_type"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_userAction);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("user_action"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0)
        goto LABEL_12;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_countOfNotificationsSelected);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("count_of_notifications_selected"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_13;
LABEL_18:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fromPersonalizeNews);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("from_personalize_news"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_19;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_previouslyCompletedOnboardingOsVersion);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("previously_completed_onboarding_os_version"));

  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_18;
LABEL_13:
  if ((has & 1) == 0)
    return v3;
LABEL_19:
  channelPickerPresentationReason = self->_channelPickerPresentationReason;
  if (channelPickerPresentationReason >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_channelPickerPresentationReason);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_24CD50B48[channelPickerPresentationReason];
  }
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("channel_picker_presentation_reason"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUserOnboardingScreenViewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_referringSourceApplication)
    PBDataWriterWriteStringField();
  if (self->_referringUrl)
    PBDataWriterWriteStringField();
  if (self->_userActivityType)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0)
        goto LABEL_12;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_13;
LABEL_19:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_19;
LABEL_13:
  if ((has & 1) != 0)
LABEL_14:
    PBDataWriterWriteInt32Field();
LABEL_15:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_onboardingScreenType;
    *(_BYTE *)(v5 + 60) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_referringSourceApplication, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  v9 = -[NSString copyWithZone:](self->_referringUrl, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_userActivityType, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v11;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_userAction;
    *(_BYTE *)(v6 + 60) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 12) = self->_countOfNotificationsSelected;
  *(_BYTE *)(v6 + 60) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
LABEL_13:
    *(_BYTE *)(v6 + 56) = self->_fromPersonalizeNews;
    *(_BYTE *)(v6 + 60) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v6;
    goto LABEL_8;
  }
LABEL_12:
  *(_DWORD *)(v6 + 20) = self->_previouslyCompletedOnboardingOsVersion;
  *(_BYTE *)(v6 + 60) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 8) = self->_channelPickerPresentationReason;
    *(_BYTE *)(v6 + 60) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *referringSourceApplication;
  NSString *referringUrl;
  NSString *userActivityType;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_onboardingScreenType != *((_DWORD *)v4 + 4))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_40;
  }
  referringSourceApplication = self->_referringSourceApplication;
  if ((unint64_t)referringSourceApplication | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](referringSourceApplication, "isEqual:"))
  {
    goto LABEL_40;
  }
  referringUrl = self->_referringUrl;
  if ((unint64_t)referringUrl | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](referringUrl, "isEqual:"))
      goto LABEL_40;
  }
  userActivityType = self->_userActivityType;
  if ((unint64_t)userActivityType | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](userActivityType, "isEqual:"))
      goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x10) == 0 || self->_userAction != *((_DWORD *)v4 + 10))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_countOfNotificationsSelected != *((_DWORD *)v4 + 3))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_previouslyCompletedOnboardingOsVersion != *((_DWORD *)v4 + 5))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x20) != 0)
    {
      if (self->_fromPersonalizeNews)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_40;
        goto LABEL_36;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_36;
    }
LABEL_40:
    v8 = 0;
    goto LABEL_41;
  }
  if ((*((_BYTE *)v4 + 60) & 0x20) != 0)
    goto LABEL_40;
LABEL_36:
  v8 = (*((_BYTE *)v4 + 60) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_channelPickerPresentationReason != *((_DWORD *)v4 + 2))
      goto LABEL_40;
    v8 = 1;
  }
LABEL_41:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_onboardingScreenType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_referringSourceApplication, "hash");
  v5 = -[NSString hash](self->_referringUrl, "hash");
  v6 = -[NSString hash](self->_userActivityType, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v7 = 2654435761 * self->_userAction;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_6:
      v8 = 2654435761 * self->_countOfNotificationsSelected;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_previouslyCompletedOnboardingOsVersion;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_8;
LABEL_13:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_9;
LABEL_14:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_12:
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_8:
  v10 = 2654435761 * self->_fromPersonalizeNews;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_14;
LABEL_9:
  v11 = 2654435761 * self->_channelPickerPresentationReason;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    self->_onboardingScreenType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 4u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBUserOnboardingScreenView setReferringSourceApplication:](self, "setReferringSourceApplication:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBUserOnboardingScreenView setReferringUrl:](self, "setReferringUrl:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NTPBUserOnboardingScreenView setUserActivityType:](self, "setUserActivityType:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 0x10) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 60);
    if ((v5 & 2) == 0)
    {
LABEL_11:
      if ((v5 & 8) == 0)
        goto LABEL_12;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_countOfNotificationsSelected = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0)
      goto LABEL_13;
LABEL_19:
    self->_fromPersonalizeNews = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 0x20u;
    if ((*((_BYTE *)v4 + 60) & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_18:
  self->_previouslyCompletedOnboardingOsVersion = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 0x20) != 0)
    goto LABEL_19;
LABEL_13:
  if ((v5 & 1) != 0)
  {
LABEL_14:
    self->_channelPickerPresentationReason = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_15:

}

- (NSString)referringSourceApplication
{
  return self->_referringSourceApplication;
}

- (void)setReferringSourceApplication:(id)a3
{
  objc_storeStrong((id *)&self->_referringSourceApplication, a3);
}

- (NSString)referringUrl
{
  return self->_referringUrl;
}

- (void)setReferringUrl:(id)a3
{
  objc_storeStrong((id *)&self->_referringUrl, a3);
}

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (void)setUserActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityType, a3);
}

- (int)countOfNotificationsSelected
{
  return self->_countOfNotificationsSelected;
}

- (BOOL)fromPersonalizeNews
{
  return self->_fromPersonalizeNews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityType, 0);
  objc_storeStrong((id *)&self->_referringUrl, 0);
  objc_storeStrong((id *)&self->_referringSourceApplication, 0);
}

@end
