@implementation HSPlaybackControlRequest

- (HSPlaybackControlRequest)initWithInterfaceID:(unsigned int)a3 controlCommand:(int64_t)a4
{
  void *v7;
  void *v8;
  HSPlaybackControlRequest *v9;
  objc_super v11;

  if ((unint64_t)a4 > 0x14)
    v7 = &unk_20AB14F2A;
  else
    v7 = *(&off_24C364A78 + a4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/%u/%s"), "ctrl-int", *(_QWORD *)&a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)HSPlaybackControlRequest;
  v9 = -[HSRequest initWithAction:](&v11, sel_initWithAction_, v8);

  if (v9)
  {
    v9->_interfaceID = a3;
    v9->_controlCommand = a4;
  }
  return v9;
}

- (int64_t)controlCommand
{
  return self->_controlCommand;
}

- (unsigned)interfaceID
{
  return self->_interfaceID;
}

@end
