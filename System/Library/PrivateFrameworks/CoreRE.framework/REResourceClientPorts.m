@implementation REResourceClientPorts

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REResourceClientPorts)init
{
  REResourceClientPorts *v2;
  REResourceClientPorts *v3;
  REResourceClientPorts *v5;
  SEL v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REResourceClientPorts;
  v2 = -[REResourceClientPorts init](&v8, sel_init);
  v3 = v2;
  if (!v2)
    return v3;
  v2->_taskIdentifierToken = 0;
  if (!task_create_identity_token(*MEMORY[0x24BDAEC58], &v2->_taskIdentifierToken))
    return v3;
  v5 = (REResourceClientPorts *)abort_report_np();
  return -[REResourceClientPorts initWithCoder:](v5, v6, v7);
}

- (REResourceClientPorts)initWithCoder:(id)a3
{
  id v4;
  REResourceClientPorts *v5;
  void *v6;
  REResourceClientPorts *result;
  REResourceClientPorts *v8;
  SEL v9;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)REResourceClientPorts;
    v5 = -[REResourceClientPorts init](&v10, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFD8], CFSTR("taskIDToken"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_taskIdentifierToken = xpc_mach_send_copy_right();

    }
    return v5;
  }
  else
  {
    v8 = (REResourceClientPorts *)abort_report_np();
    -[REResourceClientPorts dealloc](v8, v9);
  }
  return result;
}

- (void)dealloc
{
  mach_port_name_t taskIdentifierToken;
  objc_super v4;

  taskIdentifierToken = self->_taskIdentifierToken;
  if (taskIdentifierToken + 1 >= 2)
    mach_port_deallocate(*MEMORY[0x24BDAEC58], taskIdentifierToken);
  v4.receiver = self;
  v4.super_class = (Class)REResourceClientPorts;
  -[REResourceClientPorts dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  REResourceClientPorts *v4;
  SEL v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)xpc_mach_send_create();
    objc_msgSend(v6, "encodeXPCObject:forKey:", v3, CFSTR("taskIDToken"));

  }
  else
  {
    v4 = (REResourceClientPorts *)abort_report_np();
    -[REResourceClientPorts description](v4, v5);
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)REResourceClientPorts;
  -[REResourceClientPorts description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(taskIdentifierToken:%d)"), v4, self->_taskIdentifierToken);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unsigned)taskIdentifierToken
{
  return self->_taskIdentifierToken;
}

@end
