@implementation CKPhoneNumberCompressor

- (id)compress
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CKPhoneNumberCompressor _compressPhoneNumberIfFitsInCompressionLevel:](self, "_compressPhoneNumberIfFitsInCompressionLevel:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[CKPhoneNumberCompressor preferredCompressions](self, "preferredCompressions", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          -[CKPhoneNumberCompressor _compressPhoneNumberIfFitsInCompressionLevel:](self, "_compressPhoneNumberIfFitsInCompressionLevel:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "intValue"));
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v3 = (void *)v9;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
    v3 = 0;
LABEL_12:

  }
  return v3;
}

- (id)_compressPhoneNumberIfFitsInCompressionLevel:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  uint64_t v12;
  _QWORD v13[2];

  v3 = *(_QWORD *)&a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  -[CKPhoneNumberCompressor phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x193FF3E10](v5, 0, v3);

  v12 = *MEMORY[0x1E0DC1138];
  -[CKPhoneNumberCompressor font](self, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sizeWithAttributes:", v8);
  v9 = 0;
  if (v10 < self->_desiredWidth)
    v9 = v6;

  return v9;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (double)desiredWidth
{
  return self->_desiredWidth;
}

- (void)setDesiredWidth:(double)a3
{
  self->_desiredWidth = a3;
}

- (NSArray)preferredCompressions
{
  return self->_preferredCompressions;
}

- (void)setPreferredCompressions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredCompressions, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end
