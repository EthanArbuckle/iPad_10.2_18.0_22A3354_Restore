@implementation HKHealthAppIDSMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKHealthAppIDSMessage)initWithMessageKind:(int64_t)a3
{
  HKHealthAppIDSMessage *v4;
  HKHealthAppIDSMessage *v5;
  NSSecureCoding *payload;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKHealthAppIDSMessage;
  v4 = -[HKHealthAppIDSMessage init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    payload = v4->_payload;
    v4->_type = a3;
    v4->_payload = 0;

  }
  return v5;
}

- (HKHealthAppIDSMessage)initWithCoder:(id)a3
{
  id v4;
  HKHealthAppIDSMessage *v5;
  uint64_t v6;
  NSSecureCoding *payload;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHealthAppIDSMessage;
  v5 = -[HKHealthAppIDSMessage init](&v9, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("payload"));
    v6 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSSecureCoding *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payload, CFSTR("payload"));

}

- (int64_t)type
{
  return self->_type;
}

- (NSSecureCoding)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
