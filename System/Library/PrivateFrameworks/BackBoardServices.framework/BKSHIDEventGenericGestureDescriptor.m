@implementation BKSHIDEventGenericGestureDescriptor

- (BOOL)describes:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)&self->super._hidEventType + 4) && objc_msgSend(v4, "hidEventType") == 39
    || -[BKSHIDEventGenericGestureDescriptor isEqual:](self, "isEqual:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _DWORD *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6
    && (v9.receiver = self,
        v9.super_class = (Class)BKSHIDEventGenericGestureDescriptor,
        -[BKSHIDEventDescriptor isEqual:](&v9, sel_isEqual_, v6))
    && v6[4] == *(_DWORD *)&self->_isWildcard
    && *((unsigned __int8 *)v6 + 12) == *((unsigned __int8 *)&self->super._hidEventType + 4);

  return v7;
}

- (BKSHIDEventGenericGestureDescriptor)initWithGenericGestureType:(unsigned int)a3
{
  BKSHIDEventGenericGestureDescriptor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKSHIDEventGenericGestureDescriptor;
  result = -[BKSHIDEventDescriptor _initWithEventType:](&v5, sel__initWithEventType_, 39);
  if (result)
    *(_DWORD *)&result->_isWildcard = a3;
  return result;
}

- (BKSHIDEventGenericGestureDescriptor)init
{
  BKSHIDEventGenericGestureDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventGenericGestureDescriptor;
  result = -[BKSHIDEventDescriptor _initWithEventType:](&v3, sel__initWithEventType_, 39);
  if (result)
    *((_BYTE *)&result->super._hidEventType + 4) = 1;
  return result;
}

- (unint64_t)hash
{
  return *(unsigned int *)&self->_isWildcard | 0x270000;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKSHIDEventGenericGestureDescriptor;
  -[BKSHIDEventDescriptor appendDescriptionToFormatter:](&v6, sel_appendDescriptionToFormatter_, v4);
  v5 = (id)objc_msgSend(v4, "appendInteger:withName:", *(int *)&self->_isWildcard, CFSTR("genericGestureType"));

}

- (BOOL)requiresFuzzyMatching
{
  return *((_BYTE *)&self->super._hidEventType + 4);
}

- (void)encodeWithCoder:(id)a3
{
  if (*((_BYTE *)&self->super._hidEventType + 4))
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("genericGestureIsWildcardType"));
  else
    objc_msgSend(a3, "encodeInteger:forKey:", *(unsigned int *)&self->_isWildcard, CFSTR("genericGestureType"));
}

- (BKSHIDEventGenericGestureDescriptor)initWithCoder:(id)a3
{
  id v4;
  BKSHIDEventGenericGestureDescriptor *v5;
  BKSHIDEventGenericGestureDescriptor *v6;

  v4 = a3;
  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("genericGestureIsWildcardType")))
    v5 = -[BKSHIDEventGenericGestureDescriptor init](self, "init");
  else
    v5 = -[BKSHIDEventGenericGestureDescriptor initWithGenericGestureType:](self, "initWithGenericGestureType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("genericGestureType")));
  v6 = v5;

  return v6;
}

- (unsigned)genericGestureType
{
  return *(_DWORD *)&self->_isWildcard;
}

+ (id)descriptorForAnyGenericGestureType
{
  return objc_alloc_init(BKSHIDEventGenericGestureDescriptor);
}

+ (id)descriptorWithGenericGestureType:(unsigned int)a3
{
  return -[BKSHIDEventGenericGestureDescriptor initWithGenericGestureType:]([BKSHIDEventGenericGestureDescriptor alloc], "initWithGenericGestureType:", *(_QWORD *)&a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
