@implementation _MPCPrepareVocalsControlCommand

- (id)prepare
{
  void *v2;
  MPCPlayerCommandRequest *v3;
  void *v4;
  void *v5;
  void *v6;
  MPCPlayerCommandRequest *v7;

  -[_MPCPlayerCommand response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [MPCPlayerCommandRequest alloc];
  objc_msgSend(v2, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v3, "initWithMediaRemoteCommand:options:controller:label:", 143, 0, v4, v6);

  return v7;
}

@end
