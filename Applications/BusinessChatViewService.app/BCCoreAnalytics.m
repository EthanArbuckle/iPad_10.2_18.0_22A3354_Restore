@implementation BCCoreAnalytics

+ (id)sharedInstance
{
  void *v2;

  v2 = (void *)qword_100016860;
  if (!qword_100016860)
  {
    if (qword_100016868 != -1)
      dispatch_once(&qword_100016868, &stru_1000103E0);
    v2 = (void *)qword_100016860;
  }
  return v2;
}

+ (void)logEventForView:(id)a3 bizItem:(id)a4 bizItemReturnedAfterAction:(BOOL)a5 latency:(int64_t)a6
{
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;
  BOOL v14;

  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100004B54;
    v11[3] = &unk_100010408;
    v12 = v9;
    v13 = a6;
    v14 = a5;
    AnalyticsSendEventLazy(a3, v11);

  }
}

+ (void)logEventForChatSuggestDidNotAppearForBizItem:(id)a3 error:(id)a4 isVisible:(BOOL)a5 latency:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  id (*v12)(uint64_t);
  void ***v13;
  void *v14;
  void **v15;
  void **v16;
  void **v17;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9 && !v10)
  {
    v17 = _NSConcreteStackBlock;
    v12 = sub_100004D64;
    v13 = &v17;
    v14 = v9;
LABEL_6:
    v13[1] = (void **)3221225472;
    v13[2] = (void **)v12;
    v13[3] = (void **)&unk_100010408;
    v15 = v14;
    *((_BYTE *)v13 + 48) = a5;
    v13[4] = v15;
    v13[5] = (void **)a6;
    AnalyticsSendEventLazy(CFSTR("com.apple.BusinessChatViewService.ChatSuggestDidNotAppear"), v13);

    goto LABEL_7;
  }
  if (v10)
  {
    v16 = _NSConcreteStackBlock;
    v12 = sub_100004E9C;
    v13 = &v16;
    v14 = v10;
    goto LABEL_6;
  }
LABEL_7:

}

- (void)setLastActionTaken:(id)a3 withLatency:(int64_t)a4
{
  -[BCCoreAnalytics setLastActionTaken:](self, "setLastActionTaken:", a3);
  -[BCCoreAnalytics setLastActionLatency:](self, "setLastActionLatency:", a4);
}

- (NSString)lastActionTaken
{
  return self->_lastActionTaken;
}

- (void)setLastActionTaken:(id)a3
{
  objc_storeStrong((id *)&self->_lastActionTaken, a3);
}

- (int64_t)lastActionLatency
{
  return self->_lastActionLatency;
}

- (void)setLastActionLatency:(int64_t)a3
{
  self->_lastActionLatency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActionTaken, 0);
}

@end
