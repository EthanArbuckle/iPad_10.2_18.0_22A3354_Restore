@implementation IMIDSService

+ (BOOL)service:(id)a3 sendMessage:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  +[IMIDSServiceController sharedInstance](IMIDSServiceController, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "serviceIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logIfDebuggingService:method:", v19, "+[IMIDSService service:sendMessage:toDestinations:priority:options:identifier:error:]");

  LOBYTE(a8) = objc_msgSend(v17, "sendMessage:toDestinations:priority:options:identifier:error:", v16, v15, a6, v14, a8, a9);
  return (char)a8;
}

+ (BOOL)service:(id)a3 sendMessage:(id)a4 fromAccount:(id)a5 toDestinations:(id)a6 priority:(int64_t)a7 options:(id)a8 identifier:(id *)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  +[IMIDSServiceController sharedInstance](IMIDSServiceController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "serviceIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "logIfDebuggingService:method:", v21, "+[IMIDSService service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:]");

  LOBYTE(a7) = objc_msgSend(v19, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v18, v17, v16, a7, v15, a9, a10);
  return a7;
}

@end
