@implementation CalDatabaseSendAnalyticsEventForChange

void ___CalDatabaseSendAnalyticsEventForChange_block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", a1[4], CFSTR("client"));
  v3 = a1[5];
  if (v3)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, CFSTR("process"));
  }
  else
  {
    CalDatabaseGetProcessName();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("process"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("notificationType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[7]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("reason"));

}

@end
