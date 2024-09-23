@implementation FPLoggerScope

- (FPLoggerScope)init
{
  self->section = __fp_create_section();
  return self;
}

- (id)enter
{
  FPPublicLog *v3;
  void *v4;
  FPPublicLog *v5;

  v3 = [FPPublicLog alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("┏%llx"), self->section);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FPPublicLog initWithString:](v3, "initWithString:", v4);

  return v5;
}

- (id)leave
{
  FPPublicLog *v3;
  void *v4;
  FPPublicLog *v5;

  v3 = [FPPublicLog alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("┗%llx"), self->section);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FPPublicLog initWithString:](v3, "initWithString:", v4);

  return v5;
}

- (id)adopt
{
  FPPublicLog *v3;
  void *v4;
  FPPublicLog *v5;

  v3 = [FPPublicLog alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("┳%llx"), self->section);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FPPublicLog initWithString:](v3, "initWithString:", v4);

  return v5;
}

- (id)fork
{
  FPPublicLog *v3;
  void *v4;
  FPPublicLog *v5;

  v3 = [FPPublicLog alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("┣%llx"), self->section);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FPPublicLog initWithString:](v3, "initWithString:", v4);

  return v5;
}

@end
