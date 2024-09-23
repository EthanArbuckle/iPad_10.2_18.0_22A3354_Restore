@implementation _NSXPCConnectionExpectedReplies

- (_NSXPCConnectionExpectedReplies)init
{
  self->_sequence = 1;
  self->_lock._os_unfair_lock_opaque = 0;
  return self;
}

- (char)sequenceForProgress:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  char *v5;
  __CFDictionary *Mutable;

  if (!a1)
    return 0;
  v4 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock_with_options();
  v5 = *(char **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v5 + 1;
  if (a2)
  {
    Mutable = *(__CFDictionary **)(a1 + 8);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0, MEMORY[0x1E0C9B3A0]);
      *(_QWORD *)(a1 + 8) = Mutable;
    }
    CFDictionarySetValue(Mutable, v5, a2);
  }
  os_unfair_lock_unlock(v4);
  return v5;
}

- (void)removeProgressSequence:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  __CFDictionary *Mutable;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock_with_options();
    Mutable = *(__CFDictionary **)(a1 + 8);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0, MEMORY[0x1E0C9B3A0]);
      *(_QWORD *)(a1 + 8) = Mutable;
    }
    CFDictionaryRemoveValue(Mutable, a2);
    os_unfair_lock_unlock(v4);
  }
}

- (void)dealloc
{
  __CFDictionary *replyTable;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  replyTable = self->_replyTable;
  if (replyTable)
    CFRelease(replyTable);
  v4.receiver = self;
  v4.super_class = (Class)_NSXPCConnectionExpectedReplies;
  -[_NSXPCConnectionExpectedReplies dealloc](&v4, sel_dealloc);
}

- (os_unfair_lock_s)progressForSequence:(os_unfair_lock_s *)result
{
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  const __CFDictionary *Mutable;
  void *Value;
  id v7;

  if (result)
  {
    v3 = result;
    v4 = result + 6;
    os_unfair_lock_lock_with_options();
    Mutable = *(const __CFDictionary **)&v3[2]._os_unfair_lock_opaque;
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0, MEMORY[0x1E0C9B3A0]);
      *(_QWORD *)&v3[2]._os_unfair_lock_opaque = Mutable;
    }
    Value = (void *)CFDictionaryGetValue(Mutable, a2);
    v7 = Value;
    os_unfair_lock_unlock(v4);
    return (os_unfair_lock_s *)Value;
  }
  return result;
}

@end
