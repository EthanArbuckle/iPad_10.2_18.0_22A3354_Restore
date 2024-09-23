@implementation MPNowPlayingInfoLanguageOptionGroup

- (MPNowPlayingInfoLanguageOptionGroup)initWithLanguageOptions:(NSArray *)languageOptions defaultLanguageOption:(MPNowPlayingInfoLanguageOption *)defaultLanguageOption allowEmptySelection:(BOOL)allowEmptySelection
{
  NSArray *v7;
  MPNowPlayingInfoLanguageOption *v8;
  MPNowPlayingInfoLanguageOptionGroup *v9;
  const __CFAllocator *v10;
  CFIndex v11;
  __CFArray *Mutable;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = languageOptions;
  v8 = defaultLanguageOption;
  v23.receiver = self;
  v23.super_class = (Class)MPNowPlayingInfoLanguageOptionGroup;
  v9 = -[MPNowPlayingInfoLanguageOptionGroup init](&v23, sel_init);
  if (v9)
  {
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v11 = -[NSArray count](v7, "count");
    Mutable = CFArrayCreateMutable(v10, v11, MEMORY[0x1E0C9B378]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = v7;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          CFArrayAppendValue(Mutable, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "mrLanguageOption", (_QWORD)v19));
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v15);
    }

    if (v8)
      -[MPNowPlayingInfoLanguageOption mrLanguageOption](v8, "mrLanguageOption");
    v9->_mrLanguageOptionGroup = (void *)MRLanguageOptionGroupCreate();
    CFRelease(Mutable);
  }

  return v9;
}

- (MPNowPlayingInfoLanguageOptionGroup)initWithMRLanguageOptionGroup:(void *)a3
{
  MPNowPlayingInfoLanguageOptionGroup *v4;
  MPNowPlayingInfoLanguageOptionGroup *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPNowPlayingInfoLanguageOptionGroup;
  v4 = -[MPNowPlayingInfoLanguageOptionGroup init](&v7, sel_init);
  v5 = v4;
  if (a3 && v4)
    v4->_mrLanguageOptionGroup = (void *)CFRetain(a3);
  return v5;
}

- (void)dealloc
{
  void *mrLanguageOptionGroup;
  objc_super v4;

  mrLanguageOptionGroup = self->_mrLanguageOptionGroup;
  if (mrLanguageOptionGroup)
    CFRelease(mrLanguageOptionGroup);
  v4.receiver = self;
  v4.super_class = (Class)MPNowPlayingInfoLanguageOptionGroup;
  -[MPNowPlayingInfoLanguageOptionGroup dealloc](&v4, sel_dealloc);
}

- (NSArray)languageOptions
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  void *v5;
  CFIndex i;
  MPNowPlayingInfoLanguageOption *v7;
  void *v8;
  NSArray *v9;

  v2 = (const __CFArray *)MRLanguageOptionGroupCopyLanguageOptions();
  if (v2)
  {
    v3 = v2;
    Count = CFArrayGetCount(v2);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        v7 = -[MPNowPlayingInfoLanguageOption initWithMRLanguageOption:]([MPNowPlayingInfoLanguageOption alloc], "initWithMRLanguageOption:", CFArrayGetValueAtIndex(v3, i));
        objc_msgSend(v5, "addObject:", v7);

      }
    }
    CFRelease(v3);
  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v8 = v5;
  else
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v9 = v8;

  return v9;
}

- (MPNowPlayingInfoLanguageOption)defaultLanguageOption
{
  return -[MPNowPlayingInfoLanguageOption initWithMRLanguageOption:]([MPNowPlayingInfoLanguageOption alloc], "initWithMRLanguageOption:", MRLanguageOptionGroupGetDefaultLanguageOption());
}

- (BOOL)allowEmptySelection
{
  JUMPOUT(0x194038164);
}

- (void)mrLanguageOptionGroup
{
  return self->_mrLanguageOptionGroup;
}

@end
