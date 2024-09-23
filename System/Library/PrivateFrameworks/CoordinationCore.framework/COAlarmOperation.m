@implementation COAlarmOperation

- (id)initForAdding:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  COAlarmOperation *v8;
  COAlarmOperation *v9;
  uint64_t v10;
  MTAlarm *alarm;
  uint64_t v12;
  id completion;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)COAlarmOperation;
  v8 = -[COAlarmOperation init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = 0;
    v10 = objc_msgSend(v6, "copy");
    alarm = v9->_alarm;
    v9->_alarm = (MTAlarm *)v10;

    v12 = objc_msgSend(v7, "copy");
    completion = v9->_completion;
    v9->_completion = (id)v12;

  }
  return v9;
}

- (id)initForUpdating:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  COAlarmOperation *v8;
  COAlarmOperation *v9;
  uint64_t v10;
  MTAlarm *alarm;
  uint64_t v12;
  id completion;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)COAlarmOperation;
  v8 = -[COAlarmOperation init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = 1;
    v10 = objc_msgSend(v6, "copy");
    alarm = v9->_alarm;
    v9->_alarm = (MTAlarm *)v10;

    v12 = objc_msgSend(v7, "copy");
    completion = v9->_completion;
    v9->_completion = (id)v12;

  }
  return v9;
}

- (id)initForRemoving:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  COAlarmOperation *v8;
  COAlarmOperation *v9;
  uint64_t v10;
  MTAlarm *alarm;
  uint64_t v12;
  id completion;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)COAlarmOperation;
  v8 = -[COAlarmOperation init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = 2;
    v10 = objc_msgSend(v6, "copy");
    alarm = v9->_alarm;
    v9->_alarm = (MTAlarm *)v10;

    v12 = objc_msgSend(v7, "copy");
    completion = v9->_completion;
    v9->_completion = (id)v12;

  }
  return v9;
}

- (BOOL)performOperationWithMappedAlarms:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);

  v4 = a3;
  -[COAlarmOperation alarm](self, "alarm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alarmID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[COAlarmOperation type](self, "type");
  if (!v7)
    goto LABEL_5;
  v8 = v7;
  objc_msgSend(v4, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v8 == 2)
    {
      objc_msgSend(v5, "alarmID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObjectForKey:", v10);
LABEL_6:

      v13 = 1;
      goto LABEL_10;
    }
LABEL_5:
    v10 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLastModifiedDate:", v11);

    objc_msgSend(v10, "alarmID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, v12);

    goto LABEL_6;
  }
  COCoreLogForCategory(2);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[COAlarmOperation performOperationWithMappedAlarms:].cold.1(v5, v8, v14);

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[COAlarmOperation completion](self, "completion");
  v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v16)[2](v16, v15);

  v13 = 0;
LABEL_10:

  return v13;
}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (id)completion
{
  return self->_completion;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_alarm, 0);
}

- (void)performOperationWithMappedAlarms:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "alarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = a2;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_215E92000, a3, OS_LOG_TYPE_ERROR, "Operation (%ld) didn't find alarm %@!", (uint8_t *)&v6, 0x16u);

}

@end
