@implementation IKPlayerPlaybackErrorEventUserInfo

- (IKPlayerPlaybackErrorEventUserInfo)initWithError:(id)a3 shouldStopDueToError:(BOOL)a4
{
  id v7;
  IKPlayerPlaybackErrorEventUserInfo *v8;
  IKPlayerPlaybackErrorEventUserInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKPlayerPlaybackErrorEventUserInfo;
  v8 = -[IKPlayerPlaybackErrorEventUserInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_error, a3);
    v9->_shouldStopDueToError = a4;
  }

  return v9;
}

- (NSDictionary)properties
{
  void *v3;
  IKJSError *v4;
  NSError *error;
  void *v6;
  IKJSError *v7;
  void *v8;
  void *v9;
  void *v10;

  -[NSError localizedFailureReason](self->_error, "localizedFailureReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = [IKJSError alloc];
  error = self->_error;
  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IKJSError initWithError:appContext:](v4, "initWithError:appContext:", error, v6);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (IKJSError *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v3, CFSTR("reason"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("error"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldStopDueToError);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("shouldStopDueToError"));

  v10 = (void *)objc_msgSend(v8, "copy");
  return (NSDictionary *)v10;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)shouldStopDueToError
{
  return self->_shouldStopDueToError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
