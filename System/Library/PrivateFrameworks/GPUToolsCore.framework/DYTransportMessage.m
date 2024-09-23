@implementation DYTransportMessage

+ (id)messageWithKind:(int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:payload:", *(_QWORD *)&a3, 0, 0);
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:payload:", *(_QWORD *)&a3, a4, 0);
}

+ (id)messageWithKind:(int)a3 payload:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:payload:", *(_QWORD *)&a3, 0, a4);
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 payload:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:payload:", *(_QWORD *)&a3, a4, a5);
}

+ (id)messageWithKind:(int)a3 BOOLPayload:(BOOL)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:BOOLPayload:", *(_QWORD *)&a3, 0, a4);
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:BOOLPayload:", *(_QWORD *)&a3, a4, a5);
}

+ (id)messageWithKind:(int)a3 plistPayload:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:plistPayload:", *(_QWORD *)&a3, 0, a4);
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:plistPayload:", *(_QWORD *)&a3, a4, a5);
}

+ (id)messageWithKind:(int)a3 stringPayload:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:stringPayload:", *(_QWORD *)&a3, 0, a4);
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:stringPayload:", *(_QWORD *)&a3, a4, a5);
}

+ (id)messageWithKind:(int)a3 objectPayload:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:objectPayload:", *(_QWORD *)&a3, 0, a4);
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:objectPayload:", *(_QWORD *)&a3, a4, a5);
}

- (DYTransportMessage)init
{
  -[DYTransportMessage doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 payload:(id)a5
{
  DYTransportMessage *v8;
  DYTransportMessage *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DYTransportMessage;
  v8 = -[DYTransportMessage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_kind = a3;
    *(_QWORD *)&v8->_serial = -1;
    v8->_attributes = (NSDictionary *)a4;
    v9->_payload = (NSData *)a5;
  }
  return v9;
}

- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5
{
  uint64_t v6;
  uint64_t v8;
  void *v9;
  DYTransportMessage *v10;
  BOOL v12;

  v6 = *(_QWORD *)&a3;
  v12 = a5;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v12, 1);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = -[DYTransportMessage initWithKind:attributes:payload:](self, "initWithKind:attributes:payload:", v6, a4, v8);

  }
  else
  {

    return 0;
  }
  return v10;
}

- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5
{
  uint64_t v6;
  DYTransportMessage *Data;
  DYTransportMessage *v9;

  v6 = *(_QWORD *)&a3;
  if (!a5)
  {
    Data = 0;
    goto LABEL_5;
  }
  Data = (DYTransportMessage *)CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x24BDBD240], a5, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (Data)
  {
LABEL_5:
    v9 = -[DYTransportMessage initWithKind:attributes:payload:](self, "initWithKind:attributes:payload:", v6, a4, Data);
    self = Data;
    goto LABEL_6;
  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5
{
  uint64_t v6;
  DYTransportMessage *ExternalRepresentation;
  DYTransportMessage *v9;

  v6 = *(_QWORD *)&a3;
  if (!a5)
  {
    ExternalRepresentation = 0;
    goto LABEL_5;
  }
  ExternalRepresentation = (DYTransportMessage *)CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)a5, 0x8000100u, 0);
  if (ExternalRepresentation)
  {
LABEL_5:
    v9 = -[DYTransportMessage initWithKind:attributes:payload:](self, "initWithKind:attributes:payload:", v6, a4, ExternalRepresentation);
    self = ExternalRepresentation;
    goto LABEL_6;
  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (DYTransportMessage)initWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5
{
  id v5;
  uint64_t v7;
  void *v9;
  void *v10;
  DYTransportMessage *v11;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  if (a5)
  {
    v9 = (void *)MEMORY[0x2426231FC](self, a2);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v10, "setDelegate:", self);
    objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("root"));
    v5 = (id)objc_msgSend(v10, "encodedData");

    objc_autoreleasePoolPop(v9);
  }
  v11 = -[DYTransportMessage initWithKind:attributes:payload:](self, "initWithKind:attributes:payload:", v7, a4, v5);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithKind:attributes:payload:", self->_kind, self->_attributes, self->_payload);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYTransportMessage;
  -[DYTransportMessage dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYTransportMessage;
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ kind=0x%x serial=%u, reply serial=%u"), -[DYTransportMessage description](&v3, sel_description), self->_kind, self->_serial, self->_replySerial);
}

- (BOOL)hasBeenSent
{
  return -[DYTransportMessage serial](self, "serial") != -1;
}

- (void)_setSerial:(unsigned int)a3 replySerial:(unsigned int)a4 transport:(id)a5
{
  self->_serial = a3;
  self->_replySerial = a4;
  self->_transport = (DYTransport *)a5;
}

- (void)_setTransportSize:(unsigned int)a3
{
  self->_transportSize = a3;
}

- (id)attributeForKey:(id)a3
{
  return -[NSDictionary objectForKey:](-[DYTransportMessage attributes](self, "attributes"), "objectForKey:", a3);
}

- (unsigned)uint32ForKey:(id)a3
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[DYTransportMessage attributes](self, "attributes"), "objectForKey:", a3), "unsignedIntValue");
}

- (unint64_t)uint64ForKey:(id)a3
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[DYTransportMessage attributes](self, "attributes"), "objectForKey:", a3), "unsignedLongLongValue");
}

- (double)doubleForKey:(id)a3
{
  double result;

  objc_msgSend(-[NSDictionary objectForKey:](-[DYTransportMessage attributes](self, "attributes"), "objectForKey:", a3), "doubleValue");
  return result;
}

- (BOOL)BOOLForKey:(id)a3
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[DYTransportMessage attributes](self, "attributes"), "objectForKey:", a3), "BOOLValue");
}

- (BOOL)BOOLPayload
{
  NSData *payload;
  unsigned int decodedPayloadType;
  unsigned int v5;
  id decodedPayload;
  char v8;

  payload = self->_payload;
  if (payload)
  {
    decodedPayloadType = self->_decodedPayloadType;
    switch(decodedPayloadType)
    {
      case 5u:
        goto LABEL_10;
      case 4u:
LABEL_7:
        v8 = 0;
        -[NSData getBytes:length:](payload, "getBytes:length:", &v8, 1);
        self->_decodedPayloadType = 4;
        LOBYTE(payload) = v8 != 0;
        return (char)payload;
      case 0u:
        if (-[NSData length](payload, "length") == 1)
        {
          payload = self->_payload;
          goto LABEL_7;
        }
        v5 = self->_decodedPayloadType;
        if (!v5)
        {
          decodedPayload = -[DYTransportMessage objectPayload](self, "objectPayload");
          if (decodedPayload)
            self->_decodedPayloadType = 5;
          goto LABEL_11;
        }
        if (v5 == 5)
        {
LABEL_10:
          decodedPayload = self->_decodedPayload;
LABEL_11:
          LOBYTE(payload) = objc_msgSend(decodedPayload, "BOOLValue");
          return (char)payload;
        }
        break;
    }
    LOBYTE(payload) = 0;
  }
  return (char)payload;
}

- (id)plistPayload
{
  NSData *payload;
  id result;
  char v5;
  int v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  payload = self->_payload;
  if (!payload || (self->_decodedPayloadType | 2) != 2)
    return 0;
  result = self->_decodedPayload;
  if (!result)
  {
    result = (id)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFDataRef)payload, 0, 0, 0);
    self->_decodedPayload = result;
    if (result)
    {
      self->_decodedPayloadType = 2;
      v5 = objc_opt_respondsToSelector();
      result = self->_decodedPayload;
      if ((v5 & 1) != 0)
      {
        v6 = objc_msgSend((id)objc_msgSend(result, "objectForKey:", CFSTR("$archiver")), "isEqual:", CFSTR("NSKeyedArchiver"));
        result = self->_decodedPayload;
        if (v6)
        {
          objc_msgSend(result, "objectForKey:", CFSTR("$top"));
          v7 = objc_opt_respondsToSelector();
          result = self->_decodedPayload;
          if ((v7 & 1) != 0)
          {
            v8 = objc_msgSend((id)objc_msgSend(result, "objectForKey:", CFSTR("$top")), "objectForKey:", CFSTR("root"));
            result = self->_decodedPayload;
            if (v8)
            {
              v9 = objc_msgSend(result, "objectForKey:", CFSTR("$version"));
              result = self->_decodedPayload;
              if (v9)
              {
                v10 = objc_msgSend(result, "objectForKey:", CFSTR("$objects"));
                result = self->_decodedPayload;
                if (v10)
                {

                  result = 0;
                  self->_decodedPayload = 0;
                  self->_decodedPayloadType = 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)stringPayload
{
  NSData *payload;
  unsigned int decodedPayloadType;
  id result;

  payload = self->_payload;
  if (!payload)
    return 0;
  decodedPayloadType = self->_decodedPayloadType;
  if (decodedPayloadType != 3 && decodedPayloadType != 0)
    return 0;
  result = self->_decodedPayload;
  if (!result)
  {
    result = (id)CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFDataRef)payload, 0x8000100u);
    self->_decodedPayload = result;
    if (result)
      self->_decodedPayloadType = 3;
  }
  return result;
}

- (id)objectPayload
{
  id result;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  if (!self->_payload || self->_decodedPayloadType > 1)
    return 0;
  result = self->_decodedPayload;
  if (!result)
  {
    v4 = (void *)MEMORY[0x2426231FC](0, a2);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", self->_payload, 0);
    objc_msgSend(v5, "setDecodingFailurePolicy:", 0);
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7[0] = objc_opt_class();
    v7[1] = objc_opt_class();
    v7[2] = objc_opt_class();
    v7[3] = objc_opt_class();
    v7[4] = objc_opt_class();
    v7[5] = objc_opt_class();
    objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 6));
    objc_msgSend(v6, "addObjectsFromArray:", -[NSSet allObjects](+[DYKeyedUnarchiver allClassSet](DYKeyedUnarchiver, "allClassSet"), "allObjects"));
    self->_decodedPayload = (id)objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("root"));
    objc_msgSend(v5, "finishDecoding");

    objc_autoreleasePoolPop(v4);
    result = self->_decodedPayload;
    if (result)
      self->_decodedPayloadType = 1;
  }
  return result;
}

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(a4, "array");
  else
    return a4;
}

- (int)kind
{
  return self->_kind;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSData)encodedAttributes
{
  return self->_encodedAttributes;
}

- (void)setEncodedAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)serial
{
  return self->_serial;
}

- (unsigned)replySerial
{
  return self->_replySerial;
}

- (DYTransport)transport
{
  return self->_transport;
}

- (unsigned)transportSize
{
  return self->_transportSize;
}

@end
