@implementation VCVideoRuleCollectionKey

- (BOOL)isEqual:(id)a3
{
  int payload;
  int transportType;
  int encodingType;

  if (a3 == self)
    return 1;
  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  payload = self->_payload;
  if (payload != objc_msgSend(a3, "payload"))
    return 0;
  transportType = self->_transportType;
  if (transportType != objc_msgSend(a3, "transportType"))
    return 0;
  encodingType = self->_encodingType;
  return encodingType == objc_msgSend(a3, "encodingType");
}

- (int)payload
{
  return self->_payload;
}

- (unsigned)transportType
{
  return self->_transportType;
}

- (unsigned)encodingType
{
  return self->_encodingType;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_encodingType - (unint64_t)self->_transportType + 32 * self->_transportType;
  return self->_payload - v2 + 32 * v2 + 29791;
}

- (VCVideoRuleCollectionKey)initWithPayload:(int)a3 transportType:(unsigned __int8)a4 encodingType:(unsigned __int8)a5
{
  VCVideoRuleCollectionKey *result;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCVideoRuleCollectionKey;
  result = -[VCVideoRuleCollectionKey init](&v9, sel_init);
  if (result)
  {
    result->_payload = a3;
    result->_transportType = a4;
    result->_encodingType = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPayload:transportType:encodingType:", self->_payload, self->_transportType, self->_encodingType);
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  if (self->_transportType == 1)
    v2 = CFSTR("WiFi");
  else
    v2 = CFSTR("Cellular");
  v3 = CFSTR("decoding");
  if (self->_encodingType == 1)
    v3 = CFSTR("encoding");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload:%d %@ %@ rules"), self->_payload, v2, v3);
}

@end
