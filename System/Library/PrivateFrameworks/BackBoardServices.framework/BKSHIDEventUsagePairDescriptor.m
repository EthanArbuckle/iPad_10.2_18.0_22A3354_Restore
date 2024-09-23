@implementation BKSHIDEventUsagePairDescriptor

- (id)_initWithPage:(unsigned int)a3 usage:(unsigned int)a4 eventType:(unsigned int)a5
{
  _DWORD *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BKSHIDEventUsagePairDescriptor;
  v8 = -[BKSHIDEventDescriptor _initWithEventType:](&v12, sel__initWithEventType_, *(_QWORD *)&a5);
  v9 = v8;
  if (v8)
  {
    v8[3] = a3;
    v8[4] = a4;
    if (!a3)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("BKSHIDEventUsagePairDescriptor.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("usage == kHIDUsage_Undefined"));

      }
    }
  }
  return v9;
}

- (BOOL)describes:(id)a3
{
  id v4;
  void *v5;
  unsigned int page;
  int v7;
  BOOL v8;
  BOOL v9;
  int v10;

  v4 = a3;
  v5 = v4;
  page = self->_page;
  if (*(&self->super._hidEventType + 1))
  {
    if (!page)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = 0;
        goto LABEL_12;
      }
      v7 = *(&self->super._hidEventType + 1);
      v8 = v7 == objc_msgSend(v5, "page");
      goto LABEL_8;
    }
LABEL_6:
    v9 = -[BKSHIDEventUsagePairDescriptor isEqual:](self, "isEqual:", v4);
    goto LABEL_12;
  }
  if (page)
    goto LABEL_6;
  v10 = objc_msgSend(v4, "hidEventType");
  v8 = v10 == -[BKSHIDEventDescriptor hidEventType](self, "hidEventType");
LABEL_8:
  v9 = v8;
LABEL_12:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _DWORD *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6
    && (v9.receiver = self,
        v9.super_class = (Class)BKSHIDEventUsagePairDescriptor,
        -[BKSHIDEventDescriptor isEqual:](&v9, sel_isEqual_, v6))
    && v6[3] == *(&self->super._hidEventType + 1)
    && v6[4] == self->_page;

  return v7;
}

- (unint64_t)hash
{
  return BSHashPurifyNS();
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSHIDEventUsagePairDescriptor;
  -[BKSHIDEventDescriptor appendDescriptionToFormatter:](&v7, sel_appendDescriptionToFormatter_, v4);
  v5 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:format:", *(&self->super._hidEventType + 1), CFSTR("page"), 1);
  v6 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:format:", self->_page, CFSTR("usage"), 1);

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = *(&self->super._hidEventType + 1);
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInt:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("_page"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_page);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("_usage"));

  v10.receiver = self;
  v10.super_class = (Class)BKSHIDEventUsagePairDescriptor;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BKSHIDEventDescriptor hidEventType](&v10, sel_hidEventType));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("_type"));

}

- (BKSHIDEventUsagePairDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_page"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_usage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "unsignedIntValue");
  return (BKSHIDEventUsagePairDescriptor *)-[BKSHIDEventUsagePairDescriptor _initWithPage:usage:eventType:](self, "_initWithPage:usage:eventType:", v6, v8, v10);
}

- (BOOL)_page:(unsigned int)a3 usage:(unsigned int)a4 matchesHIDEvent:(__IOHIDEvent *)a5
{
  int Type;
  int IntegerValue;
  int v10;
  BOOL v12;

  if (!(a4 | a3))
    return 1;
  if (!a3 && a4)
    return 0;
  Type = IOHIDEventGetType();
  if (Type != 3 && Type != 1)
    return 0;
  IntegerValue = IOHIDEventGetIntegerValue();
  v10 = IOHIDEventGetIntegerValue();
  v12 = IntegerValue == a3 && v10 == a4;
  if (a4)
    return v12;
  else
    return IntegerValue == a3;
}

- (BOOL)requiresFuzzyMatching
{
  return !*(&self->super._hidEventType + 1) || self->_page == 0;
}

- (BOOL)matchesHIDEvent:(__IOHIDEvent *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKSHIDEventUsagePairDescriptor;
  v5 = -[BKSHIDEventDescriptor matchesHIDEvent:](&v7, sel_matchesHIDEvent_);
  if (v5)
    LOBYTE(v5) = -[BKSHIDEventUsagePairDescriptor _page:usage:matchesHIDEvent:](self, "_page:usage:matchesHIDEvent:", *(&self->super._hidEventType + 1), self->_page, a3);
  return v5;
}

- (unsigned)page
{
  return *(&self->super._hidEventType + 1);
}

- (unsigned)usage
{
  return self->_page;
}

+ (id)descriptorForHIDEventType:(unsigned int)a3 page:(unsigned __int16)a4 usage:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  __objc2_class **v7;

  if (a3 == 3)
  {
    v7 = off_1E1E9ED90;
  }
  else
  {
    if (a3 != 1)
      return 0;
    v7 = off_1E1E9EDE0;
  }
  -[__objc2_class descriptorWithPage:usage:](*v7, "descriptorWithPage:usage:", a4, a5, v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
