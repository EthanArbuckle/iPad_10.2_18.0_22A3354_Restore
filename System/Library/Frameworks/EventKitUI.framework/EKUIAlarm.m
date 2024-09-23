@implementation EKUIAlarm

- (EKUIAlarm)initWithAlarm:(id)a3
{
  id v5;
  EKUIAlarm *v6;
  EKUIAlarm *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKUIAlarm;
  v6 = -[EKUIAlarm init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isLeaveNowAlarm = 0;
    v6->_isDefaultAlarm = objc_msgSend(v5, "isDefaultAlarm");
    objc_storeStrong((id *)&v7->_alarm, a3);
  }

  return v7;
}

- (id)initDefaultAlarm
{
  EKUIAlarm *v2;
  EKUIAlarm *v3;
  EKAlarm *alarm;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKUIAlarm;
  v2 = -[EKUIAlarm init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isLeaveNowAlarm = 256;
    alarm = v2->_alarm;
    v2->_alarm = 0;

  }
  return v3;
}

- (id)initLeaveNowAlarm
{
  EKUIAlarm *v2;
  EKUIAlarm *v3;
  EKAlarm *alarm;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKUIAlarm;
  v2 = -[EKUIAlarm init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isLeaveNowAlarm = 1;
    alarm = v2->_alarm;
    v2->_alarm = 0;

  }
  return v3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0D0C2D0]);
  v8.receiver = self;
  v8.super_class = (Class)EKUIAlarm;
  -[EKUIAlarm description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  objc_msgSend(v5, "setKey:withBoolean:", CFSTR("_isLeaveNowAlarm"), self->_isLeaveNowAlarm);
  objc_msgSend(v5, "setKey:withBoolean:", CFSTR("_isDefaultAlarm"), self->_isDefaultAlarm);
  objc_msgSend(v5, "setKey:withObject:", CFSTR("_alarm"), self->_alarm);
  objc_msgSend(v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedDescriptionAllDay:(BOOL)a3
{
  void *v3;
  void *v4;
  EKAlarm *alarm;

  if (self->_isLeaveNowAlarm)
  {
    EventKitUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Time to Leave"), &stru_1E601DFA8, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    alarm = self->_alarm;
    if (a3)
      -[EKAlarm localizedAllDayDescription](alarm, "localizedAllDayDescription");
    else
      -[EKAlarm localizedDescription](alarm, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)isEqualToUIAlarm:(id)a3
{
  id v4;
  int v5;
  int v6;
  char v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    v5 = -[EKUIAlarm isDefaultAlarm](self, "isDefaultAlarm");
    if (v5 == objc_msgSend(v4, "isDefaultAlarm"))
    {
      v6 = -[EKUIAlarm isLeaveNowAlarm](self, "isLeaveNowAlarm");
      if (v6 == objc_msgSend(v4, "isLeaveNowAlarm"))
      {
        if (-[EKUIAlarm isLeaveNowAlarm](self, "isLeaveNowAlarm") && (objc_msgSend(v4, "isLeaveNowAlarm") & 1) != 0)
        {
          v7 = 1;
          goto LABEL_5;
        }
        -[EKUIAlarm alarm](self, "alarm");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "alarm");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v9)
        {
          v10 = v9;
          v12 = v11;
        }
        else
        {
          if (!v10)
          {
            v7 = 1;
            goto LABEL_14;
          }
          v12 = 0;
        }
        v7 = objc_msgSend(v10, "isTopographicallyEqualToAlarm:", v12);
LABEL_14:

        goto LABEL_5;
      }
    }
  }
  v7 = 0;
LABEL_5:

  return v7;
}

- (BOOL)isLeaveNowAlarm
{
  return self->_isLeaveNowAlarm;
}

- (BOOL)isDefaultAlarm
{
  return self->_isDefaultAlarm;
}

- (EKAlarm)alarm
{
  return self->_alarm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarm, 0);
}

@end
