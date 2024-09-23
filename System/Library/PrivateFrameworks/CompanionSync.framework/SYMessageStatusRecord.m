@implementation SYMessageStatusRecord

- (SYMessageStatusRecord)initWithMessageID:(id)a3
{
  id v4;
  SYMessageStatusRecord *v5;
  SYMessageStatusRecord *v6;
  SYMessageStatusRecord *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYMessageStatusRecord;
  v5 = -[SYMessageStatusRecord init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SYMessageStatusRecord setMessageID:](v5, "setMessageID:", v4);
    v7 = v6;
  }

  return v6;
}

- (id)initFiller
{
  return -[SYMessageStatusRecord initWithMessageID:](self, "initWithMessageID:", CFSTR("<filler>"));
}

- (BOOL)isComplete
{
  void *v3;
  BOOL v4;

  -[SYMessageStatusRecord messageID](self, "messageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("<filler>")) & 1) != 0)
    v4 = 1;
  else
    v4 = -[SYMessageStatusRecord deviceACKReceived](self, "deviceACKReceived")
      && -[SYMessageStatusRecord applicationACKReceived](self, "applicationACKReceived")
      && -[SYMessageStatusRecord responseReceived](self, "responseReceived");

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  if (-[SYMessageStatusRecord isComplete](self, "isComplete"))
  {
    v3 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[SYMessageStatusRecord messageID](self, "messageID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Sync message %@; complete"), v4);

  }
  else
  {
    -[SYMessageStatusRecord debugDescription](self, "debugDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[SYMessageStatusRecord messageID](self, "messageID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Sync message %@; device ACK: %d, app ACK: %d, responded: %d"),
                 v4,
                 -[SYMessageStatusRecord deviceACKReceived](self, "deviceACKReceived"),
                 -[SYMessageStatusRecord applicationACKReceived](self, "applicationACKReceived"),
                 -[SYMessageStatusRecord responseReceived](self, "responseReceived"));

  return v5;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)deviceACKReceived
{
  return self->_deviceACKReceived;
}

- (void)setDeviceACKReceived:(BOOL)a3
{
  self->_deviceACKReceived = a3;
}

- (BOOL)applicationACKReceived
{
  return self->_applicationACKReceived;
}

- (void)setApplicationACKReceived:(BOOL)a3
{
  self->_applicationACKReceived = a3;
}

- (BOOL)responseReceived
{
  return self->_responseReceived;
}

- (void)setResponseReceived:(BOOL)a3
{
  self->_responseReceived = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);
}

@end
