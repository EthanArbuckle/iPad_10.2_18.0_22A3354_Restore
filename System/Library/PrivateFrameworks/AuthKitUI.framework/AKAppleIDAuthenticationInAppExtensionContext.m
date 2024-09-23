@implementation AKAppleIDAuthenticationInAppExtensionContext

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  objc_super v14;
  _QWORD block[5];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9
    && (objc_msgSend(v9, "userInfo"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("statusCode")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqual:", &unk_1E769AA10),
        v12,
        v11,
        v13))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__AKAppleIDAuthenticationInAppExtensionContext_remoteUIController_didFinishLoadWithError_forRequest___block_invoke;
    block[3] = &unk_1E7678D18;
    block[4] = self;
    v16 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AKAppleIDAuthenticationInAppExtensionContext;
    -[AKAppleIDAuthenticationInAppContext remoteUIController:didFinishLoadWithError:forRequest:](&v14, sel_remoteUIController_didFinishLoadWithError_forRequest_, v8, v9, v10);
  }

}

uint64_t __101__AKAppleIDAuthenticationInAppExtensionContext_remoteUIController_didFinishLoadWithError_forRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeWithError:", *(_QWORD *)(a1 + 40));
}

@end
