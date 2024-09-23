@implementation SNNMILNamedValue

- (SNNMILNamedValue)initWithName:(id)a3
{
  NSString *v4;
  SNNMILNamedValue *v5;
  NSString *name;
  objc_super v8;

  v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SNNMILNamedValue;
  v5 = -[SNNMILValue init](&v8, sel_init);
  name = v5->_name;
  v5->_name = v4;

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
