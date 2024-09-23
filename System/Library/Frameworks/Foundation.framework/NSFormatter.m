@implementation NSFormatter

- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3
{
  return 1;
}

- (int64_t)_cacheGenerationCount
{
  return -1;
}

- (BOOL)_tracksCacheGenerationCount
{
  return 0;
}

- (NSString)stringForObjectValue:(id)obj
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSFormatter"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSAttributedString)attributedStringForObjectValue:(id)obj withDefaultAttributes:(NSDictionary *)attrs
{
  return 0;
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error
{
  objc_class *v7;

  v7 = NSClassFromString((NSString *)CFSTR("NSFormatter"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6
{
  uint64_t *v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  if (a5)
    a4 = (id)objc_msgSend(a4, "substringWithRange:", a5->location, a5->length);
  if (a6)
    v9 = &v14;
  else
    v9 = 0;
  v10 = -[NSFormatter getObjectValue:forString:errorDescription:](self, "getObjectValue:forString:errorDescription:", a3, a4, v9, v14, v15);
  v11 = v10;
  if (a6 && !v10)
  {
    if (v14)
      v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v14, CFSTR("NSLocalizedDescription"));
    else
      v12 = 0;
    *a6 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 2048, v12);
  }
  return v11;
}

- (BOOL)isPartialStringValid:(NSString *)partialString newEditingString:(NSString *)newString errorDescription:(NSString *)error
{
  return 1;
}

- (BOOL)isPartialStringValid:(NSString *)partialStringPtr proposedSelectedRange:(NSRangePointer)proposedSelRangePtr originalString:(NSString *)origString originalSelectedRange:(NSRange)origSelRange errorDescription:(NSString *)error
{
  BOOL v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v12[0] = 0;
  v9 = -[NSFormatter isPartialStringValid:newEditingString:errorDescription:](self, "isPartialStringValid:newEditingString:errorDescription:", *partialStringPtr, v12, error, origSelRange.location, origSelRange.length);
  if (!v9)
  {
    v10 = (void *)v12[0];
    if (v12[0])
    {
      *partialStringPtr = (NSString *)v12[0];
      if (proposedSelRangePtr)
      {
        proposedSelRangePtr->location = objc_msgSend(v10, "length");
        proposedSelRangePtr->length = 0;
      }
    }
  }
  return v9;
}

@end
