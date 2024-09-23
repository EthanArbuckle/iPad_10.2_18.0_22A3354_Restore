@implementation TUTestState

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return NSPrintF((uint64_t)"TUTestState %{ptr} %@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self);
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  TUTestState *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_objects, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  TUTestState *v7;
  NSMutableDictionary *objects;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  objects = v7->_objects;
  if (v11)
  {
    if (!objects)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = v7->_objects;
      v7->_objects = v9;

      objects = v7->_objects;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](objects, "setObject:forKeyedSubscript:", v11, v6);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](objects, "removeObjectForKey:", v6);
  }
  objc_sync_exit(v7);

}

- (void)incrementIntegerForKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  -[TUTestState objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v7, "integerValue") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUTestState setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, v5);

}

- (void)signal
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__TUTestState_signal__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (int)waitWithTimeout:(double)a3
{
  int signalCount;
  int result;

  signalCount = self->_signalCount;
  if (signalCount > 0)
    goto LABEL_4;
  if (CFRunLoopRunEx(a3) == 2)
  {
    signalCount = self->_signalCount;
LABEL_4:
    result = 0;
    self->_signalCount = signalCount - 1;
    return result;
  }
  return -6722;
}

- (int)signalCount
{
  return self->_signalCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

void __21__TUTestState_signal__block_invoke(uint64_t a1)
{
  __CFRunLoop *Main;

  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
  Main = CFRunLoopGetMain();
  CFRunLoopStop(Main);
}

@end
