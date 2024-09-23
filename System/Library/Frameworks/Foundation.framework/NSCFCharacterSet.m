@implementation NSCFCharacterSet

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (self == a3)
    return 1;
  return _CFNonObjCEqual() != 0;
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return CFCharacterSetCreateCopy(0, (CFCharacterSetRef)self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return CFCharacterSetCreateMutableCopy(0, (CFCharacterSetRef)self);
}

- (BOOL)characterIsMember:(unsigned __int16)a3
{
  return CFCharacterSetIsCharacterMember((CFCharacterSetRef)self, a3) != 0;
}

- (BOOL)longCharacterIsMember:(unsigned int)a3
{
  return CFCharacterSetIsLongCharacterMember((CFCharacterSetRef)self, a3) != 0;
}

- (BOOL)isSupersetOfSet:(id)a3
{
  return CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)self, (CFCharacterSetRef)a3) != 0;
}

- (BOOL)hasMemberInPlane:(unsigned __int8)a3
{
  return CFCharacterSetHasMemberInPlane((CFCharacterSetRef)self, a3) != 0;
}

- (id)bitmapRepresentation
{
  return CFCharacterSetCreateBitmapRepresentation(0, (CFCharacterSetRef)self);
}

- (id)invertedSet
{
  return CFCharacterSetCreateInvertedSet(0, (CFCharacterSetRef)self);
}

- (void)addCharactersInRange:(_NSRange)a3
{
  CFCharacterSetAddCharactersInRange((CFMutableCharacterSetRef)self, (CFRange)a3);
}

- (void)removeCharactersInRange:(_NSRange)a3
{
  CFCharacterSetRemoveCharactersInRange((CFMutableCharacterSetRef)self, (CFRange)a3);
}

- (void)addCharactersInString:(id)a3
{
  CFCharacterSetAddCharactersInString((CFMutableCharacterSetRef)self, (CFStringRef)a3);
}

- (void)removeCharactersInString:(id)a3
{
  CFCharacterSetRemoveCharactersInString((CFMutableCharacterSetRef)self, (CFStringRef)a3);
}

- (void)formUnionWithCharacterSet:(id)a3
{
  CFCharacterSetUnion((CFMutableCharacterSetRef)self, (CFCharacterSetRef)a3);
}

- (void)formIntersectionWithCharacterSet:(id)a3
{
  CFCharacterSetIntersect((CFMutableCharacterSetRef)self, (CFCharacterSetRef)a3);
}

- (Class)classForArchiver
{
  _CFCharacterSetIsMutable();
  return (Class)objc_opt_self();
}

- (void)encodeWithCoder:(id)a3
{
  int IsInverted;
  uint64_t KeyedCodingRange;
  uint64_t v7;
  const void *KeyedCodingString;
  __objc2_class *Class;
  id v10;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    IsInverted = _CFCharacterSetIsInverted();
    switch(_CFCharacterSetGetKeyedCodingType())
    {
      case 2:
        objc_msgSend(a3, "encodeInteger:forKey:", _CFCharacterSetGetKeyedCodingBuiltinType(), CFSTR("NSBuiltinID"));
        if (IsInverted)
          goto LABEL_16;
        break;
      case 3:
        KeyedCodingRange = _CFCharacterSetGetKeyedCodingRange();
        objc_msgSend(a3, "encodeInt64:forKey:", v7 | (KeyedCodingRange << 32), CFSTR("NSRange"));
        if (IsInverted)
          goto LABEL_16;
        break;
      case 4:
        KeyedCodingString = (const void *)_CFCharacterSetCreateKeyedCodingString();
        if (object_getClass(a3) == (Class)NSKeyedArchiver)
          objc_msgSend(a3, "_encodePropertyList:forKey:", KeyedCodingString, CFSTR("NSString"));
        else
          objc_msgSend(a3, "encodeObject:forKey:", KeyedCodingString, CFSTR("NSStringObject"));
        CFRelease(KeyedCodingString);
        if (IsInverted)
LABEL_16:
          objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSIsInverted"));
        break;
      case 5:
        objc_msgSend(a3, "encodeInteger:forKey:", _CFCharacterSetGetKeyedCodingBuiltinType(), CFSTR("NSBuiltinID2"));
        if (IsInverted)
          objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSIsInverted2"));
        goto LABEL_11;
      default:
LABEL_11:
        Class = (__objc2_class *)object_getClass(a3);
        v10 = -[NSCFCharacterSet bitmapRepresentation](self, "bitmapRepresentation");
        if (Class == NSKeyedArchiver)
          objc_msgSend(a3, "_encodePropertyList:forKey:", v10, CFSTR("NSBitmap"));
        else
          objc_msgSend(a3, "encodeObject:forKey:", v10, CFSTR("NSBitmapObject"));
        break;
    }
  }
}

@end
