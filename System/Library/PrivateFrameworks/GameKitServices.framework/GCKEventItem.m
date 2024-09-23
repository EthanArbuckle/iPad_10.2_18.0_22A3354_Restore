@implementation GCKEventItem

- (GCKEventItem)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCKEventItem;
  return -[GCKEventItem init](&v3, sel_init);
}

- (GCKEventItem)initWithEvent:(id *)a3 remotePeer:(unsigned int)a4
{
  GCKEventItem *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GCKEventItem;
  result = -[GCKEventItem init](&v7, sel_init);
  if (result)
  {
    result->_event = a3;
    result->_pid = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GCKEventItem;
  -[GCKEventItem dealloc](&v2, sel_dealloc);
}

- ($152105ACA10D7302EB217028A84A31FC)event
{
  return self->_event;
}

- (void)setEvent:(id *)a3
{
  self->_event = a3;
}

- (unsigned)pid
{
  return self->_pid;
}

- (void)setPid:(unsigned int)a3
{
  self->_pid = a3;
}

@end
