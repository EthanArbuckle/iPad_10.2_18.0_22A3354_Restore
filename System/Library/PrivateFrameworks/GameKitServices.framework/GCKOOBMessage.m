@implementation GCKOOBMessage

- (GCKOOBMessage)init
{
  GCKOOBMessage *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCKOOBMessage;
  result = -[GCKOOBMessage init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->type = 0;
    result->data = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)type
{
  return self->type;
}

- (unsigned)band
{
  return self->band;
}

- (id)data
{
  return self->data;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  NSData *v6;

  objc_msgSend(a3, "encodeInt32:forKey:", self->type, CFSTR("type"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->band, CFSTR("band"));
  data = self->data;
  if (data && -[NSData length](data, "length"))
    v6 = self->data;
  else
    v6 = (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "data");
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("data"));
}

- (GCKOOBMessage)initWithCoder:(id)a3
{
  GCKOOBMessage *v4;
  const __CFData *v5;
  id v6;
  const UInt8 *BytePtr;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GCKOOBMessage;
  v4 = -[GCKOOBMessage init](&v9, sel_init);
  if (v4)
  {
    v5 = (const __CFData *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_alloc(MEMORY[0x24BDBCE50]);
      BytePtr = CFDataGetBytePtr(v5);
      v4->data = (NSData *)objc_msgSend(v6, "initWithBytes:length:", BytePtr, CFDataGetLength(v5));
    }
    v4->band = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("band"));
    v4->type = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("type"));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCKOOBMessage;
  -[GCKOOBMessage dealloc](&v3, sel_dealloc);
}

@end
