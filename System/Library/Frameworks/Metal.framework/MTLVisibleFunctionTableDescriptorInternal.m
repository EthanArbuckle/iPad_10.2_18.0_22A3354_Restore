@implementation MTLVisibleFunctionTableDescriptorInternal

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return +[MTLVisibleFunctionTableDescriptorInternal allocWithZone:](MTLVisibleFunctionTableDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLVisibleFunctionTableDescriptorInternal;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    *((_QWORD *)result + 1) = self->_private.functionCount;
    *((_BYTE *)result + 16) = self->_private.forceResourceIndex;
    *((_QWORD *)result + 3) = self->_private.resourceIndex;
  }
  return result;
}

- (unint64_t)functionCount
{
  return self->_private.functionCount;
}

- (void)setFunctionCount:(unint64_t)a3
{
  self->_private.functionCount = a3;
}

- (BOOL)forceResourceIndex
{
  return self->_private.forceResourceIndex;
}

- (void)setForceResourceIndex:(BOOL)a3
{
  self->_private.forceResourceIndex = a3;
}

- (unint64_t)resourceIndex
{
  return self->_private.resourceIndex;
}

- (void)setResourceIndex:(unint64_t)a3
{
  self->_private.resourceIndex = a3;
}

- (unint64_t)hash
{
  uint64_t v2;
  _QWORD v4[3];

  v2 = -(uint64_t)self->_private.forceResourceIndex;
  v4[0] = self->_private.functionCount;
  v4[1] = v2;
  v4[2] = self->_private.resourceIndex;
  return _MTLHashState((int *)v4, 0x18uLL);
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  return Class == object_getClass(a3)
      && self->_private.functionCount == *((_QWORD *)a3 + 1)
      && self->_private.forceResourceIndex == *((unsigned __int8 *)a3 + 16)
      && self->_private.resourceIndex == *((_QWORD *)a3 + 3);
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  MTLVisibleFunctionTableDescriptorPrivate *p_private;
  const __CFString *v8;
  objc_super v10;
  _QWORD v11[10];

  v11[9] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)MTLVisibleFunctionTableDescriptorInternal;
  v6 = -[MTLVisibleFunctionTableDescriptorInternal description](&v10, sel_description);
  v11[0] = v4;
  v11[1] = CFSTR("functionCount =");
  p_private = &self->_private;
  v11[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", p_private->functionCount);
  v11[3] = v4;
  v8 = CFSTR("NO");
  if (p_private->forceResourceIndex)
    v8 = CFSTR("YES");
  v11[4] = CFSTR("forceResourceIndex =");
  v11[5] = v8;
  v11[6] = v4;
  v11[7] = CFSTR("resourceIndex =");
  v11[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", p_private->resourceIndex);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 9), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLVisibleFunctionTableDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

@end
