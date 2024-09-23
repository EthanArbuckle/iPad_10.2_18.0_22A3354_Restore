@implementation CameradReloaderController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "-[CameradReloaderController setupWithInputs:responder:]";
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v12, 0x20u);
  }

  -[CameradReloaderController setInputs:](self, "setInputs:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CameradReloaderController inputs](self, "inputs"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CameradReloaderController result](self, "result"));
    objc_msgSend(v11, "setStatusCode:", &off_100004170);

    -[CameradReloaderController setFinished:](self, "setFinished:", 1);
  }

}

- (void)start
{
  uint64_t v3;
  char v4;
  void *v5;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  _UNKNOWN **v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v3 = objc_claimAutoreleasedReturnValue(-[CameradReloaderController result](self, "result"));
  objc_msgSend((id)v3, "setStatusCode:", &off_100004188);

  LOBYTE(v3) = MGGetBoolAnswer(CFSTR("InternalBuild"));
  v4 = MGGetBoolAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw"));
  if ((v3 & 1) != 0 || (v4 & 1) != 0)
  {
    v17 = 0;
    v7 = +[CRUtils powerCycleSensor:](CRUtils, "powerCycleSensor:", &v17);
    v6 = v17;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CameradReloaderController result](self, "result"));
    v9 = v8;
    if (!v7 || v6)
      v10 = &off_1000041B8;
    else
      v10 = &off_1000041D0;
    objc_msgSend(v8, "setStatusCode:", v10);

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameradReloaderController result](self, "result"));
    objc_msgSend(v5, "setStatusCode:", &off_1000041A0);

    v6 = 0;
  }
  v18[0] = CFSTR("error");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
  v12 = v11;
  if (!v11)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v18[1] = CFSTR("errorCode");
  v19[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "code")));
  v14 = v13;
  if (!v13)
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CameradReloaderController result](self, "result"));
  objc_msgSend(v16, "setData:", v15);

  if (!v13)
  if (!v11)

  -[CameradReloaderController setFinished:](self, "setFinished:", 1);
}

- (CameradReloaderInputs)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputs, 0);
}

@end
