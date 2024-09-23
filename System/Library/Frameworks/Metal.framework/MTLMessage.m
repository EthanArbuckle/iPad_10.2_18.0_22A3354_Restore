@implementation MTLMessage

- (id)init:(unint64_t)a3 message:(id)a4
{
  MTLMessage *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLMessage;
  v6 = -[MTLMessage init](&v8, sel_init);
  v6->_type = a3;
  v6->_string = (NSString *)a4;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLMessage;
  -[MTLMessage dealloc](&v3, sel_dealloc);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

@end
