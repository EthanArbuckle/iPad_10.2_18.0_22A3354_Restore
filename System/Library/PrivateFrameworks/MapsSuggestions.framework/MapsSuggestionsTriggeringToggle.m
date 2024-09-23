@implementation MapsSuggestionsTriggeringToggle

- (MapsSuggestionsTriggeringToggle)initWithName:(id)a3 startState:(BOOL)a4 behavior:(unint64_t)a5
{
  MapsSuggestionsTriggeringToggle *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MapsSuggestionsTriggeringToggle;
  result = -[MapsSuggestionsBaseTrigger initWithName:](&v8, sel_initWithName_, a3);
  if (result)
  {
    result->_behavior = a5;
    result->_state = a4;
  }
  return result;
}

- (MapsSuggestionsTriggeringToggle)initWithName:(id)a3 startState:(BOOL)a4
{
  return -[MapsSuggestionsTriggeringToggle initWithName:startState:behavior:](self, "initWithName:startState:behavior:", a3, a4, 3);
}

- (BOOL)state
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  const char *label;
  void *v8;
  void *v9;
  char v10;
  char v11;
  _QWORD v13[2];
  uint64_t (*v14)(uint64_t);
  void *v15;
  MapsSuggestionsTriggeringToggle *v16;
  _QWORD block[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v14 = __40__MapsSuggestionsTriggeringToggle_state__block_invoke;
  v15 = &unk_1E4BCEA88;
  v16 = self;
  v5 = v13;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = ___ZN3MSg26dispatch_sync_if_differentIbEET_PU28objcproto17OS_dispatch_queue8NSObjectU13block_pointerFS1_vE_block_invoke;
  block[3] = &unk_1E4BCDE48;
  v19 = &v20;
  v6 = v5;
  v18 = v6;
  label = dispatch_queue_get_label(v3);
  if (label == dispatch_queue_get_label(0))
  {
    v9 = (void *)MEMORY[0x1A859CDD8]();
    v10 = v14((uint64_t)v6);
    *((_BYTE *)v21 + 24) = v10;
    objc_autoreleasePoolPop(v9);
    v8 = v6;
  }
  else
  {
    dispatch_sync(v3, block);
    v8 = v18;
  }
  v11 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v11;
}

uint64_t __40__MapsSuggestionsTriggeringToggle_state__block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40);
}

- (void)setState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *label;
  void *v7;
  unint64_t behavior;
  _QWORD block[6];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MapsSuggestionsTriggeringToggle_setState___block_invoke;
  block[3] = &unk_1E4BD0C70;
  block[4] = self;
  block[5] = &v11;
  v10 = v3;
  label = dispatch_queue_get_label(v5);
  if (label == dispatch_queue_get_label(0))
  {
    v7 = (void *)MEMORY[0x1A859CDD8]();
    *((_BYTE *)v12 + 24) = self->_state == v3;
    self->_state = v3;
    ++self->_timesUpdated;
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    dispatch_sync(v5, block);
  }

  behavior = self->_behavior;
  if ((!*((_BYTE *)v12 + 24) || (behavior & 4) != 0) && ((behavior & 1) != 0 && v3 || (behavior & 2) != 0 && !v3))
    -[MapsSuggestionsBaseTrigger triggerMyObservers](self, "triggerMyObservers");
  _Block_object_dispose(&v11, 8);
}

uint64_t __44__MapsSuggestionsTriggeringToggle_setState___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 40) == *(unsigned __int8 *)(result + 48);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = *(_BYTE *)(result + 48);
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (unint64_t)timesUpdated
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  const char *label;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD v13[2];
  uint64_t (*v14)(uint64_t);
  void *v15;
  MapsSuggestionsTriggeringToggle *v16;
  _QWORD block[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v14 = __47__MapsSuggestionsTriggeringToggle_timesUpdated__block_invoke;
  v15 = &unk_1E4BD0988;
  v16 = self;
  v5 = v13;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = ___ZN3MSg26dispatch_sync_if_differentImEET_PU28objcproto17OS_dispatch_queue8NSObjectU13block_pointerFS1_vE_block_invoke;
  block[3] = &unk_1E4BCDE48;
  v19 = &v20;
  v6 = v5;
  v18 = v6;
  label = dispatch_queue_get_label(v3);
  if (label == dispatch_queue_get_label(0))
  {
    v9 = (void *)MEMORY[0x1A859CDD8]();
    v10 = v14((uint64_t)v6);
    v21[3] = v10;
    objc_autoreleasePoolPop(v9);
    v8 = v6;
  }
  else
  {
    dispatch_sync(v3, block);
    v8 = v18;
  }
  v11 = v21[3];

  _Block_object_dispose(&v20, 8);
  return v11;
}

uint64_t __47__MapsSuggestionsTriggeringToggle_timesUpdated__block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
}

- (id)objectForJSON
{
  return MSg::jsonFor((MSg *)-[MapsSuggestionsTriggeringToggle isTrue](self, "isTrue"));
}

- (NSString)description
{
  id v3;
  void *v4;
  _BOOL4 v5;
  unint64_t v6;
  const char *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MapsSuggestionsBaseTrigger uniqueName](self, "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MapsSuggestionsTriggeringToggle state](self, "state");
  v6 = -[MapsSuggestionsTriggeringToggle timesUpdated](self, "timesUpdated");
  v7 = "NO";
  if (v5)
    v7 = "YES";
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ state=%s (%u updates)"), v4, v7, v6);

  return (NSString *)v8;
}

@end
