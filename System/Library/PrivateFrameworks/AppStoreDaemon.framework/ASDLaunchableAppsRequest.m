@implementation ASDLaunchableAppsRequest

- (ASDLaunchableAppsRequest)initWithOptions:(id)a3
{
  return (ASDLaunchableAppsRequest *)-[ASDEphemeralRequest _initWithOptions:](self, a3);
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD newValue[4];
  id v7;

  v4 = a3;
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __53__ASDLaunchableAppsRequest_startWithCompletionBlock___block_invoke;
  newValue[3] = &unk_1E37BDF88;
  v7 = v4;
  v5 = v4;
  -[ASDEphemeralRequest _startWithCompletionHandler:](self, (char *)newValue);

}

void __53__ASDLaunchableAppsRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = v4;
    (*(void (**)(void))(v5 + 16))();
    v4 = v6;
  }

}

+ (int64_t)requestType
{
  return 8;
}

@end
