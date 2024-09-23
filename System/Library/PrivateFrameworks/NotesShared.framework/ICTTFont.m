@implementation ICTTFont

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[ICTTFont fontName](self, "fontName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9
      || (-[ICTTFont fontName](self, "fontName"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "fontName"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqualToString:", v4)))
    {
      -[ICTTFont pointSize](self, "pointSize");
      v12 = v11;
      objc_msgSend(v7, "pointSize");
      if (v12 == v13)
      {
        v14 = -[ICTTFont fontHints](self, "fontHints");
        v10 = v14 == objc_msgSend(v7, "fontHints");
      }
      else
      {
        v10 = 0;
      }
      if (v8 == v9)
        goto LABEL_11;
    }
    else
    {
      v10 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  double v5;
  unint64_t v6;

  -[ICTTFont fontName](self, "fontName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ICTTFont pointSize](self, "pointSize");
  v6 = v4 ^ -[ICTTFont fontHints](self, "fontHints") ^ (unint64_t)v5;

  return v6;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (unsigned)fontHints
{
  return self->_fontHints;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nativeFont, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
}

- (ICTTFont)initWithArchive:(const void *)a3
{
  int v5;
  void *v6;
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  ICTTFont *v12;
  double v13;
  ICTTFont *v14;

  v5 = *((_DWORD *)a3 + 8);
  if ((v5 & 1) != 0)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = (uint64_t *)*((_QWORD *)a3 + 5);
    if (*((char *)v8 + 23) < 0)
    {
      v8 = (uint64_t *)*v8;
      v9 = *(_QWORD *)(*((_QWORD *)a3 + 5) + 8);
    }
    else
    {
      v9 = *((unsigned __int8 *)v8 + 23);
    }
    v10 = objc_msgSend(v7, "initWithBytes:length:encoding:", v8, v9, 4);
    v5 = *((_DWORD *)a3 + 8);
    v6 = (void *)v10;
  }
  else
  {
    v6 = 0;
  }
  v11 = *((float *)a3 + 12);
  v12 = [ICTTFont alloc];
  v13 = v11;
  if ((v5 & 2) == 0)
    v13 = 0.0;
  v14 = -[ICTTFont initWithName:size:hints:](v12, "initWithName:size:hints:", v6, *((_DWORD *)a3 + 13) & ((int)(*((_DWORD *)a3 + 8) << 29) >> 31), v13);

  return v14;
}

- (ICTTFont)initWithName:(id)a3 size:(double)a4 hints:(unsigned int)a5
{
  id v8;
  ICTTFont *v9;
  uint64_t v10;
  NSString *fontName;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICTTFont;
  v9 = -[ICTTFont init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    fontName = v9->_fontName;
    v9->_fontName = (NSString *)v10;

    v9->_pointSize = a4;
    v9->_fontHints = a5;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  char v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTFont fontName](self, "fontName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTFont pointSize](self, "pointSize");
  v8 = v7;
  if ((-[ICTTFont fontHints](self, "fontHints") & 1) != 0)
    v9 = CFSTR(" bold");
  else
    v9 = &stru_1E76DB108;
  v10 = -[ICTTFont fontHints](self, "fontHints");
  v11 = CFSTR(" italic");
  if ((v10 & 2) == 0)
    v11 = &stru_1E76DB108;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ %0.1f%@%@>"), v5, self, v6, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)nativeFont
{
  return self->_nativeFont;
}

- (void)setNativeFont:(id)a3
{
  objc_storeStrong(&self->_nativeFont, a3);
}

- (ICTTFont)initWithData:(id)a3
{
  id v4;
  id v5;
  char *v6;
  int v7;
  ICTTFont *v8;
  NSObject *v9;
  _BYTE v11[56];

  v4 = a3;
  topotext::Font::Font((topotext::Font *)v11);
  v5 = objc_retainAutorelease(v4);
  v6 = (char *)objc_msgSend(v5, "bytes");
  v7 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v5, "length"));
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, v6, v7))
  {
    self = -[ICTTFont initWithArchive:](self, "initWithArchive:", v11);
    v8 = self;
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICTTParagraphStyle(ICTTParagraphStylePersistenceAdditions) initWithData:].cold.1(v9);

    v8 = 0;
  }
  topotext::Font::~Font((topotext::Font *)v11);

  return v8;
}

- (void)saveToArchive:(void *)a3
{
  void *v5;
  id v6;
  _QWORD *v7;
  double v8;
  double v9;
  unsigned int v10;

  -[ICTTFont fontName](self, "fontName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICTTFont fontName](self, "fontName");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "UTF8String");
    *((_DWORD *)a3 + 8) |= 1u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 5) == google::protobuf::internal::empty_string_)
    {
      v7 = (_QWORD *)operator new();
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
      *((_QWORD *)a3 + 5) = v7;
    }
    MEMORY[0x1C3B7A7DC]();

  }
  -[ICTTFont pointSize](self, "pointSize");
  if (v8 > 0.0)
  {
    -[ICTTFont pointSize](self, "pointSize");
    *(float *)&v9 = v9;
    *((_DWORD *)a3 + 8) |= 2u;
    *((_DWORD *)a3 + 12) = LODWORD(v9);
  }
  if (-[ICTTFont fontHints](self, "fontHints"))
  {
    v10 = -[ICTTFont fontHints](self, "fontHints");
    *((_DWORD *)a3 + 8) |= 4u;
    *((_DWORD *)a3 + 13) = v10;
  }
}

- (id)serialize
{
  id v3;
  void *v4;
  int v5;
  _BYTE v7[56];

  topotext::Font::Font((topotext::Font *)v7);
  -[ICTTFont saveToArchive:](self, "saveToArchive:", v7);
  v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)topotext::Font::ByteSize((topotext::Font *)v7)));
  v4 = (void *)objc_msgSend(v3, "mutableBytes");
  v5 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v3, "length"));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v7, v4, v5);
  topotext::Font::~Font((topotext::Font *)v7);
  return v3;
}

- (ICTTFont)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ICTTFont *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufArchiveKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICTTFont initWithData:](self, "initWithData:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ICTTFont serialize](self, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("protobufArchiveKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
