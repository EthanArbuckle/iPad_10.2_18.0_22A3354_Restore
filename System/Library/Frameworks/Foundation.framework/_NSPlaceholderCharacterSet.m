@implementation _NSPlaceholderCharacterSet

- (_NSPlaceholderCharacterSet)initWithSet:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  unsigned int v7;
  int v8;
  _NSPlaceholderCharacterSet *v9;
  objc_super v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)_NSPlaceholderCharacterSet;
  v6 = -[NSCharacterSet init](&v11, sel_init);
  v7 = *((_DWORD *)v6 + 6) & 0xFFFFFFFC | v4 & 3;
  *((_DWORD *)v6 + 6) = v7;
  if ((v4 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = 4;
    else
      v8 = 0;
    v7 = *((_DWORD *)v6 + 6);
  }
  *((_DWORD *)v6 + 6) = v7 & 0xFFFFFFFB | v8;
  if ((v7 & 1) != 0 && objc_msgSend(a3, "isMutable"))
  {
    v9 = (_NSPlaceholderCharacterSet *)objc_msgSend(a3, "mutableCopyWithZone:", 0);
    -[_NSPlaceholderCharacterSet invert](v9, "invert");
    -[NSCharacterSet makeImmutable](v9, "makeImmutable");

    return v9;
  }
  else
  {
    *((_QWORD *)v6 + 1) = a3;
  }
  return (_NSPlaceholderCharacterSet *)v6;
}

- (__CFCharacterSet)_expandedCFCharacterSet
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return (__CFCharacterSet *)self->_original;
  else
    return 0;
}

- (void)_expandInverted
{
  unint64_t *p_invertedSet;
  id v4;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    p_invertedSet = (unint64_t *)&self->_invertedSet;
    if (!self->_invertedSet)
    {
      v4 = -[NSCharacterSet mutableCopyWithZone:](self->_original, "mutableCopyWithZone:", 0);
      objc_msgSend(v4, "invert");
      while (!__ldaxr(p_invertedSet))
      {
        if (!__stlxr((unint64_t)v4, p_invertedSet))
          return;
      }
      __clrex();

    }
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSCharacterSet *invertedSet;
  id v6;
  void *v7;

  invertedSet = self->_invertedSet;
  if (invertedSet)
    return -[NSCharacterSet mutableCopyWithZone:](invertedSet, "mutableCopyWithZone:", 0);
  v6 = -[NSCharacterSet mutableCopyWithZone:](self->_original, "mutableCopyWithZone:", 0);
  v7 = v6;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    objc_msgSend(v6, "invert");
  return v7;
}

- (BOOL)longCharacterIsMember:(unsigned int)a3
{
  return ((CFCharacterSetIsLongCharacterMember((CFCharacterSetRef)self->_original, a3) != 0) ^ *(_BYTE *)&self->_flags) & 1;
}

- (BOOL)isSupersetOfSet:(id)a3
{
  NSCharacterSet *invertedSet;
  int IsSupersetOfSet;
  int v7;
  $37465DDE4F5514DE4D52F8519CE55D34 flags;
  BOOL result;

  invertedSet = self->_invertedSet;
  if (invertedSet)
    return CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)invertedSet, (CFCharacterSetRef)a3) != 0;
  IsSupersetOfSet = CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)self->_original, (CFCharacterSetRef)a3);
  v7 = IsSupersetOfSet;
  flags = self->_flags;
  result = (*(_BYTE *)&flags & 1) == 0 && IsSupersetOfSet != 0;
  if ((*(_BYTE *)&flags & 1) != 0 && !v7)
  {
    -[_NSPlaceholderCharacterSet _expandInverted](self, "_expandInverted");
    invertedSet = self->_invertedSet;
    return CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)invertedSet, (CFCharacterSetRef)a3) != 0;
  }
  return result;
}

- (BOOL)hasMemberInPlane:(unsigned __int8)a3
{
  unsigned int v3;
  int *v5;

  v3 = a3;
  v5 = &OBJC_IVAR____NSPlaceholderCharacterSet__original;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    -[_NSPlaceholderCharacterSet _expandInverted](self, "_expandInverted");
    v5 = &OBJC_IVAR____NSPlaceholderCharacterSet__invertedSet;
  }
  return CFCharacterSetHasMemberInPlane(*(CFCharacterSetRef *)((char *)&self->super.super.isa + *v5), v3) != 0;
}

- (BOOL)isEqual:(id)a3
{
  NSCharacterSet *original;
  $37465DDE4F5514DE4D52F8519CE55D34 flags;

  if (a3 == self)
    return 1;
  original = self->_original;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if (original == (NSCharacterSet *)objc_msgSend(a3, "_expandedCFCharacterSet"))
      return 1;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    -[_NSPlaceholderCharacterSet _expandInverted](self, "_expandInverted");
    original = self->_invertedSet;
  }
  return CFEqual(original, a3) != 0;
}

- (id)bitmapRepresentation
{
  int *v3;

  v3 = &OBJC_IVAR____NSPlaceholderCharacterSet__original;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    -[_NSPlaceholderCharacterSet _expandInverted](self, "_expandInverted");
    v3 = &OBJC_IVAR____NSPlaceholderCharacterSet__invertedSet;
  }
  return objc_autorelease(CFCharacterSetCreateBitmapRepresentation(0, *(CFCharacterSetRef *)((char *)&self->super.super.isa
                                                                                             + *v3)));
}

- (BOOL)isEmpty
{
  if ((*(_BYTE *)&self->_flags & 1) == 0 || -[NSCharacterSet isEmpty](self->_original, "isEmpty"))
    return 0;
  -[_NSPlaceholderCharacterSet _expandInverted](self, "_expandInverted");
  return -[NSCharacterSet isEmpty](self->_invertedSet, "isEmpty");
}

- (id)invertedSet
{
  id result;

  result = self->_original;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return (id)objc_msgSend(result, "invertedSet");
  return result;
}

- (_NSPlaceholderCharacterSet)autorelease
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_NSPlaceholderCharacterSet;
    return -[_NSPlaceholderCharacterSet autorelease](&v2, sel_autorelease);
  }
  return self;
}

- (_NSPlaceholderCharacterSet)retain
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_NSPlaceholderCharacterSet;
    return -[_NSPlaceholderCharacterSet retain](&v2, sel_retain);
  }
  return self;
}

- (unint64_t)retainCount
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return -1;
  v3.receiver = self;
  v3.super_class = (Class)_NSPlaceholderCharacterSet;
  return -[_NSPlaceholderCharacterSet retainCount](&v3, sel_retainCount);
}

- (void)release
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_NSPlaceholderCharacterSet;
    -[_NSPlaceholderCharacterSet release](&v2, sel_release);
  }
}

- (BOOL)_isDeallocating
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSPlaceholderCharacterSet;
  return -[_NSPlaceholderCharacterSet _isDeallocating](&v3, sel__isDeallocating);
}

- (BOOL)_tryRetain
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)_NSPlaceholderCharacterSet;
  return -[_NSPlaceholderCharacterSet _tryRetain](&v3, sel__tryRetain);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {

    v3.receiver = self;
    v3.super_class = (Class)_NSPlaceholderCharacterSet;
    -[_NSPlaceholderCharacterSet dealloc](&v3, sel_dealloc);
  }
}

- (id)replacementObjectForKeyedArchiver:(id)a3
{
  int *v4;

  v4 = &OBJC_IVAR____NSPlaceholderCharacterSet__original;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    -[_NSPlaceholderCharacterSet _expandInverted](self, "_expandInverted", a3);
    v4 = &OBJC_IVAR____NSPlaceholderCharacterSet__invertedSet;
  }
  return *(Class *)((char *)&self->super.super.isa + *v4);
}

- (id)replacementObjectForCoder:(id)a3
{
  int *v4;

  v4 = &OBJC_IVAR____NSPlaceholderCharacterSet__original;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    -[_NSPlaceholderCharacterSet _expandInverted](self, "_expandInverted", a3);
    v4 = &OBJC_IVAR____NSPlaceholderCharacterSet__invertedSet;
  }
  return *(Class *)((char *)&self->super.super.isa + *v4);
}

@end
