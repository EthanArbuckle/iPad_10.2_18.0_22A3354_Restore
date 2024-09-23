void sub_226B3ABF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226B3B3DC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_226B3B4E0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_226B3B938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_226B3C49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ASActivitySummaryGoalFormatString()
{
  void *v0;
  void *v1;

  ActivitySharingBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("LIST_VIEW_GOAL_FORMAT_WITH_UNITS_%@_%@_%@"), &stru_24EE9E808, CFSTR("Localizable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id SmallCapsFontForFont(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v19 = *MEMORY[0x24BEBB548];
  v1 = *MEMORY[0x24BEBB598];
  v14 = *MEMORY[0x24BEBB5A0];
  v15 = v1;
  v16 = &unk_24EEA3620;
  v17 = &unk_24EEA3638;
  v2 = (void *)MEMORY[0x24BDBCE70];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", &v16, &v14, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1, v14, v15, v16, v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v3, "pointSize");
  v11 = v10;

  objc_msgSend(v9, "fontWithDescriptor:size:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void _DrawPathWithColor(CGContext *a1, const CGPath *a2, void *a3)
{
  id v5;
  id v6;
  CGColor *v7;

  v5 = a3;
  CGContextSaveGState(a1);
  v6 = objc_retainAutorelease(v5);
  v7 = (CGColor *)objc_msgSend(v6, "CGColor");

  CGContextSetFillColorWithColor(a1, v7);
  CGContextAddPath(a1, a2);
  CGContextDrawPath(a1, kCGPathFill);
  CGContextRestoreGState(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_226B41394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226B41DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void ASLaunchToMessagesWithRecipients(void *a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sms://open?recipients=%@&allowRetargeting=true"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ASLoggingInitialize();
  v3 = *MEMORY[0x24BE01E80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E80], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v2;
    _os_log_impl(&dword_226B38000, v3, OS_LOG_TYPE_DEFAULT, "Launching to messages app. URL String is %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:options:completionHandler:", v5, MEMORY[0x24BDBD1B8], 0);

}

__CFString *ASBreadcrumbKeyForBulletinType(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  __CFString *v23;

  v3 = a2;
  v4 = v3;
  v5 = CFSTR("GOAL_COMPLETION_BREADCRUMB");
  switch(a1)
  {
    case 0:
      ASLoggingInitialize();
      v6 = *MEMORY[0x24BE01E90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E90], OS_LOG_TYPE_ERROR))
        ASBreadcrumbKeyForBulletinType_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
      goto LABEL_9;
    case 2:
      v5 = CFSTR("WORKOUT_BREADCRUMB");
      break;
    case 3:
      v5 = CFSTR("ACHIEVEMENT_BREADCRUMB");
      break;
    case 4:
    case 8:
      v5 = CFSTR("COMPETITION_IN_PROGRESS_BREADCRUMB");
      break;
    case 5:
      ASLoggingInitialize();
      v14 = *MEMORY[0x24BE01E90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E90], OS_LOG_TYPE_ERROR))
        ASBreadcrumbKeyForBulletinType_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
LABEL_9:
      v5 = 0;
      break;
    case 6:
      v5 = CFSTR("COMPETITION_ACCEPT_BREADCRUMB");
      break;
    case 7:
      v22 = objc_msgSend(v3, "isScoreTied");
      v23 = CFSTR("COMPETITION_END_BREADCRUMB");
      if (v22)
        v23 = CFSTR("COMPETITION_TIE_BREADCRUMB");
      v5 = v23;
      break;
    default:
      break;
  }

  return v5;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id MessageBubbleBackgroundPlatter()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  CGSize v5;

  if (MessageBubbleBackgroundPlatter_onceToken != -1)
    dispatch_once(&MessageBubbleBackgroundPlatter_onceToken, &__block_literal_global_0);
  objc_msgSend((id)MessageBubbleBackgroundPlatter_imageCache, "objectForKey:", CFSTR("MessageBubbleBackgroundPlatter"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    v5.width = 30.0;
    v5.height = 30.0;
    UIGraphicsBeginImageContextWithOptions(v5, 0, 0.0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "as_competitionNotificationAccentGold");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setFill");

    objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 30.0, 30.0, 15.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fill");
    UIGraphicsGetImageFromCurrentImageContext();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

    if (v0)
      objc_msgSend((id)MessageBubbleBackgroundPlatter_imageCache, "setObject:forKey:", v0, CFSTR("MessageBubbleBackgroundPlatter"));
  }
  v3 = v0;

  return v3;
}

id _ASCompetitionEndedWinnerSuffixForFriend(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id *v8;
  int v9;
  id v10;
  void *v12;

  v3 = a1;
  objc_msgSend(v3, "currentOrMostRecentCompetition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2 == 1)
  {
    objc_msgSend(v4, "daysWonByParticipant:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 < 6)
    {
      if (ASCompetitionScoresAreWithinClosenessThreshold())
      {
        v8 = (id *)MEMORY[0x24BE01D30];
      }
      else if (ASDidLosePreviousCompetitionWithFriend())
      {
        v8 = (id *)MEMORY[0x24BE01D48];
      }
      else
      {
        ASCompetitionDayWithHighestScoreForParticipant();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          v8 = (id *)MEMORY[0x24BE01D28];
        else
          v8 = (id *)MEMORY[0x24BE01D38];
      }
    }
    else
    {
      v8 = (id *)MEMORY[0x24BE01D50];
    }
  }
  else
  {
    v9 = ASCompetitionScoresAreWithinClosenessThreshold();
    v8 = (id *)MEMORY[0x24BE01D30];
    if (!v9)
      v8 = (id *)MEMORY[0x24BE01D38];
  }
  v10 = *v8;

  return v10;
}

id _ASCompetitionEndedLoserSuffixForFriend(void *a1, uint64_t a2)
{
  void *v3;
  int v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "currentOrMostRecentCompetition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ASCompetitionScoresAreWithinClosenessThreshold();
  if (a2 == 1)
  {
    if (v4)
    {
      v5 = (id *)MEMORY[0x24BE01D30];
    }
    else
    {
      ASCompetitionWinningDayWithHighestScoreForParticipant();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v5 = (id *)MEMORY[0x24BE01D68];
      }
      else
      {
        ASCompetitionDayWithHighestScoreForParticipant();
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          v5 = (id *)MEMORY[0x24BE01D28];
        else
          v5 = (id *)MEMORY[0x24BE01D38];
      }
    }
  }
  else
  {
    v5 = (id *)MEMORY[0x24BE01D30];
    if (!v4)
      v5 = (id *)MEMORY[0x24BE01D38];
  }
  v8 = *v5;

  return v8;
}

id _ASCompetitionEndedKeyForFriend(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a1;
  objc_msgSend(v3, "currentOrMostRecentCompetition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BE01D20];
  if (objc_msgSend(v4, "isScoreTied"))
  {
    objc_msgSend(v5, "stringByAppendingString:", *MEMORY[0x24BE01D58]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "isParticipantWinning:", 0))
    {
      objc_msgSend(v5, "stringByAppendingString:", *MEMORY[0x24BE01D60]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _ASCompetitionEndedWinnerSuffixForFriend(v3, a2);
    }
    else
    {
      objc_msgSend(v5, "stringByAppendingString:", *MEMORY[0x24BE01D40]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _ASCompetitionEndedLoserSuffixForFriend(v3, a2);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

id ASCompetitionEndedDemoKey()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BDBCF50]);
  v1 = (void *)objc_msgSend(v0, "initWithSuiteName:", *MEMORY[0x24BE01F50]);
  objc_msgSend(v1, "stringForKey:", CFSTR("CompetitionEndDescription"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id ASCompetitionEndedDescriptionForFriend(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
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
  uint64_t v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(v3, "currentOrMostRecentCompetition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ASCompetitionEndedDemoKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    ASLoggingInitialize();
    v6 = *MEMORY[0x24BE01E90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E90], OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v5;
      _os_log_impl(&dword_226B38000, v6, OS_LOG_TYPE_DEFAULT, "Found Competition End Description Key in user defaults: %@", (uint8_t *)&v24, 0xCu);
    }
    ActivitySharingBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v5, &stru_24EE9E808, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _ASCompetitionEndedKeyForFriend(v3, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ActivitySharingBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    FILocalizationTableForExperienceType();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    FIRandomStringForPrefixWithTableName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "daysWonByParticipant:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "count");
  FILocalizeCount();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  ASCompetitionDayWithHighestScoreForParticipant();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  FILocalizedDayName();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ASCompetitionWinningDayWithHighestScoreForParticipant();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  FILocalizedDayName();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<friend-name>"), v12);
    v19 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v19;
  }
  if (v14)
  {
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<num-days>"), v14);
    v20 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v20;
  }
  FIStringByReplacingDynamicPlaceholder();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  FIStringByReplacingDynamicPlaceholder();
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id ASCompetitionEndedTitleForFriend(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  int v5;
  void *v6;

  objc_msgSend(a1, "currentOrMostRecentCompetition");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isScoreTied"))
  {
    ActivitySharingBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("COMPETITION_ENDED_TIED");
  }
  else
  {
    v5 = objc_msgSend(v1, "isParticipantWinning:", 0);
    ActivitySharingBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v5)
      v4 = CFSTR("COMPETITION_ENDED_WINNER");
    else
      v4 = CFSTR("COMPETITION_ENDED_LOSER");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_24EE9E808, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id ASCompetitionFirstGlanceDescriptionForTypeWithFriends(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  id *v19;
  id *v20;
  id *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id *v26;
  int HasCrossedMercyThresholdOnLastDayForCompetition;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;

  v4 = a3;
  if (a1)
  {
    v5 = (_QWORD *)MEMORY[0x24BE01DB8];
    if (a1 == 1)
      v5 = (_QWORD *)MEMORY[0x24BE01DC0];
    objc_msgSend((id)*MEMORY[0x24BE01D70], "stringByAppendingString:", *v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1 == 1)
      ASFriendsWithCompetitionsStartingToday();
    else
      ASFriendsWithCompetitionsEndingToday();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    v18 = v17;
    v19 = (id *)MEMORY[0x24BE01D80];
    v20 = (id *)MEMORY[0x24BE01DB0];
    v21 = (id *)MEMORY[0x24BE01DA8];
    if (v17 != 3)
      v21 = (id *)MEMORY[0x24BE01D78];
    if (v17 != 2)
      v20 = v21;
    if (v17 != 1)
      v19 = v20;
    v22 = *v19;
    objc_msgSend(v6, "stringByAppendingString:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (a1 != 1 && v18 == 1)
    {
      objc_msgSend(v16, "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "currentCompetition");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((ASCompetitionScoresAreWithinClosenessThreshold() & 1) != 0)
      {
        v26 = (id *)MEMORY[0x24BE01D98];
      }
      else if ((objc_msgSend(v25, "isParticipantWinning:", 0) & 1) != 0)
      {
        v26 = (id *)MEMORY[0x24BE01D88];
      }
      else
      {
        HasCrossedMercyThresholdOnLastDayForCompetition = ASCompetitionParticipantHasCrossedMercyThresholdOnLastDayForCompetition();
        v26 = (id *)MEMORY[0x24BE01D90];
        if (HasCrossedMercyThresholdOnLastDayForCompetition)
          v26 = (id *)MEMORY[0x24BE01DA0];
      }
      v28 = *v26;
      objc_msgSend(v23, "stringByAppendingString:", v28);
      v29 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v29;
    }
    FILocalizationTableForExperienceType();
    v30 = objc_claimAutoreleasedReturnValue();
    ActivitySharingBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v23;
    FIRandomStringForPrefixWithTableName();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = v22;
    v58 = v4;
    v55 = (void *)v30;
    if (v18)
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "displayName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 == 1)
      {
        v34 = v16;
        v53 = 0;
        v54 = 0;
      }
      else
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "displayName");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = v16;
        if (v18 < 3)
        {
          v54 = 0;
        }
        else
        {
          objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "displayName");
          v54 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
    else
    {
      v34 = v16;
      v53 = 0;
      v54 = 0;
      v33 = 0;
    }
    v37 = (void *)MEMORY[0x24BDD17C8];
    ActivitySharingBundle();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("COMPETITIONS"), &stru_24EE9E808, CFSTR("Localizable"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringWithFormat:", v39, v18);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)MEMORY[0x24BDD17C8];
    ActivitySharingBundle();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("POINTS"), &stru_24EE9E808, CFSTR("Localizable"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "currentCompetition");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringWithFormat:", v43, ASCompetitionCurrentScoreDelta());
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<first-friend-name>"), v33);
      v47 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v47;
    }
    if (v53)
    {
      objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<second-friend-name>"), v53);
      v48 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v48;
    }
    if (v54)
    {
      objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<third-friend-name>"), v54);
      v49 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v49;
    }
    if (v40)
    {
      objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<num-competitions>"), v40);
      v50 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v50;
    }
    if (v46)
    {
      objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<num-points>"), v46);
      v51 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v51;
    }
    v4 = v58;

  }
  else
  {
    ASLoggingInitialize();
    v7 = *MEMORY[0x24BE01E90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E90], OS_LOG_TYPE_ERROR))
      ASCompetitionFirstGlanceDescriptionForTypeWithFriends_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = 0;
  }

  return v15;
}

id ASCompetitionFirstGlanceSectionHeaderForType(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((unint64_t)(a1 - 1) < 2)
  {
    ActivitySharingBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("COMPETITION_MORE_COMPETITIONS_HEADER");
    goto LABEL_6;
  }
  if (a1)
  {
    if (a1 == 3)
    {
      ActivitySharingBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("COMPETITION_ALL_COMPETITIONS_HEADER");
LABEL_6:
      objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_24EE9E808, CFSTR("Localizable"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedUppercaseString");
      v1 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    ASLoggingInitialize();
    v6 = *MEMORY[0x24BE01E90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E90], OS_LOG_TYPE_ERROR))
      ASCompetitionFirstGlanceSectionHeaderForType_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    v1 = 0;
  }
  return v1;
}

id ASCompetitionScoreCapCelebrationTitle()
{
  void *v0;
  void *v1;

  ActivitySharingBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("COMPETITION_SCORE_CAP_CELEBRATION_TITLE"), &stru_24EE9E808, CFSTR("Localizable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id ASCompetitionScoreCapCelebrationDescription()
{
  void *v0;
  void *v1;

  ActivitySharingBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  FIRandomStringForPrefixWithTableName();
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id _ASCompetitionLearnMoreTextAttributes()
{
  void *v0;
  void *v1;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BEBD4B8], "as_lightCompetitionGold");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id ASCompetitionLearnMoreIntroductionAttributedStringForFriend(void *a1, uint64_t a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDD1458];
  v4 = a1;
  v5 = [v3 alloc];
  objc_msgSend(v4, "as_competitionLearnMoreIntroductionForExperienceType:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _ASCompetitionLearnMoreTextAttributes();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v6, v7);

  return v8;
}

id ASCompetitionLearnMoreDetailsAttributedStringForFriend(void *a1, uint64_t a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDD1458];
  v4 = a1;
  v5 = [v3 alloc];
  objc_msgSend(v4, "as_competitionLearnMoreDetailMessageForExperienceType:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _ASCompetitionLearnMoreTextAttributes();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v6, v7);

  return v8;
}

id ASCompetitionZeroPaddedScoreString(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (ASCompetitionZeroPaddedScoreString_onceToken != -1)
    dispatch_once(&ASCompetitionZeroPaddedScoreString_onceToken, &__block_literal_global_1);
  v2 = (void *)ASCompetitionZeroPaddedScoreString_formatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id ASCompetitionStageStringWithCompetition(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v1 = a1;
  v2 = objc_msgSend(v1, "stage");
  switch(v2)
  {
    case 2:
      ActivitySharingBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v11;
      v12 = CFSTR("COMPETITION_TALLYING_POINTS");
LABEL_8:
      objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_24EE9E808, CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1:
      if (!objc_msgSend(v1, "isLastDayOfCompetition"))
      {
        v13 = objc_msgSend(v1, "numberOfDaysRemaining");
        v14 = (void *)MEMORY[0x24BE37938];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithNumber:decimalPrecision:", v15, 1);
        v3 = (id)objc_claimAutoreleasedReturnValue();

        v16 = (void *)MEMORY[0x24BDD17C8];
        ActivitySharingBundle();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DAYS_REMAINING"), &stru_24EE9E808, CFSTR("Localizable"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", v18, v13, v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
      ActivitySharingBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v11;
      v12 = CFSTR("COMPETITION_ENDS_TODAY");
      goto LABEL_8;
    case 0:
      v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v3, "setDateFormat:", CFSTR("EEEE"));
      objc_msgSend(v1, "startDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringFromDate:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "capitalizedString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)MEMORY[0x24BDD17C8];
      ActivitySharingBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("COMPETITION_START_DATE"), &stru_24EE9E808, CFSTR("Localizable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

id ASAttributedNumberStringWithKey(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x24BE37938];
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = a2;
  objc_msgSend(v10, "numberWithUnsignedInteger:", a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithNumber:decimalPrecision:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD17C8];
  ActivitySharingBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", v14, &stru_24EE9E808, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "stringWithFormat:", v19, a1, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc(MEMORY[0x24BDD1688]);
  v23 = *MEMORY[0x24BEBB368];
  v30[0] = *MEMORY[0x24BEBB360];
  v22 = v30[0];
  v30[1] = v23;
  v31[0] = v12;
  v31[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend(v21, "initWithString:attributes:", v20, v24);
  objc_msgSend(v25, "string");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "rangeOfString:", v16);
  objc_msgSend(v25, "addAttribute:value:range:", v22, v13, v27, v28);

  return v25;
}

id ASPointsStringWithScore(uint64_t a1, void *a2, void *a3, void *a4)
{
  return ASAttributedNumberStringWithKey(a1, CFSTR("ABBREVIATED_POINTS"), a2, a3, a4);
}

id ASDailyAverageStringWithScore(uint64_t a1, void *a2, void *a3, void *a4)
{
  return ASAttributedNumberStringWithKey(a1, CFSTR("DAILY_AVERAGE"), a2, a3, a4);
}

id _AttributedNameStringWithDotPrefix(void *a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDD1688];
  v6 = a3;
  v7 = a2;
  v8 = a1;
  v9 = objc_alloc_init(v5);
  v10 = objc_alloc_init(MEMORY[0x24BEBB4B8]);
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:scale:", v7, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("circlebadge.fill"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageWithTintColor:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setImage:", v13);
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendAttributedString:", v14);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR(" "));
  objc_msgSend(v9, "appendAttributedString:", v15);

  v16 = objc_alloc(MEMORY[0x24BDD1458]);
  v21[0] = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = *MEMORY[0x24BEBB360];
  v22[0] = v17;
  v22[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(v16, "initWithString:attributes:", v8, v18);
  objc_msgSend(v9, "appendAttributedString:", v19);

  return v9;
}

uint64_t ASDurationInDaysSinceDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v1 = (void *)MEMORY[0x24BDBCE48];
  v2 = a1;
  objc_msgSend(v1, "hk_gregorianCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "components:fromDate:toDate:options:", 16, v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "day");

  return v8;
}

id ASSharingStartTimeStringFromDate(void *a1)
{
  id v1;
  void *v2;
  int v3;
  uint64_t *v4;
  void *v5;

  v1 = a1;
  if (ASSharingStartTimeStringFromDate_onceToken != -1)
    dispatch_once(&ASSharingStartTimeStringFromDate_onceToken, &__block_literal_global_2);
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDateInToday:", v1);

  v4 = &ASSharingStartTimeStringFromDate___todayFormatter;
  if (!v3)
    v4 = &ASSharingStartTimeStringFromDate___notTodayFormatter;
  objc_msgSend((id)*v4, "stringFromDate:", v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id _BackgroundColorForDetailViewType(void *a1)
{
  if ((unint64_t)a1 >= 5)
  {
    if (a1 == (void *)5)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "as_competitionFriendListPlatterGold");
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      return a1;
    }
    if (a1 != (void *)6)
      return a1;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "as_competitionNotificationPlatterGold");
  a1 = (void *)objc_claimAutoreleasedReturnValue();
  return a1;
}

uint64_t _ViewModulesForDetailViewType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return 29;
  else
    return qword_226B5EF10[a1 - 1];
}

id _CreateSeparatorView()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x24BEBDB00]);
  v1 = (void *)objc_msgSend(v0, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BEBD4B8], "as_competitionNotificationAccentGold");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", v2);

  objc_msgSend(v1, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRadius:", 1.0);

  return v1;
}

id ASDisplayModeToString(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  switch(a1)
  {
    case 0:
      ActivitySharingBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("SORT_NAME");
      goto LABEL_9;
    case 1:
      ActivitySharingBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("SORT_MOVE");
      goto LABEL_9;
    case 2:
      ActivitySharingBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("SORT_EXERCISE");
      goto LABEL_9;
    case 3:
      ActivitySharingBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("SORT_STEPS");
      goto LABEL_9;
    case 4:
      ActivitySharingBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("SORT_WORKOUTS");
      goto LABEL_9;
    case 5:
      ActivitySharingBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("SORT_PUSHES");
LABEL_9:
      objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_24EE9E808, CFSTR("Localizable"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

uint64_t ASActivitySharingReplyContextTypeFromBulletinType(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = a2;
  v4 = v3;
  v5 = 1;
  switch(a1)
  {
    case 0:
    case 5:
      v5 = 7;
      break;
    case 1:
    case 2:
    case 3:
      objc_msgSend(v3, "currentCompetition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "stage") == 1;
      goto LABEL_10;
    case 6:
      v5 = 2;
      break;
    case 7:
      objc_msgSend(v3, "currentOrMostRecentCompetition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "myTotalScore");
      v8 = objc_msgSend(v6, "opponentTotalScore");
      v9 = 3;
      if (v7 <= v8)
        v9 = 4;
      if (v7 == v8)
        v5 = 5;
      else
        v5 = v9;
LABEL_10:

      break;
    case 8:
      v5 = 6;
      break;
    default:
      break;
  }

  return v5;
}

id _ASActivitySharingSuffixesByTextType()
{
  _QWORD v1[7];

  v1[6] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("_TEXT_EMOJI");
  v1[1] = CFSTR("_TEXT_ONLY");
  v1[2] = CFSTR("_EMOJI_ONLY");
  v1[3] = CFSTR("_TEXT_ONLY");
  v1[4] = CFSTR("_EMOJI_ONLY");
  v1[5] = CFSTR("_TEXT_EMOJI");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _ASActivitySharingSuffixesByMessageToneForReplyContextType(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(CFSTR("_ENCOURAGING"), "stringByAppendingString:", CFSTR("_TEXT_EMOJI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("_ENCOURAGING"), "stringByAppendingString:", CFSTR("_EMOJI_ONLY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("_SMACK"), "stringByAppendingString:", CFSTR("_TEXT_EMOJI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("_ENCOURAGING"), "stringByAppendingString:", CFSTR("_TEXT_ONLY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("_SMACK"), "stringByAppendingString:", CFSTR("_EMOJI_ONLY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("_ENCOURAGING"), "stringByAppendingString:", CFSTR("_TEXT_ONLY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("_SMACK"), "stringByAppendingString:", CFSTR("_TEXT_ONLY"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a1)
  {
    v15 = v2;
    v16 = v8;
    v17 = v3;
    v18 = v5;
    v19 = v4;
    v20 = v6;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = &v15;
    v12 = 6;
  }
  else
  {
    v21 = v2;
    v22 = v3;
    v23 = v4;
    v24 = v5;
    v25 = v6;
    v26 = v7;
    v27 = v8;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = &v21;
    v12 = 7;
  }
  objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

__CFString *_ASActivitySharingSuffixForWorkoutType(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  BOOL v9;
  int v10;
  __CFString *v11;
  const __CFString *v12;
  uint64_t v13;

  v1 = a1;
  v2 = objc_msgSend(v1, "workoutActivityType");
  objc_msgSend(MEMORY[0x24BE37950], "activityTypeWithWorkout:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0;
  if (v2 <= 56)
  {
    if (v2 > 34)
    {
      switch(v2)
      {
        case ',':
          v5 = CFSTR("_STAIR_STEPPER");
          goto LABEL_41;
        case '-':
        case '/':
        case '0':
        case '1':
        case '3':
          goto LABEL_41;
        case '.':
          v13 = objc_msgSend(v1, "fiui_swimmingLocationType");
          v11 = CFSTR("_POOL_SWIM");
          if (v13 == 2)
            v11 = CFSTR("_OPEN_WATER_SWIM");
          goto LABEL_40;
        case '2':
          v5 = CFSTR("_TRADITIONAL_STRENGTH_TRAINING");
          goto LABEL_41;
        case '4':
          v10 = objc_msgSend(v3, "isIndoor");
          v11 = CFSTR("_OUTDOOR_WALK");
          v12 = CFSTR("_INDOOR_WALK");
          break;
        default:
          if (v2 == 35)
          {
            v10 = objc_msgSend(v3, "isIndoor");
            v11 = CFSTR("_OUTDOOR_ROWING");
            v12 = CFSTR("_INDOOR_ROWING");
          }
          else
          {
            if (v2 != 37)
              goto LABEL_41;
            v10 = objc_msgSend(v3, "isIndoor");
            v11 = CFSTR("_OUTDOOR_RUN");
            v12 = CFSTR("_INDOOR_RUN");
          }
          break;
      }
LABEL_38:
      if (v10)
        v11 = (__CFString *)v12;
LABEL_40:
      v5 = v11;
      goto LABEL_41;
    }
    if (v2 <= 19)
    {
      if (v2 != 13)
      {
        if (v2 == 16)
          v5 = CFSTR("_ELLIPTICAL");
        else
          v5 = 0;
        goto LABEL_41;
      }
      v10 = objc_msgSend(v3, "isIndoor");
      v11 = CFSTR("_OUTDOOR_CYCLE");
      v12 = CFSTR("_INDOOR_CYCLE");
      goto LABEL_38;
    }
    v6 = CFSTR("_FUNCTIONAL_STRENGTH_TRAINING");
    v7 = CFSTR("_HIKING");
    if (v2 != 24)
      v7 = 0;
    v9 = v2 == 20;
LABEL_21:
    if (v9)
      v5 = (__CFString *)v6;
    else
      v5 = (__CFString *)v7;
    goto LABEL_41;
  }
  if (v2 > 71)
  {
    v6 = CFSTR("_TAICHI");
    v7 = CFSTR("_CARDIO_DANCE");
    v8 = CFSTR("_COOLDOWN");
    if (v2 != 80)
      v8 = 0;
    if (v2 != 77)
      v7 = v8;
    v9 = v2 == 72;
    goto LABEL_21;
  }
  switch(v2)
  {
    case '9':
      v5 = CFSTR("_YOGA");
      break;
    case ';':
      v5 = CFSTR("_CORE_TRAINING");
      break;
    case '?':
      v5 = CFSTR("_HIIT");
      break;
    case 'A':
      v5 = CFSTR("_KICKBOXING");
      break;
    case 'B':
      v5 = CFSTR("_PILATES");
      break;
    default:
      break;
  }
LABEL_41:

  return v5;
}

id _ASActivitySharingWorkoutKey(void *a1)
{
  void *v1;
  void *v2;

  _ASActivitySharingSuffixForWorkoutType(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(CFSTR("_WORKOUT"), "stringByAppendingString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id _ASActivitySharingOrderedSuffixesForReplyContextType(unint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (a1 > 6)
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    if (((1 << a1) & 0x7A) != 0)
      _ASActivitySharingSuffixesByTextType();
    else
      _ASActivitySharingSuffixesByMessageToneForReplyContextType(a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id _ASActivitySharingPrefixForReplyContextType(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1 > 6)
    return 0;
  objc_msgSend(CFSTR("FRIEND_REPLY"), "stringByAppendingString:", off_24EE9DEE0[a1], v1, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t ASWatchRepliesCategoryForFitnessExperienceType(unint64_t a1)
{
  if (a1 > 2)
    return 7;
  else
    return qword_226B5EF68[a1];
}

id ASActivitySharingBaseKeysForReplyContextType(unint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1 == 7)
  {
    ASLoggingInitialize();
    v4 = *MEMORY[0x24BE01E90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E90], OS_LOG_TYPE_ERROR))
      ASActivitySharingBaseKeysForReplyContextType_cold_1(v4);
    v5 = 0;
  }
  else
  {
    _ASActivitySharingPrefixForReplyContextType(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ASActivitySharingOrderedSuffixesForReplyContextType(a1, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v9 = (void *)objc_msgSend(v8, "initWithArray:", MEMORY[0x24BDBD1A8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v6, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14), (_QWORD)v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    if (a1 <= 1 && v3)
    {
      _ASActivitySharingWorkoutKey(v3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = a1 == 0;
        objc_msgSend(CFSTR("FRIEND_REPLY"), "stringByAppendingString:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v9, "count");
        if (v19 >= v17)
          v20 = v17;
        else
          v20 = v19;
        objc_msgSend(v9, "insertObject:atIndex:", v18, v20, (_QWORD)v22);

      }
    }
    v5 = (void *)objc_msgSend(v9, "copy", (_QWORD)v22);

  }
  return v5;
}

id ASAllValidLocalizationKeysForPrefix(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  v5 = 0;
  for (i = (void *)MEMORY[0x24BDBD1A8]; ; i = (void *)v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%d"), v3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WRLocalizedCategoryString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v7) & 1) != 0)
      break;
    v5 = (v5 + 1);
    objc_msgSend(i, "arrayByAddingObject:", v7);
    v9 = objc_claimAutoreleasedReturnValue();

  }
  return i;
}

id ASActivitySharingRandomizedReplyKeysForReplyContextType(unint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v19;
  id obj;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v19 = v5;
  ASActivitySharingBaseKeysForReplyContextType(a1, v5);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    v10 = (id)MEMORY[0x24BDBD1A8];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        ASAllValidLocalizationKeysForPrefix(v12, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __ASActivitySharingRandomizedReplyKeysForReplyContextType_block_invoke;
        v21[3] = &unk_24EE9DEC0;
        v10 = v10;
        v22 = v10;
        objc_msgSend(v13, "hk_filter:", v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", (int)arc4random_uniform(objc_msgSend(v14, "count")));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "arrayByAddingObject:", v15);
          v16 = objc_claimAutoreleasedReturnValue();

          v10 = (id)v16;
        }
        else
        {
          ASLoggingInitialize();
          v17 = *MEMORY[0x24BE01E90];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E90], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v12;
            _os_log_error_impl(&dword_226B38000, v17, OS_LOG_TYPE_ERROR, "Didn't find reply keys for base reply key %@", buf, 0xCu);
          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v8);
  }
  else
  {
    v10 = (id)MEMORY[0x24BDBD1A8];
  }

  return v10;
}

id ASActivitySharingRandomizedLocalizedReplyForReplyContextType(unint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ASActivitySharingRandomizedReplyKeysForReplyContextType(a1, a2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        WRLocalizedCategoryString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13, v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

id _ASWorkoutCountString(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  ActivitySharingBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2 == 1)
    v5 = CFSTR("WORKOUT");
  else
    v5 = CFSTR("WORKOUTS");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24EE9E808, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BE37938];
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend(v1, "count");

  objc_msgSend(v8, "numberWithUnsignedInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithNumber:decimalPrecision:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id ASWorkoutNameString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = a1;
  objc_msgSend(v3, "keyColorForDisplayMode:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "hkWorkoutFromFriendWorkout");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD31C0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "workoutActivityType");
    objc_msgSend(v4, "fi_swimmingLocationType");
    FILocalizedNameForActivityType();
  }
  else
  {
    _ASWorkoutCountString(v4);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BDD1688]);
  v15[0] = *MEMORY[0x24BEBB360];
  objc_msgSend(v3, "descriptionFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[1] = *MEMORY[0x24BEBB368];
  v16[0] = v11;
  v16[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithString:attributes:", v9, v12);

  return v13;
}

id ASWorkoutCountString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = a1;
  objc_msgSend(v3, "keyColorForDisplayMode:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ASWorkoutCountString(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x24BDD1688]);
  v12[0] = *MEMORY[0x24BEBB360];
  objc_msgSend(v3, "multilineDataFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = *MEMORY[0x24BEBB368];
  v13[0] = v8;
  v13[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithString:attributes:", v6, v9);

  return v10;
}

id ASWorkoutCaloriesString(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "keyColorForDisplayMode:", 4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "quantityWithUnit:doubleValue:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    do
    {
      v16 = 0;
      v17 = v11;
      do
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v16), "totalEnergyBurned");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_quantityByAddingQuantity:", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v16;
        v17 = v11;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v14);
  }

  objc_msgSend(v7, "localizedStringWithActiveEnergy:", v11);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x24BDD1688]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v37);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *MEMORY[0x24BEBB360];
  v21 = v44;
  objc_msgSend(v6, "multilineDataFont");
  v22 = v7;
  v36 = v7;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = *MEMORY[0x24BEBB368];
  v24 = v45;
  v46[0] = v23;
  v46[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, &v44, 2);
  v35 = (void *)v8;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v19, "initWithString:attributes:", v20, v25);

  objc_msgSend(v22, "localizedShortActiveEnergyUnitString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(v27, "localizedUppercaseString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v21;
  v30 = v6;
  objc_msgSend(v6, "multilineUnitFont");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v24;
  v43[0] = v31;
  v43[1] = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v28, "initWithString:attributes:", v29, v32);
  objc_msgSend(v26, "appendAttributedString:", v33);

  return v26;
}

uint64_t sub_226B4BB48()
{
  uint64_t result;

  sub_226B4BE7C();
  result = sub_226B5D294();
  qword_25589FD28 = result;
  return result;
}

uint64_t variable initialization expression of ReplyBubbleView.delegate()
{
  return 0;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_226B4BBCC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_226B4BBEC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_226B4C188(a1, &qword_25589FD48);
}

void type metadata accessor for ASRichMessageType(uint64_t a1)
{
  sub_226B4C188(a1, &qword_25589FD50);
}

uint64_t sub_226B4BC3C(uint64_t a1, uint64_t a2)
{
  return sub_226B4BD84(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_226B4BC48(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_226B5D138();
  *a2 = 0;
  return result;
}

uint64_t sub_226B4BCBC(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_226B5D144();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_226B4BD38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_226B5D150();
  v2 = sub_226B5D12C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_226B4BD78(uint64_t a1, uint64_t a2)
{
  return sub_226B4BD84(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_226B4BD84(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_226B5D150();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_226B4BDC0()
{
  sub_226B5D150();
  sub_226B5D18C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_226B4BE00()
{
  uint64_t v0;

  sub_226B5D150();
  sub_226B5D36C();
  sub_226B5D18C();
  v0 = sub_226B5D384();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_226B4BE70(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

unint64_t sub_226B4BE7C()
{
  unint64_t result;

  result = qword_25589FD58;
  if (!qword_25589FD58)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25589FD58);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ReplyLayoutValues(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_226B4BEF4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_226B4BF14(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_226B4C188(a1, &qword_25589FD60);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_226B4C188(a1, &qword_25589FD68);
}

uint64_t sub_226B4BF68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_226B5D150();
  v2 = v1;
  if (v0 == sub_226B5D150() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_226B5D33C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_226B4BFF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_226B5D12C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_226B4C034@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_226B5D150();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_226B4C05C()
{
  sub_226B4C110((unint64_t *)&qword_25589FD88, (uint64_t)&unk_226B5F0F0);
  sub_226B4C110(&qword_25589FD90, (uint64_t)&unk_226B5F044);
  return sub_226B5D324();
}

uint64_t sub_226B4C0C8()
{
  return sub_226B4C110(&qword_25589FD70, (uint64_t)&unk_226B5F008);
}

uint64_t sub_226B4C0EC()
{
  return sub_226B4C110(&qword_25589FD78, (uint64_t)&unk_226B5EFDC);
}

uint64_t sub_226B4C110(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x2276A2E38](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_226B4C150()
{
  return sub_226B4C110(&qword_25589FD80, (uint64_t)&unk_226B5F078);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_226B4C188(a1, &qword_25589FD98);
}

void sub_226B4C188(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void **sub_226B4C1D8(void **a1, void **a2, int *a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  char *v39;
  char *v40;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    *(_QWORD *)v9 = *(void **)((char *)a2 + v8);
    *((_QWORD *)v9 + 1) = v11;
    v9[16] = *((_BYTE *)a2 + v8 + 16);
    v12 = (int *)type metadata accessor for Reply();
    v13 = v12[6];
    v39 = &v10[v13];
    v40 = &v9[v13];
    v14 = sub_226B5D06C();
    v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    v16 = v4;
    swift_bridgeObjectRetain();
    v15(v40, v39, v14);
    v17 = v12[7];
    v18 = &v9[v17];
    v19 = &v10[v17];
    v20 = *((_QWORD *)v19 + 1);
    *(_QWORD *)v18 = *(_QWORD *)v19;
    *((_QWORD *)v18 + 1) = v20;
    v21 = v12[8];
    v22 = &v9[v21];
    v23 = &v10[v21];
    v24 = sub_226B5D030();
    v25 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
    swift_bridgeObjectRetain();
    v25(v22, v23, v24);
    v26 = a3[6];
    v27 = a3[7];
    v28 = *(void **)((char *)a2 + v26);
    *(void **)((char *)v7 + v26) = v28;
    v29 = *(void **)((char *)a2 + v27);
    *(void **)((char *)v7 + v27) = v29;
    v30 = a3[8];
    v31 = a3[9];
    v32 = *(void **)((char *)a2 + v30);
    *(void **)((char *)v7 + v30) = v32;
    v33 = *(void **)((char *)a2 + v31);
    *(void **)((char *)v7 + v31) = v33;
    v34 = v28;
    v35 = v29;
    v36 = v32;
    v37 = v33;
  }
  return v7;
}

void sub_226B4C340(id *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v4 = (char *)a1 + a2[5];
  swift_bridgeObjectRelease();
  v5 = type metadata accessor for Reply();
  v6 = &v4[*(int *)(v5 + 24)];
  v7 = sub_226B5D06C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  v8 = &v4[*(int *)(v5 + 32)];
  v9 = sub_226B5D030();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);

}

void **sub_226B4C418(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  id v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  char *v38;
  char *v39;

  v6 = *a2;
  *a1 = *a2;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(uint64_t *)((char *)a2 + v7 + 8);
  *(_QWORD *)v8 = *(void **)((char *)a2 + v7);
  *((_QWORD *)v8 + 1) = v10;
  v8[16] = *((_BYTE *)a2 + v7 + 16);
  v11 = (int *)type metadata accessor for Reply();
  v12 = v11[6];
  v38 = &v9[v12];
  v39 = &v8[v12];
  v13 = sub_226B5D06C();
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  v15 = v6;
  swift_bridgeObjectRetain();
  v14(v39, v38, v13);
  v16 = v11[7];
  v17 = &v8[v16];
  v18 = &v9[v16];
  v19 = *((_QWORD *)v18 + 1);
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = v19;
  v20 = v11[8];
  v21 = &v8[v20];
  v22 = &v9[v20];
  v23 = sub_226B5D030();
  v24 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16);
  swift_bridgeObjectRetain();
  v24(v21, v22, v23);
  v25 = a3[6];
  v26 = a3[7];
  v27 = *(void **)((char *)a2 + v25);
  *(void **)((char *)a1 + v25) = v27;
  v28 = *(void **)((char *)a2 + v26);
  *(void **)((char *)a1 + v26) = v28;
  v29 = a3[8];
  v30 = a3[9];
  v31 = *(void **)((char *)a2 + v29);
  *(void **)((char *)a1 + v29) = v31;
  v32 = *(void **)((char *)a2 + v30);
  *(void **)((char *)a1 + v30) = v32;
  v33 = v27;
  v34 = v28;
  v35 = v31;
  v36 = v32;
  return a1;
}

void **sub_226B4C558(void **a1, void **a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  *(_QWORD *)v10 = *(void **)((char *)a2 + v9);
  *((_QWORD *)v10 + 1) = *(void **)((char *)a2 + v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[16] = v11[16];
  v12 = (int *)type metadata accessor for Reply();
  v13 = v12[6];
  v14 = &v10[v13];
  v15 = &v11[v13];
  v16 = sub_226B5D06C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  v17 = v12[7];
  v18 = &v10[v17];
  v19 = &v11[v17];
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *((_QWORD *)v18 + 1) = *((_QWORD *)v19 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = v12[8];
  v21 = &v10[v20];
  v22 = &v11[v20];
  v23 = sub_226B5D030();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 24))(v21, v22, v23);
  v24 = a3[6];
  v25 = *(void **)((char *)a2 + v24);
  v26 = *(void **)((char *)a1 + v24);
  *(void **)((char *)a1 + v24) = v25;
  v27 = v25;

  v28 = a3[7];
  v29 = *(void **)((char *)a2 + v28);
  v30 = *(void **)((char *)a1 + v28);
  *(void **)((char *)a1 + v28) = v29;
  v31 = v29;

  v32 = a3[8];
  v33 = *(void **)((char *)a2 + v32);
  v34 = *(void **)((char *)a1 + v32);
  *(void **)((char *)a1 + v32) = v33;
  v35 = v33;

  v36 = a3[9];
  v37 = *(void **)((char *)a1 + v36);
  v38 = *(void **)((char *)a2 + v36);
  *(void **)((char *)a1 + v36) = v38;
  v39 = v38;

  return a1;
}

_QWORD *sub_226B4C6D0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_OWORD *)v7 = *(_OWORD *)((char *)a2 + v6);
  v7[16] = *((_BYTE *)a2 + v6 + 16);
  v9 = (int *)type metadata accessor for Reply();
  v10 = v9[6];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_226B5D06C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  *(_OWORD *)&v7[v9[7]] = *(_OWORD *)&v8[v9[7]];
  v14 = v9[8];
  v15 = &v7[v14];
  v16 = &v8[v14];
  v17 = sub_226B5D030();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  v18 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v18) = *(_QWORD *)((char *)a2 + v18);
  v19 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *(_QWORD *)((char *)a1 + v19) = *(_QWORD *)((char *)a2 + v19);
  return a1;
}

void **sub_226B4C7CC(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;

  v6 = *a1;
  *a1 = *a2;

  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(uint64_t *)((char *)a2 + v7 + 8);
  *(_QWORD *)v8 = *(void **)((char *)a2 + v7);
  *((_QWORD *)v8 + 1) = v10;
  swift_bridgeObjectRelease();
  v8[16] = v9[16];
  v11 = (int *)type metadata accessor for Reply();
  v12 = v11[6];
  v13 = &v8[v12];
  v14 = &v9[v12];
  v15 = sub_226B5D06C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = v11[7];
  v17 = &v8[v16];
  v18 = &v9[v16];
  v20 = *(_QWORD *)v18;
  v19 = *((_QWORD *)v18 + 1);
  *(_QWORD *)v17 = v20;
  *((_QWORD *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  v21 = v11[8];
  v22 = &v8[v21];
  v23 = &v9[v21];
  v24 = sub_226B5D030();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  v25 = a3[6];
  v26 = *(void **)((char *)a1 + v25);
  *(void **)((char *)a1 + v25) = *(void **)((char *)a2 + v25);

  v27 = a3[7];
  v28 = *(void **)((char *)a1 + v27);
  *(void **)((char *)a1 + v27) = *(void **)((char *)a2 + v27);

  v29 = a3[8];
  v30 = *(void **)((char *)a1 + v29);
  *(void **)((char *)a1 + v29) = *(void **)((char *)a2 + v29);

  v31 = a3[9];
  v32 = *(void **)((char *)a1 + v31);
  *(void **)((char *)a1 + v31) = *(void **)((char *)a2 + v31);

  return a1;
}

uint64_t sub_226B4C910()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_226B4C91C(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for Reply();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_226B4C998()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_226B4C9A4(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for Reply();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for WorkoutRenderer()
{
  uint64_t result;

  result = qword_25589FF78;
  if (!qword_25589FF78)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_226B4CA54()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Reply();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_226B4CADC(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char *v23;
  id v24;
  id v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v42;
  double v43;
  id v44;
  CGFloat *v45;
  _QWORD *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  int *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  id v60;
  uint64_t v61;
  id v62;
  char *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  id v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  id v86;
  id v87;
  id v88;
  void *v89;
  id v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  void *v101;
  uint64_t v102;
  id v103;
  void *v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  uint64_t v110;
  id v111;
  id (*v112)();
  CGFloat *v113;
  unint64_t v114;
  id v115;
  id v116;
  id v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  void *v121;
  int *v122;
  id v123[6];
  _QWORD v124[17];
  CGFloat v125;
  uint64_t v126;
  char v127;
  _QWORD v128[3];
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  CGRect v132;
  CGRect v133;

  v131 = *MEMORY[0x24BDAC8D0];
  v6 = type metadata accessor for WorkoutRenderer();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v111 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v9 = a1;
  v122 = (int *)v7;
  sub_226B4DCE0(a2, (uint64_t)&v9[*(int *)(v7 + 20)]);
  v10 = qword_25589FD38;
  v11 = a1;
  if (v10 != -1)
    swift_once();
  sub_226B4DD24((uint64_t)&qword_2558A0BC8, (uint64_t)v128);
  v12 = v129;
  v13 = v130;
  __swift_project_boxed_opaque_existential_1(v128, v129);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v13 + 8))(v124, v12, v13);
  v14 = objc_msgSend(v11, sel_hkWorkoutFromFriendWorkout);
  if (!v14)
    goto LABEL_40;
  v15 = v14;
  v111 = objc_msgSend(v14, sel_workoutActivityType);
  if (v111 == (id)84)
  {
    v16 = objc_msgSend((id)objc_opt_self(), sel_diveColors);
    if (!v16)
    {
      __break(1u);
      goto LABEL_43;
    }
    v17 = v16;
    v18 = objc_msgSend(v16, sel_nonGradientTextColor);

    if (v18)
      goto LABEL_9;
    __break(1u);
  }
  v19 = objc_msgSend((id)objc_opt_self(), sel_metricColorsForGoalTypeIdentifier_, objc_msgSend(v11, sel_goalType, v111));
  v18 = objc_msgSend(v19, sel_nonGradientTextColor);

  if (!v18)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
LABEL_9:
  v20 = v129;
  v21 = v130;
  __swift_project_boxed_opaque_existential_1(v128, v129);
  v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 40))(v20, v21);
  v120 = a2;
  v121 = v15;
  v117 = v11;
  v118 = a3;
  v116 = v18;
  if ((v22 & 1) == 0)
  {
    v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_init);
    v112 = 0;
    v113 = 0;
    v52 = v122;
    *(_QWORD *)&v9[v122[6]] = v53;
LABEL_14:
    v54 = v129;
    v55 = v130;
    __swift_project_boxed_opaque_existential_1(v128, v129);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 96))(a2, v54, v55);
    v56 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    *(_QWORD *)&v9[v52[7]] = v56;
    v57 = v129;
    v58 = v130;
    __swift_project_boxed_opaque_existential_1(v128, v129);
    v59 = *(uint64_t (**)(uint64_t, uint64_t))(v58 + 24);
    v60 = v56;
    v61 = v59(v57, v58);
    sub_226B4D710(v61);
    swift_bridgeObjectRelease();
    v62 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    v63 = v9;
    v64 = (void *)sub_226B5D12C();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    v66 = v65;
    v114 = sub_226B4DD8C();
    v115 = v66;
    v67 = (void *)sub_226B5D120();
    swift_bridgeObjectRelease();
    v68 = objc_msgSend(v62, sel_initWithString_attributes_, v64, v67);

    objc_msgSend(v60, sel_setAttributedText_, v68);
    objc_msgSend(v60, sel_setNumberOfLines_, 1);
    v69 = v121;
    _HKWorkoutIsIndoor(v121);
    objc_msgSend(v69, sel_workoutActivityType);
    objc_msgSend(v69, sel_fi_swimmingLocationType);
    v70 = (id)FILocalizedNameForActivityType();
    if (v70)
    {
      v71 = v70;
      sub_226B5D150();

      v72 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
      v73 = v122[8];
      v119 = v63;
      *(_QWORD *)&v63[v73] = v72;
      v75 = v129;
      v74 = v130;
      __swift_project_boxed_opaque_existential_1(v128, v129);
      v76 = *(uint64_t (**)(uint64_t, uint64_t))(v74 + 32);
      v77 = v72;
      v78 = v76(v75, v74);
      sub_226B4D710(v78);
      swift_bridgeObjectRelease();
      v79 = objc_allocWithZone(MEMORY[0x24BDD1458]);
      v80 = (void *)sub_226B5D12C();
      swift_bridgeObjectRelease();
      v81 = (void *)sub_226B5D120();
      swift_bridgeObjectRelease();
      v82 = objc_msgSend(v79, sel_initWithString_attributes_, v80, v81);

      objc_msgSend(v77, sel_setAttributedText_, v82);
      objc_msgSend(v77, sel_setNumberOfLines_, 2);
      if ((v127 & 1) == 0)
      {

        sub_226B4DE38((uint64_t)v124);
        sub_226B4DE60(v120);
        v83 = v118;
        v84 = (uint64_t)v119;
        *(_QWORD *)&v119[v122[9]] = 0;
LABEL_38:
        v110 = (uint64_t)v112;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v128);
        sub_226B4DEBC(v84, v83);
        sub_226B4DF00(v110);
        return;
      }
      v85 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3C40]), sel_init);
      v86 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE37948]), sel_initWithHealthStore_, v85);
      v87 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE37938]), sel_initWithUnitManager_, v86);
      v88 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
      v89 = v88;
      *(_QWORD *)&v119[v122[9]] = v88;
      if (v111 == (id)84)
      {
        if (v87)
        {
          v90 = v87;
          objc_msgSend(v121, sel_duration);
          v91 = objc_msgSend(v90, sel_stringWithDuration_durationFormat_, 2);

          if (v91)
          {
            sub_226B5D150();
            v93 = v92;

            v94 = 0;
            goto LABEL_29;
          }
          v94 = 0;
          goto LABEL_28;
        }
      }
      else if (v87)
      {
        v123[0] = 0;
        v95 = objc_msgSend(v87, sel_localizedGoalDescriptionForWorkout_withValue_appendActivityType_, v121, v123, 0);
        v96 = v123[0];
        if (v95)
        {
          v97 = v95;
          sub_226B5D150();
          v93 = v98;
          v94 = v96;

          goto LABEL_29;
        }
        v94 = v123[0];
LABEL_28:
        v93 = 0;
LABEL_29:
        if (v89)
          goto LABEL_30;
        goto LABEL_25;
      }
      v94 = 0;
      v93 = 0;
      if (v88)
      {
LABEL_30:
        v100 = v89;
        if (v93)
        {
          v101 = (void *)sub_226B5D12C();
          swift_bridgeObjectRelease();
        }
        else
        {
          v101 = 0;
        }
        v102 = v120;
        v103 = v117;
        objc_msgSend(v89, sel_setText_, v101, v111);

        objc_msgSend(v89, sel_setNumberOfLines_, 1);
        if (v111 == (id)84)
        {
          v104 = (void *)objc_opt_self();
          v105 = v89;
          v106 = objc_msgSend(v104, sel_metricColorsForGoalTypeIdentifier_, 2);
          v107 = objc_msgSend(v106, sel_nonGradientTextColor);

          v108 = v116;
        }
        else
        {
          v109 = v89;
          v108 = v116;
          v107 = v116;
        }
        objc_msgSend(v89, sel_setTextColor_, v107);

        objc_msgSend(v89, sel_setFont_, v126);
        sub_226B4DE38((uint64_t)v124);

        v99 = v102;
        goto LABEL_37;
      }
LABEL_25:

      swift_bridgeObjectRelease();
      sub_226B4DE38((uint64_t)v124);

      v99 = v120;
LABEL_37:
      sub_226B4DE60(v99);

      v83 = v118;
      v84 = (uint64_t)v119;
      goto LABEL_38;
    }
LABEL_41:
    __break(1u);
  }
  v23 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BE01CC8]), sel_initWithNumberOfRings_, 1);
  v24 = objc_allocWithZone(MEMORY[0x24BE01CD8]);
  v119 = v23;
  v25 = objc_msgSend(v24, sel_initWithRingGroupController_, v23);
  objc_msgSend(v15, sel_fiui_completionFactor);
  v27 = v26;
  v28 = (void *)objc_opt_self();
  v115 = v25;
  v29 = objc_msgSend(v28, sel_renderSingleRingUsingRingsView_forPercentage_withDiameter_thickness_topColor_bottomColor_, v25, v18, v18, v27, *(double *)&v124[9], *(double *)&v124[16]);
  v30 = objc_msgSend(v15, sel_fiui_activityType);
  v31 = (id)FIUIStaticWorkoutIconImage();

  if (v31)
  {
    v32 = objc_msgSend(v31, sel_imageWithRenderingMode_, 2);

    v33 = objc_msgSend(v32, sel_imageWithTintColor_, v18);
    objc_msgSend(v29, sel_size);
    v35 = v34;
    v37 = v36;
    v132.origin.x = 0.0;
    v132.origin.y = 0.0;
    v132.size.width = v35;
    v132.size.height = v37;
    v133 = CGRectInset(v132, v125, v125);
    x = v133.origin.x;
    y = v133.origin.y;
    width = v133.size.width;
    height = v133.size.height;
    objc_msgSend(v29, sel_size);
    v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD618]), sel_initWithSize_, v42, v43);
    v45 = (CGFloat *)swift_allocObject();
    v45[3] = 0.0;
    v45[4] = 0.0;
    *((_QWORD *)v45 + 2) = v29;
    v45[5] = v35;
    v45[6] = v37;
    *((_QWORD *)v45 + 7) = v33;
    v45[8] = x;
    v45[9] = y;
    v45[10] = width;
    v45[11] = height;
    v46 = (_QWORD *)swift_allocObject();
    v46[2] = sub_226B4DF3C;
    v46[3] = v45;
    v123[4] = sub_226B4DFB0;
    v123[5] = v46;
    v123[0] = (id)MEMORY[0x24BDAC760];
    v123[1] = (id)1107296256;
    v123[2] = sub_226B4D6DC;
    v123[3] = &block_descriptor;
    v47 = _Block_copy(v123);
    v48 = v29;
    v49 = v33;
    swift_retain();
    swift_release();
    v50 = objc_msgSend(v44, sel_imageWithActions_, v47);
    _Block_release(v47);
    LOBYTE(v47) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v47 & 1) == 0)
    {
      v113 = v45;
      v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithImage_, v50);
      v52 = v122;
      *(_QWORD *)&v9[v122[6]] = v51;
      objc_msgSend(v51, sel_setContentMode_, 1);

      v112 = sub_226B4DF3C;
      a2 = v120;
      goto LABEL_14;
    }
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_44:
  __break(1u);
}

void sub_226B4D6DC(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t sub_226B4D710(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  int64_t v28;
  _OWORD v29[4];
  _OWORD v30[2];
  _OWORD v31[3];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25589FFC8);
    v2 = sub_226B5D318();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v28 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v28 << 6);
      goto LABEL_28;
    }
    v11 = v28 + 1;
    if (__OFADD__(v28, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v26)
      goto LABEL_37;
    v12 = *(_QWORD *)(v27 + 8 * v11);
    v13 = v28 + 1;
    if (!v12)
    {
      v13 = v28 + 2;
      if (v28 + 2 >= v26)
        goto LABEL_37;
      v12 = *(_QWORD *)(v27 + 8 * v13);
      if (!v12)
      {
        v13 = v28 + 3;
        if (v28 + 3 >= v26)
          goto LABEL_37;
        v12 = *(_QWORD *)(v27 + 8 * v13);
        if (!v12)
        {
          v13 = v28 + 4;
          if (v28 + 4 >= v26)
            goto LABEL_37;
          v12 = *(_QWORD *)(v27 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v28 = v13;
LABEL_28:
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v10);
    *(_QWORD *)&v31[0] = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v10);
    *(_QWORD *)&v30[0] = v15;
    v16 = *(id *)&v31[0];
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v17 = *(_QWORD *)&v31[0];
    sub_226B4DFE8((_OWORD *)((char *)v31 + 8), v29);
    sub_226B4DFE8(v29, v31);
    sub_226B4DFE8(v31, v30);
    sub_226B5D150();
    sub_226B5D36C();
    sub_226B5D18C();
    v18 = sub_226B5D384();
    result = swift_bridgeObjectRelease();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = v18 & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v8 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v8 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v17;
    result = (uint64_t)sub_226B4DFE8(v30, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v8));
    ++*(_QWORD *)(v2 + 16);
  }
  v14 = v28 + 5;
  if (v28 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_226B4DFF8();
    return v2;
  }
  v12 = *(_QWORD *)(v27 + 8 * v14);
  if (v12)
  {
    v13 = v28 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v26)
      goto LABEL_37;
    v12 = *(_QWORD *)(v27 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_226B4DAB4()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25589FFC0);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_226B5F150;
  v2 = (int *)type metadata accessor for WorkoutRenderer();
  v3 = *(void **)(v0 + v2[7]);
  *(_QWORD *)(v1 + 32) = v3;
  v4 = *(void **)(v0 + v2[8]);
  *(_QWORD *)(v1 + 40) = v4;
  sub_226B5D1E0();
  v5 = *(void **)(v0 + v2[9]);
  if (v5)
  {
    v6 = v5;
    v7 = v3;
    v8 = v4;
    v9 = swift_bridgeObjectRetain();
    MEMORY[0x2276A2424](v9);
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_226B5D1EC();
    sub_226B5D1F8();
    sub_226B5D1E0();
    swift_bridgeObjectRelease();

  }
  else
  {
    v10 = v3;
    v11 = v4;
  }
  return v1;
}

id sub_226B4DBEC(uint64_t a1)
{
  uint64_t v1;

  return *(id *)(v1 + *(int *)(a1 + 24));
}

void sub_226B4DBFC()
{
  id *v0;
  id v1;

  v1 = objc_msgSend(*v0, sel_endDate);
  sub_226B5D018();

}

uint64_t sub_226B4DC48()
{
  return 0;
}

uint64_t sub_226B4DC50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = v4 + *(int *)(type metadata accessor for Reply() + 24);
  v6 = sub_226B5D06C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, v5, v6);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2276A2E20]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_226B4DCE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Reply();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226B4DD24(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_226B4DD8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25589FD88;
  if (!qword_25589FD88)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x2276A2E38](&unk_226B5F0F0, v1);
    atomic_store(result, (unint64_t *)&qword_25589FD88);
  }
  return result;
}

uint64_t _HKWorkoutIsIndoor(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDD31C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

uint64_t sub_226B4DE38(uint64_t a1)
{

  return a1;
}

uint64_t sub_226B4DE60(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Reply();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_226B4DEBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WorkoutRenderer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_226B4DF00(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_226B4DF10()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_226B4DF3C()
{
  uint64_t v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;

  v1 = *(void **)(v0 + 56);
  v2 = *(double *)(v0 + 64);
  v3 = *(double *)(v0 + 72);
  v4 = *(double *)(v0 + 80);
  v5 = *(double *)(v0 + 88);
  objc_msgSend(*(id *)(v0 + 16), sel_drawInRect_, *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
  return objc_msgSend(v1, sel_drawInRect_, v2, v3, v4, v5);
}

uint64_t sub_226B4DFA0()
{
  return swift_deallocObject();
}

uint64_t sub_226B4DFB0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

_OWORD *sub_226B4DFE8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_226B4DFF8()
{
  return swift_release();
}

char *sub_226B4E000(char *a1, char **a2, int *a3)
{
  int v3;
  char *v4;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  char *v39;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a2[1];
    *((_QWORD *)a1 + 1) = v8;
    v9 = a3[6];
    v10 = &a1[v9];
    v11 = (uint64_t)a2 + v9;
    v12 = *(uint64_t *)((char *)a2 + v9 + 8);
    *(_QWORD *)v10 = *(char **)((char *)a2 + v9);
    *((_QWORD *)v10 + 1) = v12;
    v10[16] = *((_BYTE *)a2 + v9 + 16);
    v13 = (int *)type metadata accessor for Reply();
    v14 = v13[6];
    v38 = v11 + v14;
    v39 = &v10[v14];
    v15 = sub_226B5D06C();
    v37 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    v16 = v4;
    v17 = v8;
    swift_bridgeObjectRetain();
    v37(v39, v38, v15);
    v18 = v13[7];
    v19 = &v10[v18];
    v20 = (_QWORD *)(v11 + v18);
    v21 = v20[1];
    *(_QWORD *)v19 = *v20;
    *((_QWORD *)v19 + 1) = v21;
    v22 = v13[8];
    v23 = &v10[v22];
    v24 = v11 + v22;
    v25 = sub_226B5D030();
    v26 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16);
    swift_bridgeObjectRetain();
    v26(v23, v24, v25);
    v27 = a3[7];
    v28 = a3[8];
    v29 = *(char **)((char *)a2 + v27);
    *(_QWORD *)&v7[v27] = v29;
    v30 = *(char **)((char *)a2 + v28);
    *(_QWORD *)&v7[v28] = v30;
    v31 = a3[9];
    v32 = *(char **)((char *)a2 + v31);
    *(_QWORD *)&v7[v31] = v32;
    v33 = v29;
    v34 = v30;
    v35 = v32;
  }
  return v7;
}

void sub_226B4E170(id *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v4 = (char *)a1 + a2[6];
  swift_bridgeObjectRelease();
  v5 = type metadata accessor for Reply();
  v6 = &v4[*(int *)(v5 + 24)];
  v7 = sub_226B5D06C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  v8 = &v4[*(int *)(v5 + 32)];
  v9 = sub_226B5D030();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);

}

_QWORD *sub_226B4E244(_QWORD *a1, uint64_t a2, int *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  id v15;
  id v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v36;
  char *v37;

  v5 = *(void **)a2;
  v6 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v6;
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a2 + v7 + 8);
  *(_QWORD *)v8 = *(_QWORD *)(a2 + v7);
  *((_QWORD *)v8 + 1) = v10;
  v8[16] = *(_BYTE *)(a2 + v7 + 16);
  v11 = (int *)type metadata accessor for Reply();
  v12 = v11[6];
  v36 = v9 + v12;
  v37 = &v8[v12];
  v13 = sub_226B5D06C();
  v14 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  v15 = v5;
  v16 = v6;
  swift_bridgeObjectRetain();
  v14(v37, v36, v13);
  v17 = v11[7];
  v18 = &v8[v17];
  v19 = (_QWORD *)(v9 + v17);
  v20 = v19[1];
  *(_QWORD *)v18 = *v19;
  *((_QWORD *)v18 + 1) = v20;
  v21 = v11[8];
  v22 = &v8[v21];
  v23 = v9 + v21;
  v24 = sub_226B5D030();
  v25 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
  swift_bridgeObjectRetain();
  v25(v22, v23, v24);
  v26 = a3[7];
  v27 = a3[8];
  v28 = *(void **)(a2 + v26);
  *(_QWORD *)((char *)a1 + v26) = v28;
  v29 = *(void **)(a2 + v27);
  *(_QWORD *)((char *)a1 + v27) = v29;
  v30 = a3[9];
  v31 = *(void **)(a2 + v30);
  *(_QWORD *)((char *)a1 + v30) = v31;
  v32 = v28;
  v33 = v29;
  v34 = v31;
  return a1;
}

uint64_t sub_226B4E384(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  v9 = *(void **)(a2 + 8);
  v10 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v9;
  v11 = v9;

  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_QWORD *)v13 = *(_QWORD *)(a2 + v12);
  *(_QWORD *)(v13 + 8) = *(_QWORD *)(a2 + v12 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v13 + 16) = *(_BYTE *)(v14 + 16);
  v15 = (int *)type metadata accessor for Reply();
  v16 = v15[6];
  v17 = v13 + v16;
  v18 = v14 + v16;
  v19 = sub_226B5D06C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  v20 = v15[7];
  v21 = (_QWORD *)(v13 + v20);
  v22 = (_QWORD *)(v14 + v20);
  *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v23 = v15[8];
  v24 = v13 + v23;
  v25 = v14 + v23;
  v26 = sub_226B5D030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 24))(v24, v25, v26);
  v27 = a3[7];
  v28 = *(void **)(a2 + v27);
  v29 = *(void **)(a1 + v27);
  *(_QWORD *)(a1 + v27) = v28;
  v30 = v28;

  v31 = a3[8];
  v32 = *(void **)(a2 + v31);
  v33 = *(void **)(a1 + v31);
  *(_QWORD *)(a1 + v31) = v32;
  v34 = v32;

  v35 = a3[9];
  v36 = *(void **)(a2 + v35);
  v37 = *(void **)(a1 + v35);
  *(_QWORD *)(a1 + v35) = v36;
  v38 = v36;

  return a1;
}

_OWORD *sub_226B4E4F8(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  *a1 = *a2;
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_OWORD *)v7 = *(_OWORD *)((char *)a2 + v6);
  v7[16] = *((_BYTE *)a2 + v6 + 16);
  v9 = (int *)type metadata accessor for Reply();
  v10 = v9[6];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_226B5D06C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  *(_OWORD *)&v7[v9[7]] = *(_OWORD *)&v8[v9[7]];
  v14 = v9[8];
  v15 = &v7[v14];
  v16 = &v8[v14];
  v17 = sub_226B5D030();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  v18 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v18) = *(_QWORD *)((char *)a2 + v18);
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  return a1;
}

uint64_t sub_226B4E5EC(uint64_t a1, _QWORD *a2, int *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = a2[1];

  v8 = a3[6];
  v9 = a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = *(_QWORD *)((char *)a2 + v8 + 8);
  *(_QWORD *)v9 = *(_QWORD *)((char *)a2 + v8);
  *(_QWORD *)(v9 + 8) = v11;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v9 + 16) = v10[16];
  v12 = (int *)type metadata accessor for Reply();
  v13 = v12[6];
  v14 = v9 + v13;
  v15 = &v10[v13];
  v16 = sub_226B5D06C();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  v17 = v12[7];
  v18 = (_QWORD *)(v9 + v17);
  v19 = &v10[v17];
  v21 = *(_QWORD *)v19;
  v20 = *((_QWORD *)v19 + 1);
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  v22 = v12[8];
  v23 = v9 + v22;
  v24 = &v10[v22];
  v25 = sub_226B5D030();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 40))(v23, v24, v25);
  v26 = a3[7];
  v27 = *(void **)(a1 + v26);
  *(_QWORD *)(a1 + v26) = *(_QWORD *)((char *)a2 + v26);

  v28 = a3[8];
  v29 = *(void **)(a1 + v28);
  *(_QWORD *)(a1 + v28) = *(_QWORD *)((char *)a2 + v28);

  v30 = a3[9];
  v31 = *(void **)(a1 + v30);
  *(_QWORD *)(a1 + v30) = *(_QWORD *)((char *)a2 + v30);

  return a1;
}

uint64_t sub_226B4E72C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_226B4E738(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for Reply();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t sub_226B4E7B4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_226B4E7C0(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for Reply();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for CompetitionAcceptedRenderer()
{
  uint64_t result;

  result = qword_2558A0028;
  if (!qword_2558A0028)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_226B4E870()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Reply();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_226B4E8EC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  char *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  uint64_t ObjCClassFromMetadata;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  id v59;
  id v60;
  int *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  char *v67;
  char *v68;
  uint64_t result;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  id v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  id v83;
  uint64_t v84;
  id v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  void (*v94)(char *, uint64_t);
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  unsigned int (*v101)(char *, uint64_t, uint64_t);
  void (*v102)(char *, char *, uint64_t);
  uint64_t (*v103)(char *, uint64_t, uint64_t, uint64_t);
  char *v104;
  id v105;
  _QWORD *v106;
  char *v107;
  _QWORD v108[3];
  uint64_t v109;
  uint64_t v110;
  _QWORD v111[9];
  double v112;
  uint64_t v113;

  v8 = sub_226B5D030();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v107 = (char *)&v89 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0078);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v104 = (char *)&v89 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v89 - v14;
  *a4 = a1;
  v16 = (int *)type metadata accessor for CompetitionAcceptedRenderer();
  sub_226B4DCE0(a2, (uint64_t)a4 + v16[6]);
  v106 = a4;
  a4[1] = a3;
  v17 = qword_25589FD38;
  v18 = a1;
  v19 = a3;
  if (v17 != -1)
    swift_once();
  sub_226B4DD24((uint64_t)&qword_2558A0BC8, (uint64_t)v108);
  v20 = v109;
  v21 = v110;
  __swift_project_boxed_opaque_existential_1(v108, v109);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v21 + 8))(v111, v20, v21);
  objc_msgSend(v18, sel_victoryBadgeStyle);
  type metadata accessor for Reply();
  v22 = (void *)sub_226B5D048();
  v23 = (id)ASEphemeralCompetitionVictoryAchievementForStyle();

  v24 = objc_msgSend(v18, sel_endDate);
  if (!v24)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v15, 1, 1, v8);
    goto LABEL_13;
  }
  v25 = v24;
  v99 = v19;
  v100 = a2;
  v26 = v107;
  sub_226B5D018();

  v102 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v102(v15, v26, v8);
  v103 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v103(v15, 0, 1, v8);
  v101 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  if (v101(v15, 1, v8) == 1)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    result = v103(v104, 1, 1, v8);
    goto LABEL_15;
  }
  v27 = (void *)sub_226B5D00C();
  v94 = *(void (**)(char *, uint64_t))(v9 + 8);
  v94(v15, v8);
  v28 = objc_msgSend(v18, sel_victoryBadgeStyle);
  v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInt_, v28);
  v98 = v23;
  v30 = (id)ASEphemeralEarnedAchievement();

  v96 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE01B10]), sel_init);
  v97 = v30;
  v31 = objc_msgSend(v96, sel_thumbnailImageForAchievement_size_, v30, v112, v112);
  v32 = objc_allocWithZone(MEMORY[0x24BEBD668]);
  v95 = v31;
  v33 = objc_msgSend(v32, sel_initWithImage_, v31);
  v34 = v106;
  *(_QWORD *)((char *)v106 + v16[7]) = v33;
  objc_msgSend(v33, sel_setContentMode_, 1);
  type metadata accessor for ReplyBubbleView();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v90 = (id)objc_opt_self();
  v91 = ObjCClassFromMetadata;
  v36 = objc_msgSend(v90, sel_bundleForClass_, ObjCClassFromMetadata);
  v37 = (void *)sub_226B5D12C();
  v38 = objc_msgSend(v36, sel_localizedStringForKey_value_table_, v37, 0, 0);

  v39 = sub_226B5D150();
  v105 = v18;
  v40 = v39;
  v42 = v41;

  v43 = objc_msgSend((id)objc_opt_self(), sel_as_lightCompetitionGold);
  v44 = v109;
  v45 = v110;
  __swift_project_boxed_opaque_existential_1(v108, v109);
  v46 = *(uint64_t (**)(uint64_t, uint64_t))(v45 + 24);
  swift_bridgeObjectRetain();
  v47 = v46(v44, v45);
  sub_226B4D710(v47);
  swift_bridgeObjectRelease();
  v48 = objc_allocWithZone(MEMORY[0x24BDD1688]);
  v49 = (void *)sub_226B5D12C();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  v51 = v50;
  v52 = sub_226B4DD8C();
  v93 = v51;
  v92 = v52;
  v53 = (void *)sub_226B5D120();
  swift_bridgeObjectRelease();
  v54 = objc_msgSend(v48, sel_initWithString_attributes_, v49, v53);

  v55 = *MEMORY[0x24BEBB368];
  v56 = HIBYTE(v42) & 0xF;
  if ((v42 & 0x2000000000000000) == 0)
    v56 = v40;
  v57 = 7;
  if (((v42 >> 60) & ((v40 & 0x800000000000000) == 0)) != 0)
    v57 = 11;
  v58 = sub_226B4F5A0(0xFuLL, v57 | (v56 << 16), v40, v42);
  v59 = v43;
  swift_bridgeObjectRelease();
  objc_msgSend(v54, sel_addAttribute_value_range_, v55, v59, 0, v58);

  v60 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v61 = v16;
  *(_QWORD *)((char *)v34 + v16[8]) = v60;
  v62 = v60;
  objc_msgSend(v62, sel_setAttributedText_, v54);
  objc_msgSend(v62, sel_setNumberOfLines_, v113);
  objc_msgSend(v62, sel_setAllowsDefaultTighteningForTruncation_, 1);
  objc_msgSend(v62, sel_setLineBreakMode_, 4);

  v63 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  v64 = (void *)sub_226B5D12C();
  objc_msgSend(v63, sel_setDateFormat_, v64);

  v65 = objc_msgSend(v105, sel_startDate);
  if (!v65)
    goto LABEL_14;
  v66 = v65;
  v67 = v107;
  sub_226B5D018();

  v68 = v104;
  v102(v104, v67, v8);
  v103(v68, 0, 1, v8);
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v101)(v68, 1, v8);
  if ((_DWORD)result != 1)
  {
    v70 = (void *)sub_226B5D00C();
    v94(v68, v8);
    v71 = objc_msgSend(v63, sel_stringFromDate_, v70);

    v72 = sub_226B5D150();
    v74 = v73;

    v75 = objc_msgSend(v90, sel_bundleForClass_, v91);
    v76 = (void *)sub_226B5D12C();
    v77 = objc_msgSend(v75, sel_localizedStringForKey_value_table_, v76, 0, 0);

    sub_226B5D150();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
    v78 = swift_allocObject();
    *(_OWORD *)(v78 + 16) = xmmword_226B5F1C0;
    *(_QWORD *)(v78 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v78 + 64) = sub_226B4F7B0();
    *(_QWORD *)(v78 + 32) = v72;
    *(_QWORD *)(v78 + 40) = v74;
    sub_226B5D15C();
    swift_bridgeObjectRelease();
    v79 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    *(_QWORD *)((char *)v106 + v61[9]) = v79;
    v80 = v109;
    v81 = v110;
    __swift_project_boxed_opaque_existential_1(v108, v109);
    v82 = *(uint64_t (**)(uint64_t, uint64_t))(v81 + 32);
    v83 = v79;
    v84 = v82(v80, v81);
    sub_226B4D710(v84);
    swift_bridgeObjectRelease();
    v85 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    v86 = (void *)sub_226B5D12C();
    swift_bridgeObjectRelease();
    v87 = (void *)sub_226B5D120();
    swift_bridgeObjectRelease();
    v88 = objc_msgSend(v85, sel_initWithString_attributes_, v86, v87);

    objc_msgSend(v83, sel_setAttributedText_, v88);
    objc_msgSend(v83, sel_setNumberOfLines_, 2);
    objc_msgSend(v83, sel_setAllowsDefaultTighteningForTruncation_, 1);
    objc_msgSend(v83, sel_setLineBreakMode_, 4);

    sub_226B4DE38((uint64_t)v111);
    sub_226B4DE60(v100);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v108);
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_226B4F36C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  id v12;
  void *v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;

  v3 = sub_226B5D06C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0070);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v1 + *(int *)(type metadata accessor for CompetitionAcceptedRenderer() + 24);
  if (*(_BYTE *)(v9 + 16) == 1)
  {
    v10 = type metadata accessor for Reply();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a1, v9 + *(int *)(v10 + 24), v3);
  }
  v12 = objc_msgSend(*(id *)(v1 + 8), sel_UUID);
  if (v12)
  {
    v13 = v12;
    sub_226B5D054();

    v14 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v14(v8, v6, v3);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v8, 0, 1, v3);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v8, 1, v3);
    if ((_DWORD)result != 1)
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v14)(a1, v8, v3);
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v8, 1, 1, v3);
  }
  __break(1u);
  return result;
}

id sub_226B4F508(uint64_t a1)
{
  uint64_t v1;

  return *(id *)(v1 + *(int *)(a1 + 28));
}

uint64_t sub_226B4F514(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25589FFC0);
  v3 = swift_allocObject();
  v4 = *(int *)(a1 + 36);
  v5 = *(void **)(v1 + *(int *)(a1 + 32));
  *(_OWORD *)(v3 + 16) = xmmword_226B5F150;
  v6 = *(void **)(v1 + v4);
  *(_QWORD *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 40) = v6;
  v10 = v3;
  sub_226B5D1E0();
  v7 = v5;
  v8 = v6;
  return v10;
}

uint64_t sub_226B4F594()
{
  return 1;
}

unint64_t sub_226B4F5A0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  unint64_t result;
  unint64_t v9;
  uint64_t i;
  uint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;

  v7 = sub_226B4F96C(a1, a3, a4);
  result = sub_226B4F96C(a2, a3, a4);
  v9 = result >> 14;
  if (v7 >> 14 < result >> 14)
  {
    for (i = 0; ; ++i)
    {
      v11 = i + 1;
      if (__OFADD__(i, 1))
        break;
      if ((a4 & 0x1000000000000000) != 0)
      {
        result = sub_226B5D174();
        v7 = result;
      }
      else
      {
        v12 = v7 >> 16;
        if ((a4 & 0x2000000000000000) != 0)
        {
          v22 = a3;
          v23 = a4 & 0xFFFFFFFFFFFFFFLL;
          v13 = *((unsigned __int8 *)&v22 + v12);
        }
        else
        {
          result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a3 & 0x1000000000000000) == 0)
            result = sub_226B5D2E8();
          v13 = *(unsigned __int8 *)(result + v12);
        }
        v14 = (char)v13;
        v15 = __clz(v13 ^ 0xFF) - 24;
        if (v14 >= 0)
          LOBYTE(v15) = 1;
        v7 = ((v12 + v15) << 16) | 5;
      }
      if (v9 <= v7 >> 14)
        return v11;
    }
    __break(1u);
LABEL_36:
    __break(1u);
    return result;
  }
  if (v9 < v7 >> 14)
  {
    v11 = 0;
    while (!__OFSUB__(v11--, 1))
    {
      if ((a4 & 0x1000000000000000) != 0)
      {
        result = sub_226B5D180();
        v7 = result;
      }
      else
      {
        if ((a4 & 0x2000000000000000) != 0)
        {
          v22 = a3;
          v23 = a4 & 0xFFFFFFFFFFFFFFLL;
          if ((*((_BYTE *)&v22 + (v7 >> 16) - 1) & 0xC0) == 0x80)
          {
            v20 = 0;
            do
              v21 = *((_BYTE *)&v22 + (v7 >> 16) + v20-- - 2) & 0xC0;
            while (v21 == 128);
            v19 = 1 - v20;
          }
          else
          {
            v19 = 1;
          }
        }
        else
        {
          result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a3 & 0x1000000000000000) == 0)
            result = sub_226B5D2E8();
          v17 = 0;
          do
            v18 = *(_BYTE *)(result + (v7 >> 16) - 1 + v17--) & 0xC0;
          while (v18 == 128);
          v19 = -v17;
        }
        v7 = (v7 - (v19 << 16)) & 0xFFFFFFFFFFFF0000 | 5;
      }
      if (v9 >= v7 >> 14)
        return v11;
    }
    goto LABEL_36;
  }
  return 0;
}

unint64_t sub_226B4F7B0()
{
  unint64_t result;

  result = qword_2558A0088;
  if (!qword_2558A0088)
  {
    result = MEMORY[0x2276A2E38](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2558A0088);
  }
  return result;
}

unint64_t sub_226B4F7F4(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  _QWORD v13[4];

  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((_BYTE *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            v10 = v5 - 1;
            v11 = *((_BYTE *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          v5 = v10;
        }
        return v5 << 16;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 != (a2 & 0xFFFFFFFFFFFFLL))
        {
          do
LABEL_9:
            v7 = *(_BYTE *)(v6 + v5--) & 0xC0;
          while (v7 == 128);
          ++v5;
        }
      }
      else
      {
        v12 = result >> 16;
        v6 = sub_226B5D2E8();
        v5 = v12;
        if (v12 != v9)
          goto LABEL_9;
      }
      return v5 << 16;
    }
    v8 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v8 = a2 & 0xFFFFFFFFFFFFLL;
    if (v5 != v8)
      return sub_226B5D2B8();
  }
  return result;
}

uint64_t sub_226B4F8F4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_226B5D1B0();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2276A240C](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unint64_t sub_226B4F96C(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5)
    goto LABEL_9;
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 < result >> 16)
  {
    __break(1u);
LABEL_9:
    result = sub_226B4FA08(result, a2, a3);
    if ((result & 1) == 0)
      return result & 0xC | sub_226B4F7F4(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  return result;
}

unint64_t sub_226B4FA08(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 0xC) == 4 << v5)
    result = sub_226B4F8F4(result, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 < result >> 16)
    __break(1u);
  return result;
}

unint64_t sub_226B4FA74(_QWORD *a1, uint64_t a2, char a3)
{
  void *v3;
  uint64_t v7;
  char *v8;
  id v9;
  char *v10;
  id v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  char *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t result;
  unint64_t v33;
  uint64_t v34;
  uint64_t i;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  _QWORD v42[3];
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[24];
  char v46;

  type metadata accessor for Reply();
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v42[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226B4DD24((uint64_t)a1, (uint64_t)v3 + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer);
  v9 = objc_allocWithZone(MEMORY[0x24BEBDB00]);
  v10 = v3;
  v11 = objc_msgSend(v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)&v10[OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_separatorView] = v11;

  sub_226B4DCE0(a2, (uint64_t)v8);
  v12 = sub_226B57764((uint64_t)v8, a3);
  v13 = qword_25589FD38;
  v14 = v12;
  if (v13 != -1)
    swift_once();
  sub_226B4DD24((uint64_t)&qword_2558A0BC8, (uint64_t)v42);
  v15 = v43;
  v16 = v44;
  __swift_project_boxed_opaque_existential_1(v42, v43);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v16 + 8))(v45, v15, v16);
  v17 = OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_separatorView;
  v18 = *(void **)&v14[OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_separatorView];
  v19 = *(double *)&v45[6];
  v20 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v21 = v18;
  v22 = objc_msgSend(v20, sel_initWithWhite_alpha_, v19, 1.0);
  objc_msgSend(v21, sel_setBackgroundColor_, v22);

  objc_msgSend(v14, sel_addSubview_, *(_QWORD *)&v14[v17]);
  v23 = v43;
  v24 = v44;
  __swift_project_boxed_opaque_existential_1(v42, v43);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v24 + 40))(v23, v24) & 1) != 0)
  {
    v25 = a1[3];
    v26 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v25);
    v27 = *(uint64_t (**)(uint64_t, uint64_t))(v26 + 8);
    v28 = v14;
    v29 = (void *)v27(v25, v26);
    objc_msgSend(v28, sel_addSubview_, v29);

  }
  v30 = a1[3];
  v31 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v30);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 16))(v30, v31);
  v33 = result;
  if (result >> 62)
  {
    result = sub_226B5D30C();
    v34 = result;
    if (!result)
      goto LABEL_14;
  }
  else
  {
    v34 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v34)
      goto LABEL_14;
  }
  if (v34 < 1)
  {
    __break(1u);
    return result;
  }
  for (i = 0; i != v34; ++i)
  {
    if ((v33 & 0xC000000000000001) != 0)
      v36 = (id)MEMORY[0x2276A2538](i, v33);
    else
      v36 = *(id *)(v33 + 8 * i + 32);
    v37 = v36;
    objc_msgSend(v14, sel_addSubview_, v36);

  }
LABEL_14:
  swift_bridgeObjectRelease();
  if ((v46 & 1) != 0 && (a3 & 1) == 0)
  {
    v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD740]), sel_initWithTarget_action_, v14, 0);
    objc_msgSend(v14, sel_addGestureRecognizer_, v38);
    v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), sel_initWithTarget_action_, v14, 0);
    objc_msgSend(v39, sel_setNumberOfTapsRequired_, 2);
    objc_msgSend(v14, sel_addGestureRecognizer_, v39);
    v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), sel_initWithTarget_action_, v14, sel_handleTapGesture_);
    objc_msgSend(v40, sel_requireGestureRecognizerToFail_, v39);
    objc_msgSend(v40, sel_requireGestureRecognizerToFail_, v38);
    objc_msgSend(v14, sel_addGestureRecognizer_, v40);
    objc_msgSend(v14, sel_setUserInteractionEnabled_, 1);

  }
  sub_226B4DE38((uint64_t)v45);
  sub_226B4DE60(a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return (unint64_t)v14;
}

unint64_t sub_226B4FF58()
{
  char *v0;
  char *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  char *v6;
  unint64_t result;
  uint64_t v9;
  double (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double i;
  double v22;
  CGFloat v23;
  uint64_t v24;
  char *v25;
  char *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double (**v32)(_QWORD, _QWORD, _QWORD);
  char v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  double (**v38)(_QWORD, _QWORD, _QWORD);
  double v39;
  double v40;
  double MaxX;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  double (**v49)(_QWORD, _QWORD, _QWORD);
  void *v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t p_name;
  uint64_t v55;
  double v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  double (**v66)(_QWORD, _QWORD, _QWORD);
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  char *v72;
  char *v73;
  uint64_t v74;
  double (**v75)(_QWORD, _QWORD, _QWORD);
  void *v76;
  uint64_t v77;
  double (**v78)(_QWORD, _QWORD, _QWORD);
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  CGFloat Width;
  uint64_t v96;
  uint64_t v97;
  double v98;
  void *v99;
  double v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  double v104;
  CGFloat v105;
  double v106;
  CGFloat v107;
  double v108;
  CGFloat v109;
  double v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  double v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  void *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  double v128;
  CGFloat v129;
  double v130;
  CGFloat v131;
  double v132;
  double v133;
  double v134;
  CGFloat v135;
  double v136;
  double v137;
  double v138;
  double v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  unint64_t v143;
  uint64_t v144;
  double v145;
  uint64_t j;
  id v147;
  void *v148;
  double v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t (*v154)(uint64_t, uint64_t);
  id v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  uint64_t v161;
  uint64_t v162;
  id v163;
  void *v164;
  double v165;
  double v166;
  double v167;
  double v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  uint64_t v173;
  id v174;
  void *v175;
  CGFloat x;
  CGFloat y;
  double v178;
  double height;
  double v180;
  double v181;
  uint64_t v182;
  id v183;
  char *v184;
  id v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  uint64_t v190;
  uint64_t v191;
  id v192;
  void *v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double *v216;
  double MinX;
  double v218;
  double v219;
  char *v220;
  char *v221;
  char *v222;
  CGFloat rect;
  char *rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat v227;
  char *v228;
  unint64_t v229;
  unint64_t v230;
  _QWORD v231[3];
  uint64_t v232;
  double (**v233)(_QWORD, _QWORD, _QWORD);
  objc_super v234;
  _QWORD v235[3];
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;
  CGRect v253;
  CGRect v254;
  CGRect v255;
  CGRect v256;
  CGRect v257;
  CGRect v258;
  CGRect v259;
  CGRect v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;

  v1 = v0;
  v234.receiver = v0;
  v234.super_class = (Class)type metadata accessor for ActivityReplyBubbleView();
  objc_msgSendSuper2(&v234, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  v3 = v2;
  v5 = v4;
  v6 = &v0[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_fittingSize];
  result = swift_beginAccess();
  if (v3 == *(double *)v6 && v5 == *((double *)v6 + 1))
    return result;
  if (qword_25589FD38 != -1)
    swift_once();
  sub_226B4DD24((uint64_t)&qword_2558A0BC8, (uint64_t)v231);
  v9 = v232;
  v10 = v233;
  __swift_project_boxed_opaque_existential_1(v231, v232);
  ((double (**)(_QWORD *, uint64_t, _QWORD))v10)[1](v235, v9, v10);
  v11 = v232;
  v12 = (uint64_t)v233;
  __swift_project_boxed_opaque_existential_1(v231, v232);
  objc_msgSend(v1, sel_bounds);
  v17 = sub_226B5B33C(v1[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_reply + 16], v11, v12, v13, v14, v15, v16);
  v19 = v18;
  i = v20;
  v23 = v22;
  v24 = v232;
  v25 = (char *)v233;
  __swift_project_boxed_opaque_existential_1(v231, v232);
  v26 = *(char **)&v1[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_userMessageLabel];
  result = (unint64_t)objc_msgSend(v26, sel_font);
  if (!result)
    goto LABEL_133;
  v27 = (void *)result;
  v28 = (*((double (**)(unint64_t, uint64_t, char *))v25 + 7))(result, v24, v25);

  v246.origin.x = v17;
  v246.origin.y = v19;
  v246.size.width = i;
  v246.size.height = v23;
  MinX = CGRectGetMinX(v246);
  v218 = v238;
  objc_msgSend(v26, sel__lastLineBaselineFrameOriginY);
  v30 = v29;
  v31 = v232;
  v32 = v233;
  __swift_project_boxed_opaque_existential_1(v231, v232);
  v33 = ((uint64_t (*)(uint64_t, double (**)(_QWORD, _QWORD, _QWORD)))v32[5])(v31, v32);
  v34 = v236;
  v35 = v245;
  if ((v33 & 1) != 0)
    v36 = v245;
  else
    v36 = v236;
  v213 = v36;
  v37 = v232;
  v38 = v233;
  __swift_project_boxed_opaque_existential_1(v231, v232);
  LOBYTE(v37) = ((uint64_t (*)(uint64_t, double (**)(_QWORD, _QWORD, _QWORD)))v38[5])(v37, v38);
  rect = v17;
  v247.origin.x = v17;
  rect_24 = i;
  v227 = v19;
  v247.origin.y = v19;
  v247.size.width = i;
  rect_16 = v23;
  v247.size.height = v23;
  v39 = CGRectGetMinX(v247);
  v219 = v34;
  if ((v37 & 1) != 0)
  {
    v40 = v39 + v241 + v240 + v244;
  }
  else
  {
    v35 = v34;
    v40 = v39 + v34;
  }
  v248.origin.x = v17;
  v248.size.width = i;
  v248.origin.y = v19;
  v248.size.height = v23;
  MaxX = CGRectGetMaxX(v248);
  v42 = *(_QWORD *)&v1[OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer + 24];
  v43 = *(_QWORD *)&v1[OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer + 32];
  v228 = &v1[OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer];
  __swift_project_boxed_opaque_existential_1(&v1[OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer], v42);
  v44 = (*(uint64_t (**)(uint64_t, uint64_t))(v43 + 16))(v42, v43);
  if (v44 >> 62)
  {
    v45 = sub_226B5D30C();
    if (v45)
      goto LABEL_16;
LABEL_21:
    swift_bridgeObjectRelease();
    v47 = v26;
    goto LABEL_22;
  }
  v45 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v45)
    goto LABEL_21;
LABEL_16:
  if ((v44 & 0xC000000000000001) != 0)
  {
    v46 = (char *)MEMORY[0x2276A2538](0, v44);
  }
  else
  {
    if (!*(_QWORD *)((v44 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_59;
    }
    v46 = (char *)*(id *)(v44 + 32);
  }
  v47 = v46;
  swift_bridgeObjectRelease();
LABEL_22:
  v48 = v232;
  v49 = v233;
  __swift_project_boxed_opaque_existential_1(v231, v232);
  v222 = v47;
  result = (unint64_t)objc_msgSend(v47, sel_font);
  if (!result)
  {
LABEL_134:
    __break(1u);
    goto LABEL_135;
  }
  v50 = (void *)result;
  v17 = v28 + v30;
  v19 = v239;
  v51 = v49[11](result, v48, v49);

  v52 = *((_QWORD *)v228 + 3);
  v53 = *((_QWORD *)v228 + 4);
  __swift_project_boxed_opaque_existential_1(v228, v52);
  p_name = (*(uint64_t (**)(uint64_t, uint64_t))(v53 + 16))(v52, v53);
  rect_8 = v1;
  v216 = (double *)v6;
  v220 = v26;
  if (p_name >> 62)
    goto LABEL_54;
  v55 = *(_QWORD *)((p_name & 0xFFFFFFFFFFFFF8) + 0x10);
  for (i = v17 + v19; v55; i = v17 + v19)
  {
    MaxX = MaxX - v35 - v40;
    v56 = i + v51;
    v51 = 1.79769313e308;
    v57 = 4;
    while (1)
    {
      v58 = (p_name & 0xC000000000000001) != 0
          ? (char *)MEMORY[0x2276A2538](v57 - 4, p_name)
          : (char *)*(id *)(p_name + 8 * v57);
      v59 = v58;
      v60 = v57 - 3;
      if (__OFADD__(v57 - 4, 1))
        break;
      objc_msgSend(v58, sel_sizeThatFits_, MaxX, 1.79769313e308);
      objc_msgSend(v59, sel_setFrame_, v40, 0.0, fmin(v61, MaxX), v62);
      objc_msgSend(v59, sel__setFirstLineBaselineFrameOriginY_, v56);
      objc_msgSend(v59, sel__lastLineBaselineFrameOriginY);
      v64 = v63;
      v65 = v232;
      v66 = v233;
      __swift_project_boxed_opaque_existential_1(v231, v232);
      result = (unint64_t)objc_msgSend(v59, sel_font);
      if (!result)
        goto LABEL_132;
      v67 = (void *)result;
      v35 = v66[10](result, v65, v66);

      v56 = v64 + v35;
      ++v57;
      if (v60 == v55)
        goto LABEL_32;
    }
    __break(1u);
LABEL_54:
    v55 = sub_226B5D30C();
  }
LABEL_32:
  swift_bridgeObjectRelease();
  v6 = v228;
  v68 = *((_QWORD *)v228 + 3);
  v69 = *((_QWORD *)v228 + 4);
  __swift_project_boxed_opaque_existential_1(v228, v68);
  v44 = (*(uint64_t (**)(uint64_t, uint64_t))(v69 + 16))(v68, v69);
  if (v44 >> 62)
    v70 = sub_226B5D30C();
  else
    v70 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFF8) + 0x10);
  v40 = rect;
  v25 = v26;
  v26 = rect_8;
  if (v70)
  {
    v71 = __OFSUB__(v70, 1);
    v45 = v70 - 1;
    if (!v71)
    {
      if ((v44 & 0xC000000000000001) == 0)
      {
        if ((v45 & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (v45 < *(_QWORD *)((v44 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          v72 = (char *)*(id *)(v44 + 8 * v45 + 32);
LABEL_40:
          v73 = v72;
          swift_bridgeObjectRelease();
          goto LABEL_42;
        }
        __break(1u);
        goto LABEL_63;
      }
LABEL_60:
      v72 = (char *)MEMORY[0x2276A2538](v45, v44);
      goto LABEL_40;
    }
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  swift_bridgeObjectRelease();
  v73 = v220;
LABEL_42:
  v214 = v19;
  v215 = v17;
  v74 = v232;
  v75 = v233;
  __swift_project_boxed_opaque_existential_1(v231, v232);
  result = (unint64_t)objc_msgSend(v73, sel_font);
  if (!result)
  {
LABEL_135:
    __break(1u);
    return result;
  }
  v76 = (void *)result;
  MaxX = v75[9](result, v74, v75);

  v77 = v232;
  v78 = v233;
  __swift_project_boxed_opaque_existential_1(v231, v232);
  p_name = (unint64_t)&stru_24EEA1FF8.name;
  v221 = v73;
  if ((((uint64_t (*)(uint64_t, double (**)(_QWORD, _QWORD, _QWORD)))v78[5])(v77, v78) & 1) != 0)
  {
    objc_msgSend(v222, sel__firstLineCapFrameOriginY);
    v80 = v79;
    objc_msgSend(v73, sel__lastLineBaselineFrameOriginY);
    v82 = v81;
    v212 = MaxX;
    v83 = v240;
    v84 = *((_QWORD *)v6 + 3);
    v85 = *((_QWORD *)v6 + 4);
    __swift_project_boxed_opaque_existential_1(v6, v84);
    v86 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v85 + 8))(v84, v85);
    objc_msgSend(v86, sel_frame);
    v88 = v87;
    v90 = v89;
    v92 = v91;
    v211 = i;
    v94 = v93;

    v249.origin.x = v88;
    v249.origin.y = v90;
    v249.size.width = v92;
    v249.size.height = v94;
    Width = CGRectGetWidth(v249);
    v96 = *((_QWORD *)v6 + 3);
    v97 = *((_QWORD *)v6 + 4);
    v98 = v83 / Width;
    __swift_project_boxed_opaque_existential_1(v6, v96);
    v99 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v97 + 8))(v96, v97);
    objc_msgSend(v99, sel_frame);
    v101 = v100;
    v103 = v102;
    v105 = v104;
    v107 = v106;

    v250.origin.x = v101;
    v250.origin.y = v103;
    v250.size.width = v105;
    v250.size.height = v107;
    v108 = v98 * CGRectGetHeight(v250);
    v40 = rect;
    v251.origin.x = rect;
    v251.size.width = rect_24;
    v251.origin.y = v227;
    v251.size.height = rect_16;
    v109 = CGRectGetMinX(v251) + v241;
    v110 = (v80 + v82 - v108) * 0.5;
    v111 = *((_QWORD *)v6 + 3);
    v112 = *((_QWORD *)v6 + 4);
    __swift_project_boxed_opaque_existential_1(v6, v111);
    v113 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v112 + 8))(v111, v112);
    v114 = v83;
    MaxX = v212;
    objc_msgSend(v113, sel_setFrame_, v109, v110, v114, v108);

    v19 = v211 + v242 - v110;
    if (v19 > 0.0)
    {
      v115 = *((_QWORD *)v6 + 3);
      v116 = *((_QWORD *)v6 + 4);
      __swift_project_boxed_opaque_existential_1(v6, v115);
      result = sub_226B5BA1C(v115, v116);
      v44 = result;
      if (!(result >> 62))
      {
        v117 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v117)
        {
LABEL_47:
          if (v117 < 1)
            goto LABEL_131;
          v118 = 0;
          do
          {
            if ((v44 & 0xC000000000000001) != 0)
              v119 = (id)MEMORY[0x2276A2538](v118, v44);
            else
              v119 = *(id *)(v44 + 8 * v118 + 32);
            v120 = v119;
            ++v118;
            objc_msgSend(v119, *(SEL *)(p_name + 1616));
            v121 = v19 + CGRectGetMinY(v252);
            objc_msgSend(v120, *(SEL *)(p_name + 1616));
            v122 = CGRectGetMinX(v253);
            objc_msgSend(v120, *(SEL *)(p_name + 1616));
            objc_msgSend(v120, sel_setFrame_, v122, v121);

          }
          while (v117 != v118);
        }
LABEL_64:
        swift_bridgeObjectRelease();
        v26 = rect_8;
        v6 = v228;
        v73 = v221;
        goto LABEL_65;
      }
LABEL_63:
      result = sub_226B5D30C();
      v117 = result;
      if (result)
        goto LABEL_47;
      goto LABEL_64;
    }
  }
LABEL_65:
  objc_msgSend(v73, sel__lastLineBaselineFrameOriginY);
  v124 = MaxX + v123 + *(double *)&v235[2];
  v125 = *((_QWORD *)v6 + 3);
  v126 = *((_QWORD *)v6 + 4);
  __swift_project_boxed_opaque_existential_1(v6, v125);
  v127 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v126 + 8))(v125, v126);
  objc_msgSend(v127, *(SEL *)(p_name + 1616));
  v129 = v128;
  v131 = v130;
  v133 = v132;
  v135 = v134;

  v254.origin.x = v129;
  v254.origin.y = v131;
  v254.size.width = v133;
  v254.size.height = v135;
  v136 = v243 - (v124 - CGRectGetMaxY(v254));
  if (v136 < 0.0)
    v137 = 0.0;
  else
    v137 = v136;
  if (v26[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_isPending])
    v138 = v237;
  else
    v138 = v219;
  objc_msgSend(v25, *(SEL *)(p_name + 1616));
  v139 = CGRectGetMaxX(v255);
  v140 = *((_QWORD *)v6 + 3);
  v141 = *((_QWORD *)v6 + 4);
  __swift_project_boxed_opaque_existential_1(v6, v140);
  v142 = (*(uint64_t (**)(uint64_t, uint64_t))(v141 + 16))(v140, v141);
  v143 = v142;
  if (v142 >> 62)
  {
    swift_bridgeObjectRetain();
    v144 = sub_226B5D30C();
    v145 = v138 + v139;
    if (!v144)
      goto LABEL_82;
  }
  else
  {
    v144 = *(_QWORD *)((v142 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v145 = v138 + v139;
    if (!v144)
      goto LABEL_82;
  }
  if (v144 < 1)
  {
    __break(1u);
LABEL_95:
    sub_226B5D1EC();
    goto LABEL_84;
  }
  for (j = 0; j != v144; ++j)
  {
    if ((v143 & 0xC000000000000001) != 0)
      v147 = (id)MEMORY[0x2276A2538](j, v143);
    else
      v147 = *(id *)(v143 + 8 * j + 32);
    v148 = v147;
    objc_msgSend(v147, *(SEL *)(p_name + 1616));
    v149 = CGRectGetMaxX(v256);

    if (v145 <= v213 + v149)
      v145 = v213 + v149;
  }
LABEL_82:
  v124 = v124 + v137;
  swift_bridgeObjectRelease_n();
  v150 = rect_8;
  v144 = *(_QWORD *)&rect_8[OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_separatorView];
  objc_msgSend((id)v144, sel_setFrame_, MinX + v218, v215, v145 - (v218 + v218), v214);
  v257.origin.x = v40;
  v257.size.width = rect_24;
  v257.origin.y = v227;
  v257.size.height = rect_16;
  if (CGRectGetHeight(v257) >= v124)
    goto LABEL_99;
  v258.origin.x = v40;
  v258.size.width = rect_24;
  v258.origin.y = v227;
  v258.size.height = rect_16;
  v133 = v124 - CGRectGetHeight(v258);
  objc_msgSend(v25, *(SEL *)(p_name + 1616));
  CGRectGetHeight(v259);
  objc_msgSend(v25, *(SEL *)(p_name + 1616));
  CGRectGetWidth(v260);
  objc_msgSend(v25, *(SEL *)(p_name + 1616));
  objc_msgSend(v25, sel_setFrame_);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25589FFC0);
  v151 = swift_allocObject();
  *(_OWORD *)(v151 + 16) = xmmword_226B5F220;
  *(_QWORD *)(v151 + 32) = v144;
  v229 = v151;
  sub_226B5D1E0();
  v26 = v228;
  v152 = *((_QWORD *)v228 + 3);
  v153 = *((_QWORD *)v228 + 4);
  __swift_project_boxed_opaque_existential_1(v228, v152);
  v154 = *(uint64_t (**)(uint64_t, uint64_t))(v153 + 8);
  v155 = (id)v144;
  v156 = (void *)v154(v152, v153);
  swift_bridgeObjectRetain();
  v73 = v156;
  MEMORY[0x2276A2424]();
  if (*(_QWORD *)((v229 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v229 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    goto LABEL_95;
LABEL_84:
  sub_226B5D1F8();
  sub_226B5D1E0();
  swift_bridgeObjectRelease();

  v157 = *((_QWORD *)v26 + 3);
  v158 = *((_QWORD *)v26 + 4);
  __swift_project_boxed_opaque_existential_1(v26, v157);
  v159 = (*(uint64_t (**)(uint64_t, uint64_t))(v158 + 16))(v157, v158);
  if (v159 >> 62)
  {
    sub_226B51C4C();
    v160 = sub_226B5D300();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_226B5D348();
    sub_226B51C4C();
    v160 = v159;
  }
  swift_bridgeObjectRelease();
  result = sub_226B515DC(v160);
  if (v229 >> 62)
  {
    swift_bridgeObjectRetain();
    v161 = sub_226B5D30C();
    result = swift_bridgeObjectRelease();
    if (v161)
      goto LABEL_88;
  }
  else
  {
    v161 = *(_QWORD *)((v229 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v161)
    {
LABEL_88:
      if (v161 < 1)
      {
LABEL_129:
        __break(1u);
        goto LABEL_130;
      }
      v162 = 0;
      do
      {
        if ((v229 & 0xC000000000000001) != 0)
          v163 = (id)MEMORY[0x2276A2538](v162, v229);
        else
          v163 = *(id *)(v229 + 8 * v162 + 32);
        v164 = v163;
        ++v162;
        objc_msgSend(v163, *(SEL *)(p_name + 1616));
        v166 = v165 - v133;
        objc_msgSend(v164, *(SEL *)(p_name + 1616));
        v168 = v167;
        objc_msgSend(v164, *(SEL *)(p_name + 1616));
        objc_msgSend(v164, sel_setFrame_, v168, v166);

      }
      while (v161 != v162);
    }
  }
  swift_bridgeObjectRelease();
  v150 = rect_8;
  v73 = v221;
LABEL_99:
  if (objc_msgSend(v150, sel_effectiveUserInterfaceLayoutDirection) != (id)1)
    goto LABEL_110;
  v169 = *((_QWORD *)v228 + 3);
  v170 = *((_QWORD *)v228 + 4);
  __swift_project_boxed_opaque_existential_1(v228, v169);
  result = sub_226B5BA1C(v169, v170);
  v171 = result;
  if (result >> 62)
  {
    result = sub_226B5D30C();
    v172 = result;
    if (result)
      goto LABEL_102;
  }
  else
  {
    v172 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v172)
    {
LABEL_102:
      if (v172 < 1)
      {
LABEL_130:
        __break(1u);
LABEL_131:
        __break(1u);
LABEL_132:
        __break(1u);
LABEL_133:
        __break(1u);
        goto LABEL_134;
      }
      v173 = 0;
      do
      {
        if ((v171 & 0xC000000000000001) != 0)
          v174 = (id)MEMORY[0x2276A2538](v173, v171);
        else
          v174 = *(id *)(v171 + 8 * v173 + 32);
        v175 = v174;
        ++v173;
        objc_msgSend(v174, *(SEL *)(p_name + 1616));
        x = v261.origin.x;
        y = v261.origin.y;
        v178 = v261.size.width;
        height = v261.size.height;
        v180 = v145 - CGRectGetMinX(v261);
        v262.origin.x = x;
        v262.origin.y = y;
        v262.size.width = v178;
        v262.size.height = height;
        v181 = v180 - CGRectGetWidth(v262);
        v263.origin.x = x;
        v263.origin.y = y;
        v263.size.width = v178;
        v263.size.height = height;
        objc_msgSend(v175, sel_setFrame_, v181, CGRectGetMinY(v263), v178, height);

      }
      while (v172 != v173);
    }
  }
  swift_bridgeObjectRelease();
  v73 = v221;
LABEL_110:
  __swift_instantiateConcreteTypeFromMangledName(&qword_25589FFC0);
  v182 = swift_allocObject();
  *(_OWORD *)(v182 + 16) = xmmword_226B5F220;
  *(_QWORD *)(v182 + 32) = v25;
  v230 = v182;
  sub_226B5D1E0();
  v183 = (id)v144;
  v184 = v25;
  v185 = v183;
  v186 = swift_bridgeObjectRetain();
  MEMORY[0x2276A2424](v186);
  if (*(_QWORD *)((v230 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v230 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_226B5D1EC();
  sub_226B5D1F8();
  sub_226B5D1E0();
  swift_bridgeObjectRelease();

  v187 = *((_QWORD *)v228 + 3);
  v188 = *((_QWORD *)v228 + 4);
  __swift_project_boxed_opaque_existential_1(v228, v187);
  v189 = sub_226B5BA1C(v187, v188);
  result = sub_226B515DC(v189);
  if (v230 >> 62)
  {
    swift_bridgeObjectRetain();
    v190 = sub_226B5D30C();
    result = swift_bridgeObjectRelease();
    if (v190)
      goto LABEL_114;
  }
  else
  {
    v190 = *(_QWORD *)((v230 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v190)
    {
LABEL_114:
      if (v190 >= 1)
      {
        v191 = 0;
        do
        {
          if ((v230 & 0xC000000000000001) != 0)
            v192 = (id)MEMORY[0x2276A2538](v191, v230);
          else
            v192 = *(id *)(v230 + 8 * v191 + 32);
          v193 = v192;
          ++v191;
          objc_msgSend(v192, *(SEL *)(p_name + 1616));
          UIRoundToViewScale();
          v195 = v194;
          UIRoundToViewScale();
          v197 = v196;
          UIRoundToViewScale();
          v199 = v198;
          UIRoundToViewScale();
          objc_msgSend(v193, sel_setFrame_, v195, v197, v199, v200);

        }
        while (v190 != v191);
        goto LABEL_121;
      }
      __break(1u);
      goto LABEL_129;
    }
  }
LABEL_121:
  swift_bridgeObjectRelease();
  v201 = v145 + *(double *)&v235[1];
  v264.origin.x = v40;
  v264.size.width = rect_24;
  v264.origin.y = v227;
  v264.size.height = rect_16;
  v202 = CGRectGetHeight(v264);
  if (v124 >= v202)
    v203 = v202;
  else
    v203 = v124;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00D8);
  v204 = swift_allocObject();
  *(_OWORD *)(v204 + 16) = xmmword_226B5F1C0;
  v205 = MEMORY[0x2276A24CC](v201, v203);
  v207 = v206;
  *(_QWORD *)(v204 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v204 + 64) = sub_226B4F7B0();
  *(_QWORD *)(v204 + 32) = v205;
  *(_QWORD *)(v204 + 40) = v207;
  sub_226B5D234();
  if (qword_25589FD20 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
  v208 = swift_allocObject();
  *(_OWORD *)(v208 + 16) = xmmword_226B5F1C0;
  *(_QWORD *)(v208 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00E0);
  *(_QWORD *)(v208 + 64) = sub_226B51C88((unint64_t *)&qword_2558A00E8, &qword_2558A00E0, MEMORY[0x24BDCFBF8]);
  *(_QWORD *)(v208 + 32) = v204;
  swift_bridgeObjectRetain();
  sub_226B5D0D8();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v209 = CGCeiling(v201);
  v210 = CGCeiling(v203);
  sub_226B4DE38((uint64_t)v235);
  *v216 = v209;
  v216[1] = v210;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v231);
}

uint64_t sub_226B51248()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer);
}

id sub_226B51274()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityReplyBubbleView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static ReplyBubbleView.bubbleViewFor(reply:payload:isPending:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  _QWORD *v6;

  *(_BYTE *)(v3 + 176) = a3;
  *(_QWORD *)(v3 + 136) = a1;
  type metadata accessor for Reply();
  *(_QWORD *)(v3 + 144) = swift_task_alloc();
  *(_QWORD *)(v3 + 152) = sub_226B5D21C();
  *(_QWORD *)(v3 + 160) = sub_226B5D210();
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 168) = v6;
  *v6 = v3;
  v6[1] = sub_226B5138C;
  return static ActivityRendererFactory.activityRenderer(for:payload:)(v3 + 56, a1, a2);
}

uint64_t sub_226B5138C()
{
  swift_task_dealloc();
  sub_226B5D204();
  return swift_task_switch();
}

uint64_t sub_226B513FC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  swift_release();
  if (*(_QWORD *)(v0 + 80))
  {
    v1 = *(_BYTE *)(v0 + 176);
    v3 = *(_QWORD *)(v0 + 136);
    v2 = *(_QWORD *)(v0 + 144);
    sub_226B51534((__int128 *)(v0 + 56), v0 + 16);
    sub_226B4DD24(v0 + 16, v0 + 96);
    sub_226B4DCE0(v3, v2);
    v4 = objc_allocWithZone((Class)type metadata accessor for ActivityReplyBubbleView());
    v5 = sub_226B4FA74((_QWORD *)(v0 + 96), v2, v1);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  }
  else
  {
    v6 = *(_BYTE *)(v0 + 176);
    v8 = *(_QWORD *)(v0 + 136);
    v7 = *(_QWORD *)(v0 + 144);
    sub_226B514F4(v0 + 56);
    sub_226B4DCE0(v8, v7);
    v9 = objc_allocWithZone((Class)type metadata accessor for ReplyBubbleView());
    v5 = (unint64_t)sub_226B57764(v7, v6);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v5);
}

uint64_t sub_226B514F4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0098);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_226B51534(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for ActivityReplyBubbleView()
{
  uint64_t result;

  result = qword_2558A00C8;
  if (!qword_2558A00C8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_226B51588()
{
  return type metadata accessor for ActivityReplyBubbleView();
}

uint64_t sub_226B51590()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_226B515DC(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_226B5D30C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_226B5D30C();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x2276A2544](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_226B51888(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_226B5D30C();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_226B5D1E0();
  }
  __break(1u);
  return result;
}

void (*sub_226B51794(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_226B51814(v6, a2, a3);
  return sub_226B517E8;
}

void sub_226B517E8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_226B51814(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x2276A2538](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_226B51880;
  }
  __break(1u);
  return result;
}

void sub_226B51880(id *a1)
{

}

uint64_t sub_226B51888(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  void (*v13[4])(id *);

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_226B5D30C();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_226B5D30C();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_226B51C88(qword_2558A0100, &qword_2558A00F8, MEMORY[0x24BEE12E0]);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00F8);
            v10 = sub_226B51794(v13, i, a3);
            v12 = *v11;
            ((void (*)(void (**)(id *), _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_226B51C4C();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_226B51A30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t ObjectType;
  uint64_t v23;
  uint64_t v24;

  v1 = sub_226B5D030();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_226B5D06C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v0 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate;
  swift_beginAccess();
  result = MEMORY[0x2276A2F04](v9);
  if (result)
  {
    v11 = *(_QWORD *)(v9 + 8);
    ObjectType = swift_getObjectType();
    v21 = v0 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_reply;
    v12 = (_QWORD *)(v0 + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer);
    v23 = v2;
    v24 = v1;
    v13 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer + 24);
    v14 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer + 32);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer), v13);
    (*(void (**)(uint64_t, uint64_t))(v14 + 40))(v13, v14);
    v15 = v12[3];
    v16 = v12[4];
    __swift_project_boxed_opaque_existential_1(v12, v15);
    (*(void (**)(uint64_t, uint64_t))(v16 + 24))(v15, v16);
    v17 = v12[3];
    v18 = v12[4];
    __swift_project_boxed_opaque_existential_1(v12, v17);
    v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 32))(v17, v18);
    (*(void (**)(uint64_t, char *, char *, _QWORD, uint64_t, uint64_t))(v11 + 8))(v21, v8, v4, v19 & 1, ObjectType, v11);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2276A2E2C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

double CGCeiling(double a1)
{
  return ceil(a1);
}

unint64_t sub_226B51C4C()
{
  unint64_t result;

  result = qword_2558A00F0;
  if (!qword_2558A00F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2558A00F0);
  }
  return result;
}

uint64_t sub_226B51C88(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2276A2E38](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void **sub_226B51CC8(void **a1, void **a2, int *a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  char *v36;
  char *v37;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    *(_QWORD *)v9 = *(void **)((char *)a2 + v8);
    *((_QWORD *)v9 + 1) = v11;
    v9[16] = *((_BYTE *)a2 + v8 + 16);
    v12 = (int *)type metadata accessor for Reply();
    v13 = v12[6];
    v36 = &v10[v13];
    v37 = &v9[v13];
    v14 = sub_226B5D06C();
    v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    v16 = v4;
    swift_bridgeObjectRetain();
    v15(v37, v36, v14);
    v17 = v12[7];
    v18 = &v9[v17];
    v19 = &v10[v17];
    v20 = *((_QWORD *)v19 + 1);
    *(_QWORD *)v18 = *(_QWORD *)v19;
    *((_QWORD *)v18 + 1) = v20;
    v21 = v12[8];
    v22 = &v9[v21];
    v23 = &v10[v21];
    v24 = sub_226B5D030();
    v25 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
    swift_bridgeObjectRetain();
    v25(v22, v23, v24);
    v26 = a3[6];
    v27 = a3[7];
    v28 = *(void **)((char *)a2 + v26);
    *(void **)((char *)v7 + v26) = v28;
    v29 = *(void **)((char *)a2 + v27);
    *(void **)((char *)v7 + v27) = v29;
    v30 = a3[8];
    v31 = *(void **)((char *)a2 + v30);
    *(void **)((char *)v7 + v30) = v31;
    v32 = v28;
    v33 = v29;
    v34 = v31;
  }
  return v7;
}

void sub_226B51E24(id *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v4 = (char *)a1 + a2[5];
  swift_bridgeObjectRelease();
  v5 = type metadata accessor for Reply();
  v6 = &v4[*(int *)(v5 + 24)];
  v7 = sub_226B5D06C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  v8 = &v4[*(int *)(v5 + 32)];
  v9 = sub_226B5D030();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);

}

void **sub_226B51EF0(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  id v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  char *v35;
  char *v36;

  v6 = *a2;
  *a1 = *a2;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(uint64_t *)((char *)a2 + v7 + 8);
  *(_QWORD *)v8 = *(void **)((char *)a2 + v7);
  *((_QWORD *)v8 + 1) = v10;
  v8[16] = *((_BYTE *)a2 + v7 + 16);
  v11 = (int *)type metadata accessor for Reply();
  v12 = v11[6];
  v35 = &v9[v12];
  v36 = &v8[v12];
  v13 = sub_226B5D06C();
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  v15 = v6;
  swift_bridgeObjectRetain();
  v14(v36, v35, v13);
  v16 = v11[7];
  v17 = &v8[v16];
  v18 = &v9[v16];
  v19 = *((_QWORD *)v18 + 1);
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = v19;
  v20 = v11[8];
  v21 = &v8[v20];
  v22 = &v9[v20];
  v23 = sub_226B5D030();
  v24 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16);
  swift_bridgeObjectRetain();
  v24(v21, v22, v23);
  v25 = a3[6];
  v26 = a3[7];
  v27 = *(void **)((char *)a2 + v25);
  *(void **)((char *)a1 + v25) = v27;
  v28 = *(void **)((char *)a2 + v26);
  *(void **)((char *)a1 + v26) = v28;
  v29 = a3[8];
  v30 = *(void **)((char *)a2 + v29);
  *(void **)((char *)a1 + v29) = v30;
  v31 = v27;
  v32 = v28;
  v33 = v30;
  return a1;
}

void **sub_226B52024(void **a1, void **a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  *(_QWORD *)v10 = *(void **)((char *)a2 + v9);
  *((_QWORD *)v10 + 1) = *(void **)((char *)a2 + v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[16] = v11[16];
  v12 = (int *)type metadata accessor for Reply();
  v13 = v12[6];
  v14 = &v10[v13];
  v15 = &v11[v13];
  v16 = sub_226B5D06C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  v17 = v12[7];
  v18 = &v10[v17];
  v19 = &v11[v17];
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *((_QWORD *)v18 + 1) = *((_QWORD *)v19 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = v12[8];
  v21 = &v10[v20];
  v22 = &v11[v20];
  v23 = sub_226B5D030();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 24))(v21, v22, v23);
  v24 = a3[6];
  v25 = *(void **)((char *)a2 + v24);
  v26 = *(void **)((char *)a1 + v24);
  *(void **)((char *)a1 + v24) = v25;
  v27 = v25;

  v28 = a3[7];
  v29 = *(void **)((char *)a2 + v28);
  v30 = *(void **)((char *)a1 + v28);
  *(void **)((char *)a1 + v28) = v29;
  v31 = v29;

  v32 = a3[8];
  v33 = *(void **)((char *)a2 + v32);
  v34 = *(void **)((char *)a1 + v32);
  *(void **)((char *)a1 + v32) = v33;
  v35 = v33;

  return a1;
}

_QWORD *sub_226B52184(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_OWORD *)v7 = *(_OWORD *)((char *)a2 + v6);
  v7[16] = *((_BYTE *)a2 + v6 + 16);
  v9 = (int *)type metadata accessor for Reply();
  v10 = v9[6];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_226B5D06C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  *(_OWORD *)&v7[v9[7]] = *(_OWORD *)&v8[v9[7]];
  v14 = v9[8];
  v15 = &v7[v14];
  v16 = &v8[v14];
  v17 = sub_226B5D030();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  v18 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v18) = *(_QWORD *)((char *)a2 + v18);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  return a1;
}

void **sub_226B52278(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;

  v6 = *a1;
  *a1 = *a2;

  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(uint64_t *)((char *)a2 + v7 + 8);
  *(_QWORD *)v8 = *(void **)((char *)a2 + v7);
  *((_QWORD *)v8 + 1) = v10;
  swift_bridgeObjectRelease();
  v8[16] = v9[16];
  v11 = (int *)type metadata accessor for Reply();
  v12 = v11[6];
  v13 = &v8[v12];
  v14 = &v9[v12];
  v15 = sub_226B5D06C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = v11[7];
  v17 = &v8[v16];
  v18 = &v9[v16];
  v20 = *(_QWORD *)v18;
  v19 = *((_QWORD *)v18 + 1);
  *(_QWORD *)v17 = v20;
  *((_QWORD *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  v21 = v11[8];
  v22 = &v8[v21];
  v23 = &v9[v21];
  v24 = sub_226B5D030();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  v25 = a3[6];
  v26 = *(void **)((char *)a1 + v25);
  *(void **)((char *)a1 + v25) = *(void **)((char *)a2 + v25);

  v27 = a3[7];
  v28 = *(void **)((char *)a1 + v27);
  *(void **)((char *)a1 + v27) = *(void **)((char *)a2 + v27);

  v29 = a3[8];
  v30 = *(void **)((char *)a1 + v29);
  *(void **)((char *)a1 + v29) = *(void **)((char *)a2 + v29);

  return a1;
}

uint64_t sub_226B523A8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_226B523B4(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for Reply();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_226B52430()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_226B5243C(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for Reply();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for AchievementRenderer()
{
  uint64_t result;

  result = qword_2558A0160;
  if (!qword_2558A0160)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_226B524EC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Reply();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_226B52568(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  id v19;
  id result;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  _QWORD *v35;
  dispatch_semaphore_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  const void *v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  char *v45;
  uint64_t v46;
  dispatch_semaphore_t v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  dispatch_semaphore_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  uint64_t v74;
  id aBlock[8];

  aBlock[6] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_226B5D0E4();
  v3 = *(_QWORD *)(v2 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (id *)((char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_226B5D108();
  v74 = *(_QWORD *)(v6 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v65 - v10;
  v12 = objc_msgSend(a1, sel_templateUniqueName);
  v13 = ASIsCompetitionVictoryTemplate();

  sub_226B5D234();
  if (v13)
  {
    if (qword_25589FD20 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_226B5F1C0;
    *(_QWORD *)(v14 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00E0);
    *(_QWORD *)(v14 + 64) = sub_226B53B64();
    *(_QWORD *)(v14 + 32) = MEMORY[0x24BEE4AF8];
    sub_226B5D0D8();
    swift_bridgeObjectRelease();
    return (id)ASEphemeralCompetitionVictoryAchievementForFriendAchievement();
  }
  v69 = v6;
  if (qword_25589FD20 != -1)
    swift_once();
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
  v16 = swift_allocObject();
  v73 = xmmword_226B5F1C0;
  *(_OWORD *)(v16 + 16) = xmmword_226B5F1C0;
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00E0);
  *(_QWORD *)(v16 + 56) = v71;
  v70 = sub_226B53B64();
  *(_QWORD *)(v16 + 64) = v70;
  *(_QWORD *)(v16 + 32) = MEMORY[0x24BEE4AF8];
  sub_226B5D0D8();
  swift_bridgeObjectRelease();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = 0;
  if (!ACHShouldUseNewAwardsSystem())
  {
    v67 = v2;
    v68 = dispatch_semaphore_create(0);
    v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3C40]), sel_init);
    v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE017D0]), sel_initWithHealthStore_, v33);

    if (v34)
    {
      v66 = v34;
      v65 = objc_msgSend(a1, sel_templateUniqueName);
      v35 = (_QWORD *)swift_allocObject();
      v36 = v68;
      v35[2] = v17;
      v35[3] = v36;
      aBlock[4] = sub_226B53C00;
      aBlock[5] = v35;
      aBlock[0] = (id)MEMORY[0x24BDAC760];
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_226B5302C;
      aBlock[3] = &block_descriptor_0;
      v37 = v17;
      v38 = _Block_copy(aBlock);
      swift_retain();
      v39 = v36;
      swift_release();
      v41 = v65;
      v40 = v66;
      objc_msgSend(v66, sel_fetchEphemeralAchievementWithTemplateUniqueName_completion_, v65, v38);
      v42 = v38;
      v17 = v37;
      _Block_release(v42);

    }
    sub_226B5D0FC();
    *v5 = 10;
    v43 = v67;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5420], v67);
    MEMORY[0x2276A237C](v9, v5);
    (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v43);
    v44 = *(void (**)(char *, uint64_t))(v74 + 8);
    v45 = v9;
    v46 = v69;
    v44(v45, v69);
    v47 = v68;
    sub_226B5D240();
    v44(v11, v46);
    if ((sub_226B5D0F0() & 1) != 0)
    {

LABEL_24:
      swift_beginAccess();
      v15 = *(void **)(v17 + 16);
      v64 = v15;
      swift_release();
      return v15;
    }
    sub_226B5D228();
    v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = v73;
    v49 = v70;
    *(_QWORD *)(v48 + 56) = v71;
    *(_QWORD *)(v48 + 64) = v49;
    *(_QWORD *)(v48 + 32) = MEMORY[0x24BEE4AF8];
    sub_226B5D0D8();

LABEL_23:
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  v18 = (void **)(v17 + 16);
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE01B40]), sel_init);
  result = objc_msgSend(a1, sel_templateUniqueName);
  if (result)
  {
    v21 = result;
    aBlock[0] = 0;
    v22 = objc_msgSend(v19, sel_ephemeralAchievementWithTemplateUniqueName_error_, result, aBlock);

    if (aBlock[0])
    {
      v23 = v17;
      v24 = aBlock[0];

      swift_willThrow();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00D8);
      v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_226B5F280;
      v26 = objc_msgSend(a1, sel_templateUniqueName);
      v27 = MEMORY[0x24BEE0D00];
      if (v26)
      {
        v28 = v26;
        v29 = sub_226B5D150();
        v31 = v30;

        v32 = MEMORY[0x24BEE0D00];
        v26 = (id)sub_226B4F7B0();
      }
      else
      {
        v29 = 0;
        v31 = 0;
        v32 = 0;
        *(_QWORD *)(v25 + 48) = 0;
      }
      *(_QWORD *)(v25 + 32) = v29;
      *(_QWORD *)(v25 + 40) = v31;
      *(_QWORD *)(v25 + 56) = v32;
      *(_QWORD *)(v25 + 64) = v26;
      aBlock[0] = v24;
      v55 = v24;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558A01B8);
      v56 = sub_226B5D168();
      v58 = v57;
      *(_QWORD *)(v25 + 96) = v27;
      *(_QWORD *)(v25 + 104) = sub_226B4F7B0();
      *(_QWORD *)(v25 + 72) = v56;
      *(_QWORD *)(v25 + 80) = v58;
      sub_226B5D234();
      v59 = swift_allocObject();
      *(_OWORD *)(v59 + 16) = v73;
      v60 = v70;
      *(_QWORD *)(v59 + 56) = v71;
      *(_QWORD *)(v59 + 64) = v60;
      *(_QWORD *)(v59 + 32) = v25;
      swift_bridgeObjectRetain();
      sub_226B5D0D8();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v17 = v23;
      goto LABEL_24;
    }
    v50 = *v18;
    *v18 = v22;

    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00D8);
    v51 = swift_allocObject();
    *(_OWORD *)(v51 + 16) = v73;
    v52 = *v18;
    if (*v18)
    {
      v53 = sub_226B53C20();
      v54 = sub_226B53C5C(&qword_2558A01B0, (uint64_t (*)(uint64_t))sub_226B53C20, MEMORY[0x24BEE5BE8]);
    }
    else
    {
      v53 = 0;
      v54 = 0;
      *(_QWORD *)(v51 + 40) = 0;
      *(_QWORD *)(v51 + 48) = 0;
    }
    *(_QWORD *)(v51 + 32) = v52;
    *(_QWORD *)(v51 + 56) = v53;
    *(_QWORD *)(v51 + 64) = v54;
    v61 = v52;
    sub_226B5D234();
    v62 = swift_allocObject();
    *(_OWORD *)(v62 + 16) = v73;
    v63 = v70;
    *(_QWORD *)(v62 + 56) = v71;
    *(_QWORD *)(v62 + 64) = v63;
    *(_QWORD *)(v62 + 32) = v51;
    swift_bridgeObjectRetain();
    sub_226B5D0D8();
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

uint64_t sub_226B52D84(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a1)
  {
    swift_beginAccess();
    v5 = *(void **)(a3 + 16);
    *(_QWORD *)(a3 + 16) = a1;
    v6 = a1;

    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00D8);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_226B5F1C0;
    *(_QWORD *)(v7 + 56) = sub_226B53C20();
    *(_QWORD *)(v7 + 64) = sub_226B53C5C(&qword_2558A01B0, (uint64_t (*)(uint64_t))sub_226B53C20, MEMORY[0x24BEE5BE8]);
    *(_QWORD *)(v7 + 32) = v6;
    v8 = v6;
    sub_226B5D234();
    if (qword_25589FD20 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_226B5F1C0;
    *(_QWORD *)(v9 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00E0);
    *(_QWORD *)(v9 + 64) = sub_226B53B64();
    *(_QWORD *)(v9 + 32) = v7;
    swift_bridgeObjectRetain();
    sub_226B5D0D8();

  }
  else
  {
    sub_226B5D228();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00D8);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_226B5F1C0;
    __swift_instantiateConcreteTypeFromMangledName(qword_2558A01C0);
    v11 = sub_226B5D2A0();
    v13 = v12;
    *(_QWORD *)(v10 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v10 + 64) = sub_226B4F7B0();
    *(_QWORD *)(v10 + 32) = v11;
    *(_QWORD *)(v10 + 40) = v13;
    if (qword_25589FD20 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_226B5F1C0;
    *(_QWORD *)(v14 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00E0);
    *(_QWORD *)(v14 + 64) = sub_226B53B64();
    *(_QWORD *)(v14 + 32) = v10;
    swift_bridgeObjectRetain();
    sub_226B5D0D8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_226B5D24C();
}

void sub_226B5302C(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_226B530A0@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t ObjCClassFromMetadata;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  double v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  id v68;
  int *v69;
  id v70;
  _QWORD *v71;
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  _QWORD v82[3];
  uint64_t v83;
  uint64_t v84;
  _QWORD v85[21];

  v79 = sub_226B5D030();
  v78 = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79);
  v76 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0078);
  MEMORY[0x24BDAC7A8](v9);
  v77 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a4 = a1;
  v11 = (int *)type metadata accessor for AchievementRenderer();
  v12 = (uint64_t)a4 + v11[5];
  v81 = a3;
  sub_226B4DCE0(a3, v12);
  v13 = qword_25589FD38;
  v14 = a1;
  if (v13 != -1)
    swift_once();
  sub_226B4DD24((uint64_t)&qword_2558A0BC8, (uint64_t)v82);
  v15 = v83;
  v16 = v84;
  __swift_project_boxed_opaque_existential_1(v82, v83);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v16 + 8))(v85, v15, v16);
  v80 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE017B0]), sel_init);
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)((char *)a4 + v11[7]) = v17;
  v18 = v85[20];
  v19 = v17;
  objc_msgSend(v19, sel_setNumberOfLines_, v18);
  objc_msgSend(v19, sel_setAllowsDefaultTighteningForTruncation_, 1);
  v74 = v19;
  objc_msgSend(v19, sel_setLineBreakMode_, 4);
  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v69 = v11;
  *(_QWORD *)((char *)a4 + v11[8]) = v20;
  v21 = v20;
  objc_msgSend(v21, sel_setNumberOfLines_, 2);
  objc_msgSend(v21, sel_setAllowsDefaultTighteningForTruncation_, 1);
  v75 = v21;
  objc_msgSend(v21, sel_setLineBreakMode_, 4);
  v22 = (id)ASEphemeralEarnedAchievementForFriendAchievement();
  v23 = objc_msgSend(v14, sel_templateUniqueName);
  LODWORD(v21) = ASIsCompetitionVictoryTemplate();

  v72 = a2;
  v71 = a4;
  if ((_DWORD)v21)
  {
    type metadata accessor for ReplyBubbleView();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v25 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v26 = (void *)sub_226B5D12C();
    v27 = objc_msgSend(v25, sel_localizedStringForKey_value_table_, v26, 0, 0);

LABEL_6:
    v28 = sub_226B5D150();
    v30 = v29;

    goto LABEL_7;
  }
  v27 = objc_msgSend(v80, sel_titleForAchievement_, v22);
  if (v27)
    goto LABEL_6;
  v28 = 0;
  v30 = 0;
LABEL_7:
  v31 = v84;
  __swift_project_boxed_opaque_existential_1(v82, v83);
  v68 = v22;
  v32 = objc_msgSend(v22, sel_template);
  v33 = v81;
  v73 = (*(uint64_t (**)(void))(v31 + 104))();

  v34 = v83;
  v35 = v84;
  __swift_project_boxed_opaque_existential_1(v82, v83);
  v70 = v14;
  v36 = objc_msgSend(v14, sel_completedDate);
  if (!v36)
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v78 + 56))(v77, 1, 1, v79);
    goto LABEL_15;
  }
  v37 = v36;
  sub_226B5D018();

  v38 = v78;
  v39 = v77;
  v40 = v79;
  (*(void (**)(void))(v78 + 32))();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v39, 0, 1, v40);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48))(v39, 1, v40);
  if ((_DWORD)result == 1)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  v76 = (char *)(*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 112))(v33, v39, v28, v30, v34, v35);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
  v42 = v83;
  v43 = v84;
  __swift_project_boxed_opaque_existential_1(v82, v83);
  v44 = (*(uint64_t (**)(uint64_t, uint64_t))(v43 + 24))(v42, v43);
  sub_226B4D710(v44);
  swift_bridgeObjectRelease();
  v45 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v46 = (void *)sub_226B5D12C();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_226B53C5C((unint64_t *)&qword_25589FD88, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_226B5F0F0);
  v47 = (void *)sub_226B5D120();
  swift_bridgeObjectRelease();
  v48 = objc_msgSend(v45, sel_initWithString_attributes_, v46, v47);

  v49 = v74;
  objc_msgSend(v74, sel_setAttributedText_, v48);

  v50 = v83;
  v51 = v84;
  __swift_project_boxed_opaque_existential_1(v82, v83);
  v52 = (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 32))(v50, v51);
  sub_226B4D710(v52);
  swift_bridgeObjectRelease();
  v53 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v54 = (void *)sub_226B5D12C();
  swift_bridgeObjectRelease();
  v55 = (void *)sub_226B5D120();
  swift_bridgeObjectRelease();
  v56 = objc_msgSend(v53, sel_initWithString_attributes_, v54, v55);

  v57 = v75;
  objc_msgSend(v75, sel_setAttributedText_, v56);

  v58 = v83;
  v59 = v84;
  __swift_project_boxed_opaque_existential_1(v82, v83);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v59 + 40))(v58, v59) & 1) != 0)
  {
    v60 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE01B10]), sel_init);
    v61 = *(double *)&v85[9];
    v62 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithFrame_, 0.0, 0.0, v61, v61);
    *(_QWORD *)((char *)v71 + v69[6]) = v62;
    v63 = v62;
    objc_msgSend(v63, sel_setContentMode_, 1);
    v64 = v68;
    v65 = objc_msgSend(v60, sel_thumbnailImageForAchievement_size_, v68, v61 + 10.0, v61 + 10.0);
    objc_msgSend(v63, sel_setImage_, v65);

    sub_226B4DE38((uint64_t)v85);
    sub_226B4DE60(v81);
  }
  else
  {
    v66 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_init);

    sub_226B4DE38((uint64_t)v85);
    sub_226B4DE60(v81);
    *(_QWORD *)((char *)v71 + v69[6]) = v66;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
}

uint64_t sub_226B5399C@<X0>(uint64_t a1@<X8>)
{
  id *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t result;
  uint64_t v14;

  v3 = sub_226B5D030();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0078);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(*v1, sel_completedDate);
  if (v10)
  {
    v11 = v10;
    sub_226B5D018();

    v12 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v12(v9, v6, v3);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v9, 0, 1, v3);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3);
    if ((_DWORD)result != 1)
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v12)(a1, v9, v3);
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v9, 1, 1, v3);
  }
  __break(1u);
  return result;
}

uint64_t sub_226B53AE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25589FFC0);
  v3 = swift_allocObject();
  v4 = *(int *)(a1 + 32);
  v5 = *(void **)(v1 + *(int *)(a1 + 28));
  *(_OWORD *)(v3 + 16) = xmmword_226B5F150;
  v6 = *(void **)(v1 + v4);
  *(_QWORD *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 40) = v6;
  v10 = v3;
  sub_226B5D1E0();
  v7 = v5;
  v8 = v6;
  return v10;
}

unint64_t sub_226B53B64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558A00E8;
  if (!qword_2558A00E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558A00E0);
    result = MEMORY[0x2276A2E38](MEMORY[0x24BDCFBF8], v1);
    atomic_store(result, (unint64_t *)&qword_2558A00E8);
  }
  return result;
}

uint64_t sub_226B53BB0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_226B53BD4()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_226B53C00(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_226B52D84(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_226B53C20()
{
  unint64_t result;

  result = qword_2558A01A8;
  if (!qword_2558A01A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2558A01A8);
  }
  return result;
}

uint64_t sub_226B53C5C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2276A2E38](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_226B53C9C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_226B53CA8(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for Reply();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_226B53D24()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_226B53D30(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for Reply();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for GoalCompletionRenderer()
{
  uint64_t result;

  result = qword_2558A0220;
  if (!qword_2558A0220)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_226B53DE0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  int *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  int *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  _QWORD v46[3];
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[9];
  double v50;
  double v51;
  double v52;
  uint64_t v53;

  *a3 = a1;
  v6 = (int *)type metadata accessor for GoalCompletionRenderer();
  sub_226B4DCE0(a2, (uint64_t)a3 + v6[5]);
  v7 = a1;
  v8 = objc_msgSend(v7, sel_activitySummary);
  if (qword_25589FD38 != -1)
    swift_once();
  sub_226B4DD24((uint64_t)&qword_2558A0BC8, (uint64_t)v46);
  v9 = v47;
  v10 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v10 + 8))(v49, v9, v10);
  v11 = objc_msgSend((id)objc_opt_self(), sel_activityRingGroup);
  HIDWORD(v12) = HIDWORD(v50);
  *(float *)&v12 = v50;
  objc_msgSend(v11, sel_setGroupDiameter_, v12);
  HIDWORD(v13) = HIDWORD(v51);
  *(float *)&v13 = v51;
  objc_msgSend(v11, sel_setThickness_, v13);
  HIDWORD(v14) = HIDWORD(v52);
  *(float *)&v14 = v52;
  objc_msgSend(v11, sel_setInterspacing_, v14);
  objc_msgSend(v11, sel_hk_configureWithActivitySummary_animated_, v8, 0);
  v45 = v11;
  v44 = objc_msgSend((id)objc_opt_self(), sel_renderRingGroup_withRenderer_, v11, 0);
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithImage_, v44);
  *(_QWORD *)((char *)a3 + v6[6]) = v15;
  objc_msgSend(v15, sel_setContentMode_, 1);
  v43 = v8;
  if (v8)
    v16 = objc_msgSend(v8, sel__isStandalonePhoneSummary);
  else
    v16 = 0;
  v17 = v47;
  v18 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v18 + 120))(a2, v16, v17, v18);
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)((char *)a3 + v6[7]) = v19;
  v20 = v53;
  v21 = v19;
  objc_msgSend(v21, sel_setNumberOfLines_, v20);
  v41 = v6;
  v22 = v47;
  v23 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 24))(v22, v23);
  sub_226B4D710(v24);
  swift_bridgeObjectRelease();
  v25 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v42 = a2;
  v26 = (void *)sub_226B5D12C();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_226B4DD8C();
  v27 = (void *)sub_226B5D120();
  swift_bridgeObjectRelease();
  v28 = objc_msgSend(v25, sel_initWithString_attributes_, v26, v27);

  objc_msgSend(v21, sel_setAttributedText_, v28);
  objc_msgSend(v21, sel_setLineBreakMode_, 4);

  v29 = v47;
  v30 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  (*(void (**)(id, uint64_t, uint64_t))(v30 + 128))(v7, v29, v30);
  v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)((char *)a3 + v41[8]) = v31;
  v32 = v31;
  objc_msgSend(v32, sel_setNumberOfLines_, 2);
  v33 = v47;
  v34 = v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  v35 = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 32))(v33, v34);
  sub_226B4D710(v35);
  swift_bridgeObjectRelease();
  v36 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v37 = (void *)sub_226B5D12C();
  swift_bridgeObjectRelease();
  v38 = (void *)sub_226B5D120();
  swift_bridgeObjectRelease();
  v39 = objc_msgSend(v36, sel_initWithString_attributes_, v37, v38);

  objc_msgSend(v32, sel_setAttributedText_, v39);
  objc_msgSend(v32, sel_setLineBreakMode_, 4);

  sub_226B4DE38((uint64_t)v49);
  sub_226B4DE60(v42);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
}

uint64_t sub_226B542D8@<X0>(uint64_t a1@<X8>)
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = a1;
  v2 = sub_226B5D0B4();
  v28 = *(_QWORD *)(v2 - 8);
  v29 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0268);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v27 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0078);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_226B5D030();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v27 - v19;
  objc_msgSend(*v1, sel_snapshotIndex);
  v21 = (id)_HKActivityCacheDateComponentsFromCacheIndex();
  if (v21)
  {
    v22 = v21;
    sub_226B5CFB8();

    v23 = sub_226B5CFD0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v8, 0, 1, v23);
  }
  else
  {
    v23 = sub_226B5CFD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v8, 1, 1, v23);
  }
  sub_226B545D4((uint64_t)v8, (uint64_t)v10);
  sub_226B5CFD0();
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v10, 1, v23) == 1)
  {
    sub_226B5461C((uint64_t)v10, &qword_2558A0268);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
LABEL_7:
    sub_226B5461C((uint64_t)v13, &qword_2558A0078);
    return sub_226B5D024();
  }
  sub_226B5CFC4();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
    goto LABEL_7;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v13, v14);
  sub_226B5D0A8();
  sub_226B5D024();
  sub_226B5D090();
  v26 = *(void (**)(char *, uint64_t))(v15 + 8);
  v26(v18, v14);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v4, v29);
  sub_226B5D000();
  return ((uint64_t (*)(char *, uint64_t))v26)(v20, v14);
}

uint64_t sub_226B545D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0268);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_226B5461C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t Reply.message.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Reply.isFromMe.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t Reply.friend.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for Reply() + 24);
  v4 = sub_226B5D06C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for Reply()
{
  uint64_t result;

  result = qword_2558A02D8;
  if (!qword_2558A02D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t Reply.recipientAddress.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for Reply() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Reply.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for Reply() + 32);
  v4 = sub_226B5D030();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t Reply.debugDescription.getter()
{
  sub_226B5D2C4();
  sub_226B5D198();
  swift_bridgeObjectRetain();
  sub_226B5D198();
  swift_bridgeObjectRelease();
  sub_226B5D198();
  sub_226B5D198();
  swift_bridgeObjectRelease();
  sub_226B5D198();
  type metadata accessor for Reply();
  sub_226B5D06C();
  sub_226B53C5C(&qword_2558A0270, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_226B5D330();
  sub_226B5D198();
  swift_bridgeObjectRelease();
  sub_226B5D198();
  swift_bridgeObjectRetain();
  sub_226B5D198();
  swift_bridgeObjectRelease();
  sub_226B5D198();
  sub_226B5D030();
  sub_226B53C5C(&qword_2558A0278, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
  sub_226B5D330();
  sub_226B5D198();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t Reply.init(message:isFromMe:friend:recipientAddress:timestamp:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  int *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)a8 = a1;
  *(_QWORD *)(a8 + 8) = a2;
  *(_BYTE *)(a8 + 16) = a3;
  v13 = (int *)type metadata accessor for Reply();
  v14 = a8 + v13[6];
  v15 = sub_226B5D06C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v14, a4, v15);
  v16 = (_QWORD *)(a8 + v13[7]);
  *v16 = a5;
  v16[1] = a6;
  v17 = a8 + v13[8];
  v18 = sub_226B5D030();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17, a7, v18);
}

uint64_t static Reply.reply(from:isFromMe:)@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void (*v28)(char *, char *, uint64_t);
  int v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  void *v36;
  id v37;
  char *v38;
  void (*v39)(char *, char *, uint64_t);
  int v40;
  char *v41;
  int *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  int v53;
  uint64_t v54;

  v53 = a1;
  v54 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0070);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_226B5D06C();
  v51 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v49 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v52 = (char *)&v45 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0078);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_226B5D030();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v50 = (char *)&v45 - v17;
  v18 = (void *)sub_226B5CFE8();
  v19 = (id)ASMessageFromRichMessagePayload();

  if (!v19)
  {
    sub_226B5D228();
    if (qword_25589FD20 == -1)
      goto LABEL_9;
    goto LABEL_18;
  }
  v48 = sub_226B5D150();
  v21 = v20;

  v22 = (void *)sub_226B5CFE8();
  v23 = (id)ASRecipientAddressFromRichMessagePayload();

  if (!v23)
  {
    swift_bridgeObjectRelease();
    sub_226B5D228();
    if (qword_25589FD20 == -1)
    {
LABEL_9:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
      v32 = swift_allocObject();
      *(_OWORD *)(v32 + 16) = xmmword_226B5F1C0;
      *(_QWORD *)(v32 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00E0);
      *(_QWORD *)(v32 + 64) = sub_226B53B64();
      *(_QWORD *)(v32 + 32) = MEMORY[0x24BEE4AF8];
      sub_226B5D0D8();
      swift_bridgeObjectRelease();
      v33 = type metadata accessor for Reply();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v54, 1, 1, v33);
    }
LABEL_18:
    swift_once();
    goto LABEL_9;
  }
  v24 = sub_226B5D150();
  v46 = v25;
  v47 = v24;

  v26 = (void *)sub_226B5CFE8();
  v27 = (id)ASTimestampFromRichMessagePayload();

  if (v27)
  {
    sub_226B5D018();

    v28 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v28(v11, v16, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
    v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
    v30 = v51;
    if (v29 != 1)
    {
      v31 = v50;
      v28(v50, v11, v12);
      goto LABEL_12;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    v30 = v51;
  }
  v31 = v50;
  sub_226B5D024();
  sub_226B5461C((uint64_t)v11, &qword_2558A0078);
LABEL_12:
  v35 = v54;
  v36 = (void *)sub_226B5CFE8();
  v37 = (id)ASFriendUUIDFromRichMessagePayload();

  if (!v37)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v4, 1, 1, v5);
    v41 = v52;
    goto LABEL_16;
  }
  v38 = v49;
  sub_226B5D054();

  v39 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
  v39(v4, v38, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v4, 0, 1, v5);
  v40 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48))(v4, 1, v5);
  v41 = v52;
  if (v40 == 1)
  {
LABEL_16:
    sub_226B5D060();
    sub_226B5461C((uint64_t)v4, &qword_2558A0070);
    goto LABEL_17;
  }
  v39(v52, v4, v5);
LABEL_17:
  *(_QWORD *)v35 = v48;
  *(_QWORD *)(v35 + 8) = v21;
  *(_BYTE *)(v35 + 16) = v53 & 1;
  v42 = (int *)type metadata accessor for Reply();
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v35 + v42[6], v41, v5);
  v43 = (uint64_t *)(v35 + v42[7]);
  v44 = v46;
  *v43 = v47;
  v43[1] = v44;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v35 + v42[8], v31, v12);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, int *))(*((_QWORD *)v42 - 1) + 56))(v35, 0, 1, v42);
}

_QWORD *initializeBufferWithCopyOfBuffer for Reply(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    v8 = a3[6];
    v9 = a1 + v8;
    v10 = (uint64_t)a2 + v8;
    v11 = sub_226B5D06C();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[7];
    v14 = a3[8];
    v15 = (_QWORD *)((char *)v4 + v13);
    v16 = (uint64_t *)((char *)a2 + v13);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = (char *)v4 + v14;
    v19 = (uint64_t)a2 + v14;
    v20 = sub_226B5D030();
    v21 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    swift_bridgeObjectRetain();
    v21(v18, v19, v20);
  }
  return v4;
}

uint64_t destroy for Reply(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_226B5D06C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(a2 + 32);
  v7 = sub_226B5D030();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

uint64_t initializeWithCopy for Reply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_226B5D06C();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[7];
  v13 = a3[8];
  v14 = (_QWORD *)(a1 + v12);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = a1 + v13;
  v18 = a2 + v13;
  v19 = sub_226B5D030();
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
  swift_bridgeObjectRetain();
  v20(v17, v18, v19);
  return a1;
}

uint64_t assignWithCopy for Reply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_226B5D06C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[8];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_226B5D030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

uint64_t initializeWithTake for Reply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_226B5D06C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_226B5D030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

uint64_t assignWithTake for Reply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_226B5D06C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[7];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_226B5D030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for Reply()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_226B554B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_226B5D06C();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 24);
    }
    else
    {
      v10 = sub_226B5D030();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for Reply()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_226B5555C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_226B5D06C();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 24);
    }
    else
    {
      v10 = sub_226B5D030();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_226B555F8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_226B5D06C();
  if (v1 <= 0x3F)
  {
    result = sub_226B5D030();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

__int128 *ReplyLayoutValues.phoneValues.unsafeMutableAddressor()
{
  if (qword_25589FD30 != -1)
    swift_once();
  return &static ReplyLayoutValues.phoneValues;
}

uint64_t sub_226B556D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjCClassFromMetadata;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;

  if (a3)
  {
    v27 = a3;
  }
  else
  {
    type metadata accessor for ReplyBubbleView();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v6 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v7 = (void *)sub_226B5D12C();
    v8 = a1;
    v9 = objc_msgSend(v6, sel_localizedStringForKey_value_table_, v7, 0, 0);

    a2 = sub_226B5D150();
    v27 = v10;

    a1 = v8;
  }
  swift_bridgeObjectRetain();
  ACHTemplateIsMonthlyChallenge();
  v11 = *(unsigned __int8 *)(a1 + 16);
  type metadata accessor for ReplyBubbleView();
  v12 = swift_getObjCClassFromMetadata();
  v13 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v12);
  v14 = (void *)sub_226B5D12C();
  v15 = objc_msgSend(v13, (SEL)&selRef_components_fromDate_toDate_options_ + 3, v14, 0, 0);

  sub_226B5D150();
  swift_bridgeObjectRelease();

  if (v11 == 1)
  {
    v16 = type metadata accessor for Reply();
    v17 = sub_226B571D4(*(_QWORD *)(a1 + *(int *)(v16 + 28)), *(_QWORD *)(a1 + *(int *)(v16 + 28) + 8), 1);
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
    v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_226B5F280;
    v21 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v20 + 56) = MEMORY[0x24BEE0D00];
    v22 = sub_226B4F7B0();
    *(_QWORD *)(v20 + 32) = v17;
    *(_QWORD *)(v20 + 40) = v19;
    *(_QWORD *)(v20 + 96) = v21;
    *(_QWORD *)(v20 + 104) = v22;
    v23 = (_QWORD *)(v20 + 80);
    *(_QWORD *)(v20 + 64) = v22;
    *(_QWORD *)(v20 + 72) = a2;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_226B5F1C0;
    *(_QWORD *)(v24 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v24 + 64) = sub_226B4F7B0();
    *(_QWORD *)(v24 + 32) = a2;
    v23 = (_QWORD *)(v24 + 40);
  }
  *v23 = v27;
  v25 = sub_226B5D15C();
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_226B559DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjCClassFromMetadata;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  if (*(_BYTE *)(a1 + 16) == 1)
  {
    v2 = type metadata accessor for Reply();
    v3 = sub_226B571D4(*(_QWORD *)(a1 + *(int *)(v2 + 28)), *(_QWORD *)(a1 + *(int *)(v2 + 28) + 8), 1);
    v5 = v4;
    type metadata accessor for ReplyBubbleView();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v7 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v11 = (void *)sub_226B5D12C();
    v12 = objc_msgSend(v7, sel_localizedStringForKey_value_table_, v11, 0, 0);

    sub_226B5D150();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_226B5F1C0;
    *(_QWORD *)(v13 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v13 + 64) = sub_226B4F7B0();
    *(_QWORD *)(v13 + 32) = v3;
    *(_QWORD *)(v13 + 40) = v5;
    v14 = sub_226B5D15C();
    swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for ReplyBubbleView();
    v8 = swift_getObjCClassFromMetadata();
    v9 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v8);
    v10 = (void *)sub_226B5D12C();
    v15 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v10, 0, 0);

    v14 = sub_226B5D150();
  }
  return v14;
}

uint64_t sub_226B55C48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_226B56E24(v1 + 8, a1);
}

unint64_t sub_226B55C54(uint64_t a1, uint64_t a2)
{
  return sub_226B55C74(a1, a2, MEMORY[0x24BEBE220], 0x4032000000000000);
}

unint64_t sub_226B55C64(uint64_t a1, uint64_t a2)
{
  return sub_226B55C74(a1, a2, MEMORY[0x24BEBE1E0], 0x402C000000000000);
}

unint64_t sub_226B55C74(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  id v6;
  unint64_t v7;

  v6 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  v7 = sub_226B56598(v6, *a3, a4, 0);

  return v7;
}

unint64_t sub_226B55CDC()
{
  uint64_t v0;
  id v1;
  unint64_t v2;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, *(double *)(v0 + 128), 1.0);
  v2 = sub_226B56598(v1, *MEMORY[0x24BEBE1E0], 0, 1);

  return v2;
}

id sub_226B55D48(void *a1)
{
  return objc_msgSend(a1, sel__scaledValueForValue_, 26.0);
}

id sub_226B55D58(void *a1)
{
  return objc_msgSend(a1, sel__scaledValueForValue_, 12.0);
}

id sub_226B55D68(void *a1)
{
  return objc_msgSend(a1, sel__scaledValueForValue_, 16.0);
}

id sub_226B55D78(void *a1)
{
  return objc_msgSend(a1, sel__scaledValueForValue_, 21.0);
}

id sub_226B55D88(void *a1)
{
  return objc_msgSend(a1, sel__scaledValueForValue_, 14.0);
}

id sub_226B55D98(void *a1)
{
  return objc_msgSend(a1, sel__scaledValueForValue_, 24.0);
}

uint64_t sub_226B55DA8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Reply();
  return sub_226B56F48(*(_QWORD *)(a1 + *(int *)(v2 + 28)), *(_QWORD *)(a1 + *(int *)(v2 + 28) + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_226B55DF4()
{
  id v0;
  id v1;
  uint64_t v2;

  v0 = sub_226B57560();
  v1 = (id)ASShortNameForContactStoreContact();

  if (!v1)
    return sub_226B56E60();
  v2 = sub_226B5D150();

  return v2;
}

uint64_t sub_226B55E5C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Reply();
  return sub_226B571D4(*(_QWORD *)(a1 + *(int *)(v2 + 28)), *(_QWORD *)(a1 + *(int *)(v2 + 28) + 8), 1);
}

double sub_226B55E98()
{
  id v0;
  double result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE1E0]);
  static ReplyLayoutValues.phoneValues = xmmword_226B5F390;
  unk_2558A0B00 = xmmword_226B5F3A0;
  xmmword_2558A0B10 = 0x403E000000000000uLL;
  xmmword_2558A0B20 = xmmword_226B5F3B0;
  xmmword_2558A0B30 = xmmword_226B5F3C0;
  xmmword_2558A0B40 = xmmword_226B5F3D0;
  xmmword_2558A0B50 = xmmword_226B5F3E0;
  xmmword_2558A0B60 = xmmword_226B5F3F0;
  xmmword_2558A0B70 = xmmword_226B5F400;
  qword_2558A0B80 = (uint64_t)v0;
  byte_2558A0B88 = 1;
  *(_QWORD *)&xmmword_2558A0B90 = 3;
  result = 4.0;
  *(__int128 *)((char *)&xmmword_2558A0B90 + 8) = xmmword_226B5F410;
  qword_2558A0BA8 = 2;
  byte_2558A0BB0 = 1;
  return result;
}

__n128 static ReplyLayoutValues.phoneValues.getter@<Q0>(uint64_t a1@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __n128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;

  if (qword_25589FD30 != -1)
    swift_once();
  swift_beginAccess();
  v18 = *(_OWORD *)&qword_2558A0B80;
  v19 = xmmword_2558A0B90;
  v20 = unk_2558A0BA0;
  v21 = byte_2558A0BB0;
  v16 = xmmword_2558A0B60;
  v17 = xmmword_2558A0B70;
  v11 = xmmword_2558A0B10;
  v12 = xmmword_2558A0B20;
  v14 = xmmword_2558A0B40;
  v15 = xmmword_2558A0B50;
  v13 = xmmword_2558A0B30;
  v9 = static ReplyLayoutValues.phoneValues;
  v10 = (__n128)unk_2558A0B00;
  sub_226B56054((uint64_t)&v9);
  v2 = v18;
  v3 = v20;
  *(_OWORD *)(a1 + 160) = v19;
  *(_OWORD *)(a1 + 176) = v3;
  v4 = v16;
  v5 = v17;
  *(_OWORD *)(a1 + 96) = v15;
  *(_OWORD *)(a1 + 112) = v4;
  *(_BYTE *)(a1 + 192) = v21;
  *(_OWORD *)(a1 + 128) = v5;
  *(_OWORD *)(a1 + 144) = v2;
  v6 = v12;
  *(_OWORD *)(a1 + 32) = v11;
  *(_OWORD *)(a1 + 48) = v6;
  v7 = v14;
  *(_OWORD *)(a1 + 64) = v13;
  *(_OWORD *)(a1 + 80) = v7;
  result = v10;
  *(_OWORD *)a1 = v9;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_226B56054(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 144);
  return a1;
}

uint64_t static ReplyLayoutValues.phoneValues.setter(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[12];
  char v10;

  if (qword_25589FD30 != -1)
    swift_once();
  swift_beginAccess();
  v9[9] = *(_OWORD *)&qword_2558A0B80;
  v9[10] = xmmword_2558A0B90;
  v9[11] = unk_2558A0BA0;
  v10 = byte_2558A0BB0;
  v9[7] = xmmword_2558A0B60;
  v9[8] = xmmword_2558A0B70;
  v9[2] = xmmword_2558A0B10;
  v9[3] = xmmword_2558A0B20;
  v9[5] = xmmword_2558A0B40;
  v9[6] = xmmword_2558A0B50;
  v9[4] = xmmword_2558A0B30;
  v9[0] = static ReplyLayoutValues.phoneValues;
  v9[1] = unk_2558A0B00;
  v2 = *(_OWORD *)(a1 + 176);
  xmmword_2558A0B90 = *(_OWORD *)(a1 + 160);
  unk_2558A0BA0 = v2;
  byte_2558A0BB0 = *(_BYTE *)(a1 + 192);
  v3 = *(_OWORD *)(a1 + 112);
  xmmword_2558A0B50 = *(_OWORD *)(a1 + 96);
  xmmword_2558A0B60 = v3;
  v4 = *(_OWORD *)(a1 + 144);
  xmmword_2558A0B70 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)&qword_2558A0B80 = v4;
  v5 = *(_OWORD *)(a1 + 48);
  xmmword_2558A0B10 = *(_OWORD *)(a1 + 32);
  xmmword_2558A0B20 = v5;
  v6 = *(_OWORD *)(a1 + 80);
  xmmword_2558A0B30 = *(_OWORD *)(a1 + 64);
  xmmword_2558A0B40 = v6;
  v7 = *(_OWORD *)(a1 + 16);
  static ReplyLayoutValues.phoneValues = *(_OWORD *)a1;
  unk_2558A0B00 = v7;
  sub_226B56054(a1);
  sub_226B4DE38((uint64_t)v9);
  return sub_226B4DE38(a1);
}

uint64_t (*static ReplyLayoutValues.phoneValues.modify())()
{
  if (qword_25589FD30 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

void destroy for ReplyLayoutPhone(uint64_t a1)
{
  swift_release();

}

uint64_t initializeWithCopy for ReplyLayoutPhone(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  v3 = *(void **)(a2 + 152);
  *(_QWORD *)(a1 + 152) = v3;
  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_BYTE *)(a1 + 200) = *(_BYTE *)(a2 + 200);
  swift_retain();
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for ReplyLayoutPhone(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  v4 = *(void **)(a2 + 152);
  v5 = *(void **)(a1 + 152);
  *(_QWORD *)(a1 + 152) = v4;
  v6 = v4;

  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_BYTE *)(a1 + 200) = *(_BYTE *)(a2 + 200);
  return a1;
}

__n128 __swift_memcpy201_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  v5 = *(_OWORD *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  result = *(__n128 *)(a2 + 144);
  v9 = *(_OWORD *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 185) = *(_OWORD *)(a2 + 185);
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 144) = result;
  return result;
}

uint64_t assignWithTake for ReplyLayoutPhone(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  v4 = *(void **)(a1 + 152);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);

  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_BYTE *)(a1 + 200) = *(_BYTE *)(a2 + 200);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReplyLayoutPhone(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 201))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ReplyLayoutPhone(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 200) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 201) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 201) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ReplyLayoutPhone()
{
  return &type metadata for ReplyLayoutPhone;
}

unint64_t sub_226B56598(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  double v13;
  id v14;
  double v15;
  double v16;
  uint64_t inited;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v7 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_, a2);
  v8 = objc_msgSend(v7, sel_fontDescriptorWithSymbolicTraits_, 0x8000);

  if (v8)
  {
    v9 = (void *)objc_opt_self();
    v10 = objc_msgSend(v9, sel_fontWithDescriptor_size_, v8, 0.0);
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBB490]), sel_init);
    v12 = objc_msgSend((id)objc_opt_self(), sel_defaultParagraphStyle);
    objc_msgSend(v11, sel_setParagraphStyle_, v12);

    if ((a4 & 1) == 0)
    {
      v13 = *(double *)&a3;
      v14 = objc_msgSend(v9, sel_fontWithDescriptor_size_, v8, 0.0);
      objc_msgSend(v14, sel__scaledValueForValue_, v13);
      v16 = v15;
      objc_msgSend(v11, sel_setLineSpacing_, 0.0);
      objc_msgSend(v11, sel_setMinimumLineHeight_, v16);
      objc_msgSend(v11, sel_setMaximumLineHeight_, v16);

    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0328);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_226B5F420;
    v18 = (void *)*MEMORY[0x24BEBB3A8];
    *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB3A8];
    *(_QWORD *)(inited + 40) = v11;
    v19 = (void *)*MEMORY[0x24BEBB360];
    *(_QWORD *)(inited + 48) = *MEMORY[0x24BEBB360];
    *(_QWORD *)(inited + 56) = v10;
    v20 = (void *)*MEMORY[0x24BEBB368];
    *(_QWORD *)(inited + 64) = *MEMORY[0x24BEBB368];
    *(_QWORD *)(inited + 72) = a1;
    v21 = v18;
    v22 = v19;
    v23 = v20;
    v24 = a1;
    v25 = sub_226B598E4(inited);

    return v25;
  }
  else
  {
    sub_226B5D228();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00D8);
    v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_226B5F1C0;
    v28 = sub_226B5D150();
    v30 = v29;
    *(_QWORD *)(v27 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v27 + 64) = sub_226B4F7B0();
    *(_QWORD *)(v27 + 32) = v28;
    *(_QWORD *)(v27 + 40) = v30;
    if (qword_25589FD20 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_226B5F1C0;
    *(_QWORD *)(v31 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00E0);
    *(_QWORD *)(v31 + 64) = sub_226B53B64();
    *(_QWORD *)(v31 + 32) = v27;
    swift_bridgeObjectRetain();
    sub_226B5D0D8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_226B598E4(MEMORY[0x24BEE4AF8]);
  }
}

uint64_t sub_226B568F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v11;

  v0 = sub_226B5D0B4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226B5D0A8();
  if (qword_25589FD40 != -1)
    swift_once();
  v4 = (id)qword_2558A0670;
  v5 = (void *)sub_226B5D09C();
  objc_msgSend(v4, sel_setTimeZone_, v5);

  v6 = (id)qword_2558A0670;
  v7 = (void *)sub_226B5D00C();
  v8 = objc_msgSend(v6, sel_stringFromDate_, v7);

  v9 = sub_226B5D150();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v9;
}

uint64_t sub_226B56A34(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v33;
  uint64_t v34;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0320);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_226B5D0B4();
  v5 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0268);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v33 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0078);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_226B5D030();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, sel_snapshotIndex);
  v21 = (id)_HKActivityCacheDateComponentsFromCacheIndex();
  if (v21)
  {
    v22 = v21;
    sub_226B5CFB8();

    v23 = sub_226B5CFD0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v11, 0, 1, v23);
  }
  else
  {
    v23 = sub_226B5CFD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v11, 1, 1, v23);
  }
  sub_226B545D4((uint64_t)v11, (uint64_t)v13);
  sub_226B5CFD0();
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v13, 1, v23) == 1)
  {
    sub_226B5461C((uint64_t)v13, &qword_2558A0268);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
LABEL_7:
    sub_226B5461C((uint64_t)v16, &qword_2558A0078);
    return 0;
  }
  sub_226B5CFC4();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
    goto LABEL_7;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v16, v17);
  sub_226B5D084();
  v26 = v34;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v4, 1, v34) == 1)
  {
    sub_226B5D0A8();
    sub_226B5461C((uint64_t)v4, &qword_2558A0320);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v4, v26);
  }
  if (qword_25589FD40 != -1)
    swift_once();
  v27 = (id)qword_2558A0670;
  v28 = (void *)sub_226B5D09C();
  objc_msgSend(v27, sel_setTimeZone_, v28);

  v29 = (id)qword_2558A0670;
  v30 = (void *)sub_226B5D00C();
  v31 = objc_msgSend(v29, sel_stringFromDate_, v30);

  v25 = sub_226B5D150();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v26);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  return v25;
}

uint64_t sub_226B56E24(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for ReplyLayoutValues(a2, a1);
  return a2;
}

uint64_t sub_226B56E60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)(v0 + 24))
  {
    v1 = *(_QWORD *)(v0 + 16);
  }
  else
  {
    type metadata accessor for ReplyBubbleView();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v4 = (void *)sub_226B5D12C();
    v5 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, 0);

    v1 = sub_226B5D150();
    v7 = v6;

    *(_QWORD *)(v0 + 16) = v1;
    *(_QWORD *)(v0 + 24) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_226B56F48(uint64_t a1, uint64_t a2, char a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v23[2];

  v23[1] = *(id *)MEMORY[0x24BDAC8D0];
  if ((a3 & 1) != 0)
  {
    v4 = (void *)sub_226B5D12C();
    v5 = (id)ASContactStorePredicateForDestination();

    v6 = sub_226B57438();
    sub_226B574A0();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558A04D0);
    v7 = (void *)sub_226B5D1C8();
    swift_bridgeObjectRelease();
    v23[0] = 0;
    v8 = objc_msgSend(v6, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v5, v7, v23);

    v9 = v23[0];
    if (!v8)
    {
      v19 = v23[0];
      v20 = (void *)sub_226B5CFDC();

      swift_willThrow();
      goto LABEL_18;
    }
    sub_226B57728();
    v10 = sub_226B5D1D4();
    v11 = v9;

    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      v21 = sub_226B5D30C();
      swift_bridgeObjectRelease();
      if (v21)
        goto LABEL_5;
    }
    else if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_5:
      if ((v10 & 0xC000000000000001) != 0)
      {
        v12 = (id)MEMORY[0x2276A2538](0, v10);
      }
      else
      {
        if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
          __break(1u);
        v12 = *(id *)(v10 + 32);
      }
      v13 = v12;
      swift_bridgeObjectRelease();
      v14 = (id)ASFullNameForContactStoreContact();
      if (v14)
      {
        v15 = v14;
        a1 = sub_226B5D150();

        return a1;
      }

LABEL_18:
      swift_bridgeObjectRetain();
      return a1;
    }

    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  v16 = sub_226B57560();
  v17 = (id)ASFullNameForContactStoreContact();

  if (!v17)
  {
    v18 = sub_226B57560();
    v17 = (id)ASShortNameForContactStoreContact();

    if (!v17)
      return sub_226B56E60();
  }
  a1 = sub_226B5D150();

  return a1;
}

uint64_t sub_226B571D4(uint64_t a1, uint64_t a2, char a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v21[2];

  v21[1] = *(id *)MEMORY[0x24BDAC8D0];
  if ((a3 & 1) == 0)
  {
    v15 = sub_226B57560();
    v16 = (id)ASShortNameForContactStoreContact();

    if (!v16)
      return sub_226B56E60();
    a1 = sub_226B5D150();

    return a1;
  }
  v4 = (void *)sub_226B5D12C();
  v5 = (id)ASContactStorePredicateForDestination();

  v6 = sub_226B57438();
  sub_226B574A0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558A04D0);
  v7 = (void *)sub_226B5D1C8();
  swift_bridgeObjectRelease();
  v21[0] = 0;
  v8 = objc_msgSend(v6, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v5, v7, v21);

  v9 = v21[0];
  if (!v8)
  {
    v17 = v21[0];
    v18 = (void *)sub_226B5CFDC();

    swift_willThrow();
LABEL_15:
    swift_bridgeObjectRetain();
    return a1;
  }
  sub_226B57728();
  v10 = sub_226B5D1D4();
  v11 = v9;

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    v19 = sub_226B5D30C();
    swift_bridgeObjectRelease();
    if (v19)
      goto LABEL_5;
    goto LABEL_14;
  }
  if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_14:

    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
LABEL_5:
  if ((v10 & 0xC000000000000001) != 0)
  {
    v12 = (id)MEMORY[0x2276A2538](0, v10);
  }
  else
  {
    if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v12 = *(id *)(v10 + 32);
  }
  v13 = v12;
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v13, sel_givenName);
  a1 = sub_226B5D150();

  return a1;
}

id sub_226B57438()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 32);
  if (v1)
  {
    v2 = *(id *)(v0 + 32);
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACF8]), sel_init);
    v4 = *(void **)(v0 + 32);
    *(_QWORD *)(v0 + 32) = v3;
    v2 = v3;

    v1 = 0;
  }
  v5 = v1;
  return v2;
}

uint64_t sub_226B574A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(v0 + 40))
  {
    v1 = *(_QWORD *)(v0 + 40);
  }
  else
  {
    v2 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25589FFC0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_226B5F220;
    *(_QWORD *)(v1 + 32) = objc_msgSend((id)objc_opt_self(), sel_descriptorForRequiredKeysForStyle_, 0);
    sub_226B5D1E0();
    *(_QWORD *)(v2 + 40) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

id sub_226B57560()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v1 = *(void **)(v0 + 48);
  v2 = v1;
  if (v1 == (void *)1)
  {
    v2 = sub_226B575BC();
    v3 = *(void **)(v0 + 48);
    *(_QWORD *)(v0 + 48) = v2;
    v4 = v2;
    sub_226B57708(v3);
  }
  sub_226B57718(v1);
  return v2;
}

id sub_226B575BC()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v7[2];

  v7[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = sub_226B57438();
  sub_226B574A0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558A04D0);
  v1 = (void *)sub_226B5D1C8();
  swift_bridgeObjectRelease();
  v7[0] = 0;
  v2 = objc_msgSend(v0, sel__ios_meContactWithKeysToFetch_error_, v1, v7);

  v3 = v7[0];
  if (!v2)
  {
    v4 = v3;
    v5 = (void *)sub_226B5CFDC();

    swift_willThrow();
    return 0;
  }
  return v2;
}

uint64_t sub_226B576AC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_226B57708(*(id *)(v0 + 48));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ContactFormatter()
{
  return objc_opt_self();
}

void sub_226B57708(id a1)
{
  if (a1 != (id)1)

}

id sub_226B57718(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

unint64_t sub_226B57728()
{
  unint64_t result;

  result = qword_2558A04E0;
  if (!qword_2558A04E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2558A04E0);
  }
  return result;
}

char *sub_226B57764(uint64_t a1, char a2)
{
  char *v2;
  id v5;
  char *v6;
  id v7;
  char *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  id v15;
  char *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v31[3];
  uint64_t v32;
  uint64_t v33;
  objc_super v34;
  _QWORD v35[26];

  *(_QWORD *)&v2[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  sub_226B4DCE0(a1, (uint64_t)&v2[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_reply]);
  v5 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v6 = v2;
  v7 = objc_msgSend(v5, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)&v6[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_userMessageLabel] = v7;
  v8 = &v6[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_fittingSize];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v6[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_isPending] = a2;

  v34.receiver = v6;
  v34.super_class = (Class)type metadata accessor for ReplyBubbleView();
  v9 = objc_msgSendSuper2(&v34, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v10 = qword_25589FD38;
  v11 = v9;
  if (v10 != -1)
    swift_once();
  sub_226B4DD24((uint64_t)&qword_2558A0BC8, (uint64_t)v31);
  v12 = v32;
  v13 = v33;
  __swift_project_boxed_opaque_existential_1(v31, v32);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v13 + 8))(v35, v12, v13);
  v14 = *(double *)v35;
  v15 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v16 = (char *)v11;
  v17 = objc_msgSend(v15, sel_initWithWhite_alpha_, v14, 1.0);
  objc_msgSend(v16, sel_setBackgroundColor_, v17);

  v18 = OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_userMessageLabel;
  v19 = *(void **)&v16[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_userMessageLabel];
  v20 = v32;
  v21 = v33;
  __swift_project_boxed_opaque_existential_1(v31, v32);
  v22 = *(uint64_t (**)(uint64_t, uint64_t))(v21 + 16);
  v23 = v19;
  swift_bridgeObjectRetain();
  v24 = v22(v20, v21);
  sub_226B4D710(v24);
  swift_bridgeObjectRelease();
  v25 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v26 = (void *)sub_226B5D12C();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_226B4DD8C();
  v27 = (void *)sub_226B5D120();
  swift_bridgeObjectRelease();
  v28 = objc_msgSend(v25, sel_initWithString_attributes_, v26, v27);

  objc_msgSend(v23, sel_setAttributedText_, v28);
  v29 = *(void **)&v16[v18];
  objc_msgSend(v29, sel_setNumberOfLines_, v35[5]);
  objc_msgSend(v29, sel_setAllowsDefaultTighteningForTruncation_, 1);
  objc_msgSend(v29, sel_setLineBreakMode_, 4);
  objc_msgSend(v16, sel_addSubview_, v29);

  sub_226B4DE38((uint64_t)v35);
  sub_226B4DE60(a1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  return v16;
}

uint64_t ReplyBubbleView.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate;
  swift_beginAccess();
  return MEMORY[0x2276A2F04](v1);
}

uint64_t ReplyBubbleView.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*ReplyBubbleView.delegate.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x2276A2F04](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_226B57BB8;
}

void sub_226B57BB8(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

double ReplyBubbleView.fittingSize.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_fittingSize;
  swift_beginAccess();
  return *(double *)v1;
}

BOOL static ReplyBubbleViewTapBehavior.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t ReplyBubbleViewTapBehavior.hash(into:)()
{
  return sub_226B5D378();
}

uint64_t ReplyBubbleViewTapBehavior.hashValue.getter()
{
  sub_226B5D36C();
  sub_226B5D378();
  return sub_226B5D384();
}

BOOL sub_226B57CE8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_226B57D00()
{
  sub_226B5D36C();
  sub_226B5D378();
  return sub_226B5D384();
}

uint64_t sub_226B57D44()
{
  return sub_226B5D378();
}

uint64_t sub_226B57D6C()
{
  sub_226B5D36C();
  sub_226B5D378();
  return sub_226B5D384();
}

Swift::Void __swiftcall ReplyBubbleView.layoutSubviews()()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  CGFloat Width;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  double v44;
  double MaxX;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  _QWORD v68[3];
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[3];
  double v72;
  double v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00D8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_226B5F1C0;
  objc_msgSend(v1, sel_bounds);
  v3 = sub_226B5D258();
  v5 = v4;
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 64) = sub_226B4F7B0();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v5;
  sub_226B5D234();
  if (qword_25589FD20 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_226B5F1C0;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00E0);
  *(_QWORD *)(v6 + 56) = v7;
  v8 = sub_226B53B64();
  *(_QWORD *)(v6 + 64) = v8;
  *(_QWORD *)(v6 + 32) = v2;
  swift_bridgeObjectRetain();
  sub_226B5D0D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_bounds);
  v10 = v9;
  v12 = v11;
  v13 = (double *)&v1[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_fittingSize];
  swift_beginAccess();
  if (v10 == *v13 && v12 == v13[1])
  {
    sub_226B5D234();
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_226B5F1C0;
    *(_QWORD *)(v14 + 56) = v7;
    *(_QWORD *)(v14 + 64) = v8;
    *(_QWORD *)(v14 + 32) = MEMORY[0x24BEE4AF8];
    sub_226B5D0D8();
    swift_bridgeObjectRelease();
    return;
  }
  if (qword_25589FD38 != -1)
    swift_once();
  sub_226B4DD24((uint64_t)&qword_2558A0BC8, (uint64_t)v68);
  v15 = v69;
  v16 = v70;
  __swift_project_boxed_opaque_existential_1(v68, v69);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v16 + 8))(v71, v15, v16);
  v17 = v69;
  v18 = v70;
  __swift_project_boxed_opaque_existential_1(v68, v69);
  objc_msgSend(v1, sel_bounds);
  v23 = sub_226B5B33C(v1[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_reply + 16], v17, v18, v19, v20, v21, v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = v72;
  if (v1[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_isPending])
    v31 = v73;
  else
    v31 = v72;
  v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_226B5F1C0;
  *(_QWORD *)(v32 + 56) = MEMORY[0x24BEE50B0];
  *(_QWORD *)(v32 + 64) = sub_226B58534();
  *(double *)(v32 + 32) = v31;
  sub_226B5D234();
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_226B5F1C0;
  *(_QWORD *)(v33 + 56) = v7;
  *(_QWORD *)(v33 + 64) = v8;
  *(_QWORD *)(v33 + 32) = v32;
  swift_bridgeObjectRetain();
  sub_226B5D0D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v74.origin.x = v23;
  v74.origin.y = v25;
  v74.size.width = v27;
  v74.size.height = v29;
  Width = CGRectGetWidth(v74);
  v35 = *(void **)&v1[OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_userMessageLabel];
  objc_msgSend(v35, sel_sizeThatFits_, Width - v30 - v31, 1.79769313e308);
  v37 = v36;
  v39 = v38;
  v75.origin.x = v23;
  v75.origin.y = v25;
  v75.size.width = v27;
  v75.size.height = v29;
  objc_msgSend(v35, sel_setFrame_, v30 + CGRectGetMinX(v75), 0.0, v37, v39);
  v40 = v69;
  v41 = v70;
  __swift_project_boxed_opaque_existential_1(v68, v69);
  v42 = objc_msgSend(v35, sel_font);
  if (!v42)
  {
    __break(1u);
    goto LABEL_17;
  }
  v43 = v42;
  v66 = v27;
  v67 = v25;
  v44 = (*(double (**)(id, uint64_t, uint64_t))(v41 + 48))(v42, v40, v41);

  objc_msgSend(v35, sel__setFirstLineBaselineFrameOriginY_, v44);
  objc_msgSend(v35, sel_frame);
  MaxX = CGRectGetMaxX(v76);
  objc_msgSend(v35, sel__lastLineBaselineFrameOriginY);
  v47 = v46;
  v48 = v69;
  v49 = v70;
  __swift_project_boxed_opaque_existential_1(v68, v69);
  v50 = objc_msgSend(v35, sel_font);
  if (!v50)
  {
LABEL_17:
    __break(1u);
    return;
  }
  v51 = v50;
  v52 = v31 + MaxX;
  v53 = (*(double (**)(id, uint64_t, uint64_t))(v49 + 64))(v50, v48, v49);

  v54 = v47 + v53;
  if (objc_msgSend(v1, sel_effectiveUserInterfaceLayoutDirection) == (id)1)
  {
    objc_msgSend(v35, sel_frame);
    v56 = v55;
    v58 = v57;
    v60 = v59;
    v62 = v61;
    v77.origin.x = v23;
    v77.size.width = v66;
    v77.origin.y = v67;
    v77.size.height = v29;
    v63 = CGRectGetWidth(v77);
    v78.origin.x = v56;
    v78.origin.y = v58;
    v78.size.width = v60;
    v78.size.height = v62;
    v64 = v63 - CGRectGetMinX(v78);
    v79.origin.x = v56;
    v79.origin.y = v58;
    v79.size.width = v60;
    v79.size.height = v62;
    v65 = v64 - CGRectGetWidth(v79);
    v80.origin.x = v56;
    v80.origin.y = v58;
    v80.size.width = v60;
    v80.size.height = v62;
    objc_msgSend(v35, sel_setFrame_, v65, CGRectGetMinY(v80), v60, v62);
  }
  sub_226B4DE38((uint64_t)v71);
  *v13 = v52;
  v13[1] = v54;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
}

id ReplyBubbleView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReplyBubbleView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_226B58534()
{
  unint64_t result;

  result = qword_2558A0500;
  if (!qword_2558A0500)
  {
    result = MEMORY[0x2276A2E38](MEMORY[0x24BEE5108], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_2558A0500);
  }
  return result;
}

uint64_t type metadata accessor for ReplyBubbleView()
{
  uint64_t result;

  result = qword_2558A0540;
  if (!qword_2558A0540)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_226B585B8()
{
  unint64_t result;

  result = qword_2558A0510;
  if (!qword_2558A0510)
  {
    result = MEMORY[0x2276A2E38](&protocol conformance descriptor for ReplyBubbleViewTapBehavior, &type metadata for ReplyBubbleViewTapBehavior);
    atomic_store(result, (unint64_t *)&qword_2558A0510);
  }
  return result;
}

__n128 sub_226B585FC@<Q0>(_QWORD *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 *v3;
  __n128 result;

  v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_fittingSize);
  swift_beginAccess();
  result = *v3;
  *a2 = *v3;
  return result;
}

uint64_t sub_226B5864C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_fittingSize);
  result = swift_beginAccess();
  *v4 = v2;
  v4[1] = v3;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ReplyBubbleViewTapBehavior(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ReplyBubbleViewTapBehavior(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_226B58788 + 4 * byte_226B5F4E5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_226B587BC + 4 * byte_226B5F4E0[v4]))();
}

uint64_t sub_226B587BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_226B587C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x226B587CCLL);
  return result;
}

uint64_t sub_226B587D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x226B587E0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_226B587E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_226B587EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_226B587F8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_226B58804(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ReplyBubbleViewTapBehavior()
{
  return &type metadata for ReplyBubbleViewTapBehavior;
}

uint64_t sub_226B58820()
{
  return type metadata accessor for ReplyBubbleView();
}

uint64_t sub_226B58828()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Reply();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_226B588C0(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

char *sub_226B588E4(char *a1, char **a2, int *a3)
{
  int v3;
  char *v4;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  char *v42;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a2[1];
    *((_QWORD *)a1 + 1) = v8;
    v9 = a3[6];
    v10 = &a1[v9];
    v11 = (uint64_t)a2 + v9;
    v12 = *(uint64_t *)((char *)a2 + v9 + 8);
    *(_QWORD *)v10 = *(char **)((char *)a2 + v9);
    *((_QWORD *)v10 + 1) = v12;
    v10[16] = *((_BYTE *)a2 + v9 + 16);
    v13 = (int *)type metadata accessor for Reply();
    v14 = v13[6];
    v41 = v11 + v14;
    v42 = &v10[v14];
    v15 = sub_226B5D06C();
    v40 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    v16 = v4;
    v17 = v8;
    swift_bridgeObjectRetain();
    v40(v42, v41, v15);
    v18 = v13[7];
    v19 = &v10[v18];
    v20 = (_QWORD *)(v11 + v18);
    v21 = v20[1];
    *(_QWORD *)v19 = *v20;
    *((_QWORD *)v19 + 1) = v21;
    v22 = v13[8];
    v23 = &v10[v22];
    v24 = v11 + v22;
    v25 = sub_226B5D030();
    v26 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16);
    swift_bridgeObjectRetain();
    v26(v23, v24, v25);
    v27 = a3[7];
    v28 = a3[8];
    v29 = *(char **)((char *)a2 + v27);
    *(_QWORD *)&v7[v27] = v29;
    v30 = *(char **)((char *)a2 + v28);
    *(_QWORD *)&v7[v28] = v30;
    v31 = a3[9];
    v32 = a3[10];
    v33 = *(char **)((char *)a2 + v31);
    *(_QWORD *)&v7[v31] = v33;
    v34 = *(char **)((char *)a2 + v32);
    *(_QWORD *)&v7[v32] = v34;
    v35 = v29;
    v36 = v30;
    v37 = v33;
    v38 = v34;
  }
  return v7;
}

void sub_226B58A60(id *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v4 = (char *)a1 + a2[6];
  swift_bridgeObjectRelease();
  v5 = type metadata accessor for Reply();
  v6 = &v4[*(int *)(v5 + 24)];
  v7 = sub_226B5D06C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  v8 = &v4[*(int *)(v5 + 32)];
  v9 = sub_226B5D030();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);

}

_QWORD *sub_226B58B40(_QWORD *a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  char *v41;

  v6 = *(void **)a2;
  v7 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v7;
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = a2 + v8;
  v11 = *(_QWORD *)(a2 + v8 + 8);
  *(_QWORD *)v9 = *(_QWORD *)(a2 + v8);
  *((_QWORD *)v9 + 1) = v11;
  v9[16] = *(_BYTE *)(a2 + v8 + 16);
  v12 = (int *)type metadata accessor for Reply();
  v13 = v12[6];
  v40 = v10 + v13;
  v41 = &v9[v13];
  v14 = sub_226B5D06C();
  v39 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  v15 = v6;
  v16 = v7;
  swift_bridgeObjectRetain();
  v39(v41, v40, v14);
  v17 = v12[7];
  v18 = &v9[v17];
  v19 = (_QWORD *)(v10 + v17);
  v20 = v19[1];
  *(_QWORD *)v18 = *v19;
  *((_QWORD *)v18 + 1) = v20;
  v21 = v12[8];
  v22 = &v9[v21];
  v23 = v10 + v21;
  v24 = sub_226B5D030();
  v25 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
  swift_bridgeObjectRetain();
  v25(v22, v23, v24);
  v26 = a3[7];
  v27 = a3[8];
  v28 = *(void **)(a2 + v26);
  *(_QWORD *)((char *)a1 + v26) = v28;
  v29 = *(void **)(a2 + v27);
  *(_QWORD *)((char *)a1 + v27) = v29;
  v30 = a3[9];
  v31 = a3[10];
  v32 = *(void **)(a2 + v30);
  *(_QWORD *)((char *)a1 + v30) = v32;
  v33 = *(void **)(a2 + v31);
  *(_QWORD *)((char *)a1 + v31) = v33;
  v34 = v28;
  v35 = v29;
  v36 = v32;
  v37 = v33;
  return a1;
}

uint64_t sub_226B58C8C(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  v9 = *(void **)(a2 + 8);
  v10 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v9;
  v11 = v9;

  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_QWORD *)v13 = *(_QWORD *)(a2 + v12);
  *(_QWORD *)(v13 + 8) = *(_QWORD *)(a2 + v12 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v13 + 16) = *(_BYTE *)(v14 + 16);
  v15 = (int *)type metadata accessor for Reply();
  v16 = v15[6];
  v17 = v13 + v16;
  v18 = v14 + v16;
  v19 = sub_226B5D06C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  v20 = v15[7];
  v21 = (_QWORD *)(v13 + v20);
  v22 = (_QWORD *)(v14 + v20);
  *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v23 = v15[8];
  v24 = v13 + v23;
  v25 = v14 + v23;
  v26 = sub_226B5D030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 24))(v24, v25, v26);
  v27 = a3[7];
  v28 = *(void **)(a2 + v27);
  v29 = *(void **)(a1 + v27);
  *(_QWORD *)(a1 + v27) = v28;
  v30 = v28;

  v31 = a3[8];
  v32 = *(void **)(a2 + v31);
  v33 = *(void **)(a1 + v31);
  *(_QWORD *)(a1 + v31) = v32;
  v34 = v32;

  v35 = a3[9];
  v36 = *(void **)(a2 + v35);
  v37 = *(void **)(a1 + v35);
  *(_QWORD *)(a1 + v35) = v36;
  v38 = v36;

  v39 = a3[10];
  v40 = *(void **)(a1 + v39);
  v41 = *(void **)(a2 + v39);
  *(_QWORD *)(a1 + v39) = v41;
  v42 = v41;

  return a1;
}

_OWORD *sub_226B58E18(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_OWORD *)v7 = *(_OWORD *)((char *)a2 + v6);
  v7[16] = *((_BYTE *)a2 + v6 + 16);
  v9 = (int *)type metadata accessor for Reply();
  v10 = v9[6];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_226B5D06C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  *(_OWORD *)&v7[v9[7]] = *(_OWORD *)&v8[v9[7]];
  v14 = v9[8];
  v15 = &v7[v14];
  v16 = &v8[v14];
  v17 = sub_226B5D030();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  v18 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v18) = *(_QWORD *)((char *)a2 + v18);
  v19 = a3[10];
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v19) = *(_QWORD *)((char *)a2 + v19);
  return a1;
}

uint64_t sub_226B58F14(uint64_t a1, _QWORD *a2, int *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = a2[1];

  v8 = a3[6];
  v9 = a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = *(_QWORD *)((char *)a2 + v8 + 8);
  *(_QWORD *)v9 = *(_QWORD *)((char *)a2 + v8);
  *(_QWORD *)(v9 + 8) = v11;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v9 + 16) = v10[16];
  v12 = (int *)type metadata accessor for Reply();
  v13 = v12[6];
  v14 = v9 + v13;
  v15 = &v10[v13];
  v16 = sub_226B5D06C();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  v17 = v12[7];
  v18 = (_QWORD *)(v9 + v17);
  v19 = &v10[v17];
  v21 = *(_QWORD *)v19;
  v20 = *((_QWORD *)v19 + 1);
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  v22 = v12[8];
  v23 = v9 + v22;
  v24 = &v10[v22];
  v25 = sub_226B5D030();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 40))(v23, v24, v25);
  v26 = a3[7];
  v27 = *(void **)(a1 + v26);
  *(_QWORD *)(a1 + v26) = *(_QWORD *)((char *)a2 + v26);

  v28 = a3[8];
  v29 = *(void **)(a1 + v28);
  *(_QWORD *)(a1 + v28) = *(_QWORD *)((char *)a2 + v28);

  v30 = a3[9];
  v31 = *(void **)(a1 + v30);
  *(_QWORD *)(a1 + v30) = *(_QWORD *)((char *)a2 + v30);

  v32 = a3[10];
  v33 = *(void **)(a1 + v32);
  *(_QWORD *)(a1 + v32) = *(_QWORD *)((char *)a2 + v32);

  return a1;
}

uint64_t sub_226B59068()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_226B59074(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for Reply();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t sub_226B590F0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_226B590FC(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for Reply();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for CompetitionScoreRenderer()
{
  uint64_t result;

  result = qword_2558A05A8;
  if (!qword_2558A05A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_226B591AC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Reply();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_226B59234(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = a1;
  return swift_task_switch();
}

uint64_t sub_226B5924C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD *v9;
  uint64_t (*v10)(void);

  if (*(_BYTE *)(*(_QWORD *)(v0 + 48) + 16) == 1)
  {
    v1 = MEMORY[0x24BEE4AF8];
    sub_226B599EC(MEMORY[0x24BEE4AF8]);
    sub_226B59AF4(v1, &qword_2558A0658);
    sub_226B59AF4(v1, &qword_2558A0650);
    v2 = objc_allocWithZone(MEMORY[0x24BE01F30]);
    sub_226B5AFC8(0, &qword_2558A0620);
    sub_226B5AFC8(0, &qword_2558A0628);
    sub_226B5AF70();
    v3 = (void *)sub_226B5D120();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0638);
    v4 = (void *)sub_226B5D120();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0640);
    v5 = (void *)sub_226B5D120();
    swift_bridgeObjectRelease();
    sub_226B5AFC8(0, &qword_2558A0648);
    v6 = (void *)sub_226B5D1C8();
    v7 = objc_msgSend(v2, sel_initWithActivitySnapshots_friendAchievements_friendWorkouts_contact_competitions_, v3, v4, v5, 0, v6);

    return (*(uint64_t (**)(id))(v0 + 8))(v7);
  }
  else
  {
    sub_226B5D0CC();
    *(_QWORD *)(v0 + 56) = sub_226B5D0C0();
    v10 = (uint64_t (*)(void))((int)*MEMORY[0x24BE01FA8] + MEMORY[0x24BE01FA8]);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v9;
    *v9 = v0;
    v9[1] = sub_226B59474;
    return v10();
  }
}

uint64_t sub_226B59474()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_226B594C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t);

  type metadata accessor for Reply();
  v1 = sub_226B5D03C();
  v3 = v2;
  *(_QWORD *)(v0 + 72) = v2;
  v6 = (uint64_t (*)(uint64_t, uint64_t))((int)*MEMORY[0x24BE01FA0] + MEMORY[0x24BE01FA0]);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v4;
  *v4 = v0;
  v4[1] = sub_226B59558;
  return v6(v1, v3);
}

uint64_t sub_226B59558(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  _QWORD *v6;
  uint64_t (*v7)(void);

  v4 = (_QWORD *)*v2;
  v4[11] = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  v4[12] = a1;
  v7 = (uint64_t (*)(void))((int)*MEMORY[0x24BE01F98] + MEMORY[0x24BE01F98]);
  v6 = (_QWORD *)swift_task_alloc();
  v4[13] = v6;
  *v6 = v4;
  v6[1] = sub_226B59614;
  return v7();
}

uint64_t sub_226B59614()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_226B59668()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 96));
}

uint64_t sub_226B5969C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(void);

  swift_bridgeObjectRelease();
  sub_226B5D228();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00D8);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_226B5F1C0;
  swift_getErrorValue();
  v2 = sub_226B5D360();
  v4 = v3;
  *(_QWORD *)(v1 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v1 + 64) = sub_226B4F7B0();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v4;
  if (qword_25589FD20 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_226B5F1C0;
  *(_QWORD *)(v5 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00E0);
  *(_QWORD *)(v5 + 64) = sub_226B51C88((unint64_t *)&qword_2558A00E8, &qword_2558A00E0, MEMORY[0x24BDCFBF8]);
  *(_QWORD *)(v5 + 32) = v1;
  swift_bridgeObjectRetain();
  sub_226B5D0D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = (uint64_t (*)(void))((int)*MEMORY[0x24BE01F98] + MEMORY[0x24BE01F98]);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v6;
  *v6 = v0;
  v6[1] = sub_226B59854;
  return v8();
}

uint64_t sub_226B59854()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_226B598A8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 56);

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

unint64_t sub_226B598E4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0668);
  v2 = (_QWORD *)sub_226B5D318();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    swift_unknownObjectRetain();
    result = sub_226B5B000((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_226B599EC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0660);
  v2 = (_QWORD *)sub_226B5D318();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = *(v4 - 1);
    v7 = v5;
    result = sub_226B5B080((uint64_t)v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v6;
    *(_QWORD *)(v2[7] + v10) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_226B59AF4(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_226B5D318();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v6 = *v5;
    v7 = (id)*(v5 - 1);
    swift_bridgeObjectRetain();
    result = sub_226B5B080((uint64_t)v7);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v3[6] + v10) = v7;
    *(_QWORD *)(v3[7] + v10) = v6;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v3[2] = v13;
    v5 += 2;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_226B59BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v43 = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A05F8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (void *)objc_opt_self();
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInteger_, a3);
  v14 = objc_msgSend(v12, sel_stringWithNumber_decimalPrecision_, v13, 1);

  if (v14)
  {
    v15 = sub_226B5D150();
    v17 = v16;

  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
    v18 = swift_allocObject();
    v19 = MEMORY[0x24BEE1E88];
    *(_OWORD *)(v18 + 16) = xmmword_226B5F1C0;
    v20 = MEMORY[0x24BEE1ED8];
    *(_QWORD *)(v18 + 56) = v19;
    *(_QWORD *)(v18 + 64) = v20;
    *(_QWORD *)(v18 + 32) = a3;
    v15 = sub_226B5D15C();
    v17 = v21;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_226B5F280;
  v23 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v22 + 56) = MEMORY[0x24BEE0D00];
  v24 = sub_226B4F7B0();
  *(_QWORD *)(v22 + 32) = a1;
  *(_QWORD *)(v22 + 40) = a2;
  *(_QWORD *)(v22 + 96) = v23;
  *(_QWORD *)(v22 + 104) = v24;
  *(_QWORD *)(v22 + 64) = v24;
  *(_QWORD *)(v22 + 72) = v15;
  *(_QWORD *)(v22 + 80) = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v25 = sub_226B5D15C();
  v27 = v26;
  swift_bridgeObjectRetain();
  sub_226B4D710(a5);
  v28 = objc_allocWithZone(MEMORY[0x24BDD1688]);
  v29 = (void *)sub_226B5D12C();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_226B4DD8C();
  v30 = sub_226B5D120();
  swift_bridgeObjectRelease();
  v31 = objc_msgSend(v28, sel_initWithString_attributes_, v29, v30);

  v46 = v25;
  v47 = v27;
  v44 = v15;
  v45 = v17;
  v32 = sub_226B5D078();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v11, 1, 1, v32);
  sub_226B5AEEC();
  v33 = sub_226B5D2AC();
  v35 = v34;
  LOBYTE(v30) = v36;
  sub_226B5AF30((uint64_t)v11);
  swift_bridgeObjectRelease();
  if ((v30 & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v37 = *MEMORY[0x24BEBB368];
    v46 = v33;
    v47 = v35;
    v44 = v25;
    v45 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0608);
    sub_226B51C88(&qword_2558A0610, &qword_2558A0608, MEMORY[0x24BEE1BC0]);
    v38 = sub_226B5D288();
    objc_msgSend(v31, sel_addAttribute_value_range_, v37, v43, v38, v39);
  }
  v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v40, sel_setAttributedText_, v31);
  objc_msgSend(v40, sel_setNumberOfLines_, 1);

  return v40;
}

id sub_226B59FC8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id result;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char **v39;
  uint64_t v40;
  char **v41;
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  int *v56;
  _QWORD *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  unsigned int v69;
  uint64_t ObjCClassFromMetadata;
  id v71;
  void *v72;
  id v73;
  BOOL v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  id v88;
  uint64_t v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  uint64_t v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  int *v108;
  _QWORD *v109;
  _QWORD v110[3];
  uint64_t v111;
  uint64_t v112;
  _QWORD v113[9];
  double v114;

  v8 = sub_226B5D030();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0078);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v94 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a4 = a1;
  v108 = (int *)type metadata accessor for CompetitionScoreRenderer();
  sub_226B4DCE0(a2, (uint64_t)a4 + v108[6]);
  v109 = a4;
  a4[1] = a3;
  v15 = qword_25589FD38;
  v16 = a1;
  v17 = a3;
  if (v15 != -1)
    swift_once();
  sub_226B4DD24((uint64_t)&qword_2558A0BC8, (uint64_t)v110);
  v18 = v111;
  v19 = v112;
  __swift_project_boxed_opaque_existential_1(v110, v111);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v19 + 8))(v113, v18, v19);
  objc_msgSend(v16, sel_victoryBadgeStyle);
  v103 = type metadata accessor for Reply();
  v20 = (void *)sub_226B5D048();
  v107 = (id)ASEphemeralCompetitionVictoryAchievementForStyle();

  v21 = objc_msgSend(v16, sel_endDate);
  if (!v21)
  {
    result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v14, 1, 1, v8);
    goto LABEL_32;
  }
  v22 = v21;
  sub_226B5D018();

  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v11, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v14, 0, 1, v8);
  result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8);
  if ((_DWORD)result == 1)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v24 = (void *)sub_226B5D00C();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  v25 = objc_msgSend(v16, sel_victoryBadgeStyle);
  v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInt_, v25);
  v27 = (id)ASEphemeralEarnedAchievement();

  v100 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE01B10]), sel_init);
  v28 = objc_msgSend(v100, sel_thumbnailImageForAchievement_size_, v27, v114, v114);
  v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithImage_, v28);
  *(_QWORD *)((char *)v109 + v108[7]) = v29;
  objc_msgSend(v29, sel_setContentMode_, 1);
  v30 = v111;
  v31 = v112;
  __swift_project_boxed_opaque_existential_1(v110, v111);
  v105 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 136))(a2, v30, v31);
  v106 = v32;
  v33 = *(_BYTE *)(a2 + 16);
  v102 = v27;
  v101 = v28;
  if ((v33 & 1) != 0)
  {
    v34 = v111;
    v35 = v112;
    __swift_project_boxed_opaque_existential_1(v110, v111);
    v36 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 144))(a2, v34, v35);
    v96 = v37;
    v38 = 0;
    v39 = &selRef_opponentTotalScore;
    v40 = 1;
    v41 = &selRef_myTotalScore;
    goto LABEL_11;
  }
  result = objc_msgSend(v17, sel_contact);
  if (!result)
    goto LABEL_33;
  v42 = result;
  v43 = objc_msgSend(result, sel_shortName);

  if (v43 || (result = objc_msgSend(v17, sel_displayName), (v43 = result) != 0))
  {
    v36 = sub_226B5D150();
    v96 = v44;

    v40 = 0;
    v39 = &selRef_myTotalScore;
    v38 = 1;
    v41 = &selRef_opponentTotalScore;
LABEL_11:
    v99 = v17;
    v45 = objc_msgSend(v16, *v41);
    v46 = objc_msgSend(v16, *v39);
    v47 = (void *)objc_opt_self();
    v94 = v38;
    v48 = objc_msgSend(v47, sel_as_colorForParticipant_competition_, v38, v16);
    v49 = objc_msgSend(v47, sel_as_colorForParticipant_competition_, v40, v16);
    v50 = v111;
    v51 = v112;
    __swift_project_boxed_opaque_existential_1(v110, v111);
    v52 = (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 24))(v50, v51);
    v95 = v36;
    v53 = v36;
    v54 = v96;
    v97 = v49;
    v55 = sub_226B59BF8(v53, v96, (uint64_t)v46, (uint64_t)v49, v52);
    v56 = v108;
    v57 = v109;
    *(_QWORD *)((char *)v109 + v108[8]) = v55;
    v98 = v48;
    v58 = sub_226B59BF8(v105, v106, (uint64_t)v45, (uint64_t)v48, v52);
    swift_bridgeObjectRelease();
    *(_QWORD *)((char *)v57 + v56[9]) = v58;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00D8);
    v59 = swift_allocObject();
    v104 = xmmword_226B5F1C0;
    *(_OWORD *)(v59 + 16) = xmmword_226B5F1C0;
    v103 = a2;
    v60 = sub_226B5CFF4();
    v62 = v61;
    *(_QWORD *)(v59 + 56) = MEMORY[0x24BEE0D00];
    v63 = sub_226B4F7B0();
    *(_QWORD *)(v59 + 64) = v63;
    *(_QWORD *)(v59 + 32) = v60;
    *(_QWORD *)(v59 + 40) = v62;
    sub_226B5D234();
    if (qword_25589FD20 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
    v64 = swift_allocObject();
    *(_OWORD *)(v64 + 16) = v104;
    *(_QWORD *)(v64 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00E0);
    *(_QWORD *)(v64 + 64) = sub_226B51C88((unint64_t *)&qword_2558A00E8, &qword_2558A00E0, MEMORY[0x24BDCFBF8]);
    *(_QWORD *)(v64 + 32) = v59;
    swift_bridgeObjectRetain();
    sub_226B5D0D8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v65 = (void *)sub_226B5D00C();
    objc_msgSend(v16, sel_setCurrentDateOverride_, v65);

    if (objc_msgSend(v16, sel_stage) == (id)1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v66 = ASCompetitionStageStringWithCompetition(v16);
      v67 = v99;
      if (!v66)
      {

        sub_226B4DE38((uint64_t)v113);
        sub_226B4DE60(v103);
        *(_QWORD *)((char *)v109 + v108[10]) = 0;
        return (id)__swift_destroy_boxed_opaque_existential_1((uint64_t)v110);
      }
      v68 = v66;
      sub_226B5D150();

    }
    else
    {
      v69 = objc_msgSend(v16, sel_isScoreTied);
      v67 = v99;
      if (v69)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        type metadata accessor for ReplyBubbleView();
        ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
        v71 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
        v72 = (void *)sub_226B5D12C();
        v73 = objc_msgSend(v71, sel_localizedStringForKey_value_table_, v72, 0, 0);

        sub_226B5D150();
      }
      else
      {
        v74 = objc_msgSend(v16, sel_isParticipantWinning_, v94) == 0;
        if (v74)
          v75 = v95;
        else
          v75 = v105;
        if (v74)
          v76 = v54;
        else
          v76 = v106;
        swift_bridgeObjectRelease();
        type metadata accessor for ReplyBubbleView();
        v77 = swift_getObjCClassFromMetadata();
        v78 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v77);
        v79 = (void *)sub_226B5D12C();
        v80 = objc_msgSend(v78, sel_localizedStringForKey_value_table_, v79, 0, 0);

        sub_226B5D150();
        v81 = swift_allocObject();
        *(_OWORD *)(v81 + 16) = v104;
        *(_QWORD *)(v81 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v81 + 64) = v63;
        *(_QWORD *)(v81 + 32) = v75;
        *(_QWORD *)(v81 + 40) = v76;
        sub_226B5D15C();
        swift_bridgeObjectRelease();
      }
    }
    v82 = v103;
    v83 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    *(_QWORD *)((char *)v109 + v108[10]) = v83;
    if (v83)
    {
      v84 = v83;
      objc_msgSend(v83, sel_setNumberOfLines_, 1);
      objc_msgSend(v84, sel_setLineBreakMode_, 4);
      v85 = v111;
      v86 = v112;
      __swift_project_boxed_opaque_existential_1(v110, v111);
      v87 = *(uint64_t (**)(uint64_t, uint64_t))(v86 + 32);
      v88 = v84;
      v89 = v87(v85, v86);
      sub_226B4D710(v89);
      swift_bridgeObjectRelease();
      v90 = objc_allocWithZone(MEMORY[0x24BDD1458]);
      v91 = (void *)sub_226B5D12C();
      swift_bridgeObjectRelease();
      type metadata accessor for Key(0);
      sub_226B4DD8C();
      v92 = (void *)sub_226B5D120();
      swift_bridgeObjectRelease();
      v93 = objc_msgSend(v90, sel_initWithString_attributes_, v91, v92);

      objc_msgSend(v88, sel_setAttributedText_, v93);
      sub_226B4DE38((uint64_t)v113);

    }
    else
    {

      sub_226B4DE38((uint64_t)v113);
      swift_bridgeObjectRelease();
    }
    sub_226B4DE60(v82);
    return (id)__swift_destroy_boxed_opaque_existential_1((uint64_t)v110);
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_226B5AC10()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25589FFC0);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_226B5F150;
  v2 = (int *)type metadata accessor for CompetitionScoreRenderer();
  v3 = *(void **)(v0 + v2[8]);
  *(_QWORD *)(v1 + 32) = v3;
  v4 = *(void **)(v0 + v2[9]);
  *(_QWORD *)(v1 + 40) = v4;
  sub_226B5D1E0();
  v5 = *(void **)(v0 + v2[10]);
  if (v5)
  {
    v6 = v5;
    v7 = v3;
    v8 = v4;
    v9 = swift_bridgeObjectRetain();
    MEMORY[0x2276A2424](v9);
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_226B5D1EC();
    sub_226B5D1F8();
    sub_226B5D1E0();
    swift_bridgeObjectRelease();

  }
  else
  {
    v10 = v3;
    v11 = v4;
  }
  return v1;
}

uint64_t sub_226B5AD48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  id v13;
  void *v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;

  v3 = sub_226B5D06C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0070);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v1 + *(int *)(type metadata accessor for CompetitionScoreRenderer() + 24);
  if (*(_BYTE *)(v10 + 16) == 1)
  {
    v11 = type metadata accessor for Reply();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a1, v10 + *(int *)(v11 + 24), v3);
  }
  v13 = objc_msgSend(*(id *)(v1 + 8), sel_UUID);
  if (v13)
  {
    v14 = v13;
    sub_226B5D054();

    v15 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v15(v9, v6, v3);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v9, 0, 1, v3);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3);
    if ((_DWORD)result != 1)
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v15)(a1, v9, v3);
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v9, 1, 1, v3);
  }
  __break(1u);
  return result;
}

unint64_t sub_226B5AEEC()
{
  unint64_t result;

  result = qword_2558A0600;
  if (!qword_2558A0600)
  {
    result = MEMORY[0x2276A2E38](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2558A0600);
  }
  return result;
}

uint64_t sub_226B5AF30(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A05F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_226B5AF70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558A0630;
  if (!qword_2558A0630)
  {
    v1 = sub_226B5AFC8(255, &qword_2558A0620);
    result = MEMORY[0x2276A2E38](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2558A0630);
  }
  return result;
}

uint64_t sub_226B5AFC8(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_226B5B000(uint64_t a1)
{
  uint64_t v2;

  sub_226B5D150();
  sub_226B5D36C();
  sub_226B5D18C();
  v2 = sub_226B5D384();
  swift_bridgeObjectRelease();
  return sub_226B5B0B0(a1, v2);
}

unint64_t sub_226B5B080(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_226B5D270();
  return sub_226B5B224(a1, v2);
}

unint64_t sub_226B5B0B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_226B5D150();
    v8 = v7;
    if (v6 == sub_226B5D150() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_226B5D33C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_226B5D150();
          v15 = v14;
          if (v13 == sub_226B5D150() && v15 == v16)
            break;
          v18 = sub_226B5D33C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_226B5B224(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_226B5AFC8(0, &qword_2558A0620);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_226B5D27C();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_226B5D27C();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

double sub_226B5B33C(char a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double v13;
  double v14;
  _QWORD v16[25];
  uint64_t v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v13 = 0.0;
  if ((a1 & 1) == 0)
  {
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(a3 + 8))(v16, a2, a3);
    sub_226B4DE38((uint64_t)v16);
    v13 = *(double *)&v16[1];
  }
  v18.origin.x = a4;
  v18.origin.y = a5;
  v18.size.width = a6;
  v18.size.height = a7;
  v14 = v13 + CGRectGetMinX(v18);
  v19.origin.x = a4;
  v19.origin.y = a5;
  v19.size.width = a6;
  v19.size.height = a7;
  CGRectGetWidth(v19);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a3 + 8))(&v17, a2, a3);
  sub_226B4DE38((uint64_t)&v17);
  v20.origin.x = a4;
  v20.origin.y = a5;
  v20.size.width = a6;
  v20.size.height = a7;
  CGRectGetMinY(v20);
  v21.origin.x = a4;
  v21.origin.y = a5;
  v21.size.width = a6;
  v21.size.height = a7;
  CGRectGetHeight(v21);
  return v14;
}

uint64_t sub_226B5B454()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[12];
  char v10;

  type metadata accessor for ContactFormatter();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 1;
  if (qword_25589FD30 != -1)
    swift_once();
  swift_beginAccess();
  v9[9] = *(_OWORD *)&qword_2558A0B80;
  v9[10] = xmmword_2558A0B90;
  v9[11] = unk_2558A0BA0;
  v10 = byte_2558A0BB0;
  v9[7] = xmmword_2558A0B60;
  v9[8] = xmmword_2558A0B70;
  v9[2] = xmmword_2558A0B10;
  v9[3] = xmmword_2558A0B20;
  v9[5] = xmmword_2558A0B40;
  v9[6] = xmmword_2558A0B50;
  v9[4] = xmmword_2558A0B30;
  v9[0] = static ReplyLayoutValues.phoneValues;
  v9[1] = unk_2558A0B00;
  qword_2558A0BE0 = (uint64_t)&type metadata for ReplyLayoutPhone;
  unk_2558A0BE8 = &off_24EE9E510;
  v1 = swift_allocObject();
  v2 = xmmword_2558A0B70;
  *(_OWORD *)(v1 + 168) = *(_OWORD *)&qword_2558A0B80;
  v3 = unk_2558A0BA0;
  *(_OWORD *)(v1 + 184) = xmmword_2558A0B90;
  *(_OWORD *)(v1 + 200) = v3;
  v4 = xmmword_2558A0B30;
  *(_OWORD *)(v1 + 104) = xmmword_2558A0B40;
  v5 = xmmword_2558A0B60;
  *(_OWORD *)(v1 + 120) = xmmword_2558A0B50;
  *(_OWORD *)(v1 + 136) = v5;
  *(_OWORD *)(v1 + 152) = v2;
  v6 = static ReplyLayoutValues.phoneValues;
  *(_OWORD *)(v1 + 40) = unk_2558A0B00;
  v7 = xmmword_2558A0B20;
  *(_OWORD *)(v1 + 56) = xmmword_2558A0B10;
  *(_OWORD *)(v1 + 72) = v7;
  *(_OWORD *)(v1 + 88) = v4;
  qword_2558A0BC8 = v1;
  *(_QWORD *)(v1 + 16) = v0;
  *(_BYTE *)(v1 + 216) = byte_2558A0BB0;
  *(_OWORD *)(v1 + 24) = v6;
  return sub_226B56054((uint64_t)v9);
}

double ReplyLayoutValues.bubbleBackgroundWhite.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double ReplyLayoutValues.bubbleTailHorizontalInset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double ReplyLayoutValues.bubbleTailVerticalInset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double ReplyLayoutValues.userMessageHorizontalInset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

double ReplyLayoutValues.pendingUserMessageTrailingInset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

uint64_t ReplyLayoutValues.userMessageNumberOfLines.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

double ReplyLayoutValues.separatorWhite.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 48);
}

double ReplyLayoutValues.separatorHorizontalInset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 56);
}

double ReplyLayoutValues.separatorThickness.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

double ReplyLayoutValues.activityIconWidth.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 72);
}

double ReplyLayoutValues.activityIconHorizontalInset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 80);
}

double ReplyLayoutValues.activityIconMinimumTopPadding.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 88);
}

double ReplyLayoutValues.activityIconMinimumBottomPadding.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 96);
}

double ReplyLayoutValues.activityTextLeftInset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 104);
}

double ReplyLayoutValues.activityTextRightInset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 112);
}

double ReplyLayoutValues.activityTextInfoWhite.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 120);
}

double ReplyLayoutValues.workoutRingThickness.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 128);
}

double ReplyLayoutValues.workoutTypeIconInset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 136);
}

id ReplyLayoutValues.workoutDetailFont.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 144);
}

uint64_t ReplyLayoutValues.shouldRenderWorkoutDetail.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 152);
}

uint64_t ReplyLayoutValues.achievementTitleNumberOfLines.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 160);
}

double ReplyLayoutValues.goalCompletionRingThickness.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 168);
}

double ReplyLayoutValues.goalCompletionRingSpacing.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 176);
}

uint64_t ReplyLayoutValues.goalCompletionTitleNumberOfLines.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 184);
}

uint64_t ReplyLayoutValues.isBubbleInteractive.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 192);
}

void destroy for ReplyLayoutValues(uint64_t a1)
{

}

uint64_t initializeWithCopy for ReplyLayoutValues(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  __int128 v8;
  id v9;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  v6 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v6;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  v7 = *(void **)(a2 + 144);
  *(_QWORD *)(a1 + 144) = v7;
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  v8 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v8;
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  v9 = v7;
  return a1;
}

uint64_t assignWithCopy for ReplyLayoutValues(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  v4 = *(void **)(a2 + 144);
  v5 = *(void **)(a1 + 144);
  *(_QWORD *)(a1 + 144) = v4;
  v6 = v4;

  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  return a1;
}

__n128 __swift_memcpy193_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  v5 = *(_OWORD *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  result = *(__n128 *)(a2 + 144);
  v9 = *(_OWORD *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 144) = result;
  return result;
}

uint64_t assignWithTake for ReplyLayoutValues(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  void *v8;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  v8 = *(void **)(a1 + 144);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);

  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReplyLayoutValues(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 193))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 144);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ReplyLayoutValues(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 184) = 0;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 192) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 193) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 144) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 193) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ReplyLayoutValues()
{
  return &type metadata for ReplyLayoutValues;
}

uint64_t sub_226B5B990()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

id sub_226B5B9BC()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 1);
  result = objc_msgSend(v0, sel_setTimeStyle_, 0);
  qword_2558A0670 = (uint64_t)v0;
  return result;
}

uint64_t sub_226B5BA1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25589FFC0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_226B5F220;
  *(_QWORD *)(v4 + 32) = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  sub_226B5D1E0();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  if (v5 >> 62)
  {
    sub_226B51C4C();
    v6 = sub_226B5D300();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_226B5D348();
    sub_226B51C4C();
    v6 = v5;
  }
  swift_bridgeObjectRelease();
  sub_226B515DC(v6);
  return v4;
}

uint64_t static ActivityRendererFactory.activityRenderer(for:payload:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  v3[6] = type metadata accessor for CompetitionScoreRenderer();
  v3[7] = swift_task_alloc();
  v3[8] = type metadata accessor for CompetitionAcceptedRenderer();
  v3[9] = swift_task_alloc();
  v3[10] = type metadata accessor for GoalCompletionRenderer();
  v3[11] = swift_task_alloc();
  v3[12] = type metadata accessor for AchievementRenderer();
  v3[13] = swift_task_alloc();
  type metadata accessor for Reply();
  v3[14] = swift_task_alloc();
  v3[15] = type metadata accessor for WorkoutRenderer();
  v3[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_226B5BC34()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD *v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = (void *)sub_226B5CFE8();
  v2 = ASRichMessageTypeFromRichMessagePayload();

  switch(v2)
  {
    case -1:
      sub_226B5D228();
      if (qword_25589FD20 != -1)
        goto LABEL_30;
      goto LABEL_25;
    case 0:
      sub_226B5D234();
      if (qword_25589FD20 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
      v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_226B5F1C0;
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00E0);
      *(_QWORD *)(v4 + 56) = v5;
      v6 = sub_226B53B64();
      *(_QWORD *)(v4 + 64) = v6;
      v7 = MEMORY[0x24BEE4AF8];
      *(_QWORD *)(v4 + 32) = MEMORY[0x24BEE4AF8];
      sub_226B5D0D8();
      swift_bridgeObjectRelease();
      v8 = (void *)sub_226B5CFE8();
      v9 = (id)ASSnapshotFromRichMessagePayload();
      *(_QWORD *)(v0 + 176) = v9;

      if (!v9)
        goto LABEL_26;
      sub_226B5D21C();
      *(_QWORD *)(v0 + 184) = sub_226B5D210();
      sub_226B5D204();
      goto LABEL_18;
    case 1:
      sub_226B5D234();
      if (qword_25589FD20 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
      v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_226B5F1C0;
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00E0);
      *(_QWORD *)(v10 + 56) = v5;
      v6 = sub_226B53B64();
      *(_QWORD *)(v10 + 64) = v6;
      v7 = MEMORY[0x24BEE4AF8];
      *(_QWORD *)(v10 + 32) = MEMORY[0x24BEE4AF8];
      sub_226B5D0D8();
      swift_bridgeObjectRelease();
      v11 = (void *)sub_226B5CFE8();
      v12 = (id)ASAchievementFromRichMessagePayload();
      *(_QWORD *)(v0 + 152) = v12;

      if (!v12)
        goto LABEL_26;
      v13 = sub_226B52568(v12);
      *(_QWORD *)(v0 + 160) = v13;
      if (v13)
      {
        sub_226B5D21C();
        *(_QWORD *)(v0 + 168) = sub_226B5D210();
        sub_226B5D204();
        goto LABEL_18;
      }

      goto LABEL_28;
    case 2:
      sub_226B5D234();
      if (qword_25589FD20 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
      v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_226B5F1C0;
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00E0);
      *(_QWORD *)(v14 + 56) = v5;
      v6 = sub_226B53B64();
      *(_QWORD *)(v14 + 64) = v6;
      v7 = MEMORY[0x24BEE4AF8];
      *(_QWORD *)(v14 + 32) = MEMORY[0x24BEE4AF8];
      sub_226B5D0D8();
      swift_bridgeObjectRelease();
      v15 = (void *)sub_226B5CFE8();
      v16 = (id)ASWorkoutFromRichMessagePayload();
      *(_QWORD *)(v0 + 136) = v16;

      if (!v16)
      {
LABEL_26:
        sub_226B5D228();
        v24 = swift_allocObject();
        *(_OWORD *)(v24 + 16) = xmmword_226B5F1C0;
        *(_QWORD *)(v24 + 56) = v5;
        *(_QWORD *)(v24 + 64) = v6;
        *(_QWORD *)(v24 + 32) = v7;
        goto LABEL_27;
      }
      sub_226B5D21C();
      *(_QWORD *)(v0 + 144) = sub_226B5D210();
      sub_226B5D204();
LABEL_18:
      result = swift_task_switch();
      break;
    case 3:
      v17 = (void *)sub_226B5CFE8();
      v18 = (id)ASCompetitionFromRichMessagePayload();
      *(_QWORD *)(v0 + 192) = v18;

      if (!v18)
        goto LABEL_24;
      v19 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 200) = v19;
      v20 = sub_226B5C774;
      goto LABEL_23;
    case 4:
      v21 = (void *)sub_226B5CFE8();
      v22 = (id)ASCompetitionFromRichMessagePayload();
      *(_QWORD *)(v0 + 224) = v22;

      if (v22)
      {
        v19 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 232) = v19;
        v20 = sub_226B5CA00;
LABEL_23:
        *v19 = v0;
        v19[1] = v20;
        result = sub_226B59234(*(_QWORD *)(v0 + 32));
      }
      else
      {
LABEL_24:
        sub_226B5D228();
        if (qword_25589FD20 != -1)
LABEL_30:
          swift_once();
LABEL_25:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2558A0080);
        v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = xmmword_226B5F1C0;
        *(_QWORD *)(v23 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2558A00E0);
        *(_QWORD *)(v23 + 64) = sub_226B53B64();
        *(_QWORD *)(v23 + 32) = MEMORY[0x24BEE4AF8];
LABEL_27:
        sub_226B5D0D8();
        swift_bridgeObjectRelease();
LABEL_28:
        v25 = *(_QWORD *)(v0 + 24);
        *(_QWORD *)(v25 + 32) = 0;
        *(_OWORD *)v25 = 0u;
        *(_OWORD *)(v25 + 16) = 0u;
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        result = (*(uint64_t (**)(void))(v0 + 8))();
      }
      break;
    default:
      type metadata accessor for ASRichMessageType(0);
      *(_QWORD *)(v0 + 16) = v2;
      return sub_226B5D354();
  }
  return result;
}

uint64_t sub_226B5C410()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void *)v0[17];
  v2 = v0[16];
  v3 = v0[14];
  v4 = v0[4];
  swift_release();
  sub_226B4DCE0(v4, v3);
  sub_226B4CADC(v1, v3, v2);
  return swift_task_switch();
}

uint64_t sub_226B5C47C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *boxed_opaque_existential_1;

  v2 = *(_QWORD *)(v0 + 128);
  v1 = *(void **)(v0 + 136);
  v3 = *(uint64_t **)(v0 + 24);
  v3[3] = *(_QWORD *)(v0 + 120);
  v3[4] = (uint64_t)&off_24EE9E2B0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v3);
  sub_226B5CCC8(v2, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for WorkoutRenderer);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_226B5C528()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (void *)v0[20];
  v2 = (void *)v0[19];
  v3 = (_QWORD *)v0[13];
  v4 = v0[14];
  v5 = v0[4];
  swift_release();
  sub_226B4DCE0(v5, v4);
  sub_226B530A0(v2, v1, v4, v3);
  return swift_task_switch();
}

uint64_t sub_226B5C5AC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *boxed_opaque_existential_1;

  v2 = *(void **)(v0 + 152);
  v1 = *(void **)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *(uint64_t **)(v0 + 24);
  v4[3] = *(_QWORD *)(v0 + 96);
  v4[4] = (uint64_t)&off_24EE9E3A8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v4);
  sub_226B5CCC8(v3, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for AchievementRenderer);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_226B5C65C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v1 = (void *)v0[22];
  v2 = v0[14];
  v3 = (_QWORD *)v0[11];
  v4 = v0[4];
  swift_release();
  sub_226B4DCE0(v4, v2);
  sub_226B53DE0(v1, v2, v3);
  return swift_task_switch();
}

uint64_t sub_226B5C6C8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *boxed_opaque_existential_1;

  v1 = *(void **)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(uint64_t **)(v0 + 24);
  v3[3] = *(_QWORD *)(v0 + 80);
  v3[4] = (uint64_t)&off_24EE9E458;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v3);
  sub_226B5CCC8(v2, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for GoalCompletionRenderer);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_226B5C774(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_226B5C7D0()
{
  uint64_t v0;
  uint64_t v2;

  if (*(_QWORD *)(v0 + 208))
  {
    sub_226B5D21C();
    *(_QWORD *)(v0 + 216) = sub_226B5D210();
    sub_226B5D204();
    return swift_task_switch();
  }
  else
  {

    v2 = *(_QWORD *)(v0 + 24);
    *(_QWORD *)(v2 + 32) = 0;
    *(_OWORD *)v2 = 0u;
    *(_OWORD *)(v2 + 16) = 0u;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_226B5C8C4()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v1 = (void *)v0[26];
  v2 = (void *)v0[24];
  v3 = v0[14];
  v4 = (_QWORD *)v0[9];
  v5 = v0[4];
  swift_release();
  sub_226B4DCE0(v5, v3);
  sub_226B4E8EC(v2, v3, v1, v4);
  return swift_task_switch();
}

uint64_t sub_226B5C94C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *boxed_opaque_existential_1;

  v1 = *(void **)(v0 + 208);
  v2 = *(void **)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(uint64_t **)(v0 + 24);
  v4[3] = *(_QWORD *)(v0 + 64);
  v4[4] = (uint64_t)&off_24EE9E360;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v4);
  sub_226B5CCC8(v3, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for CompetitionAcceptedRenderer);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_226B5CA00(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 240) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_226B5CA5C()
{
  uint64_t v0;
  uint64_t v2;

  if (*(_QWORD *)(v0 + 240))
  {
    sub_226B5D21C();
    *(_QWORD *)(v0 + 248) = sub_226B5D210();
    sub_226B5D204();
    return swift_task_switch();
  }
  else
  {

    v2 = *(_QWORD *)(v0 + 24);
    *(_QWORD *)(v2 + 32) = 0;
    *(_OWORD *)v2 = 0u;
    *(_OWORD *)(v2 + 16) = 0u;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_226B5CB50()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v1 = (void *)v0[30];
  v2 = (void *)v0[28];
  v3 = v0[14];
  v4 = (_QWORD *)v0[7];
  v5 = v0[4];
  swift_release();
  sub_226B4DCE0(v5, v3);
  sub_226B59FC8(v2, v3, v1, v4);
  return swift_task_switch();
}

uint64_t sub_226B5CBD8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *boxed_opaque_existential_1;

  v1 = *(void **)(v0 + 240);
  v2 = *(void **)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(uint64_t **)(v0 + 24);
  v4[3] = *(_QWORD *)(v0 + 48);
  v4[4] = (uint64_t)&off_24EE9E688;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v4);
  sub_226B5CCC8(v3, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for CompetitionScoreRenderer);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_226B5CCC8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for ActivityRendererFactory()
{
  return &type metadata for ActivityRendererFactory;
}

void ASBreadcrumbKeyForBulletinType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_226B38000, a1, a3, "Trying to find a breadcrumb key for an undefined notification type", a5, a6, a7, a8, 0);
}

void ASBreadcrumbKeyForBulletinType_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_226B38000, a1, a3, "Trying to find a breadcrumb key for a competition accept request", a5, a6, a7, a8, 0);
}

void ASCompetitionFirstGlanceDescriptionForTypeWithFriends_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_226B38000, a1, a3, "Trying to create a description for a competition first glance type that does not exist.", a5, a6, a7, a8, 0);
}

void ASCompetitionFirstGlanceSectionHeaderForType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_226B38000, a1, a3, "Trying to find a header label for a competition first glance type that doesn't exist", a5, a6, a7, a8, 0);
}

void ASActivitySharingBaseKeysForReplyContextType_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_226B38000, log, OS_LOG_TYPE_ERROR, "Trying to create a reply key for type ASActivitySharingReplyContextTypeUndefined", v1, 2u);
}

uint64_t sub_226B5CFB8()
{
  return MEMORY[0x24BDCBCC0]();
}

uint64_t sub_226B5CFC4()
{
  return MEMORY[0x24BDCBD00]();
}

uint64_t sub_226B5CFD0()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_226B5CFDC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_226B5CFE8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_226B5CFF4()
{
  return MEMORY[0x24BDCE2D0]();
}

uint64_t sub_226B5D000()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_226B5D00C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_226B5D018()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_226B5D024()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_226B5D030()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_226B5D03C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_226B5D048()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_226B5D054()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_226B5D060()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_226B5D06C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_226B5D078()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_226B5D084()
{
  return MEMORY[0x24BDCF490]();
}

uint64_t sub_226B5D090()
{
  return MEMORY[0x24BDCF4B8]();
}

uint64_t sub_226B5D09C()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_226B5D0A8()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_226B5D0B4()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_226B5D0C0()
{
  return MEMORY[0x24BE01FB0]();
}

uint64_t sub_226B5D0CC()
{
  return MEMORY[0x24BE01FB8]();
}

uint64_t sub_226B5D0D8()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_226B5D0E4()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_226B5D0F0()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_226B5D0FC()
{
  return MEMORY[0x24BEE55A8]();
}

uint64_t sub_226B5D108()
{
  return MEMORY[0x24BEE55B0]();
}

uint64_t sub_226B5D114()
{
  return MEMORY[0x24BEE5630]();
}

uint64_t sub_226B5D120()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_226B5D12C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_226B5D138()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_226B5D144()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_226B5D150()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_226B5D15C()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_226B5D168()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_226B5D174()
{
  return MEMORY[0x24BEE0A80]();
}

uint64_t sub_226B5D180()
{
  return MEMORY[0x24BEE0A88]();
}

uint64_t sub_226B5D18C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_226B5D198()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_226B5D1A4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_226B5D1B0()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_226B5D1BC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_226B5D1C8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_226B5D1D4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_226B5D1E0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_226B5D1EC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_226B5D1F8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_226B5D204()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_226B5D210()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_226B5D21C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_226B5D228()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_226B5D234()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_226B5D240()
{
  return MEMORY[0x24BEE5910]();
}

uint64_t sub_226B5D24C()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_226B5D258()
{
  return MEMORY[0x24BDBD820]();
}

uint64_t sub_226B5D264()
{
  return MEMORY[0x24BDBD840]();
}

uint64_t sub_226B5D270()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_226B5D27C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_226B5D288()
{
  return MEMORY[0x24BDD0278]();
}

uint64_t sub_226B5D294()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_226B5D2A0()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_226B5D2AC()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_226B5D2B8()
{
  return MEMORY[0x24BEE2500]();
}

uint64_t sub_226B5D2C4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_226B5D2D0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_226B5D2DC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_226B5D2E8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_226B5D2F4()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_226B5D300()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_226B5D30C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_226B5D318()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_226B5D324()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_226B5D330()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_226B5D33C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_226B5D348()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_226B5D354()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_226B5D360()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_226B5D36C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_226B5D378()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_226B5D384()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t ACHShouldUseNewAwardsSystem()
{
  return MEMORY[0x24BE01590]();
}

uint64_t ACHTemplateIsMonthlyChallenge()
{
  return MEMORY[0x24BE01620]();
}

uint64_t ASAchievementFromRichMessagePayload()
{
  return MEMORY[0x24BE01CE8]();
}

uint64_t ASAchievementThumbnailPathForStyle()
{
  return MEMORY[0x24BE01CF0]();
}

uint64_t ASCompetitionCalculateStartDateComponentsForFriendWithProposedStartDate()
{
  return MEMORY[0x24BE01D00]();
}

uint64_t ASCompetitionCurrentScoreDelta()
{
  return MEMORY[0x24BE01D08]();
}

uint64_t ASCompetitionDayWithHighestScoreForParticipant()
{
  return MEMORY[0x24BE01D10]();
}

uint64_t ASCompetitionDurationDateComponentsForNewCompetitions()
{
  return MEMORY[0x24BE01D18]();
}

uint64_t ASCompetitionFromRichMessagePayload()
{
  return MEMORY[0x24BE01DC8]();
}

uint64_t ASCompetitionMaximumPointsPerDayForNewCompetitions()
{
  return MEMORY[0x24BE01DD0]();
}

uint64_t ASCompetitionParticipantHasCrossedMercyThresholdOnLastDayForCompetition()
{
  return MEMORY[0x24BE01DD8]();
}

uint64_t ASCompetitionRequestHasExpired()
{
  return MEMORY[0x24BE01DE0]();
}

uint64_t ASCompetitionRequestHoursUntilExpiration()
{
  return MEMORY[0x24BE01DE8]();
}

uint64_t ASCompetitionRequestIsStillVisible()
{
  return MEMORY[0x24BE01DF0]();
}

uint64_t ASCompetitionRequestMinutesUntilExpiration()
{
  return MEMORY[0x24BE01DF8]();
}

uint64_t ASCompetitionScoresAreWithinClosenessThreshold()
{
  return MEMORY[0x24BE01E00]();
}

uint64_t ASCompetitionWinningDayWithHighestScoreForParticipant()
{
  return MEMORY[0x24BE01E08]();
}

uint64_t ASContactStorePredicateForDestination()
{
  return MEMORY[0x24BE01E10]();
}

uint64_t ASDidLosePreviousCompetitionWithFriend()
{
  return MEMORY[0x24BE01E28]();
}

uint64_t ASEphemeralCompetitionVictoryAchievementForFriendAchievement()
{
  return MEMORY[0x24BE01E30]();
}

uint64_t ASEphemeralCompetitionVictoryAchievementForStyle()
{
  return MEMORY[0x24BE01E38]();
}

uint64_t ASEphemeralEarnedAchievement()
{
  return MEMORY[0x24BE01E40]();
}

uint64_t ASEphemeralEarnedAchievementForFriendAchievement()
{
  return MEMORY[0x24BE01E48]();
}

uint64_t ASFriendUUIDFromRichMessagePayload()
{
  return MEMORY[0x24BE01E50]();
}

uint64_t ASFriendsWithCompetitionsEndingToday()
{
  return MEMORY[0x24BE01E60]();
}

uint64_t ASFriendsWithCompetitionsStartingToday()
{
  return MEMORY[0x24BE01E68]();
}

uint64_t ASFullNameForContactStoreContact()
{
  return MEMORY[0x24BE01E70]();
}

uint64_t ASIsCompetitionVictoryTemplate()
{
  return MEMORY[0x24BE01E78]();
}

uint64_t ASLoggingInitialize()
{
  return MEMORY[0x24BE01E98]();
}

uint64_t ASMessageFromRichMessagePayload()
{
  return MEMORY[0x24BE01EA0]();
}

uint64_t ASNumberOfNewFriendsAllowedForFriends()
{
  return MEMORY[0x24BE01EA8]();
}

uint64_t ASRecipientAddressFromRichMessagePayload()
{
  return MEMORY[0x24BE01EB0]();
}

uint64_t ASRichMessageTypeFromRichMessagePayload()
{
  return MEMORY[0x24BE01EB8]();
}

uint64_t ASShortNameForContactStoreContact()
{
  return MEMORY[0x24BE01EC8]();
}

uint64_t ASSnapshotFromRichMessagePayload()
{
  return MEMORY[0x24BE01ED0]();
}

uint64_t ASTimestampFromRichMessagePayload()
{
  return MEMORY[0x24BE01ED8]();
}

uint64_t ASWorkoutFromRichMessagePayload()
{
  return MEMORY[0x24BE01EE0]();
}

uint64_t ActivitySharingBundle()
{
  return MEMORY[0x24BE01EE8]();
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDCC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x24BDBDD28](c);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x24BDBDE18](c, *(_QWORD *)&mode);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x24BDBE020](c, *(_QWORD *)&cap);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x24BDBE550](gradient);
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDC0](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathAddRoundedRect(CGMutablePathRef path, const CGAffineTransform *transform, CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight)
{
  MEMORY[0x24BDBEE00](path, transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t FILocalizationTableForExperienceType()
{
  return MEMORY[0x24BE326C8]();
}

uint64_t FILocalizeCount()
{
  return MEMORY[0x24BE326D0]();
}

uint64_t FILocalizedDayName()
{
  return MEMORY[0x24BE32700]();
}

uint64_t FILocalizedNameForActivityType()
{
  return MEMORY[0x24BE32710]();
}

uint64_t FIRandomStringForPrefixWithTableName()
{
  return MEMORY[0x24BE32788]();
}

uint64_t FIStringByReplacingDynamicPlaceholder()
{
  return MEMORY[0x24BE327E8]();
}

uint64_t FIUIIsWheelchairUserForWheelchairUse()
{
  return MEMORY[0x24BE37858]();
}

uint64_t FIUIStaticWorkoutIconImage()
{
  return MEMORY[0x24BE378E0]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x24BDD2B20]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x24BEBE2B8]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x24BEBE2C0](context);
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x24BEBE6E0]();
}

uint64_t WRLocalizedCategoryString()
{
  return MEMORY[0x24BEC1EE0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _HKActivityCacheDateComponentsFromCacheIndex()
{
  return MEMORY[0x24BDD4270]();
}

uint64_t _HKActivityCacheDateComponentsFromDate()
{
  return MEMORY[0x24BDD4278]();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return MEMORY[0x24BDD42A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

