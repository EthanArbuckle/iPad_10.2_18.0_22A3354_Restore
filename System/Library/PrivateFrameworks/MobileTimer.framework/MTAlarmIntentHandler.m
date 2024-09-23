@implementation MTAlarmIntentHandler

- (MTAlarmIntentHandler)initWithAlarmManager:(id)a3
{
  id v5;
  MTAlarmIntentHandler *v6;
  MTAlarmIntentHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTAlarmIntentHandler;
  v6 = -[MTAlarmIntentHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_alarmManager, a3);

  return v7;
}

+ (id)createUserInfoWithIntentName:(id)a3 alarmIDString:(id)a4 time:(id)a5 label:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("identifier"));
    if (v10)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("alarmID"));
    if (v11)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("time"));
    if (v12)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("label"));
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmManager, 0);
}

@end
