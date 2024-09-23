@implementation TKSmartCardPINFormat

- (TKSmartCardPINFormat)init
{
  TKSmartCardPINFormat *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TKSmartCardPINFormat;
  result = -[TKSmartCardPINFormat init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_charset = xmmword_1B97AAB90;
    *(_OWORD *)&result->_minPINLength = xmmword_1B97AABA0;
    result->_PINBlockByteLength = 8;
    *(_OWORD *)&result->_PINJustification = 0u;
    *(_OWORD *)&result->_PINLengthBitOffset = 0u;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardPINFormat)initWithCoder:(id)a3
{
  id v4;
  TKSmartCardPINFormat *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TKSmartCardPINFormat;
  v5 = -[TKSmartCardPINFormat init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("charset"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_charset = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encoding"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_encoding = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minPINLength"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_minPINLength = objc_msgSend(v8, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxPINLength"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxPINLength = objc_msgSend(v9, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PINBlockByteLength"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINBlockByteLength = objc_msgSend(v10, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PINJustification"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINJustification = objc_msgSend(v11, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PINBitOffset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINBitOffset = objc_msgSend(v12, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PINLengthBitOffset"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINLengthBitOffset = objc_msgSend(v13, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PINLengthBitSize"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINLengthBitSize = objc_msgSend(v14, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t charset;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  charset = self->_charset;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", charset);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("charset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_encoding);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("encoding"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minPINLength);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("minPINLength"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxPINLength);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("maxPINLength"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_PINBlockByteLength);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("PINBlockByteLength"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_PINJustification);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("PINJustification"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_PINBitOffset);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v13, CFSTR("PINBitOffset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_PINLengthBitOffset);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v14, CFSTR("PINLengthBitOffset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_PINLengthBitSize);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v15, CFSTR("PINLengthBitSize"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  TKSmartCardPINFormat *v4;

  v4 = objc_alloc_init(TKSmartCardPINFormat);
  -[TKSmartCardPINFormat setCharset:](v4, "setCharset:", -[TKSmartCardPINFormat charset](self, "charset"));
  -[TKSmartCardPINFormat setEncoding:](v4, "setEncoding:", -[TKSmartCardPINFormat encoding](self, "encoding"));
  -[TKSmartCardPINFormat setMinPINLength:](v4, "setMinPINLength:", -[TKSmartCardPINFormat minPINLength](self, "minPINLength"));
  -[TKSmartCardPINFormat setMaxPINLength:](v4, "setMaxPINLength:", -[TKSmartCardPINFormat maxPINLength](self, "maxPINLength"));
  -[TKSmartCardPINFormat setPINBlockByteLength:](v4, "setPINBlockByteLength:", -[TKSmartCardPINFormat PINBlockByteLength](self, "PINBlockByteLength"));
  -[TKSmartCardPINFormat setPINJustification:](v4, "setPINJustification:", -[TKSmartCardPINFormat PINJustification](self, "PINJustification"));
  -[TKSmartCardPINFormat setPINBitOffset:](v4, "setPINBitOffset:", -[TKSmartCardPINFormat PINBitOffset](self, "PINBitOffset"));
  -[TKSmartCardPINFormat setPINLengthBitOffset:](v4, "setPINLengthBitOffset:", -[TKSmartCardPINFormat PINLengthBitOffset](self, "PINLengthBitOffset"));
  -[TKSmartCardPINFormat setPINLengthBitSize:](v4, "setPINLengthBitSize:", -[TKSmartCardPINFormat PINLengthBitSize](self, "PINLengthBitSize"));
  return v4;
}

+ (void)_writeNumber:(unint64_t)a3 into:(id)a4 bitOffset:(int64_t)a5 bitLength:(int64_t)a6
{
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  int v15;
  int v16;
  unsigned int v17;

  if (a6 >= 1)
  {
    v9 = a6 + a5;
    v10 = -1;
    do
    {
      v11 = objc_msgSend(objc_retainAutorelease(a4), "mutableBytes");
      v12 = v9 + v10 + 7;
      if (v9 + v10 >= 0)
        v12 = v9 + v10;
      v13 = v12 >> 3;
      v14 = v9 + v10 - 8 * v13;
      v15 = *(unsigned __int8 *)(v11 + v13);
      v16 = v15 & (-129 >> v14);
      v17 = v15 | (0x80u >> v14);
      if ((a3 & 1) == 0)
        LOBYTE(v17) = v16;
      *(_BYTE *)(v11 + v13) = v17;
      a3 >>= 1;
      --v10;
    }
    while (a6 + v10 + 2 > 1);
  }
}

- (BOOL)fillPIN:(id)a3 intoAPDUTemplate:(id)a4 PINByteOffset:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  const char *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t *v20;
  void *v21;
  uint64_t v22;
  NSInteger v23;
  TKSmartCardPINEncoding v24;
  uint64_t v25;
  char v26;
  int v27;
  int v28;
  TKSmartCardPINCharset v29;
  char v30;
  BOOL v31;
  unsigned int v32;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = objc_retainAutorelease(a4);
  if (*(_BYTE *)(objc_msgSend(v11, "bytes") + 4))
  {
    v12 = 40;
  }
  else if ((unint64_t)objc_msgSend(v11, "length") <= 6)
  {
    v12 = 40;
  }
  else
  {
    v12 = 56;
  }
  v13 = objc_retainAutorelease(v10);
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  v15 = strlen(v14);
  if (v15 < -[TKSmartCardPINFormat minPINLength](self, "minPINLength")
    || v15 > -[TKSmartCardPINFormat maxPINLength](self, "maxPINLength"))
  {
    if (a6)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CB2D50];
      +[TKSmartCard _localizedString:](TKSmartCard, "_localizedString:", CFSTR("INVALID_PIN"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v17;
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = (void **)v38;
      v20 = &v37;
      goto LABEL_10;
    }
    goto LABEL_37;
  }
  v22 = v12 + 8 * a5;
  objc_msgSend((id)objc_opt_class(), "_writeNumber:into:bitOffset:bitLength:", v15, v11, -[TKSmartCardPINFormat PINLengthBitOffset](self, "PINLengthBitOffset") + v22, -[TKSmartCardPINFormat PINLengthBitSize](self, "PINLengthBitSize"));
  v23 = -[TKSmartCardPINFormat PINBitOffset](self, "PINBitOffset") + v22;
  v24 = -[TKSmartCardPINFormat encoding](self, "encoding");
  if (v24 == TKSmartCardPINEncodingBCD)
    v25 = 4;
  else
    v25 = 8;
  if (-[TKSmartCardPINFormat PINJustification](self, "PINJustification") == TKSmartCardPINJustificationRight)
  {
    v26 = 2;
    if (v24 != TKSmartCardPINEncodingBCD)
      v26 = 3;
    v23 = v23 - (v15 << v26) + 8 * -[TKSmartCardPINFormat PINBlockByteLength](self, "PINBlockByteLength");
  }
  if (v15 < 1)
  {
LABEL_36:
    LOBYTE(a6) = 1;
    goto LABEL_37;
  }
  while (1)
  {
    v28 = *(unsigned __int8 *)v14++;
    v27 = v28;
    v29 = -[TKSmartCardPINFormat charset](self, "charset");
    if (v29 == TKSmartCardPINCharsetUpperAlphanumeric)
    {
      v30 = v27 - 48;
      v31 = (v27 - 48) >= 0xA;
      v32 = (v27 - 65);
      goto LABEL_29;
    }
    if (v29 == TKSmartCardPINCharsetAlphanumeric)
      break;
    if (v29)
      goto LABEL_38;
    v30 = v27 - 48;
    if ((v27 - 48) >= 0xA)
      goto LABEL_38;
LABEL_33:
    if (-[TKSmartCardPINFormat encoding](self, "encoding") != TKSmartCardPINEncodingASCII)
      LOBYTE(v27) = v30;
    objc_msgSend((id)objc_opt_class(), "_writeNumber:into:bitOffset:bitLength:", v27, v11, v23, v25);
    v23 += v25;
    if (!--v15)
      goto LABEL_36;
  }
  v30 = v27 - 48;
  v31 = (v27 - 48) >= 0xA && (v27 - 65) >= 0x1Au;
  v32 = (v27 - 97);
LABEL_29:
  if (!v31 || v32 < 0x1A)
    goto LABEL_33;
LABEL_38:
  if (a6)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    +[TKSmartCard _localizedString:](TKSmartCard, "_localizedString:", CFSTR("INVALID_PIN"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v17;
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = &v36;
    v20 = &v35;
LABEL_10:
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -5, v21);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a6) = 0;
  }
LABEL_37:

  return (char)a6;
}

- (unsigned)PINFormatStringWithError:(id *)a3
{
  TKSmartCardPINEncoding v5;
  TKSmartCardPINEncoding v6;
  TKSmartCardPINJustification v7;
  char v8;
  NSInteger v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  unsigned __int8 result;

  v5 = -[TKSmartCardPINFormat encoding](self, "encoding");
  v6 = -[TKSmartCardPINFormat encoding](self, "encoding");
  v7 = -[TKSmartCardPINFormat PINJustification](self, "PINJustification");
  v8 = -[TKSmartCardPINFormat PINBitOffset](self, "PINBitOffset");
  v9 = -[TKSmartCardPINFormat PINBitOffset](self, "PINBitOffset");
  v10 = 8;
  if ((v8 & 7) != 0)
    v10 = 1;
  v11 = v9 / v10;
  if (v11 < 0x10)
    return (v5 == TKSmartCardPINEncodingBCD) | (2 * (v6 == TKSmartCardPINEncodingASCII)) & 0x87 | (4
                                                                                                 * (v7 == TKSmartCardPINJustificationRight)) & 0x87 | (8 * (v11 & 0xF)) | (((v8 & 7) == 0) << 7);
  TK_LOG_smartcard();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[TKSmartCardPINFormat PINFormatStringWithError:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -8, 0);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a3 = v20;
  return result;
}

- (unsigned)PINBlockString
{
  char v3;

  v3 = -[TKSmartCardPINFormat PINBlockByteLength](self, "PINBlockByteLength");
  return v3 & 0xF | (16 * -[TKSmartCardPINFormat PINLengthBitSize](self, "PINLengthBitSize"));
}

- (unsigned)PINLengthFormatWithError:(id *)a3
{
  char v5;
  NSInteger v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  unsigned __int8 v18;

  v5 = -[TKSmartCardPINFormat PINLengthBitOffset](self, "PINLengthBitOffset");
  v6 = -[TKSmartCardPINFormat PINLengthBitOffset](self, "PINLengthBitOffset");
  v7 = 8;
  if ((v5 & 7) != 0)
    v7 = 1;
  v8 = v6 / v7;
  if (v8 < 0x10)
    return v8 | (16 * ((v5 & 7) == 0));
  TK_LOG_smartcard();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[TKSmartCardPINFormat PINLengthFormatWithError:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -8, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  *a3 = v17;
  return v18;
}

- (unsigned)PINMaxExtraDigit
{
  __int16 v3;

  v3 = -[TKSmartCardPINFormat minPINLength](self, "minPINLength");
  return -[TKSmartCardPINFormat maxPINLength](self, "maxPINLength") | (unsigned __int16)(v3 << 8);
}

- (TKSmartCardPINCharset)charset
{
  return self->_charset;
}

- (void)setCharset:(TKSmartCardPINCharset)charset
{
  self->_charset = charset;
}

- (TKSmartCardPINEncoding)encoding
{
  return self->_encoding;
}

- (void)setEncoding:(TKSmartCardPINEncoding)encoding
{
  self->_encoding = encoding;
}

- (NSInteger)minPINLength
{
  return self->_minPINLength;
}

- (void)setMinPINLength:(NSInteger)minPINLength
{
  self->_minPINLength = minPINLength;
}

- (NSInteger)maxPINLength
{
  return self->_maxPINLength;
}

- (void)setMaxPINLength:(NSInteger)maxPINLength
{
  self->_maxPINLength = maxPINLength;
}

- (NSInteger)PINBlockByteLength
{
  return self->_PINBlockByteLength;
}

- (void)setPINBlockByteLength:(NSInteger)PINBlockByteLength
{
  self->_PINBlockByteLength = PINBlockByteLength;
}

- (TKSmartCardPINJustification)PINJustification
{
  return self->_PINJustification;
}

- (void)setPINJustification:(TKSmartCardPINJustification)PINJustification
{
  self->_PINJustification = PINJustification;
}

- (NSInteger)PINBitOffset
{
  return self->_PINBitOffset;
}

- (void)setPINBitOffset:(NSInteger)PINBitOffset
{
  self->_PINBitOffset = PINBitOffset;
}

- (NSInteger)PINLengthBitOffset
{
  return self->_PINLengthBitOffset;
}

- (void)setPINLengthBitOffset:(NSInteger)PINLengthBitOffset
{
  self->_PINLengthBitOffset = PINLengthBitOffset;
}

- (NSInteger)PINLengthBitSize
{
  return self->_PINLengthBitSize;
}

- (void)setPINLengthBitSize:(NSInteger)PINLengthBitSize
{
  self->_PINLengthBitSize = PINLengthBitSize;
}

- (void)PINFormatStringWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B9768000, a1, a3, "The 'PINBitOffset' is negative or can't fit", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)PINLengthFormatWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B9768000, a1, a3, "The 'PINLengthBitOffset' is negative or can't fit", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

@end
