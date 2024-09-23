@implementation SLFacebookSession

+ (id)sharedSession
{
  if (sharedSession_onceToken != -1)
    dispatch_once(&sharedSession_onceToken, &__block_literal_global_1);
  return (id)sharedSession___sharedSession;
}

void __34__SLFacebookSession_sharedSession__block_invoke()
{
  SLFacebookSession *v0;
  void *v1;

  v0 = objc_alloc_init(SLFacebookSession);
  v1 = (void *)sharedSession___sharedSession;
  sharedSession___sharedSession = (uint64_t)v0;

}

- (SLFacebookSession)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLFacebookSession;
  return -[SLFacebookSession init](&v3, sel_init);
}

- (id)tokenSecretForEntitledClientWithError:(id *)a3
{
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8F1D0], 3, 0);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return 0;
}

- (BOOL)uploadPost:(id)a3
{
  return 0;
}

- (BOOL)uploadPost:(id)a3 forPID:(int)a4
{
  return 0;
}

- (void)uploadPost:(id)a3 suppressAlerts:(BOOL)a4 withPostCompletion:(id)a5
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0C8F1D0];
  v8 = a5;
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 3, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v8, 0, v9);

}

- (BOOL)uploadProfilePicture:(id)a3 error:(id *)a4
{
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8F1D0], 3, 0);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  return 0;
}

- (void)likeURL:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0C8F1D0];
  v7 = a4;
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 3, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v8);

}

- (void)unlikeURL:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0C8F1D0];
  v7 = a4;
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 3, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v8);

}

- (void)fetchLikeStatusForURL:(id)a3 flags:(unint64_t)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0C8F1D0];
  v8 = a5;
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 3, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v8, 0, v9);

}

+ (id)_remoteInterface
{
  return 0;
}

@end
