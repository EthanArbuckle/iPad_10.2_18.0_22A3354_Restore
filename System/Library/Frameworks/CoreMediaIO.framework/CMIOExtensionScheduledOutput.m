@implementation CMIOExtensionScheduledOutput

+ (CMIOExtensionScheduledOutput)scheduledOutputWithSequenceNumber:(uint64_t)sequenceNumber hostTimeInNanoseconds:(uint64_t)hostTimeInNanoseconds
{
  return (CMIOExtensionScheduledOutput *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSequenceNumber:hostTimeInNanoseconds:", sequenceNumber, hostTimeInNanoseconds);
}

- (CMIOExtensionScheduledOutput)initWithSequenceNumber:(uint64_t)sequenceNumber hostTimeInNanoseconds:(uint64_t)hostTimeInNanoseconds
{
  CMIOExtensionScheduledOutput *v6;
  CMIOExtensionScheduledOutput *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMIOExtensionScheduledOutput;
  v6 = -[CMIOExtensionScheduledOutput init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_sequenceNumber = sequenceNumber;
    v6->_hostTimeInNanoseconds = hostTimeInNanoseconds;
    v6->_description = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionScheduledOutput: seqNum %lld, hostTime %.3f]>"), sequenceNumber, (float)((float)hostTimeInNanoseconds / 1000000000.0));
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionScheduledOutput;
  -[CMIOExtensionScheduledOutput dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return self->_description;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t sequenceNumber;
  unint64_t hostTimeInNanoseconds;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  sequenceNumber = self->_sequenceNumber;
  if (sequenceNumber != objc_msgSend(a3, "sequenceNumber"))
    return 0;
  hostTimeInNanoseconds = self->_hostTimeInNanoseconds;
  return hostTimeInNanoseconds == objc_msgSend(a3, "hostTimeInNanoseconds");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CMIOExtensionScheduledOutput initWithSequenceNumber:hostTimeInNanoseconds:](+[CMIOExtensionScheduledOutput allocWithZone:](CMIOExtensionScheduledOutput, "allocWithZone:", a3), "initWithSequenceNumber:hostTimeInNanoseconds:", self->_sequenceNumber, self->_hostTimeInNanoseconds);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_sequenceNumber, CFSTR("sequenceNumber"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_hostTimeInNanoseconds, CFSTR("hostTimeInNanoseconds"));
}

- (CMIOExtensionScheduledOutput)initWithCoder:(id)a3
{
  return -[CMIOExtensionScheduledOutput initWithSequenceNumber:hostTimeInNanoseconds:](self, "initWithSequenceNumber:hostTimeInNanoseconds:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("sequenceNumber")), objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("hostTimeInNanoseconds")));
}

- (id)copyXPCDictionary
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "sequenceNumber", self->_sequenceNumber);
  xpc_dictionary_set_uint64(v3, "hostTimeInNanoseconds", self->_hostTimeInNanoseconds);
  return v3;
}

- (CMIOExtensionScheduledOutput)initWithXPCDictionary:(id)a3
{
  uint64_t uint64;

  if (a3)
  {
    uint64 = xpc_dictionary_get_uint64(a3, "sequenceNumber");
    return -[CMIOExtensionScheduledOutput initWithSequenceNumber:hostTimeInNanoseconds:](self, "initWithSequenceNumber:hostTimeInNanoseconds:", uint64, xpc_dictionary_get_uint64(a3, "hostTimeInNanoseconds"));
  }
  else
  {

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil xpc dictionary"));
    return 0;
  }
}

- (uint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (uint64_t)hostTimeInNanoseconds
{
  return self->_hostTimeInNanoseconds;
}

@end
