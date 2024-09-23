@implementation AXEventData

+ (AXEventData)dataWithSender:(int64_t)a3
{
  AXEventData *v4;

  v4 = objc_alloc_init(AXEventData);
  v4->_storage.eventSenderIdentifier = a3;
  return v4;
}

+ (AXEventData)dataWithSender:(int64_t)a3 page:(int64_t)a4 usage:(int64_t)a5 modifierFlags:(int64_t)a6 eventValue1:(float)a7 eventValue2:(float)a8
{
  AXEventData *v14;

  v14 = objc_alloc_init(AXEventData);
  v14->_storage.eventSenderIdentifier = a3;
  v14->_storage.page = a4;
  v14->_storage.usage = a5;
  v14->_storage.modifierFlags = a6;
  v14->_storage.eventValue1 = a7;
  v14->_storage.eventValue2 = a8;
  return v14;
}

+ (AXEventData)dataWithBytes:(char *)a3 length:(int64_t)a4
{
  AXEventData *v5;
  uint64_t v6;
  __int128 v7;
  NSObject *v9;

  if (a4 != 40)
  {
    AXLogEventTap();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[AXEventData dataWithBytes:length:].cold.1(a4, v9);

    goto LABEL_7;
  }
  if (!a3)
  {
LABEL_7:
    v5 = 0;
    return v5;
  }
  v5 = objc_alloc_init(AXEventData);
  v6 = *((_QWORD *)a3 + 4);
  v7 = *((_OWORD *)a3 + 1);
  *(_OWORD *)&v5->_storage.eventSenderIdentifier = *(_OWORD *)a3;
  *(_OWORD *)&v5->_storage.usage = v7;
  *(_QWORD *)&v5->_storage.eventValue1 = v6;
  return v5;
}

- (AXEventData)init
{
  AXEventData *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXEventData;
  result = -[AXEventData init](&v3, sel_init);
  if (result)
    result->_storage.eventSenderIdentifier = 0;
  return result;
}

- (id)description
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[AXEventData eventSenderIdentifier](self, "eventSenderIdentifier");
  if (v2 > 8)
    v3 = 0;
  else
    v3 = off_1E24C8E98[v2];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AXEventData. Sender:%@"), v3);
}

- (int64_t)eventSenderIdentifier
{
  return self->_storage.eventSenderIdentifier;
}

- (int64_t)page
{
  return self->_storage.page;
}

- (int64_t)usage
{
  return self->_storage.usage;
}

- (int64_t)modifierFlags
{
  return self->_storage.modifierFlags;
}

- (float)eventValue1
{
  return self->_storage.eventValue1;
}

- (float)eventValue2
{
  return self->_storage.eventValue2;
}

- (BOOL)wasPostedByAccessibility
{
  return -[AXEventData eventSenderIdentifier](self, "eventSenderIdentifier") != 0;
}

- (char)dataBytes
{
  return (char *)&self->_storage;
}

- (int64_t)dataLength
{
  return 40;
}

+ (void)dataWithBytes:(uint64_t)a1 length:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = &unk_1E24F8150;
  _os_log_error_impl(&dword_18C62B000, a2, OS_LOG_TYPE_ERROR, "Expected length:(%@) to be size of AXEventDataStorage: (%@)", (uint8_t *)&v4, 0x16u);

}

@end
