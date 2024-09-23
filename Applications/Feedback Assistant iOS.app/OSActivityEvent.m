@implementation OSActivityEvent

- (id)fba_toString
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v3 = objc_opt_class(OSActivityLogMessageEvent);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OSActivityEvent subsystem](self, "subsystem"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSActivityEvent subsystem](self, "subsystem"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@]"), v5));

    }
    else
    {
      v6 = &stru_1000EA660;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSActivityEvent timestamp](self, "timestamp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fba_toString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OSActivityEvent process](self, "process"));
    v12 = -[OSActivityEvent processID](self, "processID");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OSActivityEvent eventMessage](self, "eventMessage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@[%d]:%@ %@"), v8, v10, v12, v6, v13));

  }
  else
  {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OSActivityEvent timestamp](self, "timestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString fba_toString](v6, "fba_toString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSActivityEvent process](self, "process"));
    v9 = -[OSActivityEvent processID](self, "processID");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OSActivityEvent eventMessage](self, "eventMessage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@[%d]: %@"), v7, v8, v9, v10));
  }

  return v11;
}

@end
