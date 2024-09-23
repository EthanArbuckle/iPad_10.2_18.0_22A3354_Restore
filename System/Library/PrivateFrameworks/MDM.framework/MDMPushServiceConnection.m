@implementation MDMPushServiceConnection

+ (id)connectionWithEnvironment:(unint64_t)a3 channel:(unint64_t)a4 queue:(id)a5
{
  id *v8;
  id *v9;
  void **v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  MDMPushServiceConnection *v15;

  v8 = (id *)MEMORY[0x24BE613B0];
  if (a3)
    v8 = (id *)MEMORY[0x24BE613A8];
  v9 = (id *)MEMORY[0x24BE61480];
  if (a3)
  {
    v9 = (id *)MEMORY[0x24BE61478];
    v10 = (void **)MEMORY[0x24BE08718];
  }
  else
  {
    v10 = (void **)MEMORY[0x24BE08720];
  }
  if (a4)
    v8 = v9;
  v11 = *v10;
  v12 = *v8;
  v13 = v11;
  v14 = a5;
  v15 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]([MDMPushServiceConnection alloc], "initWithEnvironmentName:namedDelegatePort:queue:", v13, v12, v14);

  -[MDMPushServiceConnection setChannel:](v15, "setChannel:", a4);
  -[MDMPushServiceConnection setEnvironment:](v15, "setEnvironment:", a3);

  return v15;
}

- (void)requestAppTokenForTopic:(id)a3
{
  unint64_t v4;
  _QWORD *v5;
  id v6;

  v6 = a3;
  v4 = -[MDMPushServiceConnection channel](self, "channel");
  v5 = (_QWORD *)MEMORY[0x24BE613E8];
  if (v4)
    v5 = (_QWORD *)MEMORY[0x24BE61488];
  -[APSConnection requestTokenForTopic:identifier:](self, "requestTokenForTopic:identifier:", v6, *v5);

}

- (unint64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(unint64_t)a3
{
  self->_environment = a3;
}

- (unint64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(unint64_t)a3
{
  self->_channel = a3;
}

@end
