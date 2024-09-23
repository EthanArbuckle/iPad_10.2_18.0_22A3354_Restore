@implementation _BSCompoundAssertionState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

- (BOOL)isActive
{
  return self->_active;
}

- (NSSet)context
{
  return -[NSOrderedSet set](self->_context, "set");
}

- (NSOrderedSet)orderedContext
{
  return self->_context;
}

- (id)description
{
  const __CFString *v2;

  v2 = CFSTR("YES");
  if (!self->_active)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("active:%@ %@"), v2, self->_context);
}

@end
