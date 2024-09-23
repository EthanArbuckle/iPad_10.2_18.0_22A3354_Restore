@implementation NSBundle(MNExtras)

+ (uint64_t)_navigation_isRunningInSiri
{
  if (qword_1ED0C3F68 != -1)
    dispatch_once(&qword_1ED0C3F68, &__block_literal_global_21);
  return _MergedGlobals_29;
}

+ (uint64_t)_navigation_implementsSiriMethod
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__NSBundle_MNExtras___navigation_implementsSiriMethod__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0C3F70 != -1)
    dispatch_once(&qword_1ED0C3F70, block);
  return byte_1ED0C3F61;
}

+ (id)_navigationBundle
{
  if (qword_1ED0C3F80 != -1)
    dispatch_once(&qword_1ED0C3F80, &__block_literal_global_6);
  return (id)qword_1ED0C3F78;
}

- (id)_navigation_localizedStringForKey:()MNExtras value:table:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x1E0CB34D0], "_navigation_isRunningInSiri")
    && objc_msgSend(MEMORY[0x1E0CB34D0], "_navigation_implementsSiriMethod"))
  {
    objc_msgSend(a1, "siriUILocalizedStringForKey:value:table:", v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "localizedStringForKey:value:table:", v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  return v12;
}

@end
