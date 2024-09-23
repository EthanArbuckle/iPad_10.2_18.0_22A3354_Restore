@implementation NTKLunarCalendarSentinel

- (NTKLunarCalendarSentinel)init
{
  NTKLunarCalendarSentinel *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKLunarCalendarSentinel;
  v2 = -[NTKLunarCalendarSentinel init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleLocaleChange, *MEMORY[0x1E0C99720], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleLocaleChange, *MEMORY[0x1E0CAA1E8], 0);

  }
  return v2;
}

- (void)_handleLocaleChange
{
  unsigned int v2;

  _NTKUpdateLunarCalendarID();
  do
    v2 = __ldaxr((unsigned int *)&_lunarSeed);
  while (__stlxr(v2 + 1, (unsigned int *)&_lunarSeed));
}

@end
