@implementation EKEvent(IpsosExtendedStorage)

- (uint64_t)ipsos_isTimeApproximate
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("ipsos_isTimeApproximateKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIpsos_isTimeApproximate:()IpsosExtendedStorage
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("ipsos_isTimeApproximateKey"), v2, (void *)0x301);

}

- (uint64_t)ipsos_isEndTimeApproximate
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("ipsos_isEndTimeApproximateKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIpsos_isEndTimeApproximate:()IpsosExtendedStorage
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("ipsos_isEndTimeApproximateKey"), v2, (void *)0x301);

}

- (uint64_t)ipsos_usesDefaultClassificationTypeStartTime
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("ipsos_usesDefaultClassificationTypeStartTimeKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIpsos_usesDefaultClassificationTypeStartTime:()IpsosExtendedStorage
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("ipsos_usesDefaultClassificationTypeStartTimeKey"), v2, (void *)0x301);

}

- (uint64_t)ipsos_timeNeedsMeridianGuess
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("ipsos_timeNeedsMeridianGuessKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIpsos_timeNeedsMeridianGuess:()IpsosExtendedStorage
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("ipsos_timeNeedsMeridianGuessKey"), v2, (void *)0x301);

}

- (uint64_t)ipsos_isDateTimeTenseDependent
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("ipsos_isDateTimeTenseDependentKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIpsos_isDateTimeTenseDependent:()IpsosExtendedStorage
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("ipsos_isDateTimeTenseDependentKey"), v2, (void *)0x301);

}

- (uint64_t)ipsos_isEventTimeOnlyAndReferrengingToSentDate
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("ipsos_isEventTimeOnlyAndReferrengingToSentDateKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIpsos_isEventTimeOnlyAndReferrengingToSentDate:()IpsosExtendedStorage
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("ipsos_isEventTimeOnlyAndReferrengingToSentDateKey"), v2, (void *)0x301);

}

- (uint64_t)ipsos_isTimeOffset
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("ipsos_isTimeOffsetKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIpsos_isTimeOffset:()IpsosExtendedStorage
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("ipsos_isTimeOffsetKey"), v2, (void *)0x301);

}

- (id)ipsos_eventClassificationType
{
  return objc_getAssociatedObject(a1, CFSTR("ipsos_eventClassificationTypeKey"));
}

- (void)setIpsos_eventClassificationType:()IpsosExtendedStorage
{
  objc_setAssociatedObject(a1, CFSTR("ipsos_eventClassificationTypeKey"), a3, (void *)0x301);
}

- (id)ipsos_dataFeatures
{
  return objc_getAssociatedObject(a1, CFSTR("ipsos_dataFeaturesKey"));
}

- (void)setIpsos_dataFeatures:()IpsosExtendedStorage
{
  objc_setAssociatedObject(a1, CFSTR("ipsos_dataFeaturesKey"), a3, (void *)0x301);
}

- (id)ipsos_messageUnit
{
  return objc_getAssociatedObject(a1, CFSTR("ipsos_messageUnitKey"));
}

- (void)setIpsos_messageUnit:()IpsosExtendedStorage
{
  objc_setAssociatedObject(a1, CFSTR("ipsos_messageUnitKey"), a3, (void *)0x301);
}

- (uint64_t)ipsos_allDayPreferred
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("ipsos_allDayPreferredKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIpsos_allDayPreferred:()IpsosExtendedStorage
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("ipsos_allDayPreferredKey"), v2, (void *)0x301);

}

- (uint64_t)ipsos_disableTimeAdjustment
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("ipsos_disableTimeAdjustmentKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIpsos_disableTimeAdjustment:()IpsosExtendedStorage
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("ipsos_disableTimeAdjustmentKey"), v2, (void *)0x301);

}

- (uint64_t)ipsos_usedBubblesCount
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("ipsos_usedBubblesCountKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (void)setIpsos_usedBubblesCount:()IpsosExtendedStorage
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("ipsos_usedBubblesCountKey"), v2, (void *)0x301);

}

- (double)ipsos_duration
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4;

  return v5;
}

- (double)ipsos_confidence
{
  void *v1;
  double v2;
  double v3;

  objc_getAssociatedObject(a1, CFSTR("ipsos_confidenceKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (void)setIpsos_confidence:()IpsosExtendedStorage
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("ipsos_confidenceKey"), v2, (void *)0x301);

}

- (double)ipsos_experimentalConfidence
{
  void *v1;
  double v2;
  double v3;

  objc_getAssociatedObject(a1, CFSTR("ipsos_experimentalConfidenceKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (void)setIpsos_experimentalConfidence:()IpsosExtendedStorage
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("ipsos_experimentalConfidenceKey"), v2, (void *)0x301);

}

- (uint64_t)ipsos_eventStatus
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("ipsos_eventStatus"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (void)setIpsos_eventStatus:()IpsosExtendedStorage
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("ipsos_eventStatus"), v2, (void *)0x301);

}

- (uint64_t)ipsos_eventAttributes
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("ipsos_eventAttributesKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (void)setIpsos_eventAttributes:()IpsosExtendedStorage
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("ipsos_eventAttributesKey"), v2, (void *)0x301);

}

- (id)ipsos_betterDescription
{
  uint64_t v2;
  __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;

  v2 = objc_msgSend(a1, "ipsos_eventStatus");
  v3 = CFSTR("None");
  v4 = CFSTR("Confirmed");
  if (v2 != 2)
    v4 = CFSTR("None");
  if (v2 == 1)
    v5 = CFSTR("Proposed");
  else
    v5 = v4;
  v23 = v5;
  v24 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "description");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "isAllDay");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  v22 = v10;
  objc_msgSend(a1, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ipsos_eventClassificationType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(a1, "ipsos_eventClassificationType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v13 = CFSTR("_");
  if (objc_msgSend(a1, "ipsos_isTimeApproximate"))
    v14 = CFSTR("A");
  else
    v14 = CFSTR("_");
  if (objc_msgSend(a1, "ipsos_isDateTimeTenseDependent"))
    v15 = CFSTR("T");
  else
    v15 = CFSTR("_");
  if (objc_msgSend(a1, "ipsos_isEventTimeOnlyAndReferrengingToSentDate"))
    v13 = CFSTR("S");
  objc_msgSend(a1, "ipsos_confidence");
  v20 = v14;
  v16 = (void *)v6;
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ startDate:%@ endDate:%@ allDay:%@ TZ:%@ type:%@ [%@%@%@] status:%@ confidence:%.02f"), v6, v7, v8, v22, v11, v3, v20, v15, v13, v23, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

  }
  return v18;
}

@end
