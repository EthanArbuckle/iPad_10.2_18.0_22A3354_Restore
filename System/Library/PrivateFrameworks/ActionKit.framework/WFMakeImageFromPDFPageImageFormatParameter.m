@implementation WFMakeImageFromPDFPageImageFormatParameter

- (id)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    objc_msgSend(MEMORY[0x24BE19538], "imageTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "if_compactMap:", &__block_literal_global_25321);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_possibleStates;
    self->_possibleStates = v6;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)readableStringFromFileTypeString:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.atx")) & 1) != 0)
  {
    v4 = CFSTR("ATX");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("org.khronos.ktx")) & 1) != 0)
  {
    v4 = CFSTR("KTX textures");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("org.khronos.astc")) & 1) != 0)
  {
    v4 = CFSTR("ASTC textures");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.microsoft.dds")) & 1) != 0)
  {
    v4 = CFSTR("DDS textures");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("public.pbm")) & 1) != 0)
  {
    v4 = CFSTR("Portable Bitmap Format");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("public.pvr")) & 1) != 0)
  {
    v4 = CFSTR("PVRTC textures");
  }
  else
  {
    v4 = (__CFString *)v3;
  }

  return v4;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BEC14A0];
  objc_msgSend(a3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "typeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v6, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFMakeImageFromPDFPageImageFormatParameter readableStringFromFileTypeString:](self, "readableStringFromFileTypeString:", v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)defaultSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84F8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEC40C8];
  objc_msgSend(v2, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serializedRepresentationFromValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __60__WFMakeImageFromPDFPageImageFormatParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithValue:", v5);
  return v6;
}

@end
