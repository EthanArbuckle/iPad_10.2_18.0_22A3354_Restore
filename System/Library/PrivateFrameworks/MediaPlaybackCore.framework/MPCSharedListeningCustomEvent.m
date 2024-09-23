@implementation MPCSharedListeningCustomEvent

- (MPCSharedListeningCustomEvent)initWithLocalizedMessage:(id)a3
{
  id v4;
  MPCSharedListeningCustomEvent *v5;
  uint64_t v6;
  NSString *localizedMessage;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCSharedListeningCustomEvent;
  v5 = -[MPCSharedListeningCustomEvent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    localizedMessage = v5->_localizedMessage;
    v5->_localizedMessage = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningCustomEvent: %p localizedMessage=\"%@\">"), self, self->_localizedMessage);
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);
}

@end
