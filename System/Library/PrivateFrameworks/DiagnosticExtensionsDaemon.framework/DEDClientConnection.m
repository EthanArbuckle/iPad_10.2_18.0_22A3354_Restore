@implementation DEDClientConnection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEDClientConnection)initWithCoder:(id)a3
{
  id v4;
  DEDClientConnection *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DEDClientConnection;
  v5 = -[DEDClientConnection init](&v7, sel_init);
  if (v5)
    v5->_pid = (NSNumber *)(id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pid"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDClientConnection pid](self, "pid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pid"));

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[DEDClientConnection pid](self, "pid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("DEDClientConnection to PID [%@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSNumber)pid
{
  return self->_pid;
}

- (void)setPid:(id)a3
{
  self->_pid = (NSNumber *)a3;
}

@end
