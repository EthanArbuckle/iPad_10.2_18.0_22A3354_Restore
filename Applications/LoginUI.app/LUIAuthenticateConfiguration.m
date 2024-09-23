@implementation LUIAuthenticateConfiguration

- (LUIAuthenticateConfiguration)initWithUser:(id)a3 userAlreadyExist:(BOOL)a4 isTemporarySession:(BOOL)a5 currentUser:(id)a6 passcode:(id)a7 passcodeResetRequired:(BOOL)a8 passcodeResultResponder:(id)a9 authMode:(unint64_t)a10 canLoginWithLocalAuthOnly:(BOOL)a11 doLocalAuthOnly:(BOOL)a12 hasDoneRemoteAuth:(BOOL)a13 userSwitchContext:(id)a14 emcsInfoDict:(id)a15 shouldBypassSetupAssistant:(BOOL)a16 preferencesToSet:(id)a17 needsToEvictCleanUser:(BOOL)a18 navigationController:(id)a19 completionHandler:(id)a20
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  LUIAuthenticateConfiguration *v29;
  LUIAuthenticateConfiguration *v30;
  uint64_t v31;
  NSData *passcodeData;
  id v33;
  id completionHandler;
  id v37;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;

  v43 = a3;
  v37 = a6;
  v42 = a6;
  v24 = a7;
  v40 = a9;
  v25 = a14;
  v41 = a15;
  v26 = a17;
  v27 = a19;
  v28 = a20;
  v44.receiver = self;
  v44.super_class = (Class)LUIAuthenticateConfiguration;
  v29 = -[LUIAuthenticateConfiguration init](&v44, "init");
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_user, a3);
    objc_storeStrong((id *)&v30->_currentUser, v37);
    v30->_isTemporarySession = a5;
    v30->_userAlreadyExist = a4;
    v30->_canLoginWithLocalAuthOnly = a11;
    v30->_doLocalAuthOnly = a12;
    v30->_authMode = a10;
    objc_storeStrong((id *)&v30->_passcode, a7);
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dataUsingEncoding:", 4));
    passcodeData = v30->_passcodeData;
    v30->_passcodeData = (NSData *)v31;

    objc_storeStrong((id *)&v30->_passcodeResultResponder, a9);
    v30->_passcodeResetRequired = a8;
    v30->_hasDoneRemoteAuth = a13;
    objc_storeStrong((id *)&v30->_userSwitchContext, a14);
    objc_storeStrong((id *)&v30->_emcsInfoDict, a15);
    v30->_shouldBypassSetupAssistant = a16;
    objc_storeStrong((id *)&v30->_preferencesToSet, a17);
    v30->_needsToEvictCleanUser = a18;
    objc_storeStrong((id *)&v30->_navigationController, a19);
    v33 = objc_retainBlock(v28);
    completionHandler = v30->_completionHandler;
    v30->_completionHandler = v33;

  }
  return v30;
}

- (LUIAuthenticateConfiguration)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  LOBYTE(v5) = 0;
  LOBYTE(v4) = 0;
  BYTE2(v3) = 0;
  LOWORD(v3) = 0;
  return -[LUIAuthenticateConfiguration initWithUser:userAlreadyExist:isTemporarySession:currentUser:passcode:passcodeResetRequired:passcodeResultResponder:authMode:canLoginWithLocalAuthOnly:doLocalAuthOnly:hasDoneRemoteAuth:userSwitchContext:emcsInfoDict:shouldBypassSetupAssistant:preferencesToSet:needsToEvictCleanUser:navigationController:completionHandler:](self, "initWithUser:userAlreadyExist:isTemporarySession:currentUser:passcode:passcodeResetRequired:passcodeResultResponder:authMode:canLoginWithLocalAuthOnly:doLocalAuthOnly:hasDoneRemoteAuth:userSwitchContext:emcsInfoDict:shouldBypassSetupAssistant:preferencesToSet:needsToEvictCleanUser:navigationController:completionHandler:", 0, 0, 0, 0, 0, 0, 0, 0, v3, 0, 0, v4, 0, v5, 0,
           0);
}

- (void)setPasscode:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_passcode, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));

  -[LUIAuthenticateConfiguration setPasscodeData:](self, "setPasscodeData:", v6);
}

- (void)setUser:(id)a3
{
  id v5;
  unsigned __int8 v6;
  id v7;

  objc_storeStrong((id *)&self->_user, a3);
  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v6 = objc_msgSend(v7, "userExists:", v5);

  self->_userAlreadyExist = v6;
}

- (UMUser)user
{
  return self->_user;
}

- (BOOL)isTemporarySession
{
  return self->_isTemporarySession;
}

- (void)setIsTemporarySession:(BOOL)a3
{
  self->_isTemporarySession = a3;
}

- (UMUser)currentUser
{
  return self->_currentUser;
}

- (void)setCurrentUser:(id)a3
{
  objc_storeStrong((id *)&self->_currentUser, a3);
}

- (BOOL)userAlreadyExist
{
  return self->_userAlreadyExist;
}

- (void)setUserAlreadyExist:(BOOL)a3
{
  self->_userAlreadyExist = a3;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (NSData)passcodeData
{
  return self->_passcodeData;
}

- (void)setPasscodeData:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeData, a3);
}

- (BOOL)passcodeResetRequired
{
  return self->_passcodeResetRequired;
}

- (void)setPasscodeResetRequired:(BOOL)a3
{
  self->_passcodeResetRequired = a3;
}

- (BOOL)canLoginWithLocalAuthOnly
{
  return self->_canLoginWithLocalAuthOnly;
}

- (void)setCanLoginWithLocalAuthOnly:(BOOL)a3
{
  self->_canLoginWithLocalAuthOnly = a3;
}

- (BOOL)doLocalAuthOnly
{
  return self->_doLocalAuthOnly;
}

- (void)setDoLocalAuthOnly:(BOOL)a3
{
  self->_doLocalAuthOnly = a3;
}

- (BOOL)hasDoneRemoteAuth
{
  return self->_hasDoneRemoteAuth;
}

- (void)setHasDoneRemoteAuth:(BOOL)a3
{
  self->_hasDoneRemoteAuth = a3;
}

- (unint64_t)authMode
{
  return self->_authMode;
}

- (void)setAuthMode:(unint64_t)a3
{
  self->_authMode = a3;
}

- (LUIPasscodeVerificationResultResponder)passcodeResultResponder
{
  return self->_passcodeResultResponder;
}

- (void)setPasscodeResultResponder:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeResultResponder, a3);
}

- (UMUserSwitchContext)userSwitchContext
{
  return self->_userSwitchContext;
}

- (void)setUserSwitchContext:(id)a3
{
  objc_storeStrong((id *)&self->_userSwitchContext, a3);
}

- (NSDictionary)emcsInfoDict
{
  return self->_emcsInfoDict;
}

- (void)setEmcsInfoDict:(id)a3
{
  objc_storeStrong((id *)&self->_emcsInfoDict, a3);
}

- (BOOL)shouldBypassSetupAssistant
{
  return self->_shouldBypassSetupAssistant;
}

- (void)setShouldBypassSetupAssistant:(BOOL)a3
{
  self->_shouldBypassSetupAssistant = a3;
}

- (NSDictionary)preferencesToSet
{
  return self->_preferencesToSet;
}

- (void)setPreferencesToSet:(id)a3
{
  objc_storeStrong((id *)&self->_preferencesToSet, a3);
}

- (BOOL)needsToEvictCleanUser
{
  return self->_needsToEvictCleanUser;
}

- (void)setNeedsToEvictCleanUser:(BOOL)a3
{
  self->_needsToEvictCleanUser = a3;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_preferencesToSet, 0);
  objc_storeStrong((id *)&self->_emcsInfoDict, 0);
  objc_storeStrong((id *)&self->_userSwitchContext, 0);
  objc_storeStrong((id *)&self->_passcodeResultResponder, 0);
  objc_storeStrong((id *)&self->_passcodeData, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end
