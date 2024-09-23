@implementation AVSpecifiedLoggingIdentifier

- (NSString)name
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", self->_specifiedLoggingIdentifier->identifierName);
}

- (AVSpecifiedLoggingIdentifier)initWithSpecifiedName:(id)a3
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  AVSpecifiedLoggingIdentifier *v14;
  AVSpecifiedLoggingIdentifierInternal *v15;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  objc_super v21;

  if (!a3)
    return 0;
  v6 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  if (objc_msgSend(v6, "count"))
  {
    if ((unint64_t)objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", 0), "length") >= 7)
    {
      v17 = (void *)MEMORY[0x1E0C99DA0];
      v18 = *MEMORY[0x1E0C99778];
      v19 = CFSTR("Identifier name must be 6 chars or less");
      goto LABEL_17;
    }
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      if ((unint64_t)objc_msgSend(v6, "count") >= 3)
      {
        v17 = (void *)MEMORY[0x1E0C99DA0];
        v18 = *MEMORY[0x1E0C99778];
        v19 = CFSTR("Identifier name must not contain more than one period");
        goto LABEL_17;
      }
      v12 = (void *)objc_msgSend(v6, "objectAtIndex:", 1);
      if (objc_msgSend(v12, "length"))
      {
        v13 = 0;
        while (objc_msgSend(v12, "characterAtIndex:", v13) - 58 > 0xFFFFFFF5)
        {
          if (++v13 >= (unint64_t)objc_msgSend(v12, "length"))
            goto LABEL_10;
        }
        v17 = (void *)MEMORY[0x1E0C99DA0];
        v18 = *MEMORY[0x1E0C99778];
        v19 = CFSTR("Identifier name must not contain non-numeric character after period");
LABEL_17:
        v20 = (void *)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v19, v7, v8, v9, v10, v11, (uint64_t)v21.receiver), 0);
        objc_exception_throw(v20);
      }
    }
  }
LABEL_10:
  v21.receiver = self;
  v21.super_class = (Class)AVSpecifiedLoggingIdentifier;
  v14 = -[AVSpecifiedLoggingIdentifier init](&v21, sel_init);
  if (v14)
  {
    v15 = objc_alloc_init(AVSpecifiedLoggingIdentifierInternal);
    v14->_specifiedLoggingIdentifier = v15;
    if (v15)
    {
      v15->derivedIdentifierCounter = 0;
      v14->_specifiedLoggingIdentifier->identifierName = (NSString *)objc_msgSend(a3, "copyWithZone:", 0);
      CFRetain(v14->_specifiedLoggingIdentifier);
      return v14;
    }

    return 0;
  }
  return v14;
}

- (void)dealloc
{
  AVSpecifiedLoggingIdentifierInternal *specifiedLoggingIdentifier;
  objc_super v4;

  specifiedLoggingIdentifier = self->_specifiedLoggingIdentifier;
  if (specifiedLoggingIdentifier)
  {

    CFRelease(self->_specifiedLoggingIdentifier);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVSpecifiedLoggingIdentifier;
  -[AVSpecifiedLoggingIdentifier dealloc](&v4, sel_dealloc);
}

- (id)makeDerivedIdentifier
{
  AVSpecifiedLoggingIdentifier *v3;

  ++self->_specifiedLoggingIdentifier->derivedIdentifierCounter;
  v3 = [AVSpecifiedLoggingIdentifier alloc];
  return -[AVSpecifiedLoggingIdentifier initWithSpecifiedName:](v3, "initWithSpecifiedName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%02d"), -[AVSpecifiedLoggingIdentifier name](self, "name"), self->_specifiedLoggingIdentifier->derivedIdentifierCounter));
}

@end
