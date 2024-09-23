@implementation EndpointReachabilityInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSSet *v12;
  void *v13;
  NSArray *v14;
  NSArray *endpointURLs;
  NSArray *v16;
  int v17;
  NSNumber *v18;
  NSNumber *timeout;
  BOOL v20;
  unsigned __int8 v22;
  uint8_t buf[4];
  const char *v24;

  v4 = (char *)a3;
  v22 = 0;
  v6 = handleForCategory(0, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[EndpointReachabilityInputs validateAndInitializeParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9 = handleForCategory(0, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Parameters: %@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("https://idiagnostics.apple.com"), CFSTR("https://gs.apple.com"), CFSTR("https://skl.apple.com"), CFSTR("https://gg.apple.com"), CFSTR("https://ig.apple.com"), 0));
  v12 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:", CFSTR("endpointURLs"), v13, 0xFFFFFFFFLL, v11, &v22, &stru_100008268));
  endpointURLs = self->_endpointURLs;
  self->_endpointURLs = v14;

  v16 = self->_endpointURLs;
  if (!v16 || !-[NSArray count](v16, "count"))
    v22 = 1;

  v17 = v22;
  if (!v22)
  {
    v18 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("timeout"), &off_100008650, &off_100008668, &off_100008680, &v22));
    timeout = self->_timeout;
    self->_timeout = v18;

    v17 = v22;
  }
  v20 = v17 == 0;

  return v20;
}

- (NSArray)endpointURLs
{
  return self->_endpointURLs;
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_endpointURLs, 0);
}

@end
