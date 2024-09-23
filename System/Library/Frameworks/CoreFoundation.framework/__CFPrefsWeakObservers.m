@implementation __CFPrefsWeakObservers

- (unsigned)addObject:(id)a3
{
  id *v5;
  int v6;
  unsigned __int8 v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a3)
    -[__CFPrefsWeakObservers addObject:].cold.1();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36____CFPrefsWeakObservers_addObject___block_invoke;
  v9[3] = &unk_1E12E5CE0;
  v9[4] = a3;
  v9[5] = &v10;
  v5 = (id *)visit((uint64_t)self, 0, (uint64_t)v9);
  v6 = *((unsigned __int8 *)v11 + 24);
  if (!*((_BYTE *)v11 + 24))
  {
    objc_storeWeak(v5, a3);
    ++self->count;
    v6 = *((unsigned __int8 *)v11 + 24);
  }
  v7 = v6 == 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (__CFPrefsWeakObservers)init
{
  __CFPrefsWeakObservers *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)__CFPrefsWeakObservers;
  result = -[__CFPrefsWeakObservers init](&v3, sel_init);
  if (result)
  {
    result->values.slot = 0;
    result->values.var0 = 0;
    result->count = 0;
  }
  return result;
}

- (unint64_t)approximateCount
{
  return self->count;
}

- (unint64_t)borrowObjects:(id *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46____CFPrefsWeakObservers_borrowObjects_count___block_invoke;
  v6[3] = &unk_1E12E5D08;
  v6[4] = &v7;
  v6[5] = a4;
  v6[6] = a3;
  visit((uint64_t)self, 2, (uint64_t)v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  __CFPrefsWeakObservers *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(__CFPrefsWeakObservers);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46____CFPrefsWeakObservers_mutableCopyWithZone___block_invoke;
  v6[3] = &unk_1E12E5CB8;
  v6[4] = v4;
  visit((uint64_t)self, 2, (uint64_t)v6);
  return v4;
}

- (void)dealloc
{
  __cfobservers_t *var0;
  __cfobservers_t *v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_storeWeak((id *)&self->values.slot, 0);
  var0 = self->values.var0;
  if (var0)
  {
    do
    {
      v4 = var0->var0;
      objc_destroyWeak((id *)&var0->slot);
      free(var0);
      var0 = v4;
    }
    while (v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)__CFPrefsWeakObservers;
  -[__CFPrefsWeakObservers dealloc](&v5, sel_dealloc);
}

- (unsigned)removeObject:(id)a3
{
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a3)
    -[__CFPrefsWeakObservers removeObject:].cold.1();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39____CFPrefsWeakObservers_removeObject___block_invoke;
  v5[3] = &unk_1E12E5CE0;
  v5[4] = a3;
  v5[5] = &v6;
  visit((uint64_t)self, 1, (uint64_t)v5);
  if (*((_BYTE *)v7 + 24))
    --self->count;
  _Block_object_dispose(&v6, 8);
  return 1;
}

- (id)debugDescription
{
  CFMutableStringRef Mutable;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  Mutable = CFStringCreateMutable(0, 1024);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42____CFPrefsWeakObservers_debugDescription__block_invoke;
  v5[3] = &__block_descriptor_40_e15_v32__0__8_16_24l;
  v5[4] = Mutable;
  visit((uint64_t)self, 2, (uint64_t)v5);
  return Mutable;
}

- (void)addObject:.cold.1()
{
  qword_1EDCD1038 = (uint64_t)"invalid NULL observer";
  __break(1u);
}

- (void)removeObject:.cold.1()
{
  qword_1EDCD1038 = (uint64_t)"invalid NULL observer";
  __break(1u);
}

@end
