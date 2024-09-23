@implementation IMDHandleRecord

+ (IMDHandleRecord)allocWithZone:(_NSZone *)a3
{
  IMDHandleRecordGetTypeID();
  return (IMDHandleRecord *)_CFRuntimeCreateInstance();
}

- (_IMDHandleRecordStruct)cfHandleRecord
{
  CFTypeID v3;

  v3 = CFGetTypeID(self);
  if (v3 == IMDHandleRecordGetTypeID())
    return (_IMDHandleRecordStruct *)self;
  else
    return 0;
}

- (void)_fetchUpdatedRecord
{
  return (void *)IMDHandleRecordCopyHandleRecordUnlocked(-[IMDHandleRecord rowID](self, "rowID"));
}

- (__CFArray)_localCache
{
  return (__CFArray *)-[IMDHandleRecord cfHandleRecord](self, "cfHandleRecord")[24];
}

- ($3947A809542915F75EEFCF1F658B679C)_propertyDescriptorForProperty:(SEL)a3
{
  char **v4;
  __int128 v5;

  v4 = &(&off_1E5AB2900)[5 * a4];
  v5 = *((_OWORD *)v4 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v4;
  *(_OWORD *)&retstr->var2 = v5;
  retstr->var4 = v4[4];
  return self;
}

- (int)_propertyIDForProperty:(int64_t)a3
{
  return sub_1ABBA3630(a3);
}

- (int64_t)rowID
{
  return (uint64_t)-[IMDHandleRecord cfHandleRecord](self, "cfHandleRecord")[16];
}

- (NSString)canonicalizedURIString
{
  return (NSString *)(id)IMDBridgedRecordCopyPropertyValue(self, 0);
}

- (NSString)uncanonicalizedURIString
{
  return (NSString *)MEMORY[0x1E0DE7D20](self, sel_uncanonicalizedID);
}

- (IMDHandleRecord)init
{

  return 0;
}

+ (id)keyPathsToColumns
{
  if (qword_1ED0D37A8 != -1)
    dispatch_once(&qword_1ED0D37A8, &unk_1E5AAF028);
  return (id)qword_1ED0D3788;
}

@end
