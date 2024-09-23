@implementation IMDAttachmentRecord

- (IMDAttachmentRecord)initWithRecordRef:(_IMDAttachmentRecordStruct *)a3
{
  _IMDAttachmentRecordStruct *v4;

  v4 = a3;

  return (IMDAttachmentRecord *)v4;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  IMDAttachmentRecordGetTypeID();
  return (id)_CFRuntimeCreateInstance();
}

- (_IMDAttachmentRecordStruct)cfAttachmentRecord
{
  CFTypeID v3;

  v3 = CFGetTypeID(self);
  if (v3 == IMDAttachmentRecordGetTypeID())
    return (_IMDAttachmentRecordStruct *)self;
  else
    return 0;
}

- (void)_fetchUpdatedRecord
{
  return (void *)IMDAttachmentRecordCopyAttachmentRecordUnlocked(-[IMDAttachmentRecord rowID](self, "rowID"));
}

- (__CFArray)_localCache
{
  return (__CFArray *)-[IMDAttachmentRecord cfAttachmentRecord](self, "cfAttachmentRecord")[24];
}

- ($3947A809542915F75EEFCF1F658B679C)_propertyDescriptorForProperty:(SEL)a3
{
  char **v4;
  __int128 v5;

  v4 = &(&off_1E5ABC198)[5 * a4];
  v5 = *((_OWORD *)v4 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v4;
  *(_OWORD *)&retstr->var2 = v5;
  retstr->var4 = v4[4];
  return self;
}

- (int)_propertyIDForProperty:(int64_t)a3
{
  return sub_1ABBE76C4(a3);
}

- (int64_t)rowID
{
  return (uint64_t)-[IMDAttachmentRecord cfAttachmentRecord](self, "cfAttachmentRecord")[16];
}

- (NSString)path
{
  void *v2;
  void *v3;
  void *v4;

  -[IMDAttachmentRecord filename](self, "filename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByExpandingTildeInPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__im_apfsCompatibleFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)utiString
{
  return (NSString *)(id)IMDBridgedRecordCopyPropertyValue(self, 4);
}

- (BOOL)isCommSafetySensitive
{
  return IMDBridgedRecordGetPropertyBool(self, 19);
}

- (BOOL)isAdaptiveImageGlyph
{
  void *v2;
  BOOL v3;

  -[IMDAttachmentRecord emojiImageContentIdentifier](self, "emojiImageContentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (NSString)emojiImageContentIdentifier
{
  return (NSString *)(id)IMDBridgedRecordCopyPropertyValue(self, 20);
}

- (NSString)emojiImageShortDescription
{
  return (NSString *)(id)IMDBridgedRecordCopyPropertyValue(self, 21);
}

- (NSDictionary)transferUserInfo
{
  void *v2;
  void *v3;

  v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 8);
  if (objc_msgSend(v2, "length"))
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

- (NSDictionary)stickerUserInfo
{
  void *v2;
  void *v3;

  v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 12);
  if (objc_msgSend(v2, "length"))
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

- (NSDictionary)attributionInfo
{
  void *v2;
  void *v3;

  v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 13);
  if (objc_msgSend(v2, "length"))
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

- (int64_t)cloudSyncState
{
  return MEMORY[0x1E0DE7D20](self, sel_ckSyncState);
}

- (NSData)cloudServerChangeToken
{
  return (NSData *)MEMORY[0x1E0DE7D20](self, sel_ckServerChangeTokenBlob);
}

- (NSString)cloudRecordID
{
  return (NSString *)MEMORY[0x1E0DE7D20](self, sel_ckRecordID);
}

- (IMDMessageRecord)messageRecord
{
  __CFString *v2;
  void *v3;

  -[IMDAttachmentRecord guid](self, "guid");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)IMDAttachmentRecordCopyMessageForAttachmentGUID(v2);

  return (IMDMessageRecord *)v3;
}

- (IMDAttachmentRecord)init
{

  return 0;
}

+ (id)keyPathsToColumns
{
  if (qword_1ED0D37B8 != -1)
    dispatch_once(&qword_1ED0D37B8, &unk_1E5AAF308);
  return (id)qword_1ED0D3798;
}

@end
