@implementation _MFActivityMonitorMultiTarget

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MFActivityMonitorMultiTarget;
  -[_MFActivityMonitorMultiTarget dealloc](&v3, sel_dealloc);
}

- (BOOL)addActivityTarget:(id)a3
{
  NSMutableSet *allTargets;
  char v6;

  allTargets = self->_allTargets;
  if (!allTargets)
  {
    allTargets = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    self->_allTargets = allTargets;
  }
  v6 = -[NSMutableSet containsObject:](allTargets, "containsObject:", a3);
  if ((v6 & 1) == 0)
    -[NSMutableSet addObject:](self->_allTargets, "addObject:", a3);
  return v6 ^ 1;
}

- (BOOL)removeActivityTarget:(id)a3
{
  NSMutableSet *allTargets;

  allTargets = self->_allTargets;
  if (allTargets)
  {
    LODWORD(allTargets) = -[NSMutableSet containsObject:](allTargets, "containsObject:");
    if ((_DWORD)allTargets)
    {
      -[NSMutableSet removeObject:](self->_allTargets, "removeObject:", a3);
      if (self->_primaryTarget == a3)
        -[_MFActivityMonitorMultiTarget setPrimaryTarget:](self, "setPrimaryTarget:", 0);
      LOBYTE(allTargets) = 1;
    }
  }
  return (char)allTargets;
}

- (id)primaryTarget
{
  return self->_primaryTarget;
}

- (void)setPrimaryTarget:(id)a3
{
  id v5;

  v5 = a3;

  self->_primaryTarget = a3;
}

- (id)allTargets
{
  return (id)-[NSMutableSet allObjects](self->_allTargets, "allObjects");
}

- (id)displayName
{
  if (self->_primaryTarget && (objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(self->_primaryTarget, "displayName");
  else
    return 0;
}

@end
