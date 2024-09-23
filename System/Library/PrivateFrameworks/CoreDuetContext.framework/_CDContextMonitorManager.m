@implementation _CDContextMonitorManager

+ (void)activateMonitorForKeyPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  +[_CDContextMonitorManager initializeKeyPathEventStreamMapping](_CDContextMonitorManager, "initializeKeyPathEventStreamMapping");
  v4 = (void *)MEMORY[0x1E0D15860];
  objc_msgSend(MEMORY[0x1E0D158A8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "monitorManagerForEventStreams:domain:", v5, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)keyPathToEventStream, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "populateCurrentValueForStreamName:", v6);
}

+ (void)initializeKeyPathEventStreamMapping
{
  if (initializeKeyPathEventStreamMapping_onceToken != -1)
    dispatch_once(&initializeKeyPathEventStreamMapping_onceToken, &__block_literal_global_33);
}

+ (id)cleanKBEventNameKey:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/device"), CFSTR("/system"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/user"), &stru_1E26D6BC0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
