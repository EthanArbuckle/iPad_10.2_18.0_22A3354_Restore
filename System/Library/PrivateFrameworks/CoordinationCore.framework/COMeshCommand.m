@implementation COMeshCommand

- (COMeshCommand)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)COMeshCommand;
  return -[COMeshCommand init](&v3, sel_init);
}

- (COMeshCommand)initWithCoder:(id)a3
{
  objc_super v5;

  if (objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("version")) == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)COMeshCommand;
    return -[COMeshCommand init](&v5, sel_init);
  }
  else
  {

    return 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", 1, CFSTR("version"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (COMeshNode)sender
{
  return (COMeshNode *)objc_getAssociatedObject(self, sel_sender);
}

- (id)rapportOptions
{
  return objc_getAssociatedObject(self, sel_rapportOptions);
}

- (unint64_t)rapportTransactionID
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[COMeshCommand rapportOptions](self, "rapportOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BE7CD20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)_sendingConstituent
{
  void *v3;
  void *v4;
  void *v5;

  -[COMeshCommand sender](self, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "remote");
  else
    objc_getAssociatedObject(self, sel__sendingConstituent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setSendingConstituent:(id)a3
{
  objc_setAssociatedObject(self, sel__sendingConstituent, a3, (void *)1);
}

- (void)_setSender:(id)a3
{
  objc_setAssociatedObject(self, sel_sender, a3, (void *)1);
}

- (void)_setRapportOptions:(id)a3
{
  objc_setAssociatedObject(self, sel_rapportOptions, a3, (void *)1);
}

@end
