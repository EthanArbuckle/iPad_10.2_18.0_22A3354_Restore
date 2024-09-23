@implementation AUCrashHandlerDelegate

- (id)init:(id)a3
{
  id v4;
  AUCrashHandlerDelegate *v5;
  AUCrashHandlerDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AUCrashHandlerDelegate;
  v5 = -[AUCrashHandlerDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->weakCrashHandler, v4);

  return v6;
}

- (void)notifyCrash:(id *)a3 withCrashInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  __int128 v9;
  _OWORD v10[2];
  id to;

  v6 = a4;
  objc_copyWeak(&to, (id *)&self->weakCrashHandler);
  v7 = objc_loadWeakRetained(&to);

  if (v7)
  {
    v8 = objc_loadWeakRetained(&to);
    v9 = *(_OWORD *)&a3->var0[4];
    v10[0] = *(_OWORD *)a3->var0;
    v10[1] = v9;
    objc_msgSend(v8, "notifyCrash:withCrashInfo:", v10, v6);

  }
  objc_destroyWeak(&to);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->weakCrashHandler);
}

@end
