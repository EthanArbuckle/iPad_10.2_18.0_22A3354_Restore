@implementation EMFEmojiStringGenderVariantFactory

- (EMFEmojiStringGenderVariantFactory)initWithSourceString:(id)a3 gender:(int)a4
{
  id v6;
  EMFEmojiStringGenderVariantFactory *v7;
  uint64_t v8;
  NSString *sourceString;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMFEmojiStringGenderVariantFactory;
  v7 = -[EMFEmojiStringGenderVariantFactory init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    sourceString = v7->_sourceString;
    v7->_sourceString = (NSString *)v8;

    v7->_gender = a4;
  }

  return v7;
}

- (id)stringForGenderVariant:(int)a3
{
  __CFString *v6;
  CFIndex Length;
  CFIndex v8;
  CFIndex v9;
  uint64_t v10;
  int CharacterAtIndex;
  CFIndex v12;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  _OWORD v29[4];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_sourceString, "length") >= 0x11)
  {
    -[EMFEmojiStringGenderVariantFactory sourceString](self, "sourceString");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  memset(v29, 0, sizeof(v29));
  -[EMFEmojiStringGenderVariantFactory sourceString](self, "sourceString");
  v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  Length = CFStringGetLength(v6);
  if (Length < 1)
  {

    goto LABEL_25;
  }
  v8 = Length;
  v28 = a3;
  v9 = 0;
  v10 = 0;
  do
  {
    CharacterAtIndex = CFStringGetCharacterAtIndex(v6, v9);
    v12 = v9 + 1;
    if ((CharacterAtIndex & 0xFC00) == 0xD800 && v12 < v8)
    {
      v14 = CFStringGetCharacterAtIndex(v6, v9 + 1);
      if ((v14 & 0xFC00) != 0xDC00)
      {
        ++v9;
        continue;
      }
      CharacterAtIndex = v14 + (CharacterAtIndex << 10) - 56613888;
    }
    else
    {
      v12 = v9;
    }
    *((_DWORD *)v29 + v10++) = CharacterAtIndex;
    v9 = v12 + 1;
  }
  while (v9 < v8 && v9 != 16);
  if (v9 < v8)
    v15 = 0;
  else
    v15 = v10;
  v16 = v29[0];

  a3 = v28;
  if ((v16 - 128104) < 2 || v16 == 129489)
  {
    if ((v28 - 1) > 2)
      v17 = 0;
    else
      v17 = dword_1B3E3B9E8[v28 - 1];
    LODWORD(v29[0]) = v17;
    goto LABEL_43;
  }
LABEL_25:
  v18 = DWORD1(v29[0]);
  if (DWORD1(v29[0]) == 65039)
    v15 = 2;
  else
    v15 = 1;
  if (a3 != 3)
  {
    *((_DWORD *)v29 + v15) = 8205;
    if (a3 == 2)
      v19 = 9792;
    else
      v19 = 0;
    if (a3 == 1)
      v19 = 9794;
    v20 = v18 == 65039;
    v21 = 8;
    if (v20)
      v21 = 12;
    *(_DWORD *)((unint64_t)v29 | v21) = v19;
    v22 = 16;
    if (!v20)
      v22 = 12;
    *(_DWORD *)((char *)v29 + v22) = 65039;
    if (v20)
      v15 = 5;
    else
      v15 = 4;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v29, 4 * v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v23, 2617245952);
  v25 = v24;
  if (v24)
  {
    v26 = v24;
  }
  else
  {
    -[EMFEmojiStringGenderVariantFactory sourceString](self, "sourceString");
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = v26;

  return v27;
}

- (NSString)sourceString
{
  return self->_sourceString;
}

- (void)setSourceString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)gender
{
  return self->_gender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceString, 0);
}

@end
