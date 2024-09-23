@implementation NSAttributedStringMarkdownSourcePosition

- (NSInteger)startLine
{
  return self->_startOffsets.line;
}

- (NSInteger)startColumn
{
  return self->_startOffsets.column;
}

- (NSInteger)endLine
{
  return self->_endOffsets.line;
}

- (NSInteger)endColumn
{
  return self->_endOffsets.column;
}

- (NSAttributedStringMarkdownSourcePosition)initWithStartLine:(NSInteger)startLine startColumn:(NSInteger)startColumn endLine:(NSInteger)endLine endColumn:(NSInteger)endColumn
{
  NSAttributedStringMarkdownSourcePosition *result;
  int64x2_t v11;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)NSAttributedStringMarkdownSourcePosition;
  result = -[NSAttributedStringMarkdownSourcePosition init](&v12, sel_init);
  if (result)
  {
    v11 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&result->_startOffsets.utf8Offset = v11;
    *(int64x2_t *)&result->_startOffsets.utf8NextCodePoint = v11;
    result->_startOffsets.line = startLine;
    result->_startOffsets.column = startColumn;
    *(int64x2_t *)&result->_endOffsets.utf8Offset = v11;
    *(int64x2_t *)&result->_endOffsets.utf8NextCodePoint = v11;
    result->_endOffsets.line = endLine;
    result->_endOffsets.column = endColumn;
  }
  return result;
}

- (NSAttributedStringMarkdownSourcePosition)initWithStart:(id *)a3 end:(id *)a4
{
  NSAttributedStringMarkdownSourcePosition *result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NSAttributedStringMarkdownSourcePosition;
  result = -[NSAttributedStringMarkdownSourcePosition init](&v11, sel_init);
  if (result)
  {
    v7 = *(_OWORD *)&a3->var0;
    v8 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&result->_startOffsets.line = *(_OWORD *)&a3->var4;
    *(_OWORD *)&result->_startOffsets.utf8NextCodePoint = v8;
    *(_OWORD *)&result->_startOffsets.utf8Offset = v7;
    v9 = *(_OWORD *)&a4->var0;
    v10 = *(_OWORD *)&a4->var2;
    *(_OWORD *)&result->_endOffsets.line = *(_OWORD *)&a4->var4;
    *(_OWORD *)&result->_endOffsets.utf8NextCodePoint = v10;
    *(_OWORD *)&result->_endOffsets.utf8Offset = v9;
  }
  return result;
}

- ($915FBD377EA738B5CB203B2EF22C919A)startOffsets
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->var5;
  return self;
}

- ($915FBD377EA738B5CB203B2EF22C919A)endOffsets
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var5;
  return self;
}

- (void)setOffsetsFromUTF8:(const char *)a3 size:(unint64_t)a4 usingCache:(id *)a5
{
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  updateOffsetsForPosition((uint64_t)a3, (unsigned __int8 *)a4, self->_startOffsets.line, self->_startOffsets.column, (unsigned __int8 **)a5);
  v9 = *(_OWORD *)&a5->var0;
  v10 = *(_OWORD *)&a5->var2;
  *(_OWORD *)&self->_startOffsets.line = *(_OWORD *)&a5->var4;
  *(_OWORD *)&self->_startOffsets.utf8NextCodePoint = v10;
  *(_OWORD *)&self->_startOffsets.utf8Offset = v9;
  updateOffsetsForPosition((uint64_t)a3, (unsigned __int8 *)a4, self->_endOffsets.line, self->_endOffsets.column, (unsigned __int8 **)a5);
  v11 = *(_OWORD *)&a5->var0;
  v12 = *(_OWORD *)&a5->var2;
  *(_OWORD *)&self->_endOffsets.line = *(_OWORD *)&a5->var4;
  *(_OWORD *)&self->_endOffsets.utf8NextCodePoint = v12;
  *(_OWORD *)&self->_endOffsets.utf8Offset = v11;
}

+ ($915FBD377EA738B5CB203B2EF22C919A)calculateOffsetsForLine:(SEL)a3 column:(int64_t)a4 inString:(int64_t)a5 size:(const char *)a6 withExistingOffsets:(unint64_t)a7
{
  __int128 v8;

  v8 = *(_OWORD *)&a8->var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a8->var0;
  *(_OWORD *)&retstr->var2 = v8;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&a8->var4;
  return ($915FBD377EA738B5CB203B2EF22C919A *)updateOffsetsForPosition((uint64_t)a6, (unsigned __int8 *)a7, a4, a5, (unsigned __int8 **)retstr);
}

- (NSRange)rangeInString:(NSString *)string
{
  int64_t utf16Offset;
  int64_t v5;
  int64_t v6;
  const char *v7;
  unsigned __int8 *v8;
  int64_t line;
  int64_t column;
  int64_t v11;
  NSUInteger v12;
  uint64_t v13;
  int64_t utf16CurrentCodePointLength;
  NSUInteger v15;
  __int128 v16;
  __int128 v17;
  int64x2_t v18;
  uint64_t v19;
  NSRange result;

  v19 = *MEMORY[0x1E0C80C00];
  utf16Offset = self->_startOffsets.utf16Offset;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (utf16Offset == 0x7FFFFFFFFFFFFFFFLL || (v6 = self->_endOffsets.utf16Offset, v6 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v7 = -[NSString UTF8String](string, "UTF8String");
    v8 = (unsigned __int8 *)strlen(v7);
    line = self->_startOffsets.line;
    column = self->_startOffsets.column;
    v16 = 0u;
    v17 = 0u;
    v18 = vdupq_n_s64(1uLL);
    updateOffsetsForPosition((uint64_t)v7, v8, line, column, (unsigned __int8 **)&v16);
    v11 = *((_QWORD *)&v16 + 1);
    updateOffsetsForPosition((uint64_t)v7, v8, self->_endOffsets.line, self->_endOffsets.column, (unsigned __int8 **)&v16);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      if (*((_QWORD *)&v16 + 1) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = *((_QWORD *)&v17 + 1);
        if ((_QWORD)v16 + 1 != (_QWORD)v17)
          v13 = 0;
        v12 = *((_QWORD *)&v16 + 1) - v11 + v13;
        v5 = v11;
      }
    }
  }
  else
  {
    utf16CurrentCodePointLength = self->_endOffsets.utf16CurrentCodePointLength;
    if (self->_endOffsets.utf8Offset + 1 != self->_endOffsets.utf8NextCodePoint)
      utf16CurrentCodePointLength = 0;
    v12 = v6 - utf16Offset + utf16CurrentCodePointLength;
    v5 = self->_startOffsets.utf16Offset;
  }
  v15 = v5;
  result.length = v12;
  result.location = v15;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSAttributedStringMarkdownSourcePosition;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{startLine=%lu, startColumn=%lu, endLine=%lu, endColumn=%lu}"), -[NSAttributedStringMarkdownSourcePosition description](&v3, sel_description), self->_startOffsets.line, self->_startOffsets.column, self->_endOffsets.line, self->_endOffsets.column);
}

- (id)debugDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p>{ startPosition = (%lu, %lu), endPosition = (%lu, %lu), utf8Offsets = (%lu, %lu), utf16Offsets = (%lu, %lu), nextCodePoints = (%lu, %lu), currentCodePointUTF16Lengths = (%lu, %lu) }"), objc_opt_class(), self, self->_startOffsets.line, self->_startOffsets.column, self->_endOffsets.line, self->_endOffsets.column, self->_startOffsets.utf8Offset, self->_endOffsets.utf8Offset, self->_startOffsets.utf16Offset, self->_endOffsets.utf16Offset, self->_startOffsets.utf8NextCodePoint, self->_endOffsets.utf8NextCodePoint, self->_startOffsets.utf16CurrentCodePointLength, self->_endOffsets.utf16CurrentCodePointLength);
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;

  if (!objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ cannot be encoded by non-keyed archivers"), objc_opt_class()), 0);
    objc_exception_throw(v5);
  }
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSAttributedStringMarkdownSourcePosition startLine](self, "startLine"), CFSTR("NSStartLine"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSAttributedStringMarkdownSourcePosition startColumn](self, "startColumn"), CFSTR("NSStartColumn"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSAttributedStringMarkdownSourcePosition endLine](self, "endLine"), CFSTR("NSEndLine"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSAttributedStringMarkdownSourcePosition endColumn](self, "endColumn"), CFSTR("NSEndColumn"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_startOffsets.utf8Offset, CFSTR("NSStartUTF8Offset"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_endOffsets.utf8Offset, CFSTR("NSEndUTF8Offset"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_startOffsets.utf16Offset, CFSTR("NSStartUTF16Offset"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_endOffsets.utf16Offset, CFSTR("NSEndUTF16Offset"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_startOffsets.utf8NextCodePoint, CFSTR("NSStartUTF8NextCodePoint"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_endOffsets.utf8NextCodePoint, CFSTR("NSEndUTF8NextCodePoint"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_startOffsets.utf16CurrentCodePointLength, CFSTR("NSStartUTF16CurrentCodePointLength"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_endOffsets.utf16CurrentCodePointLength, CFSTR("NSEndUTF16CurrentCodePointLength"));
}

- (NSAttributedStringMarkdownSourcePosition)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  NSAttributedStringMarkdownSourcePosition *result;
  void *v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ cannot be decoded by non-keyed archivers"), objc_opt_class()), 0);
    objc_exception_throw(v21);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = objc_msgSend(&unk_1E0FCE848, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(&unk_1E0FCE848);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (!objc_msgSend(a3, "containsValueForKey:", v10))
        {
          objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("%@: missing key %@"), _NSMethodExceptionProem((objc_class *)self, a2), v10));
          return 0;
        }
      }
      v7 = objc_msgSend(&unk_1E0FCE848, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSStartLine"));
  if (objc_msgSend(a3, "error"))
    return 0;
  v12 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSStartColumn"));
  if (objc_msgSend(a3, "error"))
    return 0;
  v13 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSEndLine"));
  if (objc_msgSend(a3, "error"))
    return 0;
  v14 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSEndColumn"));
  if (objc_msgSend(a3, "error"))
    return 0;
  v15 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSStartUTF8Offset"));
  if (objc_msgSend(a3, "error"))
    return 0;
  v16 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSEndUTF8Offset"));
  if (objc_msgSend(a3, "error"))
    return 0;
  v17 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSStartUTF16Offset"));
  if (objc_msgSend(a3, "error"))
    return 0;
  v18 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSEndUTF16Offset"));
  if (objc_msgSend(a3, "error"))
    return 0;
  v19 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSStartUTF8NextCodePoint"));
  if (objc_msgSend(a3, "error"))
    return 0;
  v24 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSEndUTF8NextCodePoint"));
  if (objc_msgSend(a3, "error"))
    return 0;
  v23 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSStartUTF16CurrentCodePointLength"));
  if (objc_msgSend(a3, "error"))
    return 0;
  v22 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSEndUTF16CurrentCodePointLength"));
  if (objc_msgSend(a3, "error"))
    return 0;
  result = -[NSAttributedStringMarkdownSourcePosition initWithStartLine:startColumn:endLine:endColumn:]([NSAttributedStringMarkdownSourcePosition alloc], "initWithStartLine:startColumn:endLine:endColumn:", v11, v12, v13, v14);
  result->_startOffsets.utf8Offset = v15;
  result->_startOffsets.utf16Offset = v17;
  result->_endOffsets.utf8Offset = v16;
  result->_endOffsets.utf16Offset = v18;
  result->_startOffsets.utf8NextCodePoint = v19;
  result->_startOffsets.utf16CurrentCodePointLength = v23;
  result->_endOffsets.utf8NextCodePoint = v24;
  result->_endOffsets.utf16CurrentCodePointLength = v22;
  return result;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSInteger v4;
  NSInteger v5;
  NSInteger v6;
  NSInteger v7;
  int8x16_t v8;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  v4 = -[NSAttributedStringMarkdownSourcePosition startLine](self, "startLine");
  v5 = -[NSAttributedStringMarkdownSourcePosition startColumn](self, "startColumn");
  v6 = -[NSAttributedStringMarkdownSourcePosition endLine](self, "endLine");
  v7 = -[NSAttributedStringMarkdownSourcePosition endColumn](self, "endColumn");
  v8 = veorq_s8(*(int8x16_t *)&self->_startOffsets.utf8NextCodePoint, *(int8x16_t *)&self->_endOffsets.utf8NextCodePoint);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v8.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)) ^ self->_startOffsets.utf8Offset ^ self->_endOffsets.utf8Offset ^ self->_startOffsets.utf16Offset ^ self->_endOffsets.utf16Offset ^ v7 ^ v6 ^ v5 ^ v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = objc_msgSend(a3, "startLine");
  if (v5 != -[NSAttributedStringMarkdownSourcePosition startLine](self, "startLine"))
    return 0;
  v6 = objc_msgSend(a3, "endLine");
  if (v6 != -[NSAttributedStringMarkdownSourcePosition endLine](self, "endLine"))
    return 0;
  v7 = objc_msgSend(a3, "startColumn");
  if (v7 != -[NSAttributedStringMarkdownSourcePosition startColumn](self, "startColumn"))
    return 0;
  v8 = objc_msgSend(a3, "endColumn");
  return v8 == -[NSAttributedStringMarkdownSourcePosition endColumn](self, "endColumn");
}

@end
