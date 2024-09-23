@implementation UserAuthenticator

+ (void)authenticateWithUsername:(id)a3 authenticationType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int64_t v29;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
  if (!v10)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "OSLogObject"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v25 = (id)objc_opt_class(a1);
    v26 = 2112;
    v27 = v8;
    v28 = 2050;
    v29 = a4;
    v12 = v25;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Authenticating user. Username: %@, authenticationType: %{public}ld.", buf, 0x20u);

  }
  v13 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  objc_msgSend(v13, "setAuthenticationType:", 2);
  objc_msgSend(v13, "setIsEphemeral:", 1);
  objc_msgSend(v13, "_setProxyingForApp:", 1);
  objc_msgSend(v13, "setIsUsernameEditable:", a4 == 0);
  objc_msgSend(v13, "setServiceType:", 1);
  objc_msgSend(v13, "setShouldAllowAppleIDCreation:", 0);
  objc_msgSend(v13, "setUsername:", v8);
  if (a4 == 2)
  {
    v16 = CFSTR("AUTHENTICATION_PROMPT_TITLE_DECLINE_REMOTE");
LABEL_11:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](Localizations, "stringWithKey:", v16));
    v15 = CFSTR("AUTHENTICATION_PROMPT_BODY_REMOTE");
    goto LABEL_12;
  }
  if (a4 == 1)
  {
    v16 = CFSTR("AUTHENTICATION_PROMPT_TITLE_APPROVE_REMOTE");
    goto LABEL_11;
  }
  if (a4)
  {
    v18 = 0;
    v14 = 0;
    goto LABEL_17;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](Localizations, "stringWithKey:", CFSTR("AUTHENTICATION_PROMPT_TITLE_APPROVE_LOCAL")));
  v15 = CFSTR("AUTHENTICATION_PROMPT_BODY_LOCAL");
LABEL_12:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](Localizations, "stringWithKey:", v15));
  if (v17)
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@"), 0, v8));
  else
    v18 = 0;

LABEL_17:
  objc_msgSend(v13, "set_passwordPromptTitle:", v14);
  objc_msgSend(v13, "setReason:", v18);
  v19 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000B71C;
  v21[3] = &unk_100014700;
  v22 = v9;
  v23 = a1;
  v20 = v9;
  objc_msgSend(v19, "authenticateWithContext:completion:", v13, v21);

}

@end
