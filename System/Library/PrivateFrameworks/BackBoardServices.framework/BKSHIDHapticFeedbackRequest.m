@implementation BKSHIDHapticFeedbackRequest

- (id)_initWithCopyOf:(id *)a1
{
  id *v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    a1 = (id *)-[BKSHIDHapticFeedbackRequest _init](a1);
    if (a1)
    {
      v4 = objc_msgSend(v3[1], "copy");
      v5 = a1[1];
      a1[1] = (id)v4;

      a1[2] = v3[2];
      a1[3] = v3[3];
      objc_storeStrong(a1 + 4, v3[4]);
      a1[5] = v3[5];
    }
  }

  return a1;
}

- (id)_init
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  if (result)
  {
    v1 = result;
    v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__init, v1, CFSTR("BKSHIDHapticFeedbackRequest.m"), 65, CFSTR("BKSHIDHapticFeedbackRequest cannot be subclassed"));

      }
    }
    v5.receiver = v1;
    v5.super_class = (Class)BKSHIDHapticFeedbackRequest;
    return objc_msgSendSuper2(&v5, sel_init);
  }
  return result;
}

- (BKSHIDHapticFeedbackRequest)init
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BKSHIDHapticFeedbackRequest init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("BKSHIDHapticFeedbackRequest.m"), 54, CFSTR("cannot directly allocate BKSHIDHapticFeedbackRequest"));

  return 0;
}

- (BKSHIDHapticFeedbackRequest)initWithCoder:(id)a3
{
  id v3;
  BKSHIDHapticFeedbackRequest *v4;
  uint64_t v5;
  NSString *pattern;
  uint64_t v7;
  NSNumber *powerSourceID;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKSHIDHapticFeedbackRequest;
  v3 = a3;
  v4 = -[BKSHIDHapticFeedbackRequest init](&v11, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pattern"), v11.receiver, v11.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  pattern = v4->_pattern;
  v4->_pattern = (NSString *)v5;

  v4->_deviceType = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("deviceType"));
  v4->_senderID = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("senderID"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("powerSourceID"));
  v7 = objc_claimAutoreleasedReturnValue();
  powerSourceID = v4->_powerSourceID;
  v4->_powerSourceID = (NSNumber *)v7;

  v9 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("timestamp"));
  v4->_timestamp = v9;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *pattern;
  NSNumber *powerSourceID;
  id v6;

  v6 = a3;
  pattern = self->_pattern;
  if (pattern)
    objc_msgSend(v6, "encodeObject:forKey:", pattern, CFSTR("pattern"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_deviceType, CFSTR("deviceType"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_senderID, CFSTR("senderID"));
  powerSourceID = self->_powerSourceID;
  if (powerSourceID)
    objc_msgSend(v6, "encodeObject:forKey:", powerSourceID, CFSTR("powerSourceID"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_timestamp, CFSTR("timestamp"));

}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;

  -[NSString hash](self->_pattern, "hash");
  -[NSNumber hash](self->_powerSourceID, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_senderID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hash");

  return BSHashPurifyNS();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = BSEqualObjects()
      && v5[2] == self->_deviceType
      && v5[3] == self->_senderID
      && BSEqualObjects()
      && v5[5] == self->_timestamp;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSHIDHapticFeedbackRequest _initWithCopyOf:]((id *)[BKSMutableHIDHapticFeedbackRequest alloc], self);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v4 = (id)objc_msgSend(v10, "appendObject:withName:", self->_pattern, CFSTR("pattern"));
  NSStringFromBKSHIDHapticFeedbackRequestDeviceType(self->_deviceType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v10, "appendObject:withName:", v5, CFSTR("deviceType"));

  v7 = (id)objc_msgSend(v10, "appendUInt64:withName:format:", self->_senderID, CFSTR("senderID"), 1);
  v8 = (id)objc_msgSend(v10, "appendObject:withName:", self->_powerSourceID, CFSTR("powerSourceID"));
  v9 = (id)objc_msgSend(v10, "appendInt64:withName:", self->_timestamp, CFSTR("timestamp"));

}

- (NSString)pattern
{
  return self->_pattern;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (NSNumber)powerSourceID
{
  return self->_powerSourceID;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerSourceID, 0);
  objc_storeStrong((id *)&self->_pattern, 0);
}

+ (id)build:(id)a3
{
  void (**v3)(id, id);
  id v4;
  void *v5;

  v3 = (void (**)(id, id))a3;
  v4 = -[BKSHIDHapticFeedbackRequest _init]([BKSMutableHIDHapticFeedbackRequest alloc]);
  v3[2](v3, v4);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

+ (id)new
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BKSHIDHapticFeedbackRequest new]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BKSHIDHapticFeedbackRequest.m"), 59, CFSTR("cannot directly allocate BKSHIDHapticFeedbackRequest"));

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)protobufSchema
{
  return (id)objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", a1, &__block_literal_global_9182);
}

void __45__BKSHIDHapticFeedbackRequest_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_pattern");
  objc_msgSend(v2, "addField:", "_deviceType");
  objc_msgSend(v2, "addField:", "_senderID");
  objc_msgSend(v2, "addField:", "_powerSourceID");
  objc_msgSend(v2, "addField:", "_timestamp");

}

@end
