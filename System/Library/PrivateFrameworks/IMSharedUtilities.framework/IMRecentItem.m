@implementation IMRecentItem

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMRecentItem;
  -[IMRecentItem dealloc](&v3, sel_dealloc);
}

- (IMRecentItem)initWithGUID:(id)a3 data:(id)a4 messageItemInfo:(id)a5
{
  IMRecentItem *v8;
  double v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IMRecentItem;
  v8 = -[IMRecentItem init](&v12, sel_init);
  if (v8)
  {
    v8->_payloadData = (NSData *)objc_msgSend(a4, "copy");
    v8->_messageItemInfo = (NSDictionary *)objc_msgSend(a5, "copy");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceReferenceDate");
    v8->_timestamp = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v9);
    if (a3)
      v10 = a3;
    else
      v10 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v8->_GUID = (NSString *)objc_msgSend(v10, "copy");
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSString isEqualToString:](-[IMRecentItem GUID](self, "GUID"), "isEqualToString:", objc_msgSend(a3, "GUID"));
}

- (unint64_t)hash
{
  return -[NSString hash](-[IMRecentItem GUID](self, "GUID"), "hash");
}

- (id)asJSONObject
{
  _QWORD v3[2];
  int8x16_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("guid");
  v3[1] = CFSTR("timestamp");
  v4 = vextq_s8(*(int8x16_t *)&self->_timestamp, *(int8x16_t *)&self->_timestamp, 8uLL);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v4, v3, 2);
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (void)setPayloadData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSDictionary)messageItemInfo
{
  return self->_messageItemInfo;
}

- (void)setMessageItemInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)accessibilityString
{
  return self->_accessibilityString;
}

- (void)setAccessibilityString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
