@implementation TUCallCenter

- (BOOL)shouldActivateProviderInBackgroundForCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
  if (objc_msgSend(v5, "isSuperboxProvider"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
    if (objc_msgSend(v6, "isSystemProvider"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallCenter audioOrVideoCallWithStatus:](self, "audioOrVideoCallWithStatus:", 4));
      v8 = v7 == 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)bottomBarCallState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  int64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  Block_layout *v25;
  _QWORD v26[4];
  Block_layout *v27;
  _QWORD v28[4];
  Block_layout *v29;
  _QWORD v30[4];
  Block_layout *v31;

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10009AC44;
  v30[3] = &unk_100286F18;
  v31 = &stru_100286EF0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallCenter callPassingTest:](self, "callPassingTest:", v30));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10009AC9C;
  v28[3] = &unk_100286F18;
  v29 = &stru_100286EF0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallCenter callPassingTest:](self, "callPassingTest:", v28));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10009ACF4;
  v26[3] = &unk_100286F18;
  v27 = &stru_100286EF0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallCenter callPassingTest:](self, "callPassingTest:", v26));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10009AD4C;
  v24[3] = &unk_100286F18;
  v25 = &stru_100286EF0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallCenter callPassingTest:](self, "callPassingTest:", v24));
  v7 = objc_claimAutoreleasedReturnValue(-[TUCallCenter incomingCall](self, "incomingCall"));
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  if (v5)
    v11 = v5;
  else
    v11 = v4;
  if (v3)
    v11 = v3;
  v12 = v11;

  if (v10 && v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "provider"));
    v14 = objc_msgSend(v13, "isSystemProvider");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v12, "provider"));
    v16 = objc_msgSend(v15, "isSystemProvider");

    if (v14)
    {
      if (v16)
        v17 = 2;
      else
        v17 = 4;
    }
    else if (v16)
    {
      v17 = 3;
    }
    else
    {
      v17 = 1;
    }
  }
  else
  {
    if (v12 | v10)
    {
      if (v12)
        v18 = (void *)v12;
      else
        v18 = (void *)v10;
      v19 = v18;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "delegate"));
      v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "mostRecentlyDisconnectedAudioCall"));

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "provider"));
    if (objc_msgSend(v22, "isSystemProvider"))
      v17 = 2;
    else
      v17 = 1;

  }
  return v17;
}

- (BOOL)ics_hasTooManyCallsForCallWaitingBanner
{
  TUCallCenter *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100156F60();

  return v3 & 1;
}

- (TUCall)emergencyCall
{
  TUCallCenter *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1001A77E0();

  return (TUCall *)v3;
}

@end
