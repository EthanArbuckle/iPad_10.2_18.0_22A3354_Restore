@implementation IMDChatRecord

+ (id)keyPathsToColumns
{
  if (qword_1ED0D37B0 != -1)
    dispatch_once(&qword_1ED0D37B0, &unk_1E5AAF088);
  return (id)qword_1ED0D3790;
}

- (IMDChatRecord)initWithRecordRef:(_IMDChatRecordStruct *)a3
{
  _IMDChatRecordStruct *v4;

  v4 = a3;

  return (IMDChatRecord *)v4;
}

+ (IMDChatRecord)allocWithZone:(_NSZone *)a3
{
  IMDChatRecordGetTypeID();
  return (IMDChatRecord *)_CFRuntimeCreateInstance();
}

- (_IMDChatRecordStruct)cfChatRecord
{
  CFTypeID v3;

  v3 = CFGetTypeID(self);
  if (v3 == IMDChatRecordGetTypeID())
    return (_IMDChatRecordStruct *)self;
  else
    return 0;
}

- (void)_fetchUpdatedRecord
{
  return (void *)IMDChatRecordCopyChatRecordUnlocked(-[IMDChatRecord rowID](self, "rowID"));
}

- (__CFArray)_localCache
{
  return (__CFArray *)-[IMDChatRecord cfChatRecord](self, "cfChatRecord")[24];
}

- ($3947A809542915F75EEFCF1F658B679C)_propertyDescriptorForProperty:(SEL)a3
{
  char **v4;
  __int128 v5;

  v4 = &(&off_1E5AB4430)[5 * a4];
  v5 = *((_OWORD *)v4 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v4;
  *(_OWORD *)&retstr->var2 = v5;
  retstr->var4 = v4[4];
  return self;
}

- (int)_propertyIDForProperty:(int64_t)a3
{
  return sub_1ABBCFE70(a3);
}

- (int64_t)rowID
{
  return (uint64_t)-[IMDChatRecord cfChatRecord](self, "cfChatRecord")[16];
}

- (NSDictionary)properties
{
  void *v2;
  void *v3;

  v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 4);
  if (v2)
  {
    JWDecodeDictionary();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (NSString)lastAddressedSIMID
{
  return (NSString *)MEMORY[0x1E0DE7D20](self, sel_lastAddressedSimID);
}

- (int64_t)cloudSyncState
{
  return MEMORY[0x1E0DE7D20](self, sel_ckSyncState);
}

- (NSString)cloudServerChangeToken
{
  return (NSString *)MEMORY[0x1E0DE7D20](self, sel_serverChangeToken);
}

- (NSString)cloudKitRecordID
{
  return (NSString *)MEMORY[0x1E0DE7D20](self, sel_cloudkitRecordID);
}

- (NSString)cloudRecordID
{
  return (NSString *)MEMORY[0x1E0DE7D20](self, sel_cloudkitRecordID);
}

- (IMDMessageRecord)lastMessageRecord
{
  return (IMDMessageRecord *)(id)IMDChatRecordCopyLastMessage((uint64_t)-[IMDChatRecord cfChatRecord](self, "cfChatRecord"));
}

- (NSArray)handleRecords
{
  return (NSArray *)IMDChatRecordCopyHandles((_QWORD *)-[IMDChatRecord cfChatRecord](self, "cfChatRecord"));
}

- (IMDChatRecord)init
{

  return 0;
}

@end
