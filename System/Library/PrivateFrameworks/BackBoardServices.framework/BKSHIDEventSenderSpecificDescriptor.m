@implementation BKSHIDEventSenderSpecificDescriptor

- (BKSHIDEventSenderSpecificDescriptor)initWithDescriptor:(id)a3 senderID:(unint64_t)a4
{
  id v7;
  id *v8;
  BKSHIDEventSenderSpecificDescriptor *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKSHIDEventSenderSpecificDescriptor;
  v8 = -[BKSHIDEventDescriptor _initWithEventType:](&v11, sel__initWithEventType_, 0);
  v9 = (BKSHIDEventSenderSpecificDescriptor *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 3, a3);
    v9->_senderID = a4;
  }

  return v9;
}

- (id)descriptorByAddingSenderIDToMatchCriteria:(unint64_t)a3
{
  return -[BKSHIDEventSenderSpecificDescriptor initWithDescriptor:senderID:]([BKSHIDEventSenderSpecificDescriptor alloc], "initWithDescriptor:senderID:", self->_sourceDescriptor, a3);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSHIDEventSenderSpecificDescriptor;
  -[BKSHIDEventDescriptor appendDescriptionToFormatter:](&v7, sel_appendDescriptionToFormatter_, v4);
  v5 = (id)objc_msgSend(v4, "appendUInt64:withName:format:", self->_senderID, CFSTR("senderID"), 1);
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_sourceDescriptor, CFSTR("sourceDescriptor"));

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t senderID;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  senderID = self->_senderID;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", senderID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("_senderID"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_sourceDescriptor, CFSTR("_sourceDescriptor"));
}

- (BKSHIDEventSenderSpecificDescriptor)initWithCoder:(id)a3
{
  id v4;
  BKSHIDEventSenderSpecificDescriptor *v5;
  void *v6;
  uint64_t v7;
  BKSHIDEventDescriptor *sourceDescriptor;
  BKSHIDEventDescriptor *v9;
  BKSHIDEventSenderSpecificDescriptor *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKSHIDEventSenderSpecificDescriptor;
  v5 = -[BKSHIDEventDescriptor init](&v12, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_senderID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_senderID = objc_msgSend(v6, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceDescriptor"));
  v7 = objc_claimAutoreleasedReturnValue();
  sourceDescriptor = v5->_sourceDescriptor;
  v5->_sourceDescriptor = (BKSHIDEventDescriptor *)v7;

  v9 = v5->_sourceDescriptor;
  if (v9)
  {
    v5 = -[BKSHIDEventSenderSpecificDescriptor initWithDescriptor:senderID:](v5, "initWithDescriptor:senderID:", v9, v5->_senderID);
    v10 = v5;
  }
  else
  {
LABEL_4:
    v10 = 0;
  }

  return v10;
}

- (BOOL)requiresFuzzyMatching
{
  return 1;
}

- (BOOL)describes:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  BKSHIDEventDescriptor *sourceDescriptor;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BKSHIDEventSenderSpecificDescriptor senderID](self, "senderID");
    if (v6 == objc_msgSend(v5, "senderID"))
    {
      sourceDescriptor = self->_sourceDescriptor;
      objc_msgSend(v5, "sourceDescriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[BKSHIDEventDescriptor describes:](sourceDescriptor, "describes:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)matchesHIDEvent:(__IOHIDEvent *)a3
{
  unint64_t v5;

  v5 = -[BKSHIDEventSenderSpecificDescriptor senderID](self, "senderID");
  return v5 == IOHIDEventGetSenderID()
      && -[BKSHIDEventDescriptor matchesHIDEvent:](self->_sourceDescriptor, "matchesHIDEvent:", a3);
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (BKSHIDEventDescriptor)sourceDescriptor
{
  return self->_sourceDescriptor;
}

- (void)setSourceDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDescriptor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
