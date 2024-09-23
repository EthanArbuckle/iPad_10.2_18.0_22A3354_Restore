@implementation SGTokenString

- (SGTokenString)stringWithNewContents:(id)a3
{
  return +[SGTokenString stringWithString:range:confidence:](SGTokenString, "stringWithString:range:confidence:", a3, self->_range.location, self->_range.length, self->_confidence);
}

- (unint64_t)length
{
  return (unint64_t)*((unsigned int *)self + 7) >> 1;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  $FBF3808751D49D307D9C285B3A61280A *p_contents;

  if (a3 >= (unint64_t)*((unsigned int *)self + 7) >> 1)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTokenString.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < _length"));
  p_contents = &self->_contents;
  if ((*((_BYTE *)self + 28) & 1) != 0)
    return *((char *)p_contents + a3);
  else
    return *((_WORD *)p_contents + a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  char *v8;
  unsigned __int16 v9;

  length = a4.length;
  location = a4.location;
  if (a4.location + a4.length > (unint64_t)*((unsigned int *)self + 7) >> 1)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTokenString.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("range.location + range.length <= _length"));
  if ((*((_BYTE *)self + 28) & 1) != 0)
  {
    if (length)
    {
      v8 = (char *)&self->_contents + location;
      do
      {
        v9 = *v8++;
        *a3++ = v9;
        --length;
      }
      while (length);
    }
  }
  else
  {
    memcpy(a3, (char *)&self->_contents + 2 * location, 2 * length);
  }
}

- (const)UTF8String
{
  objc_super v3;

  if ((*((_BYTE *)self + 28) & 1) != 0)
    return (const char *)&self->_contents;
  v3.receiver = self;
  v3.super_class = (Class)SGTokenString;
  return -[SGTokenString UTF8String](&v3, sel_UTF8String);
}

- (const)_fastCStringContents:(BOOL)a3
{
  if ((*((_BYTE *)self + 28) & 1) != 0)
    return (const char *)&self->_contents;
  else
    return 0;
}

- (const)_fastCharacterContents
{
  if ((*((_BYTE *)self + 28) & 1) != 0)
    return 0;
  else
    return (const unsigned __int16 *)&self->_contents;
}

- (unint64_t)fastestEncoding
{
  if ((*((_BYTE *)self + 28) & 1) != 0)
    return 1;
  else
    return 10;
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (int)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int)a3
{
  self->_confidence = a3;
}

+ (id)stringWithString:(id)a3
{
  return (id)objc_msgSend(a1, "stringWithString:range:confidence:", a3, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
}

+ (id)stringWithString:(id)a3 range:(_NSRange)a4
{
  return (id)objc_msgSend(a1, "stringWithString:range:confidence:", a3, a4.location, a4.length, 0);
}

+ (id)stringWithString:(id)a3 range:(_NSRange)a4 confidence:(int)a5
{
  NSUInteger length;
  NSUInteger location;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  length = a4.length;
  location = a4.location;
  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGTokenString.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));
  if ((unint64_t)objc_msgSend(a3, "length") >> 31)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGTokenString.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string.length < ((unsigned long)1 << 31)"));
  v11 = objc_msgSend(a3, "canBeConvertedToEncoding:", 1);
  v12 = objc_msgSend(class_createInstance((Class)a1, (objc_msgSend(a3, "length") << (v11 ^ 1)) + v11), "init");
  *(_QWORD *)(v12 + 8) = location;
  *(_QWORD *)(v12 + 16) = length;
  *(_DWORD *)(v12 + 24) = a5;
  *(_BYTE *)(v12 + 28) = *(_BYTE *)(v12 + 28) & 0xFE | v11;
  *(_DWORD *)(v12 + 28) = *(_DWORD *)(v12 + 28) & 1 | (2 * objc_msgSend(a3, "length"));
  v13 = v12 + 32;
  if (((v11 ^ 1) & 1) != 0)
    objc_msgSend(a3, "getCharacters:", v13);
  else
    objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v13, 0, (unint64_t)*(unsigned int *)(v12 + 28) >> 1, 0);
  return (id)v12;
}

@end
