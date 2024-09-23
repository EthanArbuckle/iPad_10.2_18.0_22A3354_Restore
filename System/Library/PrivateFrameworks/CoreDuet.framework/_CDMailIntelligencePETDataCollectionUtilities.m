@implementation _CDMailIntelligencePETDataCollectionUtilities

+ (id)prepareContactEventFromEventDic:(id)a3
{
  id v3;
  MailIntelligencePETContactEvent *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MailIntelligencePETContactEvent);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("contactRelation"), (_QWORD)v13))
        {
          objc_msgSend(v5, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[MailIntelligencePETContactEvent setContactRelation:](v4, "setContactRelation:", v11);
        }
        else
        {
          objc_msgSend(v5, "valueForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgTotal")))
          {
            -[MailIntelligencePETContactEvent setFirstPartyMsgTotal:](v4, "setFirstPartyMsgTotal:", (int)objc_msgSend(v11, "intValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgOutgoingRatio")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgOutgoingRatio:](v4, "setFirstPartyMsgOutgoingRatio:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgMorningWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgMorningWeekday:](v4, "setFirstPartyMsgMorningWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgMorningFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgMorningFri:](v4, "setFirstPartyMsgMorningFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgMorningSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgMorningSat:](v4, "setFirstPartyMsgMorningSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgMorningSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgMorningSun:](v4, "setFirstPartyMsgMorningSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgNoonWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgNoonWeekday:](v4, "setFirstPartyMsgNoonWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgNoonFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgNoonFri:](v4, "setFirstPartyMsgNoonFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgNoonSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgNoonSat:](v4, "setFirstPartyMsgNoonSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgNoonSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgNoonSun:](v4, "setFirstPartyMsgNoonSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgEveWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgEveWeekday:](v4, "setFirstPartyMsgEveWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgEveFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgEveFri:](v4, "setFirstPartyMsgEveFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgEveSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgEveSat:](v4, "setFirstPartyMsgEveSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgEveSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgEveSun:](v4, "setFirstPartyMsgEveSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgNightWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgNightWeekday:](v4, "setFirstPartyMsgNightWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgNightFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgNightFri:](v4, "setFirstPartyMsgNightFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgNightSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgNightSat:](v4, "setFirstPartyMsgNightSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("firstPartyMsgNightSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setFirstPartyMsgNightSun:](v4, "setFirstPartyMsgNightSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgTotal")))
          {
            -[MailIntelligencePETContactEvent setThirdPartyMsgTotal:](v4, "setThirdPartyMsgTotal:", (int)objc_msgSend(v11, "intValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgMorningWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgMorningWeekday:](v4, "setThirdPartyMsgMorningWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgMorningFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgMorningFri:](v4, "setThirdPartyMsgMorningFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgMorningSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgMorningSat:](v4, "setThirdPartyMsgMorningSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgMorningSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgMorningSun:](v4, "setThirdPartyMsgMorningSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgNoonWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgNoonWeekday:](v4, "setThirdPartyMsgNoonWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgNoonFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgNoonFri:](v4, "setThirdPartyMsgNoonFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgNoonSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgNoonSat:](v4, "setThirdPartyMsgNoonSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgNoonSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgNoonSun:](v4, "setThirdPartyMsgNoonSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgEveWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgEveWeekday:](v4, "setThirdPartyMsgEveWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgEveFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgEveFri:](v4, "setThirdPartyMsgEveFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgEveSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgEveSat:](v4, "setThirdPartyMsgEveSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgEveSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgEveSun:](v4, "setThirdPartyMsgEveSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgNightWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgNightWeekday:](v4, "setThirdPartyMsgNightWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgNightFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgNightFri:](v4, "setThirdPartyMsgNightFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgNightSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgNightSat:](v4, "setThirdPartyMsgNightSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("thirdPartyMsgNightSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setThirdPartyMsgNightSun:](v4, "setThirdPartyMsgNightSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callTotal")))
          {
            -[MailIntelligencePETContactEvent setCallTotal:](v4, "setCallTotal:", (int)objc_msgSend(v11, "intValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callBirthday")))
          {
            -[MailIntelligencePETContactEvent setCallBirthday:](v4, "setCallBirthday:", objc_msgSend(v11, "unsignedIntValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("contactFavorite")))
          {
            -[MailIntelligencePETContactEvent setContactFavorite:](v4, "setContactFavorite:", objc_msgSend(v11, "unsignedIntValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callTotalDur")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallTotalDur:](v4, "setCallTotalDur:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongRatio")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongRatio:](v4, "setCallLongRatio:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callOutgoingRatio")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallOutgoingRatio:](v4, "setCallOutgoingRatio:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callAvgDur")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallAvgDur:](v4, "setCallAvgDur:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callMaxDur")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallMaxDur:](v4, "setCallMaxDur:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callMorningWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallMorningWeekday:](v4, "setCallMorningWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callMorningFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallMorningFri:](v4, "setCallMorningFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callMorningSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallMorningSat:](v4, "setCallMorningSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callMorningSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallMorningSun:](v4, "setCallMorningSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callNoonWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallNoonWeekday:](v4, "setCallNoonWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callNoonFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallNoonFri:](v4, "setCallNoonFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callNoonSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallNoonSat:](v4, "setCallNoonSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callNoonSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallNoonSun:](v4, "setCallNoonSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callEveWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallEveWeekday:](v4, "setCallEveWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callEveFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallEveFri:](v4, "setCallEveFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callEveSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallEveSat:](v4, "setCallEveSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callEveSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallEveSun:](v4, "setCallEveSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callNightWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallNightWeekday:](v4, "setCallNightWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callNightFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallNightFri:](v4, "setCallNightFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callNightSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallNightSat:](v4, "setCallNightSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callNightSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallNightSun:](v4, "setCallNightSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurMorningWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurMorningWeekday:](v4, "setCallDurMorningWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurMorningFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurMorningFri:](v4, "setCallDurMorningFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurMorningSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurMorningSat:](v4, "setCallDurMorningSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurMorningSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurMorningSun:](v4, "setCallDurMorningSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurNoonWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurNoonWeekday:](v4, "setCallDurNoonWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurNoonFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurNoonFri:](v4, "setCallDurNoonFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurNoonSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurNoonSat:](v4, "setCallDurNoonSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurNoonSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurNoonSun:](v4, "setCallDurNoonSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurEveWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurEveWeekday:](v4, "setCallDurEveWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurEveFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurEveFri:](v4, "setCallDurEveFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurEveSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurEveSat:](v4, "setCallDurEveSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurEveSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurEveSun:](v4, "setCallDurEveSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurNightWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurNightWeekday:](v4, "setCallDurNightWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurNightFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurNightFri:](v4, "setCallDurNightFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurNightSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurNightSat:](v4, "setCallDurNightSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callDurNightSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallDurNightSun:](v4, "setCallDurNightSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongMorningWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongMorningWeekday:](v4, "setCallLongMorningWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongMorningFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongMorningFri:](v4, "setCallLongMorningFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongMorningSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongMorningSat:](v4, "setCallLongMorningSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongMorningSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongMorningSun:](v4, "setCallLongMorningSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongNoonWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongNoonWeekday:](v4, "setCallLongNoonWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongNoonFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongNoonFri:](v4, "setCallLongNoonFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongNoonSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongNoonSat:](v4, "setCallLongNoonSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongNoonSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongNoonSun:](v4, "setCallLongNoonSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongEveWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongEveWeekday:](v4, "setCallLongEveWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongEveFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongEveFri:](v4, "setCallLongEveFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongEveSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongEveSat:](v4, "setCallLongEveSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongEveSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongEveSun:](v4, "setCallLongEveSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongNightWeekday")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongNightWeekday:](v4, "setCallLongNightWeekday:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongNightFri")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongNightFri:](v4, "setCallLongNightFri:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongNightSat")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongNightSat:](v4, "setCallLongNightSat:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("callLongNightSun")))
          {
            objc_msgSend(v11, "doubleValue");
            -[MailIntelligencePETContactEvent setCallLongNightSun:](v4, "setCallLongNightSun:");
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("contactFamilyRelation")))
          {
            -[MailIntelligencePETContactEvent setContactFamilyRelation:](v4, "setContactFamilyRelation:", objc_msgSend(v11, "unsignedIntValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("contactFamilyName")))
          {
            -[MailIntelligencePETContactEvent setContactFamilyName:](v4, "setContactFamilyName:", objc_msgSend(v11, "unsignedIntValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("contactParent")))
          {
            -[MailIntelligencePETContactEvent setContactParent:](v4, "setContactParent:", objc_msgSend(v11, "unsignedIntValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("contactEmergency")))
          {
            -[MailIntelligencePETContactEvent setContactEmergency:](v4, "setContactEmergency:", objc_msgSend(v11, "unsignedIntValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("contactEmergencyFamily")))
          {
            -[MailIntelligencePETContactEvent setContactEmergencyFamily:](v4, "setContactEmergencyFamily:", objc_msgSend(v11, "unsignedIntValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("contactInHome")))
          {
            -[MailIntelligencePETContactEvent setContactInHome:](v4, "setContactInHome:", objc_msgSend(v11, "unsignedIntValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("contactInPhotos")))
          {
            -[MailIntelligencePETContactEvent setContactInPhotos:](v4, "setContactInPhotos:", objc_msgSend(v11, "unsignedIntValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("contactInAirDrop")))
          {
            -[MailIntelligencePETContactEvent setContactInAirDrop:](v4, "setContactInAirDrop:", objc_msgSend(v11, "unsignedIntValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("contactInAirDropAtHome")))
          {
            -[MailIntelligencePETContactEvent setContactInAirDropAtHome:](v4, "setContactInAirDropAtHome:", objc_msgSend(v11, "unsignedIntValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("contactInFMFFollowingMe")))
          {
            -[MailIntelligencePETContactEvent setContactInFMFFollowingMe:](v4, "setContactInFMFFollowingMe:", objc_msgSend(v11, "unsignedIntValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("contactInFMFSharingWithMe")))
          {
            -[MailIntelligencePETContactEvent setContactInFMFSharingWithMe:](v4, "setContactInFMFSharingWithMe:", objc_msgSend(v11, "unsignedIntValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("contactInFMFFavorite")))
          {
            -[MailIntelligencePETContactEvent setContactInFMFFavorite:](v4, "setContactInFMFFavorite:", objc_msgSend(v11, "unsignedIntValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("mailIntelligenceContactId")))
          {
            -[MailIntelligencePETContactEvent setMailIntelligenceContactId:](v4, "setMailIntelligenceContactId:", objc_msgSend(v11, "unsignedLongLongValue"));
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

@end
