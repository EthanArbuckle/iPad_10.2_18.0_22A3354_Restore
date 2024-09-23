@implementation GTTransportMessage_replayer

- (GTTransportMessage_replayer)init
{
  -[GTTransportMessage_replayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 payload:(id)a5
{
  GTTransportMessage_replayer *v8;
  GTTransportMessage_replayer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GTTransportMessage_replayer;
  v8 = -[GTTransportMessage_replayer init](&v11, "init");
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

- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  GTTransportMessage_replayer *v10;
  BOOL v12;

  v6 = *(_QWORD *)&a3;
  v12 = a5;
  v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v12, 1);
  if (v8)
  {
    v9 = v8;
    v10 = -[GTTransportMessage_replayer initWithKind:attributes:payload:](self, "initWithKind:attributes:payload:", v6, a4, v8);

  }
  else
  {

    return 0;
  }
  return v10;
}

- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5
{
  uint64_t v6;
  CFDataRef v8;
  CFDataRef v9;
  GTTransportMessage_replayer *v10;
  CFErrorRef error;

  v6 = *(_QWORD *)&a3;
  if (a5)
  {
    error = 0;
    v8 = CFPropertyListCreateData(kCFAllocatorDefault, a5, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    if (!v8)
    {

      return 0;
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  v10 = -[GTTransportMessage_replayer initWithKind:attributes:payload:](self, "initWithKind:attributes:payload:", v6, a4, v9);

  return v10;
}

- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5
{
  uint64_t v6;
  GTTransportMessage_replayer *ExternalRepresentation;
  GTTransportMessage_replayer *v9;

  v6 = *(_QWORD *)&a3;
  if (!a5)
  {
    ExternalRepresentation = 0;
    goto LABEL_5;
  }
  ExternalRepresentation = (GTTransportMessage_replayer *)CFStringCreateExternalRepresentation(kCFAllocatorDefault, (CFStringRef)a5, 0x8000100u, 0);
  if (ExternalRepresentation)
  {
LABEL_5:
    v9 = -[GTTransportMessage_replayer initWithKind:attributes:payload:](self, "initWithKind:attributes:payload:", v6, a4, ExternalRepresentation);
    self = ExternalRepresentation;
    goto LABEL_6;
  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5
{
  id v5;
  uint64_t v7;
  void *v9;
  id v10;
  GTTransportMessage_replayer *v11;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  if (a5)
  {
    v9 = objc_autoreleasePoolPush();
    v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("root"));
    v5 = objc_msgSend(v10, "encodedData");

    objc_autoreleasePoolPop(v9);
  }
  v11 = -[GTTransportMessage_replayer initWithKind:attributes:payload:](self, "initWithKind:attributes:payload:", v7, a4, v5);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "initWithKind:attributes:payload:", self->_kind, self->_attributes, self->_payload);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTTransportMessage_replayer;
  -[GTTransportMessage_replayer dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTTransportMessage_replayer;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ kind=0x%x serial=%u, reply serial=%u"), -[GTTransportMessage_replayer description](&v3, "description"), self->_kind, self->_serial, self->_replySerial);
}

- (BOOL)hasBeenSent
{
  return -[GTTransportMessage_replayer serial](self, "serial") != -1;
}

- (void)_setSerial:(unsigned int)a3 replySerial:(unsigned int)a4 transport:(id)a5
{
  self->_serial = a3;
  self->_replySerial = a4;
  self->_transport = (GTTransport_replayer *)a5;
}

- (void)_setTransportSize:(unsigned int)a3
{
  self->_transportSize = a3;
}

- (id)attributeForKey:(id)a3
{
  return -[NSDictionary objectForKey:](-[GTTransportMessage_replayer attributes](self, "attributes"), "objectForKey:", a3);
}

- (unsigned)uint32ForKey:(id)a3
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[GTTransportMessage_replayer attributes](self, "attributes"), "objectForKey:", a3), "unsignedIntValue");
}

- (unint64_t)uint64ForKey:(id)a3
{
  return (unint64_t)objc_msgSend(-[NSDictionary objectForKey:](-[GTTransportMessage_replayer attributes](self, "attributes"), "objectForKey:", a3), "unsignedLongLongValue");
}

- (double)doubleForKey:(id)a3
{
  double result;

  objc_msgSend(-[NSDictionary objectForKey:](-[GTTransportMessage_replayer attributes](self, "attributes"), "objectForKey:", a3), "doubleValue");
  return result;
}

- (BOOL)BOOLForKey:(id)a3
{
  return objc_msgSend(-[NSDictionary objectForKey:](-[GTTransportMessage_replayer attributes](self, "attributes"), "objectForKey:", a3), "BOOLValue");
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
        if ((char *)-[NSData length](payload, "length") == (char *)&dword_0 + 1)
        {
          payload = self->_payload;
          goto LABEL_7;
        }
        v5 = self->_decodedPayloadType;
        if (!v5)
        {
          decodedPayload = -[GTTransportMessage_replayer objectPayload](self, "objectPayload");
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
  unsigned int v6;
  char v7;
  id v8;
  id v9;
  id v10;

  payload = self->_payload;
  if (!payload || (self->_decodedPayloadType | 2) != 2)
    return 0;
  result = self->_decodedPayload;
  if (!result)
  {
    result = (id)CFPropertyListCreateWithData(kCFAllocatorDefault, (CFDataRef)payload, 0, 0, 0);
    self->_decodedPayload = result;
    if (result)
    {
      self->_decodedPayloadType = 2;
      v5 = objc_opt_respondsToSelector(result, "objectForKey:");
      result = self->_decodedPayload;
      if ((v5 & 1) != 0)
      {
        v6 = objc_msgSend(objc_msgSend(result, "objectForKey:", CFSTR("$archiver")), "isEqual:", CFSTR("NSKeyedArchiver"));
        result = self->_decodedPayload;
        if (v6)
        {
          v7 = objc_opt_respondsToSelector(objc_msgSend(result, "objectForKey:", CFSTR("$top")), "objectForKey:");
          result = self->_decodedPayload;
          if ((v7 & 1) != 0)
          {
            v8 = objc_msgSend(objc_msgSend(result, "objectForKey:", CFSTR("$top")), "objectForKey:", CFSTR("root"));
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
    result = (id)CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, (CFDataRef)payload, 0x8000100u);
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
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[10];

  if (!self->_payload || self->_decodedPayloadType > 1)
    return 0;
  result = self->_decodedPayload;
  if (!result)
  {
    v4 = objc_autoreleasePoolPush();
    v5 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", self->_payload, 0);
    objc_msgSend(v5, "setDecodingFailurePolicy:", 0);
    v6 = +[NSMutableSet set](NSMutableSet, "set");
    v17[0] = objc_opt_class(NSArray, v7);
    v17[1] = objc_opt_class(NSComparisonPredicate, v8);
    v17[2] = objc_opt_class(NSData, v9);
    v17[3] = objc_opt_class(NSDictionary, v10);
    v17[4] = objc_opt_class(NSError, v11);
    v17[5] = objc_opt_class(NSMapTable, v12);
    v17[6] = objc_opt_class(NSNumber, v13);
    v17[7] = objc_opt_class(NSSet, v14);
    v17[8] = objc_opt_class(NSString, v15);
    v17[9] = objc_opt_class(NSURL, v16);
    objc_msgSend(v6, "addObjectsFromArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 10));
    self->_decodedPayload = objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("root"));
    objc_msgSend(v5, "finishDecoding");

    objc_autoreleasePoolPop(v4);
    result = self->_decodedPayload;
    if (result)
      self->_decodedPayloadType = 1;
  }
  return result;
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

- (GTTransport_replayer)transport
{
  return self->_transport;
}

- (unsigned)transportSize
{
  return self->_transportSize;
}

+ (id)messageWithKind:(int)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:payload:", *(_QWORD *)&a3, 0, 0);
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:payload:", *(_QWORD *)&a3, a4, 0);
}

+ (id)messageWithKind:(int)a3 payload:(id)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:payload:", *(_QWORD *)&a3, 0, a4);
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 payload:(id)a5
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:payload:", *(_QWORD *)&a3, a4, a5);
}

+ (id)messageWithKind:(int)a3 BOOLPayload:(BOOL)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:BOOLPayload:", *(_QWORD *)&a3, 0, a4);
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:BOOLPayload:", *(_QWORD *)&a3, a4, a5);
}

+ (id)messageWithKind:(int)a3 plistPayload:(id)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:plistPayload:", *(_QWORD *)&a3, 0, a4);
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:plistPayload:", *(_QWORD *)&a3, a4, a5);
}

+ (id)messageWithKind:(int)a3 stringPayload:(id)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:stringPayload:", *(_QWORD *)&a3, 0, a4);
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:stringPayload:", *(_QWORD *)&a3, a4, a5);
}

+ (id)messageWithKind:(int)a3 objectPayload:(id)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:objectPayload:", *(_QWORD *)&a3, 0, a4);
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithKind:attributes:objectPayload:", *(_QWORD *)&a3, a4, a5);
}

@end
