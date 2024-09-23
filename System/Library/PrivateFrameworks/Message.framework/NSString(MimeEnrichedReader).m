@implementation NSString(MimeEnrichedReader)

+ (id)mf_stringFromMimeRichTextString:()MimeEnrichedReader asHTML:
{
  id v6;
  MFMimeEnrichedReader *v7;

  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (a3)
  {
    v7 = objc_alloc_init(MFMimeEnrichedReader);
    -[MFMimeEnrichedReader setWantsHTML:](v7, "setWantsHTML:", a4);
    -[MFMimeEnrichedReader convertRichTextString:intoOutputString:](v7, "convertRichTextString:intoOutputString:", a3, v6);

  }
  return v6;
}

+ (id)mf_stringFromMimeEnrichedString:()MimeEnrichedReader asHTML:
{
  id v6;
  MFMimeEnrichedReader *v7;

  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (a3)
  {
    v7 = objc_alloc_init(MFMimeEnrichedReader);
    -[MFMimeEnrichedReader setWantsHTML:](v7, "setWantsHTML:", a4);
    -[MFMimeEnrichedReader convertEnrichedString:intoOutputString:](v7, "convertEnrichedString:intoOutputString:", a3, v6);

  }
  return v6;
}

@end
