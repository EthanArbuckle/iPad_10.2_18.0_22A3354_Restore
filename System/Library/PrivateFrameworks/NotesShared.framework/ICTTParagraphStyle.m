@implementation ICTTParagraphStyle

- (BOOL)isBlockQuote
{
  return -[ICTTParagraphStyle blockQuoteLevel](self, "blockQuoteLevel") != 0;
}

- (BOOL)isList
{
  if (-[ICTTParagraphStyle isUnknownStyle](self, "isUnknownStyle"))
    return -[ICTTParagraphStyle hints](self, "hints") & 1;
  if (-[ICTTParagraphStyle style](self, "style") == 103
    || -[ICTTParagraphStyle style](self, "style") == 100
    || -[ICTTParagraphStyle style](self, "style") == 101)
  {
    return 1;
  }
  return -[ICTTParagraphStyle style](self, "style") == 102;
}

- (BOOL)isUnknownStyle
{
  unsigned int style;

  style = self->_style;
  return style > 0x67 || style - 6 < 0x5E;
}

- (NSUUID)todoTrackingUUID
{
  void *v2;
  void *v3;

  -[ICTTParagraphStyle todo](self, "todo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[ICTTParagraphStyle isEqualToParagraphStyle:](self, "isEqualToParagraphStyle:", a3);
}

- (BOOL)isEqualToParagraphStyle:(id)a3
{
  _BOOL4 v5;

  if (a3)
  {
    v5 = -[ICTTParagraphStyle isEqualToModelParagraphStyle:](self, "isEqualToModelParagraphStyle:");
    if (v5)
      LOBYTE(v5) = self->_needsListCleanup == *((unsigned __int8 *)a3 + 9)
                && self->_needsParagraphCleanup == *((unsigned __int8 *)a3 + 8);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)needsParagraphCleanup
{
  return self->_needsParagraphCleanup;
}

- (BOOL)needsListCleanup
{
  return self->_needsListCleanup;
}

- (BOOL)isEqualToModelParagraphStyle:(id)a3
{
  NSUUID *uuid;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  char v14;

  if (!a3
    || !-[ICTTParagraphStyle isHierarchicallyEqualToParagraphStyle:](self, "isHierarchicallyEqualToParagraphStyle:")
    || self->_writingDirection != *((_QWORD *)a3 + 4))
  {
    return 0;
  }
  uuid = self->_uuid;
  v6 = (void *)*((_QWORD *)a3 + 9);
  v7 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((NSUUID *)*MEMORY[0x1E0C9B0D0] == uuid)
    uuid = 0;
  v8 = uuid;
  if (v7 == v6)
    v9 = 0;
  else
    v9 = v6;
  v10 = v9;
  v11 = (void *)v10;
  if ((unint64_t)v8 | v10)
  {
    if (v8)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (v12)
      v14 = 0;
    else
      v14 = objc_msgSend(v8, "isEqual:", v10);
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t style;
  uint64_t hints;
  unint64_t v5;
  uint64_t v6;
  int8x16_t v7;
  int8x16_t v9;
  int8x16_t v10;

  v10 = (int8x16_t)vshlq_u64(*(uint64x2_t *)&self->_indent, (uint64x2_t)xmmword_1BDC16770);
  v9 = (int8x16_t)vshlq_u64(*(uint64x2_t *)&self->_alignment, (uint64x2_t)xmmword_1BDC16780);
  style = self->_style;
  hints = self->_hints;
  v5 = -[ICTTTodo hash](self->_todo, "hash");
  v6 = -[NSUUID hash](self->_uuid, "hash");
  v7 = veorq_s8(v9, v10);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v7.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)) ^ style ^ v6 ^ hints ^ v5;
}

- (unsigned)style
{
  return self->_style;
}

- (ICTTTodo)todo
{
  return self->_todo;
}

- (int64_t)writingDirection
{
  return self->_writingDirection;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (unint64_t)blockQuoteLevel
{
  return self->_blockQuoteLevel;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unint64_t)indent
{
  return self->_indent;
}

- (unsigned)hints
{
  return self->_hints;
}

- (unint64_t)startingItemNumber
{
  return self->_startingItemNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_todo, 0);
}

- (ICTTParagraphStyle)initWithArchive:(const void *)a3
{
  ICTTParagraphStyle *v4;
  ICTTParagraphStyle *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  int v9;
  ICTTTodo *v10;
  ICTTTodo *v11;
  uint64_t v12;
  ICTTTodo *v13;
  id v14;
  uint64_t *v15;
  void *v16;

  v4 = -[ICTTParagraphStyle init](self, "init");
  v5 = v4;
  if (v4)
  {
    if ((*((_DWORD *)a3 + 8) & 1) != 0)
      v6 = *((unsigned int *)a3 + 10);
    else
      v6 = 3;
    -[ICTTParagraphStyle setStyle:](v4, "setStyle:", v6);
    if ((*((_BYTE *)a3 + 32) & 2) != 0)
      v7 = +[ICTTParagraphStyle textAlignmentForParagraphStyleAlignment:](ICTTParagraphStyle, "textAlignmentForParagraphStyleAlignment:", *((unsigned int *)a3 + 11));
    else
      v7 = ICTTParagraphStyleAlignmentDefault;
    -[ICTTParagraphStyle setAlignment:](v5, "setAlignment:", v7);
    if ((*((_BYTE *)a3 + 32) & 4) != 0)
      v8 = +[ICTTMergeableAttributedString writingDirectionForAttribute:](ICTTMergeableAttributedString, "writingDirectionForAttribute:", *((unsigned int *)a3 + 12));
    else
      v8 = -1;
    -[ICTTParagraphStyle setWritingDirection:](v5, "setWritingDirection:", v8);
    v9 = *((_DWORD *)a3 + 8);
    if ((v9 & 8) != 0)
    {
      -[ICTTParagraphStyle setIndent:](v5, "setIndent:", *((int *)a3 + 13));
      v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 0x80) != 0)
    {
      -[ICTTParagraphStyle setBlockQuoteLevel:](v5, "setBlockQuoteLevel:", *((unsigned int *)a3 + 20));
      v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 0x40) != 0)
    {
      -[ICTTParagraphStyle setStartingItemNumber:](v5, "setStartingItemNumber:", *((unsigned int *)a3 + 17));
      v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 0x10) != 0)
    {
      v10 = [ICTTTodo alloc];
      v11 = v10;
      v12 = *((_QWORD *)a3 + 7);
      if (!v12)
        v12 = *(_QWORD *)(topotext::ParagraphStyle::default_instance((topotext::ParagraphStyle *)v10) + 56);
      v13 = -[ICTTTodo initWithArchive:](v11, "initWithArchive:", v12);
      -[ICTTParagraphStyle setTodo:](v5, "setTodo:", v13);

      v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 0x20) != 0)
    {
      -[ICTTParagraphStyle setHints:](v5, "setHints:", *((unsigned int *)a3 + 16));
      v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 0x100) != 0)
    {
      v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v15 = (uint64_t *)*((_QWORD *)a3 + 9);
      if (*((char *)v15 + 23) < 0)
        v15 = (uint64_t *)*v15;
      v16 = (void *)objc_msgSend(v14, "initWithUUIDBytes:", v15);
      -[ICTTParagraphStyle setUuid:](v5, "setUuid:", v16);

    }
  }
  return v5;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (void)setWritingDirection:(int64_t)a3
{
  self->_writingDirection = a3;
}

- (void)setStyle:(unsigned int)a3
{
  ICTTTodo *todo;
  ICTTTodo *v5;

  self->_style = a3;
  todo = self->_todo;
  if (a3 != 103)
  {
    v5 = 0;
LABEL_6:
    self->_todo = v5;

    return;
  }
  if (!todo)
  {
    v5 = objc_alloc_init(ICTTTodo);
    todo = self->_todo;
    goto LABEL_6;
  }
}

- (ICTTParagraphStyle)init
{
  ICTTParagraphStyle *v2;
  ICTTParagraphStyle *v3;
  uint64_t v4;
  NSUUID *uuid;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICTTParagraphStyle;
  v2 = -[ICTTParagraphStyle init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_style = 3;
    v2->_alignment = ICTTParagraphStyleAlignmentDefault;
    v2->_writingDirection = -1;
    if (ICInternalSettingsIsCollapsibleSectionsEnabled())
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v4 = objc_claimAutoreleasedReturnValue();
      uuid = v3->_uuid;
      v3->_uuid = (NSUUID *)v4;

    }
  }
  return v3;
}

+ (int64_t)textAlignmentForParagraphStyleAlignment:(int)a3
{
  if (a3 >= 4)
    return 4;
  else
    return a3;
}

- (BOOL)uniqueToLine
{
  return -[ICTTParagraphStyle style](self, "style") == 103;
}

- (id)listBulletInAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;

  v6 = a3;
  v7 = -[ICTTParagraphStyle style](self, "style");
  if (v7 == 101)
  {
    v11 = CFSTR("–");
  }
  else if (v7 == 102)
  {
    objc_msgSend(v6, "attribute:atIndex:effectiveRange:", TTPresentationAttributeNameItemNumber, a4, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (a4 && !v8)
    {
      objc_msgSend(v6, "attribute:atIndex:effectiveRange:", TTPresentationAttributeNameItemNumber, a4 - 1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld."), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(&unk_1E771ABF0, "objectAtIndexedSubscript:", -[ICTTParagraphStyle indent](self, "indent") % objc_msgSend(&unk_1E771ABF0, "count"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)isRTL
{
  return -[ICTTParagraphStyle writingDirection](self, "writingDirection") == 1;
}

+ (int)paragraphStyleAlignmentForTextAlignment:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
    return 4;
  else
    return a3;
}

- (ICTTParagraphStyle)initWithData:(id)a3
{
  id v4;
  id v5;
  char *v6;
  int v7;
  ICTTParagraphStyle *v8;
  NSObject *v9;
  _BYTE v11[88];

  v4 = a3;
  topotext::ParagraphStyle::ParagraphStyle((topotext::ParagraphStyle *)v11);
  v5 = objc_retainAutorelease(v4);
  v6 = (char *)objc_msgSend(v5, "bytes");
  v7 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v5, "length"));
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, v6, v7))
  {
    self = -[ICTTParagraphStyle initWithArchive:](self, "initWithArchive:", v11);
    v8 = self;
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICTTParagraphStyle(ICTTParagraphStylePersistenceAdditions) initWithData:].cold.1(v9);

    v8 = 0;
  }
  topotext::ParagraphStyle::~ParagraphStyle((topotext::ParagraphStyle *)v11);

  return v8;
}

- (void)saveToArchive:(void *)a3
{
  unsigned int v5;
  int64_t v6;
  topotext *v7;
  int v8;
  topotext *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  topotext::Todo *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (-[ICTTParagraphStyle style](self, "style") != 3)
  {
    v5 = -[ICTTParagraphStyle style](self, "style");
    *((_DWORD *)a3 + 8) |= 1u;
    *((_DWORD *)a3 + 10) = v5;
  }
  v6 = -[ICTTParagraphStyle alignment](self, "alignment");
  if (v6 != ICTTParagraphStyleAlignmentDefault)
  {
    v7 = (topotext *)+[ICTTParagraphStyle paragraphStyleAlignmentForTextAlignment:](ICTTParagraphStyle, "paragraphStyleAlignmentForTextAlignment:", -[ICTTParagraphStyle alignment](self, "alignment"));
    v8 = (int)v7;
    if (!topotext::AttributeRun_WritingDirection_IsValid(v7))
      -[ICTTParagraphStyle(ICTTParagraphStylePersistenceAdditions) saveToArchive:].cold.3();
    *((_DWORD *)a3 + 8) |= 2u;
    *((_DWORD *)a3 + 11) = v8;
  }
  if (-[ICTTParagraphStyle writingDirection](self, "writingDirection") != -1)
  {
    v9 = (topotext *)+[ICTTMergeableAttributedString attributeForWritingDirection:](ICTTMergeableAttributedString, "attributeForWritingDirection:", -[ICTTParagraphStyle writingDirection](self, "writingDirection"));
    v10 = (int)v9;
    if (!topotext::AttributeRun_WritingDirection_IsValid(v9))
      -[ICTTParagraphStyle(ICTTParagraphStylePersistenceAdditions) saveToArchive:].cold.2();
    *((_DWORD *)a3 + 8) |= 4u;
    *((_DWORD *)a3 + 12) = v10;
  }
  if (-[ICTTParagraphStyle indent](self, "indent"))
  {
    v11 = -[ICTTParagraphStyle indent](self, "indent");
    *((_DWORD *)a3 + 8) |= 8u;
    *((_DWORD *)a3 + 13) = v11;
  }
  if (-[ICTTParagraphStyle blockQuoteLevel](self, "blockQuoteLevel"))
  {
    v12 = -[ICTTParagraphStyle blockQuoteLevel](self, "blockQuoteLevel");
    *((_DWORD *)a3 + 8) |= 0x80u;
    *((_DWORD *)a3 + 20) = v12;
  }
  if (-[ICTTParagraphStyle startingItemNumber](self, "startingItemNumber"))
  {
    v13 = -[ICTTParagraphStyle startingItemNumber](self, "startingItemNumber");
    *((_DWORD *)a3 + 8) |= 0x40u;
    *((_DWORD *)a3 + 17) = v13;
  }
  -[ICTTParagraphStyle todo](self, "todo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ICTTParagraphStyle todo](self, "todo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)a3 + 8) |= 0x10u;
    v16 = (topotext::Todo *)*((_QWORD *)a3 + 7);
    if (!v16)
    {
      v16 = (topotext::Todo *)operator new();
      topotext::Todo::Todo(v16);
      *((_QWORD *)a3 + 7) = v16;
    }
    objc_msgSend(v15, "saveToArchive:", v16);

  }
  if (-[ICTTParagraphStyle hints](self, "hints"))
  {
    v17 = -[ICTTParagraphStyle hints](self, "hints");
    *((_DWORD *)a3 + 8) |= 0x20u;
    *((_DWORD *)a3 + 16) = v17;
  }
  -[ICTTParagraphStyle uuid](self, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v21[0] = 0;
    v21[1] = 0;
    -[ICTTParagraphStyle uuid](self, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "getUUIDBytes:", v21);

    *((_DWORD *)a3 + 8) |= 0x100u;
    if (!google::protobuf::internal::empty_string_)
      -[ICTTParagraphStyle(ICTTParagraphStylePersistenceAdditions) saveToArchive:].cold.1();
    if (*((_QWORD *)a3 + 9) == google::protobuf::internal::empty_string_)
    {
      v20 = (_QWORD *)operator new();
      *v20 = 0;
      v20[1] = 0;
      v20[2] = 0;
      *((_QWORD *)a3 + 9) = v20;
    }
    MEMORY[0x1C3B7A7E8]();
  }
}

- (id)serialize
{
  id v3;
  void *v4;
  int v5;
  _BYTE v7[88];

  topotext::ParagraphStyle::ParagraphStyle((topotext::ParagraphStyle *)v7);
  -[ICTTParagraphStyle saveToArchive:](self, "saveToArchive:", v7);
  v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)topotext::ParagraphStyle::ByteSize((topotext::ParagraphStyle *)v7)));
  v4 = (void *)objc_msgSend(v3, "mutableBytes");
  v5 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v3, "length"));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v7, v4, v5);
  topotext::ParagraphStyle::~ParagraphStyle((topotext::ParagraphStyle *)v7);
  return v3;
}

- (ICTTParagraphStyle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ICTTParagraphStyle *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufArchiveKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICTTParagraphStyle initWithData:](self, "initWithData:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ICTTParagraphStyle serialize](self, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("protobufArchiveKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultParagraphStyle
{
  if (defaultParagraphStyle_onceToken != -1)
    dispatch_once(&defaultParagraphStyle_onceToken, &__block_literal_global_56);
  return (id)defaultParagraphStyle_defaultParagraphStyle;
}

void __43__ICTTParagraphStyle_defaultParagraphStyle__block_invoke()
{
  ICTTParagraphStyle *v0;
  void *v1;

  v0 = objc_alloc_init(ICTTParagraphStyle);
  v1 = (void *)defaultParagraphStyle_defaultParagraphStyle;
  defaultParagraphStyle_defaultParagraphStyle = (uint64_t)v0;

}

+ (id)paragraphStyleNamed:(unsigned int)a3
{
  uint64_t v3;
  ICTTParagraphStyle *v4;

  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc_init(ICTTParagraphStyle);
  -[ICTTParagraphStyle setStyle:](v4, "setStyle:", v3);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  ICTTMutableParagraphStyle *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(ICTTMutableParagraphStyle);
  -[ICTTParagraphStyle todo](self, "todo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTParagraphStyle setTodo:](v4, "setTodo:", v5);

  -[ICTTParagraphStyle setStyle:](v4, "setStyle:", -[ICTTParagraphStyle style](self, "style"));
  -[ICTTParagraphStyle setAlignment:](v4, "setAlignment:", self->_alignment);
  -[ICTTParagraphStyle setWritingDirection:](v4, "setWritingDirection:", self->_writingDirection);
  -[ICTTParagraphStyle setIndent:](v4, "setIndent:", -[ICTTParagraphStyle indent](self, "indent"));
  -[ICTTParagraphStyle setBlockQuoteLevel:](v4, "setBlockQuoteLevel:", -[ICTTParagraphStyle blockQuoteLevel](self, "blockQuoteLevel"));
  -[ICTTParagraphStyle setStartingItemNumber:](v4, "setStartingItemNumber:", -[ICTTParagraphStyle startingItemNumber](self, "startingItemNumber"));
  -[ICTTParagraphStyle setHints:](v4, "setHints:", -[ICTTParagraphStyle hints](self, "hints"));
  -[ICTTParagraphStyle setNeedsParagraphCleanup:](v4, "setNeedsParagraphCleanup:", -[ICTTParagraphStyle needsParagraphCleanup](self, "needsParagraphCleanup"));
  -[ICTTParagraphStyle setNeedsListCleanup:](v4, "setNeedsListCleanup:", -[ICTTParagraphStyle needsListCleanup](self, "needsListCleanup"));
  -[ICTTParagraphStyle uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTParagraphStyle setUuid:](v4, "setUuid:", v6);

  return v4;
}

- (BOOL)isEqualToModelComparable:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[ICTTParagraphStyle isEqualToModelParagraphStyle:](self, "isEqualToModelParagraphStyle:", a3);
}

- (BOOL)isHierarchicallyEqualToParagraphStyle:(id)a3
{
  ICTTTodo *todo;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  BOOL v10;
  char v12;

  if (!a3
    || self->_style != *((_DWORD *)a3 + 3)
    || self->_alignment != *((_QWORD *)a3 + 3)
    || self->_indent != *((_QWORD *)a3 + 5)
    || self->_blockQuoteLevel != *((_QWORD *)a3 + 6)
    || self->_startingItemNumber != *((_QWORD *)a3 + 7)
    || self->_hints != *((_DWORD *)a3 + 4))
  {
    return 0;
  }
  todo = self->_todo;
  v4 = (void *)*((_QWORD *)a3 + 8);
  v5 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((ICTTTodo *)*MEMORY[0x1E0C9B0D0] == todo)
    todo = 0;
  v6 = todo;
  if (v5 == v4)
    v7 = 0;
  else
    v7 = v4;
  v8 = v7;
  v9 = (void *)v8;
  if ((unint64_t)v6 | v8)
  {
    if (v6)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (v10)
      v12 = 0;
    else
      v12 = objc_msgSend(v6, "isEqual:", v8);
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)canIndent
{
  return -[ICTTParagraphStyle isList](self, "isList") || -[ICTTParagraphStyle style](self, "style") == 3;
}

- (void)setIndent:(unint64_t)a3
{
  uint64_t v3;

  v3 = ICTTParagraphStyleMaximumIndent;
  if (ICTTParagraphStyleMaximumIndent >= a3)
    v3 = a3;
  self->_indent = v3;
}

- (void)setBlockQuoteLevel:(unint64_t)a3
{
  self->_blockQuoteLevel = a3;
}

- (BOOL)isHeader
{
  unsigned int v3;

  v3 = -[ICTTParagraphStyle style](self, "style");
  if (v3 != 1)
    LOBYTE(v3) = -[ICTTParagraphStyle style](self, "style") == 2 || -[ICTTParagraphStyle style](self, "style") == 0;
  return v3;
}

- (BOOL)preferSingleLine
{
  _BOOL4 v3;

  if (-[ICTTParagraphStyle isUnknownStyle](self, "isUnknownStyle"))
  {
    return (-[ICTTParagraphStyle hints](self, "hints") >> 1) & 1;
  }
  else if (-[ICTTParagraphStyle style](self, "style") == 3 || -[ICTTParagraphStyle style](self, "style") == 4)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    LOBYTE(v3) = !-[ICTTParagraphStyle isList](self, "isList");
  }
  return v3;
}

- (BOOL)wantsFollowingNewLine
{
  return -[ICTTParagraphStyle isList](self, "isList")
      || -[ICTTParagraphStyle style](self, "style") == 4
      || -[ICTTParagraphStyle isBlockQuote](self, "isBlockQuote");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  __CFString *v8;
  __CFString *v9;
  _BOOL4 v10;
  __CFString *v11;
  __CFString *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  _BOOL4 v20;
  const __CFString *v21;
  void *v22;
  void *v24;
  __CFString *v25;

  -[ICTTParagraphStyle todo](self, "todo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[ICTTParagraphStyle todo](self, "todo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR(" todo=%@"), v6);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = &stru_1E76DB108;
  }

  if (-[ICTTParagraphStyle writingDirection](self, "writingDirection"))
  {
    v7 = -[ICTTParagraphStyle writingDirection](self, "writingDirection");
    v8 = CFSTR("Natural");
    if (v7 == 1)
      v8 = CFSTR("RTL");
  }
  else
  {
    v8 = CFSTR("LTR");
  }
  v9 = v8;
  v10 = -[ICTTParagraphStyle needsParagraphCleanup](self, "needsParagraphCleanup");
  v11 = CFSTR(" needsParagraphCleanup");
  if (!v10)
    v11 = &stru_1E76DB108;
  v24 = (void *)MEMORY[0x1E0CB3940];
  v12 = v11;
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ICTTParagraphStyle style](self, "style");
  v16 = -[ICTTParagraphStyle alignment](self, "alignment");
  v17 = -[ICTTParagraphStyle indent](self, "indent");
  v18 = -[ICTTParagraphStyle blockQuoteLevel](self, "blockQuoteLevel");
  -[ICTTParagraphStyle uuid](self, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ICTTParagraphStyle needsListCleanup](self, "needsListCleanup");
  v21 = CFSTR(" needsListCleanup");
  if (!v20)
    v21 = &stru_1E76DB108;
  objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@: %p style=%lu alignment=%lu indent=%ld blockQuoteLevel=%ld uuid=%@ %@%@%@%@>"), v14, self, v15, v16, v17, v18, v19, v9, v25, v12, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v22;
}

- (void)setStartingItemNumber:(unint64_t)a3
{
  self->_startingItemNumber = a3;
}

- (void)setTodo:(id)a3
{
  objc_storeStrong((id *)&self->_todo, a3);
}

- (void)setHints:(unsigned int)a3
{
  self->_hints = a3;
}

- (void)setNeedsParagraphCleanup:(BOOL)a3
{
  self->_needsParagraphCleanup = a3;
}

- (void)setNeedsListCleanup:(BOOL)a3
{
  self->_needsListCleanup = a3;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

@end
