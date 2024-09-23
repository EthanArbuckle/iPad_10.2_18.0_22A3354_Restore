@implementation AXRemoteMLElement

- (AXRemoteMLElement)initWithUUID:(id)a3 andContextId:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  pid_t v7;
  AXRemoteMLElement *v8;
  AXRemoteMLElement *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = getpid();
  v11.receiver = self;
  v11.super_class = (Class)AXRemoteMLElement;
  v8 = -[AXRemoteElement initWithUUID:andRemotePid:andContextId:](&v11, sel_initWithUUID_andRemotePid_andContextId_, v6, -v7, v4);

  if (AXRequestingClientSupportsMLElements())
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

@end
