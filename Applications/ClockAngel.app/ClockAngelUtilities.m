@implementation ClockAngelUtilities

+ (id)mtOrange
{
  return +[UIColor systemOrangeColor](UIColor, "systemOrangeColor");
}

+ (double)radFromDeg:(double)a3
{
  return a3 * 0.0174532925;
}

+ (void)updateTimerWithID:(id)a3 toState:(unint64_t)a4 withManager:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  unint64_t v16;
  _QWORD v17[4];
  id v18;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timers"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100006D4C;
  v17[3] = &unk_10009DF98;
  v18 = v7;
  v10 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flatMap:", v17));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006E24;
  v14[3] = &unk_10009DFC0;
  v15 = v8;
  v16 = a4;
  v12 = v8;
  v13 = objc_msgSend(v11, "addSuccessBlock:", v14);

}

@end
