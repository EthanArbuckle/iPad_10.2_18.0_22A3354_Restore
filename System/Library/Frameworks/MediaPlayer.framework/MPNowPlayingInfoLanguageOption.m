@implementation MPNowPlayingInfoLanguageOption

- (MPNowPlayingInfoLanguageOption)initWithType:(MPNowPlayingInfoLanguageOptionType)languageOptionType languageTag:(NSString *)languageTag characteristics:(NSArray *)languageOptionCharacteristics displayName:(NSString *)displayName identifier:(NSString *)identifier
{
  NSString *v11;
  NSArray *v12;
  NSString *v13;
  NSString *v14;
  MPNowPlayingInfoLanguageOption *v15;
  objc_super v17;

  v11 = languageTag;
  v12 = languageOptionCharacteristics;
  v13 = displayName;
  v14 = identifier;
  v17.receiver = self;
  v17.super_class = (Class)MPNowPlayingInfoLanguageOption;
  v15 = -[MPNowPlayingInfoLanguageOption init](&v17, sel_init);
  if (v15)
    v15->_mrLanguageOption = (void *)MRLanguageOptionCreate();

  return v15;
}

- (void)dealloc
{
  void *mrLanguageOption;
  objc_super v4;

  mrLanguageOption = self->_mrLanguageOption;
  if (mrLanguageOption)
    CFRelease(mrLanguageOption);
  v4.receiver = self;
  v4.super_class = (Class)MPNowPlayingInfoLanguageOption;
  -[MPNowPlayingInfoLanguageOption dealloc](&v4, sel_dealloc);
}

- (MPNowPlayingInfoLanguageOption)initWithMRLanguageOption:(void *)a3
{
  MPNowPlayingInfoLanguageOption *v4;
  MPNowPlayingInfoLanguageOption *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPNowPlayingInfoLanguageOption;
  v4 = -[MPNowPlayingInfoLanguageOption init](&v7, sel_init);
  v5 = v4;
  if (a3 && v4)
    v4->_mrLanguageOption = (void *)CFRetain(a3);
  return v5;
}

- (BOOL)isAutomaticLegibleLanguageOption
{
  return MRLanguageOptionIsAutomaticLanguageOptionForType();
}

- (BOOL)isAutomaticAudibleLanguageOption
{
  return MRLanguageOptionIsAutomaticLanguageOptionForType();
}

- (MPNowPlayingInfoLanguageOptionType)languageOptionType
{
  return (unint64_t)(MEMORY[0x194038140](self->_mrLanguageOption, a2) == 1);
}

- (NSString)languageTag
{
  return (NSString *)(id)MRLanguageOptionCopyLanguageTag();
}

- (NSArray)languageOptionCharacteristics
{
  return (NSArray *)(id)MRLanguageOptionCopyCharacteristics();
}

- (NSString)displayName
{
  return (NSString *)(id)MRLanguageOptionCopyDisplayName();
}

- (NSString)identifier
{
  return (NSString *)(id)MRLanguageOptionCopyIdentifier();
}

- (id)copyExternalRepresentation
{
  return (id)MRLanguageOptionCreateExternalRepresentation();
}

- (BOOL)isEqualToLanguageOption:(id)a3
{
  objc_msgSend(a3, "mrLanguageOption");
  return MRLanguageOptionIsEqualToLanguageOption();
}

- (void)mrLanguageOption
{
  return self->_mrLanguageOption;
}

@end
