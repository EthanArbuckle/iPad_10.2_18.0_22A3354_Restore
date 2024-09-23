@implementation AMSBTLEPeripheral

- (AMSBTLEPeripheral)initWithID:(id)a3 name:(id)a4 manager:(id)a5
{
  AMSBTLEPeripheral *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AMSBTLEPeripheral;
  v8 = -[AMSBTLEPeripheral init](&v10, sel_init);
  if (v8)
  {
    v8->uuid = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", a3);
    v8->centralManager = (CBCentralManager *)a5;
    v8->name = (NSString *)a4;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSBTLEPeripheral;
  -[AMSBTLEPeripheral dealloc](&v3, sel_dealloc);
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setName:(id)a3
{
  id v5;

  v5 = a3;

  self->name = (NSString *)a3;
}

- (NSString)name
{
  if (self->name)
    return self->name;
  else
    return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), self->uuid);
}

- (double)lastSeen
{
  return self->lastSeen;
}

- (void)setLastSeen:(double)a3
{
  self->lastSeen = a3;
}

- (BOOL)inputAvailable
{
  return self->inputAvailable;
}

- (void)setInputAvailable:(BOOL)a3
{
  self->inputAvailable = a3;
}

- (BOOL)outputAvailable
{
  return self->outputAvailable;
}

- (void)setOutputAvailable:(BOOL)a3
{
  self->outputAvailable = a3;
}

- (BOOL)isOnline
{
  return self->online;
}

- (void)setOnline:(BOOL)a3
{
  self->online = a3;
}

- (BOOL)isAvailable
{
  return self->available;
}

- (void)setAvailable:(BOOL)a3
{
  self->available = a3;
}

- (CBPeripheral)peripheral
{
  id v3;
  CBCentralManager *centralManager;
  NSArray *v5;
  CBPeripheral *result;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", self->uuid);
  centralManager = self->centralManager;
  v7[0] = v3;
  v5 = -[CBCentralManager retrievePeripheralsWithIdentifiers:](centralManager, "retrievePeripheralsWithIdentifiers:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1));
  result = -[NSArray count](v5, "count");
  if (result)
  {

    result = (CBPeripheral *)-[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", 0);
  }
  self->peripheral = result;
  return result;
}

- (BOOL)connect
{
  CBPeripheral *v3;
  CBPeripheral *v4;

  if (self->online)
    return 1;
  v3 = -[AMSBTLEPeripheral peripheral](self, "peripheral");
  if (v3)
  {
    v4 = v3;
    NSLog(CFSTR("Connecting to peripheral with UUID %@ ..."), self->uuid);
    -[CBCentralManager connectPeripheral:options:](self->centralManager, "connectPeripheral:options:", v4, 0);
    return 1;
  }
  NSLog(CFSTR("Error: No Bluetooth peripheral located with UUID %@."), self->uuid);
  return 0;
}

- (BOOL)disconnect
{
  MIDIObjectRef v3;
  MIDIObjectRef v4;

  if (!self->online)
    return 1;
  v3 = objc_msgSend(MEMORY[0x24BDBFBE8], "nullDevice");
  if (v3)
  {
    v4 = v3;
    NSLog(CFSTR("Instructing the driver to disconnect peripheral with UUID %@"), self->uuid);
    return MIDIObjectSetStringProperty(v4, CFSTR("disconnect device"), (CFStringRef)-[AMSBTLEPeripheral uuid](self, "uuid")) == 0;
  }
  else
  {
    NSLog(CFSTR("Could not communicate with the Bluetooth driver to disconnect."));
    return 0;
  }
}

- (BOOL)hidden
{
  return !self->inputAvailable && !self->outputAvailable;
}

- (BOOL)updateAvailableStateChanged
{
  int available;
  double v4;
  int online;

  available = self->available;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "date"), "timeIntervalSince1970");
  if (v4 - self->lastSeen <= 7.0 || (online = self->online) != 0)
    online = 1;
  self->available = online;
  return online != available;
}

- (BOOL)canConnect
{
  return self->available || self->online;
}

- (BOOL)isChangingState
{
  return self->changingState;
}

- (void)setChangingState:(BOOL)a3
{
  self->changingState = a3;
}

@end
