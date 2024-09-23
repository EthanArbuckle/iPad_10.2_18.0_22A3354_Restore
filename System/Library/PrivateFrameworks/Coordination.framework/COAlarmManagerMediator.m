@implementation COAlarmManagerMediator

- (COAlarmManagerMediator)initWithAlarmManager:(id)a3
{
  id v4;
  COAlarmManagerMediator *v5;
  COAlarmManagerMediator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COAlarmManagerMediator;
  v5 = -[COAlarmManagerMediator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_manager, v4);

  return v6;
}

- (void)postNotificationName:(id)a3 withUserInfo:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[COAlarmManagerMediator manager](self, "manager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:withUserInfo:callback:", v10, v9, v8);

}

- (COAlarmManager)manager
{
  return (COAlarmManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
}

@end
