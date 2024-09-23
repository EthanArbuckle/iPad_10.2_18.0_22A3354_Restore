@implementation LUILockButtonController

+ (id)sharedInstance
{
  if (qword_100088DD8 != -1)
    dispatch_once(&qword_100088DD8, &stru_100069AC0);
  return (id)qword_100088DD0;
}

- (void)startConsumingLockButtonDoublePressEventWithAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LoginUI start consuming lock button press event", v8, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SBSHardwareButtonService sharedInstance](SBSHardwareButtonService, "sharedInstance"));
  v7 = objc_msgSend(v6, "beginConsumingPressesForButtonKind:eventConsumer:priority:", 2, self, 100);

  -[LUILockButtonController setActionBlock:](self, "setActionBlock:", v4);
}

- (void)consumeDoublePressUpForButtonKind:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  void *v7;
  void (**v8)(void);
  uint8_t v9[16];
  uint64_t v10;
  uint64_t v11;

  if (a3 == 2)
  {
    v10 = v3;
    v11 = v4;
    v6 = qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Lock button double tapped", v9, 2u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUILockButtonController actionBlock](self, "actionBlock"));

    if (v7)
    {
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[LUILockButtonController actionBlock](self, "actionBlock"));
      v8[2]();

    }
  }
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
}

@end
