@implementation LUIHomeButtonController

+ (LUIHomeButtonController)sharedController
{
  if (qword_100088E38 != -1)
    dispatch_once(&qword_100088E38, &stru_100069C18);
  return (LUIHomeButtonController *)(id)qword_100088E30;
}

- (LUIHomeButtonController)init
{
  LUIHomeButtonController *v2;
  LUIHomeButtonController *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LUIHomeButtonController;
  v2 = -[LUIHomeButtonController init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[LUIHomeButtonController setSingleTapActivated:](v2, "setSingleTapActivated:", 0);
    -[LUIHomeButtonController setDoubleTapActivated:](v3, "setDoubleTapActivated:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SBSHardwareButtonService sharedInstance](SBSHardwareButtonService, "sharedInstance"));
    v5 = objc_msgSend(v4, "beginConsumingPressesForButtonKind:eventConsumer:priority:", 1, v3, 100);

  }
  return v3;
}

- (void)consumeSinglePressUpForButtonKind:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];
  uint64_t v8;
  uint64_t v9;

  if (a3 == 1)
  {
    v8 = v3;
    v9 = v4;
    if (-[LUIHomeButtonController singleTapActivated](self, "singleTapActivated"))
    {
      v5 = qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Home button single tap notification", v7, 2u);
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v6, "postNotificationName:object:", CFSTR("LUIHomeButtonSingleTapNofication"), 0);

    }
  }
}

- (void)consumeDoublePressDownForButtonKind:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];
  uint64_t v8;
  uint64_t v9;

  if (a3 == 1)
  {
    v8 = v3;
    v9 = v4;
    if (-[LUIHomeButtonController doubleTapActivated](self, "doubleTapActivated"))
    {
      v5 = qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Home button double tap notification", v7, 2u);
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v6, "postNotificationName:object:", CFSTR("LUIHomeButtonDoubleTapNofication"), 0);

    }
  }
}

- (void)consumeLongPressForButtonKind:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];
  uint64_t v8;
  uint64_t v9;

  if (a3 == 1)
  {
    v8 = v3;
    v9 = v4;
    if (-[LUIHomeButtonController longPressActivated](self, "longPressActivated"))
    {
      v5 = qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Home button long press notification", v7, 2u);
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v6, "postNotificationName:object:", CFSTR("LUIHomeButtonLongPressNofication"), 0);

    }
  }
}

- (void)activateTapType:(unint64_t)a3
{
  -[LUIHomeButtonController _tapType:observed:](self, "_tapType:observed:", a3, 1);
}

- (void)deactivateTapType:(unint64_t)a3
{
  -[LUIHomeButtonController _tapType:observed:](self, "_tapType:observed:", a3, 0);
}

- (void)_tapType:(unint64_t)a3 observed:(BOOL)a4
{
  switch(a3)
  {
    case 2uLL:
      -[LUIHomeButtonController setLongPressActivated:](self, "setLongPressActivated:", a4);
      break;
    case 1uLL:
      -[LUIHomeButtonController setDoubleTapActivated:](self, "setDoubleTapActivated:", a4);
      break;
    case 0uLL:
      -[LUIHomeButtonController setSingleTapActivated:](self, "setSingleTapActivated:", a4);
      break;
  }
}

- (BOOL)singleTapActivated
{
  return self->_singleTapActivated;
}

- (void)setSingleTapActivated:(BOOL)a3
{
  self->_singleTapActivated = a3;
}

- (BOOL)doubleTapActivated
{
  return self->_doubleTapActivated;
}

- (void)setDoubleTapActivated:(BOOL)a3
{
  self->_doubleTapActivated = a3;
}

- (BOOL)longPressActivated
{
  return self->_longPressActivated;
}

- (void)setLongPressActivated:(BOOL)a3
{
  self->_longPressActivated = a3;
}

@end
