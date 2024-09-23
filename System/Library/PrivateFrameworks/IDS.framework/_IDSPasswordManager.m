@implementation _IDSPasswordManager

- (void)setPassword:(id)a3 forUsername:(id)a4 onService:(id)a5 completionBlock:(id)a6
{
  id v11;
  void (**v12)(id, id, id, uint64_t);
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v11 = a5;
  v12 = (void (**)(id, id, id, uint64_t))a6;
  v13 = a3;
  if (_IDSRunningInDaemon())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_IDSPasswordManager.m"), 18, CFSTR("This method should only be run on clients"));

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPassword:forUsername:onService:", v13, v16, v11);

  if (v12)
    v12[2](v12, v16, v11, 1);

}

@end
