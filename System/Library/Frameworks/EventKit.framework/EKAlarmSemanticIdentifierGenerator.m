@implementation EKAlarmSemanticIdentifierGenerator

+ (id)semanticIdentifierForAlarm:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(v3, "isDefaultAlarm") & 1) != 0)
  {
    v4 = CFSTR("kDefaultAlarmSemanticIdentifier");
  }
  else
  {
    objc_msgSend(v3, "absoluteDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "relativeOffset");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKAlarmSemanticIdentifierGenerator semanticIdentifierForAlarmIsDefault:absoluteDate:relativeOffset:emailAddress:url:](EKAlarmSemanticIdentifierGenerator, "semanticIdentifierForAlarmIsDefault:absoluteDate:relativeOffset:emailAddress:url:", 0, v5, v7, 0, 0);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)semanticIdentifierForAlarmIsDefault:(BOOL)a3 absoluteDate:(id)a4 relativeOffset:(id)a5 emailAddress:(id)a6 url:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (a3)
  {
    v15 = CFSTR("kDefaultAlarmSemanticIdentifier");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v11, "timeIntervalSinceReferenceDate");
      objc_msgSend(v16, "appendFormat:", CFSTR("ABSOLUTE=%f;"), v17);
    }
    else
    {
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v16, "appendFormat:", CFSTR("RELATIVE=%f;"), v18);
    }
    if (v13)
      objc_msgSend(v16, "appendFormat:", CFSTR("EMAIL=%@;"), v13);
    objc_msgSend(v14, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v14, "absoluteString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appendFormat:", CFSTR("URL=%@;"), v20);

    }
    v15 = (__CFString *)objc_msgSend(v16, "copy");

  }
  return v15;
}

+ (id)_stringForAlarmProximity:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("None");
  else
    return off_1E4785F38[a3 - 1];
}

@end
