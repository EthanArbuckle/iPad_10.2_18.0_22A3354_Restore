@implementation LAPSPasscodeChangePreflightController

- (LAPSPasscodeChangePreflightController)initWithSystem:(id)a3
{
  id v5;
  LAPSPasscodeChangePreflightController *v6;
  LAPSPasscodeChangePreflightController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSPasscodeChangePreflightController;
  v6 = -[LAPSPasscodeChangePreflightController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_system, a3);

  return v7;
}

- (id)lastPasscodeChange
{
  return (id)-[LAPSPasscodeChangeSystem lastPasscodeChange](self->_system, "lastPasscodeChange");
}

- (BOOL)canChangePasscodeWithError:(id *)a3
{
  return -[LAPSPasscodeChangeSystem canChangePasscodeWithError:](self->_system, "canChangePasscodeWithError:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_system, 0);
}

@end
