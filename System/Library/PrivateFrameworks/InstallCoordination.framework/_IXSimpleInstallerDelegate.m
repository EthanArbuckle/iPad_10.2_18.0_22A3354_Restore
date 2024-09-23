@implementation _IXSimpleInstallerDelegate

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  v6 = sAppInstallCoordinatorQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86___IXSimpleInstallerDelegate_coordinatorDidCompleteSuccessfully_forApplicationRecord___block_invoke;
  v8[3] = &unk_1E4DC4728;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = sAppInstallCoordinatorQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68___IXSimpleInstallerDelegate_coordinator_canceledWithReason_client___block_invoke;
  v9[3] = &unk_1E4DC4728;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6
{
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (a5 == 1)
  {
    -[_IXSimpleInstallerDelegate progressBlock](self, "progressBlock", a3, a4, a6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_IXSimpleInstallerDelegate progressBlock](self, "progressBlock");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13[0] = CFSTR("Status");
      IXStatusForInstallationProgress(a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = CFSTR("PercentComplete");
      v14[0] = v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v9)[2](v9, v12);

    }
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (IXInitiatingOrUpdatingCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (NSURL)moveResultToURL
{
  return self->_moveResultToURL;
}

- (void)setMoveResultToURL:(id)a3
{
  objc_storeStrong((id *)&self->_moveResultToURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moveResultToURL, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
