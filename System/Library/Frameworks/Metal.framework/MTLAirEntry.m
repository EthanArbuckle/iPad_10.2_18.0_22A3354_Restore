@implementation MTLAirEntry

- (MTLAirEntry)initWithData:(id)a3 bitcode:(id)a4 airScript:(id)a5
{
  MTLAirEntry *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLAirEntry;
  v8 = -[MTLAirEntry init](&v10, sel_init);
  if (v8)
  {
    dispatch_retain((dispatch_object_t)a3);
    if (a4)
      dispatch_retain((dispatch_object_t)a4);
    dispatch_retain((dispatch_object_t)a5);
    v8->_data = (OS_dispatch_data *)a3;
    v8->_bitcode = (OS_dispatch_data *)a4;
    v8->_airScript = (OS_dispatch_data *)a5;
    v8->_linkedBitcodes = 0;
  }
  return v8;
}

- (MTLAirEntry)initWithData:(id)a3
{
  MTLAirEntry *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLAirEntry;
  v4 = -[MTLAirEntry init](&v6, sel_init);
  if (v4)
  {
    dispatch_retain((dispatch_object_t)a3);
    v4->_data = (OS_dispatch_data *)a3;
    v4->_bitcode = 0;
    v4->_airScript = 0;
    v4->_linkedBitcodes = 0;
  }
  return v4;
}

- (void)dealloc
{
  NSObject *bitcode;
  NSObject *airScript;
  objc_super v5;

  dispatch_release((dispatch_object_t)self->_data);
  bitcode = self->_bitcode;
  if (bitcode)
    dispatch_release(bitcode);
  airScript = self->_airScript;
  if (airScript)
    dispatch_release(airScript);

  v5.receiver = self;
  v5.super_class = (Class)MTLAirEntry;
  -[MTLAirEntry dealloc](&v5, sel_dealloc);
}

- (NSArray)linkedBitcodes
{
  return self->_linkedBitcodes;
}

- (void)setLinkedBitcodes:(id)a3
{
  NSArray *linkedBitcodes;
  id v5;
  id v6;

  linkedBitcodes = self->_linkedBitcodes;
  if (linkedBitcodes)
  {
    v6 = a3;

    a3 = v6;
  }
  self->_linkedBitcodes = (NSArray *)a3;
  v5 = a3;
}

- (OS_dispatch_data)bitcode
{
  return self->_bitcode;
}

- (OS_dispatch_data)airScript
{
  return self->_airScript;
}

- (OS_dispatch_data)data
{
  return self->_data;
}

@end
