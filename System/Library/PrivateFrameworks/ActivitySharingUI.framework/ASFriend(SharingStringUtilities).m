@implementation ASFriend(SharingStringUtilities)

- (uint64_t)as_friendListNameStringWithDotPrefix:()SharingStringUtilities keyColor:
{
  return objc_msgSend(a1, "as_friendListNameStringWithDotPrefix:keyColor:showAwaitingCompetitionResponse:", a3, a4, 0);
}

- (id)as_friendListNameStringWithDotPrefix:()SharingStringUtilities keyColor:showAwaitingCompetitionResponse:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(a1, "isMe"))
  {
    objc_msgSend(a1, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _AttributedNameStringWithDotPrefix(v10, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a5 || !objc_msgSend(a1, "isAwaitingCompetitionResponseFromMe"))
    {
      v13 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(a1, "displayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = *MEMORY[0x24BEBB368];
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = *MEMORY[0x24BEBB360];
      v19[0] = v15;
      v19[1] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v16);

      goto LABEL_8;
    }
    objc_msgSend(a1, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "as_lightCompetitionGold");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _AttributedNameStringWithDotPrefix(v10, v8, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:

  return v11;
}

- (id)as_detailedSharingDurationString
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;

  if ((objc_msgSend(a1, "isMe") & 1) == 0)
  {
    objc_msgSend(a1, "dateForLatestRelationshipStart");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v2 = 0;
LABEL_22:

      return v2;
    }
    objc_msgSend(a1, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = ASDurationInDaysSinceDate(v3);
    ASSharingStartTimeStringFromDate(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      ActivitySharingBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DAYS_OTHER"), &stru_24EE9E808, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 == 1)
      {
        ActivitySharingBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DAYS_ONE"), &stru_24EE9E808, CFSTR("Localizable"));
        v10 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v10;
      }
      v11 = (void *)MEMORY[0x24BDD17C8];
      ActivitySharingBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DETAILED_SHARING_DURATION_INFO"), &stru_24EE9E808, CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v13, v4, v14, v8, v6);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      ActivitySharingBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DETAILED_SHARING_DURATION_INFO_ZERO_DAYS"), &stru_24EE9E808, CFSTR("Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v12, v4, v6);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(a1, "dateForLatestDataHidden");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(a1, "canSeeMyActivityData") & 1) == 0 && v16)
    {
      v17 = ASDurationInDaysSinceDate(v16);
      ASSharingStartTimeStringFromDate(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ActivitySharingBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v17)
        v21 = CFSTR("SHARING_HIDDEN_SINCE_INFO");
      else
        v21 = CFSTR("SHARING_HIDDEN_SINCE_INFO_ZERO_DAYS");
      objc_msgSend(v19, "localizedStringForKey:value:table:", v21, &stru_24EE9E808, CFSTR("Localizable"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v22, v4, v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringByAppendingString:", v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v24;
    }
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isStandalonePhoneFitnessMode"))
    {
      objc_msgSend(a1, "mostRecentSnapshot");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)v26;
        objc_msgSend(a1, "mostRecentSnapshot");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "activitySummary");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "_isStandalonePhoneSummary");

        if ((v30 & 1) != 0)
        {
LABEL_21:

          goto LABEL_22;
        }
        ActivitySharingBundle();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("SHARING_STANDALONE_EXPLANATION_%@"), &stru_24EE9E808, CFSTR("Localizable"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v25, v4);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %@"), v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "stringByAppendingString:", v33);
        v34 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v34;
      }
    }

    goto LABEL_21;
  }
  v2 = 0;
  return v2;
}

- (id)as_simpleSharingDurationString
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  if ((objc_msgSend(a1, "isMe") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(a1, "dateForLatestRelationshipStart");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(a1, "displayName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = ASDurationInDaysSinceDate(v3);
      ASSharingStartTimeStringFromDate(v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BDD17C8];
      ActivitySharingBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v5)
      {
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SIMPLE_SHARING_DURATION_INFO"), &stru_24EE9E808, CFSTR("Localizable"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", v10, v4, v6);
      }
      else
      {
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SIMPLE_SHARING_DURATION_INFO_ZERO_DAYS"), &stru_24EE9E808, CFSTR("Localizable"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", v10, v4, v12);
      }
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (id)as_simpleHiddenFromString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  if ((objc_msgSend(a1, "isMe") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(a1, "dateForLatestDataHiddenFromMe");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      ASSharingStartTimeStringFromDate(v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = ASDurationInDaysSinceDate(v4);
      ActivitySharingBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6)
        v9 = CFSTR("SHARING_HIDDEN_FROM_SINCE_INFO");
      else
        v9 = CFSTR("SHARING_HIDDEN_FROM_SINCE_INFO_ZERO_DAYS");
      objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24EE9E808, CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(a1, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v10, v12, v5);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (id)as_invitedDurationString
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "dateForLatestOutgoingInviteRequest");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = ASDurationInDaysSinceDate(v1);
    v4 = v3;
    if (v3 == 1)
    {
      ActivitySharingBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("DAYS_ONE");
    }
    else
    {
      if (!v3)
      {
        ActivitySharingBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TODAY"), &stru_24EE9E808, CFSTR("Localizable"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

        goto LABEL_10;
      }
      ActivitySharingBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("DAYS_OTHER");
    }
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24EE9E808, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD17C8];
    ActivitySharingBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHARING_INBOX_WAITING_INFO"), &stru_24EE9E808, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v13, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v6 = 0;
LABEL_10:

  return v6;
}

- (id)as_competitionStatusBreadcrumbStringForExperienceType:()SharingStringUtilities
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;

  v1 = a1;
  if (objc_msgSend(a1, "hasPendingCompetitionRequestFromMe"))
  {
    objc_msgSend(v1, "dateForLatestOutgoingCompetitionRequest");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = ASCompetitionRequestHoursUntilExpiration();

    if (v3 < 1)
    {
      objc_msgSend(v1, "dateForLatestOutgoingCompetitionRequest");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = ASCompetitionRequestMinutesUntilExpiration();

      v26 = (void *)MEMORY[0x24BDD17C8];
      ActivitySharingBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MINUTES"), &stru_24EE9E808, CFSTR("Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringWithFormat:", v6, v25);
    }
    else
    {
      v4 = (void *)MEMORY[0x24BDD17C8];
      ActivitySharingBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HOURS"), &stru_24EE9E808, CFSTR("Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringWithFormat:", v6, v3);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x24BDD17C8];
    ActivitySharingBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("COMPETITION_INVITE_SENT_BREADCRUMB"), &stru_24EE9E808, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "displayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", v17, v22, v9);
    goto LABEL_15;
  }
  if (objc_msgSend(v1, "isCompetitionActive"))
  {
    objc_msgSend(v1, "currentCompetition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    FILocalizedDayName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "currentCompetition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastDayOfCompetition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FILocalizedDayName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDD17C8];
    ActivitySharingBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("POINTS"), &stru_24EE9E808, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "currentCompetition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v15, objc_msgSend(v16, "maximumNumberOfPointsPerDay"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "currentCompetition");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "stage");

    if (v19 == 2)
    {
      ActivitySharingBundle();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      FILocalizationTableForExperienceType();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      FIRandomStringForPrefixWithTableName();
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v1, "displayName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", v22, v12, v31);
      v1 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
LABEL_17:

      return v1;
    }
    if (v19 == 1)
    {
      ActivitySharingBundle();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      FILocalizationTableForExperienceType();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      FIRandomStringForPrefixWithTableName();
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x24BDD17C8];
      v35 = v12;
      v36 = v17;
    }
    else
    {
      if (v19)
        goto LABEL_17;
      ActivitySharingBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      FILocalizationTableForExperienceType();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      FIRandomStringForPrefixWithTableName();
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x24BDD17C8];
      v35 = v9;
      v36 = v17;
    }
    objc_msgSend(v23, "stringWithFormat:", v22, v35, v36);
LABEL_15:
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v1 = 0;
  return v1;
}

- (id)as_competitionRequestDurationRemainingString
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  objc_msgSend(a1, "dateForLatestOutgoingCompetitionRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (objc_msgSend(a1, "ignoredCompetitionRequestFromMe"))
    {
      ActivitySharingBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("DECLINED_COMPETITION_REQUEST");
    }
    else
    {
      if (!ASCompetitionRequestHasExpired())
      {
        v7 = ASCompetitionRequestHoursUntilExpiration();
        if (v7 < 1)
        {
          v8 = ASCompetitionRequestMinutesUntilExpiration();
          v9 = (void *)MEMORY[0x24BDD17C8];
          ActivitySharingBundle();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v10;
          v11 = CFSTR("MINUTES_REMAINING");
        }
        else
        {
          v8 = v7;
          v9 = (void *)MEMORY[0x24BDD17C8];
          ActivitySharingBundle();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v10;
          v11 = CFSTR("HOURS_REMAINING");
        }
        objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_24EE9E808, CFSTR("Localizable"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringWithFormat:", v12, v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      ActivitySharingBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("EXPIRED_COMPETITION_REQUEST");
    }
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24EE9E808, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

    goto LABEL_13;
  }
  v6 = 0;
LABEL_13:

  return v6;
}

- (id)as_competitionStageString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "currentCompetition");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  ASCompetitionStageStringWithCompetition(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)as_myCompetitionScoreStringWithContext:()SharingStringUtilities color:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "currentCompetition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "myTotalScore");
  objc_msgSend(v7, "multilineDataFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "multilineUnitFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ASAttributedNumberStringWithKey(v9, CFSTR("ABBREVIATED_POINTS"), v10, v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)as_opponentCompetitionScoreStringWithContext:()SharingStringUtilities color:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "currentCompetition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "opponentTotalScore");
  objc_msgSend(v7, "multilineDataFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "multilineUnitFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ASAttributedNumberStringWithKey(v9, CFSTR("ABBREVIATED_POINTS"), v10, v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)as_competitionSendConfirmationTitle
{
  void *v0;
  void *v1;

  ActivitySharingBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("COMPETITION_SEND_CONFIRMATION_TITLE"), &stru_24EE9E808, CFSTR("Localizable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)as_competitionSendConfirmationMessageForExperienceType:()SharingStringUtilities
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (objc_msgSend(a1, "isMyActivityDataCurrentlyHidden"))
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    ActivitySharingBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("COMPETITION_SEND_CONFIRMATION_MESSAGE_HIDING"), &stru_24EE9E808, CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ActivitySharingBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    FILocalizationTableForExperienceType();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    FIRandomStringForPrefixWithTableName();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)as_competitionSendConfirmationSendAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a1, "isMyActivityDataCurrentlyHidden"))
  {
    ActivitySharingBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("COMPETITION_SEND_CONFIRMATION_SEND_ACTION_HIDING"), &stru_24EE9E808, CFSTR("Localizable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    ActivitySharingBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("COMPETITION_SEND_CONFIRMATION_SEND_ACTION"), &stru_24EE9E808, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)as_competitionSendErrorMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  ActivitySharingBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("COMPETITION_SEND_ERROR_MESSAGE"), &stru_24EE9E808, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)as_competitionReceivedNotificationTitle
{
  void *v0;
  void *v1;

  ActivitySharingBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("COMPETITION_RECEIVED_NOTIFICATION_TITLE"), &stru_24EE9E808, CFSTR("Localizable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)as_competitionReceivedNotificationMessageForExperienceType:()SharingStringUtilities
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  ActivitySharingBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FILocalizationTableForExperienceType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FIRandomStringForPrefixWithTableName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)as_competitionReceivedHidingWarningMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  ActivitySharingBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("COMPETITION_RECEIVED_NOTIFICATION_MESSAGE_HIDING"), &stru_24EE9E808, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)as_competitionReceivedNotificationAcceptAction
{
  void *v0;
  void *v1;

  ActivitySharingBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  FIRandomStringForPrefixWithTableName();
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)as_competitionReceivedHidingAcceptAction
{
  void *v0;
  void *v1;

  ActivitySharingBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("COMPETITION_RECEIVED_NOTIFICATION_ACCEPT_ACTION_HIDING"), &stru_24EE9E808, CFSTR("Localizable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)as_competitionAcceptErrorMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  ActivitySharingBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("COMPETITION_ACCEPT_ERROR_MESSAGE"), &stru_24EE9E808, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)as_competitionAcceptedNotificationTitle
{
  void *v0;
  void *v1;

  ActivitySharingBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("COMPETITION_ACCEPTED_NOTIFICATION_TITLE"), &stru_24EE9E808, CFSTR("Localizable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)as_competitionAcceptedNotificationMessageForCompetition:()SharingStringUtilities experienceType:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  ActivitySharingBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FILocalizationTableForExperienceType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FIRandomStringForPrefixWithTableName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_competitionStartMessage:replacingNameAndDatePlaceholdersForCompetitionStartDate:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)as_competitionAcceptConfirmationTitle
{
  void *v0;
  void *v1;

  ActivitySharingBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("COMPETITION_ACCEPT_CONFIRMATION_TITLE"), &stru_24EE9E808, CFSTR("Localizable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)_competitionStartMessage:()SharingStringUtilities replacingNameAndDatePlaceholdersForCompetitionStartDate:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<friend-name>"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  FILocalizedDayName();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  FIStringByReplacingDynamicPlaceholder();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)as_competitionLearnMoreTitleForExperienceType:()SharingStringUtilities
{
  void *v0;
  void *v1;
  void *v2;

  ActivitySharingBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  FILocalizationTableForExperienceType();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FIRandomStringForPrefixWithTableName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)as_competitionLearnMoreDetailActionForExperienceType:()SharingStringUtilities
{
  void *v0;
  void *v1;
  void *v2;

  ActivitySharingBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  FILocalizationTableForExperienceType();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FIRandomStringForPrefixWithTableName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)as_competitionLearnMoreIntroductionForExperienceType:()SharingStringUtilities
{
  void *v0;
  void *v1;
  void *v2;

  ActivitySharingBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  FILocalizationTableForExperienceType();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FIRandomStringForPrefixWithTableName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)as_competitionLearnMoreDetailMessageForExperienceType:()SharingStringUtilities
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  ASCompetitionDurationDateComponentsForNewCompetitions();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "day");

  v2 = ASCompetitionMaximumPointsPerDayForNewCompetitions();
  v3 = (void *)MEMORY[0x24BDD17C8];
  ActivitySharingBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("POINTS"), &stru_24EE9E808, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v2 * v1;
  v8 = (void *)MEMORY[0x24BDD17C8];
  ActivitySharingBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("POINTS"), &stru_24EE9E808, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ActivitySharingBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  FILocalizationTableForExperienceType();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  FIRandomStringForPrefixWithTableName();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v14, v6, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)as_competitionLearnMoreFullDescriptionForExperienceType:()SharingStringUtilities
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "as_competitionLearnMoreIntroductionForExperienceType:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "as_competitionLearnMoreDetailMessageForExperienceType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)as_competitionAcceptConfirmationMessageForCompetition:()SharingStringUtilities experienceType:
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "startDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ASCompetitionCalculateStartDateComponentsForFriendWithProposedStartDate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  ActivitySharingBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FILocalizationTableForExperienceType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  FIRandomStringForPrefixWithTableName();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_competitionStartMessage:replacingNameAndDatePlaceholdersForCompetitionStartDate:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)as_competitionLearnMorePopupAction
{
  void *v0;
  void *v1;

  ActivitySharingBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("COMPETITION_LEARN_MORE_POPUP_ACTION"), &stru_24EE9E808, CFSTR("Localizable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
