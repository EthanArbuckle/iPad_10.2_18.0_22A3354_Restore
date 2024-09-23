@implementation _NSUndoStack

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  while (self->_head)
    -[_NSUndoStack popUndoObject](self, "popUndoObject");
  v3.receiver = self;
  v3.super_class = (Class)_NSUndoStack;
  -[_NSUndoStack dealloc](&v3, sel_dealloc);
}

- (void)removeAllObjects
{
  _NSUndoObject *i;

  for (i = self->_head; i; i = self->_head)
  {
    self->_head = i->next;

  }
  self->_count = 0;
  self->_nestingLevel = 0;
}

- (_NSUndoStack)init
{
  _NSUndoStack *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSUndoStack;
  result = -[_NSUndoStack init](&v3, sel_init);
  result->_head = 0;
  result->_max = 0;
  result->_count = 0;
  return result;
}

- (void)setMax:(unint64_t)max
{
  for (self->_max = max; max; max = self->_max)
  {
    if (self->_count <= max)
      break;
    -[_NSUndoStack _removeBottom](self, "_removeBottom");
  }
}

- (unint64_t)nestingLevel
{
  return self->_nestingLevel;
}

- (void)removeAllObjectsWithTarget:(id)a3
{
  _NSUndoObject *head;
  _NSUndoObject *v6;
  int v7;
  unint64_t nestingLevel;
  _BOOL4 v9;
  unint64_t v10;
  int v11;
  _BOOL4 v12;
  _NSUndoObject *next;
  _NSUndoObject *previous;
  _NSUndoObject *v15;

  head = self->_head;
  if (head)
  {
    v6 = 0;
    v7 = 0;
    nestingLevel = self->_nestingLevel;
    while (1)
    {
      v9 = -[_NSUndoObject isEndMark](head, "isEndMark");
      v10 = nestingLevel + v9;
      v11 = v9 | v7;
      v12 = -[_NSUndoObject isBeginMark](head, "isBeginMark");
      nestingLevel = (v12 & v11) != 0 ? v10 - 1 : v10;
      v7 = (v12 & v11 ^ 1 | (v10 != 1)) & v11;
      if (-[_NSUndoObject target](head, "target") == a3
        && !-[_NSUndoObject isBeginMark](head, "isBeginMark")
        && !-[_NSUndoObject isEndMark](head, "isEndMark"))
      {
        break;
      }
      next = head->next;
LABEL_10:
      v6 = head;
      head = next;
      if (!next)
        return;
    }
    next = head->next;
    -[_NSUndoStack removeObject:](self, "removeObject:", head);
    if (next && !-[_NSUndoObject isBeginMark](next, "isBeginMark")
      || v6 && !-[_NSUndoObject isEndMark](v6, "isEndMark"))
    {
      head = v6;
      goto LABEL_10;
    }
    head = v6;
    while (1)
    {
      if (!head)
        goto LABEL_21;
      previous = head->previous;
      -[_NSUndoStack removeObject:](self, "removeObject:", head);
      if (next)
      {
        if (previous)
          break;
      }
      head = previous;
      if (!nestingLevel)
        goto LABEL_22;
LABEL_23:
      if (!-[_NSUndoObject isBeginMark](next, "isBeginMark") || !-[_NSUndoObject isEndMark](head, "isEndMark"))
        goto LABEL_10;
    }
    v15 = next->next;
    -[_NSUndoStack removeObject:](self, "removeObject:", next);
    nestingLevel -= v7 & 1;
    head = previous;
    next = v15;
LABEL_21:
    if (nestingLevel)
      goto LABEL_23;
LABEL_22:
    v7 = 0;
    --self->_count;
    goto LABEL_23;
  }
}

- (unint64_t)count
{
  return self->_count;
}

- (void)_removeBottom
{
  _NSUndoObject *previous;
  uint64_t v4;
  uint64_t v5;

  previous = self->_head->previous;
  if (!-[_NSUndoObject isBeginMark](previous, "isBeginMark"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Error while removing bottom of undo stack."), 0));
  v4 = 0;
  do
  {
    if (-[_NSUndoObject isBeginMark](previous, "isBeginMark"))
      v5 = 1;
    else
      v5 = -[_NSUndoObject isEndMark](previous, "isEndMark") << 63 >> 63;
    v4 += v5;
    previous = previous->previous;

  }
  while (v4);
  self->_head->previous = previous;
  self->_head->previous->next = 0;
  --self->_count;
}

- (unint64_t)max
{
  return self->_max;
}

- (unint64_t)topLevelGroupCount
{
  _NSUndoObject *head;
  unint64_t v3;
  uint64_t v4;

  head = self->_head;
  if (head)
  {
    v3 = 0;
    v4 = 0;
    while (1)
    {
      if (-[_NSUndoObject isEndMark](head, "isEndMark"))
      {
        if (!v4)
        {
          ++v3;
          v4 = -1;
          goto LABEL_7;
        }
        --v4;
      }
      v4 += -[_NSUndoObject isBeginMark](head, "isBeginMark");
LABEL_7:
      head = head->next;
      if (!head)
        return v3;
    }
  }
  return 0;
}

- (void)push:(id)a3
{
  _NSUndoObject *head;
  id previous;
  _NSUndoObject *v8;
  unint64_t nestingLevel;
  unint64_t v10;
  unint64_t max;
  unint64_t v12;
  NSString *v13;
  objc_class *v14;
  void *v15;

  *((_QWORD *)a3 + 1) = self->_head;
  head = self->_head;
  previous = a3;
  if (head)
    previous = head->previous;
  *((_QWORD *)a3 + 2) = previous;
  v8 = self->_head;
  if (v8)
    v8->previous = (_NSUndoObject *)a3;
  self->_head = (_NSUndoObject *)a3;
  if (objc_msgSend(a3, "isEndMark"))
  {
    nestingLevel = self->_nestingLevel;
    if (!nestingLevel)
    {
      v13 = NSStringFromSelector(a2);
      v14 = (objc_class *)objc_opt_class();
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ -- %@ %p pushing more ends than begins onto stack"), v13, NSStringFromClass(v14), self), 0);
      objc_exception_throw(v15);
    }
    v10 = nestingLevel - 1;
    self->_nestingLevel = v10;
    if (!v10)
    {
      max = self->_max;
      if (max)
      {
        if (self->_count > max)
          -[_NSUndoStack _removeBottom](self, "_removeBottom");
      }
    }
  }
  else if (objc_msgSend(a3, "isBeginMark"))
  {
    v12 = self->_nestingLevel;
    if (!v12)
      ++self->_count;
    self->_nestingLevel = v12 + 1;
  }
}

- (id)popUndoObject
{
  _NSUndoObject *head;
  _NSUndoObject *next;
  unint64_t nestingLevel;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v11;
  objc_class *v12;
  void *v13;

  head = self->_head;
  if (!head)
    return 0;
  next = head->next;
  self->_head = next;
  if (next)
    next->previous = head->previous;
  if (-[_NSUndoObject isBeginMark](head, "isBeginMark"))
  {
    nestingLevel = self->_nestingLevel;
    if (!nestingLevel)
    {
      v11 = NSStringFromSelector(a2);
      v12 = (objc_class *)objc_opt_class();
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ -- %@ %p popping more begins than ends from stack"), v11, NSStringFromClass(v12), self), 0);
      objc_exception_throw(v13);
    }
    v7 = nestingLevel - 1;
    self->_nestingLevel = v7;
    if (v7)
      return head;
    v8 = -1;
    v9 = 16;
    goto LABEL_11;
  }
  if (-[_NSUndoObject isEndMark](head, "isEndMark"))
  {
    v8 = 1;
    v9 = 24;
LABEL_11:
    *(Class *)((char *)&self->super.isa + v9) = (Class)(*(char **)((char *)&self->super.isa + v9) + v8);
  }
  return head;
}

- (id)_beginMark
{
  _NSUndoObject *head;
  unint64_t nestingLevel;

  head = self->_head;
  if (head)
  {
    nestingLevel = self->_nestingLevel;
    do
    {
      nestingLevel += -[_NSUndoObject isEndMark](head, "isEndMark");
      if (-[_NSUndoObject isBeginMark](head, "isBeginMark"))
      {
        if (nestingLevel)
        {
          if (!--nestingLevel)
            break;
        }
      }
      head = head->next;
    }
    while (head);
  }
  return head;
}

- (void)setGroupIdentifier:(id)a3
{
  id v6;
  NSString *v7;
  objc_class *v8;
  void *v9;

  v6 = -[_NSUndoStack _beginMark](self, "_beginMark");
  if (!v6)
  {
    v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %p is in invalid state, calling setGroupIdentifier with no begin group mark\n"), v7, NSStringFromClass(v8), self), 0);
    objc_exception_throw(v9);
  }
  objc_msgSend(v6, "setGroupIdentifier:", a3);
}

- (id)groupIdentifier
{
  id result;

  result = -[_NSUndoStack _beginMark](self, "_beginMark");
  if (result)
    return (id)objc_msgSend(result, "groupIdentifier");
  return result;
}

- (id)topUndoObject
{
  return self->_head;
}

- (void)markBegin
{
  -[_NSUndoStack push:](self, "push:", -[_NSUndoObject init](+[_NSUndoBeginMark allocWithZone:](_NSUndoBeginMark, "allocWithZone:", -[_NSUndoStack zone](self, "zone")), "init"));
}

- (void)markEnd
{
  -[_NSUndoStack push:](self, "push:", -[_NSUndoObject init](+[_NSUndoEndMark allocWithZone:](_NSUndoEndMark, "allocWithZone:", -[_NSUndoStack zone](self, "zone")), "init"));
}

- (BOOL)isDiscardable
{
  id v2;

  v2 = -[_NSUndoStack _beginMark](self, "_beginMark");
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "isDiscardable");
  return (char)v2;
}

- (void)setDiscardable:(BOOL)a3
{
  _BOOL8 v3;
  id v6;
  NSString *v7;
  objc_class *v8;
  void *v9;

  v3 = a3;
  v6 = -[_NSUndoStack _beginMark](self, "_beginMark");
  if (!v6)
  {
    v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %p is in invalid state, calling setDiscardable with no begin group mark\n"), v7, NSStringFromClass(v8), self), 0);
    objc_exception_throw(v9);
  }
  objc_msgSend(v6, "setDiscardable:", v3);
}

- (id)userInfo
{
  id result;

  result = -[_NSUndoStack _beginMark](self, "_beginMark");
  if (result)
    return (id)objc_msgSend(result, "userInfo");
  return result;
}

- (void)setUserInfo:(id)a3
{
  id v6;
  NSString *v7;
  objc_class *v8;
  void *v9;

  v6 = -[_NSUndoStack _beginMark](self, "_beginMark");
  if (!v6)
  {
    v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %p is in invalid state, calling setUserInfo with no begin group mark\n"), v7, NSStringFromClass(v8), self), 0);
    objc_exception_throw(v9);
  }
  objc_msgSend(v6, "setUserInfo:", a3);
}

- (BOOL)popAndInvoke
{
  _NSUndoObject *head;
  uint64_t v5;
  BOOL v6;
  NSString *v8;
  objc_class *v9;
  void *v10;

  head = self->_head;
  if (head)
  {
    if (!-[_NSUndoObject isEndMark](head, "isEndMark"))
    {
      v8 = NSStringFromSelector(a2);
      v9 = (objc_class *)objc_opt_class();
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %p is in invalid state, call endUndoGrouping on undo manager before calling this method\n"), v8, NSStringFromClass(v9), self), 0);
      objc_exception_throw(v10);
    }
    head = self->_head;
  }
  v5 = 0;
  v6 = 0;
  do
  {
    if (-[_NSUndoObject isBeginMark](head, "isBeginMark"))
    {
      --v5;
    }
    else
    {
      if (!-[_NSUndoObject isEndMark](self->_head, "isEndMark"))
      {
        objc_msgSend(-[_NSUndoStack popUndoObject](self, "popUndoObject"), "invoke");
        v6 = 1;
        goto LABEL_11;
      }
      ++v5;
    }
    -[_NSUndoStack popUndoObject](self, "popUndoObject");
LABEL_11:
    head = self->_head;
  }
  while (head && v5);
  return v6;
}

- (void)removeObject:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *((_QWORD *)a3 + 1);
  v3 = *((_QWORD *)a3 + 2);
  if (v4)
  {
    *(_QWORD *)(v4 + 16) = v3;
    v5 = *((_QWORD *)a3 + 2);
    if (*(_QWORD *)(v5 + 8))
      *(_QWORD *)(v5 + 8) = *((_QWORD *)a3 + 1);
  }
  else
  {
    *(_QWORD *)(v3 + 8) = 0;
    self->_head->previous = (_NSUndoObject *)*((_QWORD *)a3 + 2);
  }
  if (self->_head == a3)
    self->_head = (_NSUndoObject *)*((_QWORD *)a3 + 1);

}

- (id)description
{
  id result;
  _NSUndoObject *head;
  uint64_t v5;
  uint64_t v6;

  result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Stack: %p\n"), self);
  head = self->_head;
  if (head)
  {
    v5 = 0;
    do
    {
      v6 = v5 + 1;
      result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%ld: %@\n"), result, v5, head);
      head = head->next;
      v5 = v6;
    }
    while (head);
  }
  return result;
}

@end
