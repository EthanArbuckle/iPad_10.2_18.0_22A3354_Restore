@implementation __NSCFCharacterSet

- (BOOL)longCharacterIsMember:(unsigned int)a3
{
  return CFCharacterSetIsLongCharacterMember((CFCharacterSetRef)self, a3) != 0;
}

- (BOOL)characterIsMember:(unsigned __int16)a3
{
  return CFCharacterSetIsCharacterMember((CFCharacterSetRef)self, a3) != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return CFCharacterSetCreateCopy(0, (CFCharacterSetRef)self);
}

- (void)formUnionWithCharacterSet:(id)a3
{
  CFCharacterSetUnion((CFMutableCharacterSetRef)self, (CFCharacterSetRef)a3);
}

- (void)addCharactersInString:(id)a3
{
  CFCharacterSetAddCharactersInString((CFMutableCharacterSetRef)self, (CFStringRef)a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return CFCharacterSetCreateMutableCopy(0, (CFCharacterSetRef)self);
}

- (id)invertedSet
{
  return CFCharacterSetCreateInvertedSet(0, (CFCharacterSetRef)self);
}

- (void)addCharactersInRange:(_NSRange)a3
{
  CFCharacterSetAddCharactersInRange((CFMutableCharacterSetRef)self, (CFRange)a3);
}

- (BOOL)isSupersetOfSet:(id)a3
{
  return CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)self, (CFCharacterSetRef)a3) != 0;
}

- (void)removeCharactersInRange:(_NSRange)a3
{
  CFCharacterSetRemoveCharactersInRange((CFMutableCharacterSetRef)self, (CFRange)a3);
}

- (void)removeCharactersInString:(id)a3
{
  CFCharacterSetRemoveCharactersInString((CFMutableCharacterSetRef)self, (CFStringRef)a3);
}

- (void)formIntersectionWithCharacterSet:(id)a3
{
  CFCharacterSetIntersect((CFMutableCharacterSetRef)self, (CFCharacterSetRef)a3);
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (self == a3)
    return 1;
  return _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (BOOL)hasMemberInPlane:(unsigned __int8)a3
{
  return CFCharacterSetHasMemberInPlane((CFCharacterSetRef)self, a3) != 0;
}

- (id)bitmapRepresentation
{
  return CFCharacterSetCreateBitmapRepresentation(0, (CFCharacterSetRef)self);
}

- (Class)classForCoder
{
  if (__CFCharacterSetIsMutable((uint64_t)self))
    return objc_lookUpClass("NSMutableCharacterSet");
  else
    return objc_lookUpClass("NSCharacterSet");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__NSCFCharacterSet)initWithCoder:(id)a3
{
  objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInternalInconsistencyException"), CFSTR("Bridged character sets should decode using NSCharacterSet/NSMutableCharacterSet via classForCoder"), 0));
}

- (void)encodeWithCoder:(id)a3
{
  int IsInverted;
  uint64_t KeyedCodingRange;
  uint64_t v7;
  CFStringRef KeyedCodingString;
  objc_class *v9;
  uint64_t v10;
  Class v11;
  id v12;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    IsInverted = _CFCharacterSetIsInverted((uint64_t)self);
    switch(_CFCharacterSetGetKeyedCodingType((uint64_t)self))
    {
      case 2:
        objc_msgSend(a3, "encodeInteger:forKey:", _CFCharacterSetGetKeyedCodingBuiltinType((uint64_t)self), CFSTR("NSBuiltinID"));
        if (IsInverted)
          goto LABEL_16;
        break;
      case 3:
        KeyedCodingRange = _CFCharacterSetGetKeyedCodingRange((uint64_t)self);
        objc_msgSend(a3, "encodeInt64:forKey:", v7 | (KeyedCodingRange << 32), CFSTR("NSRange"));
        if (IsInverted)
          goto LABEL_16;
        break;
      case 4:
        KeyedCodingString = _CFCharacterSetCreateKeyedCodingString((uint64_t)self);
        v9 = (objc_class *)objc_opt_class();
        if (v9 == objc_lookUpClass("NSKeyedArchiver"))
          objc_msgSend(a3, "_encodePropertyList:forKey:", KeyedCodingString, CFSTR("NSString"));
        else
          objc_msgSend(a3, "encodeObject:forKey:", KeyedCodingString, CFSTR("NSStringObject"));
        CFRelease(KeyedCodingString);
        if (IsInverted)
LABEL_16:
          objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSIsInverted"));
        break;
      case 5:
        objc_msgSend(a3, "encodeInteger:forKey:", _CFCharacterSetGetKeyedCodingBuiltinType((uint64_t)self), CFSTR("NSBuiltinID2"));
        if (IsInverted)
          objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSIsInverted2"));
        goto LABEL_11;
      default:
LABEL_11:
        v10 = objc_opt_class();
        v11 = objc_lookUpClass("NSKeyedArchiver");
        v12 = -[__NSCFCharacterSet bitmapRepresentation](self, "bitmapRepresentation");
        if ((Class)v10 == v11)
          objc_msgSend(a3, "_encodePropertyList:forKey:", v12, CFSTR("NSBitmap"));
        else
          objc_msgSend(a3, "encodeObject:forKey:", v12, CFSTR("NSBitmapObject"));
        break;
    }
  }
}

@end
