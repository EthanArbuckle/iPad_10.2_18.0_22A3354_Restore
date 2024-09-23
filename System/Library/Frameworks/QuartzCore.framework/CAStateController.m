@implementation CAStateController

- (void)setState:(id)a3 ofLayer:(id)a4 transitionSpeed:(float)a5
{
  CAStateControllerLayer *Value;
  CAState *v10;
  CAState *v11;
  NSTimer *nextTimer;
  NSArray *v13;
  NSArray *v14;
  __CFDictionary *var1;
  CFTypeRef v16;
  uint64_t state;
  CAState *v18;
  CAState *v19;
  CAStateControllerUndo *undoStack;
  uint64_t *v21;
  uint64_t v22;
  CAStateControllerUndo *v23;
  NSMutableArray *transitions;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  const void *v29;
  CAStateController *v30;
  NSArray *v31;
  void *transition;
  double v33;
  CAStateControllerUndo *v34;
  CAState *v35;
  void *v36;
  double v37;
  uint64_t *v38;
  void *v39;
  double v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  CAStateControllerUndo *next;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  CAStateControllerLayer *v50;
  CAStateController *v51;
  CAState *v52;
  int v53;
  int v54;
  unint64_t v55;
  __CFDictionary *v56;
  CFTypeRef v57;
  double v58;
  double v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  CAStateControllerLayer *v65;
  double v66;
  uint64_t v67;
  void *v68;
  id WeakRetained;
  uint64_t v70;
  NSArray *v71;
  int v72;
  CAState *v73;
  id v74;
  CAStateControllerLayer *v75;
  CAStateController *v76;
  unint64_t v77;
  _BYTE v78[128];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    NSLog(CFSTR("trying to set state of nil layer."));
    return;
  }
  Value = (CAStateControllerLayer *)CFDictionaryGetValue(self->_data->var1, a4);
  v10 = -[CAStateControllerLayer currentState](Value, "currentState");
  if (v10 == a3)
    return;
  v11 = v10;
  if (Value)
  {
    nextTimer = Value->_nextTimer;
    if (nextTimer)
    {
      -[NSTimer invalidate](nextTimer, "invalidate");
      Value->_nextTimer = 0;

      Value->_nextState = 0;
    }
  }
  v13 = (NSArray *)objc_msgSend(a4, "states");
  v14 = (NSArray *)objc_msgSend(a4, "stateTransitions");
  if (a3)
  {
    if (-[NSArray indexOfObjectIdenticalTo:](v13, "indexOfObjectIdenticalTo:", a3) == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSLog(CFSTR("trying to set state not in given layer."));
      return;
    }
    if (!Value)
    {
      Value = -[CAStateControllerLayer initWithLayer:]([CAStateControllerLayer alloc], "initWithLayer:", a4);
      var1 = self->_data->var1;
      v16 = CFRetain(Value);
      CFDictionarySetValue(var1, a4, v16);

    }
  }
  state = +[CATransaction disableActions](CATransaction, "disableActions");
  v72 = state;
  if ((state & 1) == 0)
    state = +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  if (a3)
  {
    if (!v11
      || (state = (uint64_t)find_state(v13, -[CAState basedOn](v11, "basedOn")), v18 = (CAState *)a3, (id)state != a3))
    {
      state = (uint64_t)find_state(v13, (NSString *)objc_msgSend(a3, "basedOn"));
      v18 = (CAState *)state == v11 ? v11 : 0;
      if (v11 && (CAState *)state != v11)
      {
        v19 = v11;
        while (2)
        {
          state = (uint64_t)a3;
          do
          {
            if (v19 == (CAState *)state)
            {
              v18 = v19;
              goto LABEL_30;
            }
            state = (uint64_t)find_state(v13, (NSString *)objc_msgSend((id)state, "basedOn"));
          }
          while (state);
          state = (uint64_t)find_state(v13, -[CAState basedOn](v19, "basedOn"));
          v19 = (CAState *)state;
          v18 = 0;
          if (state)
            continue;
          break;
        }
      }
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_30:
  v73 = v11;
  if (Value)
    undoStack = Value->_undoStack;
  else
    undoStack = 0;
  v71 = v14;
  v74 = a4;
  v75 = Value;
  v76 = self;
  v77 = (unint64_t)a3;
  if (v18 == a3)
  {
    v21 = 0;
    if (!undoStack)
      goto LABEL_48;
  }
  else
  {
    do
    {
      MEMORY[0x1E0C80A78](state);
      v21 = &v70 - 4;
      *(&v70 - 3) = (uint64_t)a3;
      *(&v70 - 2) = 0;
      *(&v70 - 4) = v22;
      *(&v70 - 2) = (uint64_t)objc_alloc_init(CAStateControllerUndo);
      state = (uint64_t)find_state(v13, (NSString *)objc_msgSend(a3, "basedOn"));
      a3 = (id)state;
    }
    while ((CAState *)state != v18);
    if (!undoStack)
      goto LABEL_48;
  }
  v23 = undoStack;
  do
  {
    if (v23->_state == v18)
      break;
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    transitions = v23->_transitions;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transitions, "countByEnumeratingWithState:objects:count:", &v84, v83, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v85 != v27)
            objc_enumerationMutation(transitions);
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "invalidate");
        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transitions, "countByEnumeratingWithState:objects:count:", &v84, v83, 16);
      }
      while (v26);
    }
    v23 = v23->_next;
  }
  while (v23);
LABEL_48:
  v29 = v74;
  v30 = v76;
  v31 = v71;
  if (a5 > 0.0)
  {
    transition = find_transition(v71, (const __CFString *)-[CAState name](v73, "name"), (const __CFString *)objc_msgSend((id)v77, "name"));
    if (transition)
    {
      *(float *)&v33 = a5;
      -[CAStateController _applyTransition:layer:undo:speed:](v30, "_applyTransition:layer:undo:speed:", transition, v29, undoStack, v33);
    }
    else
    {
      if (undoStack)
      {
        v34 = undoStack;
        do
        {
          v35 = v34->_state;
          if (v35 == v18)
            break;
          v36 = find_transition(v31, (const __CFString *)-[CAState name](v35, "name"), CFSTR("*"));
          if (v36)
          {
            *(float *)&v37 = a5;
            -[CAStateController _applyTransition:layer:undo:speed:](v30, "_applyTransition:layer:undo:speed:", v36, v29, 0, v37);
          }
          v34 = v34->_next;
        }
        while (v34);
      }
      if (v21)
      {
        v38 = v21;
        do
        {
          v39 = find_transition(v31, CFSTR("*"), (const __CFString *)objc_msgSend((id)v38[1], "name"));
          if (v39)
          {
            *(float *)&v40 = a5;
            -[CAStateController _applyTransition:layer:undo:speed:](v30, "_applyTransition:layer:undo:speed:", v39, v29, v38[2], v40);
          }
          v38 = (uint64_t *)*v38;
        }
        while (v38);
      }
    }
  }
  if (undoStack)
  {
    do
    {
      if (undoStack->_state == v18)
        break;
      v41 = -[CAStateControllerUndo elements](undoStack, "elements");
      v42 = -[NSMutableArray count](v41, "count");
      if (v42)
      {
        v43 = v42 - 1;
        do
          objc_msgSend((id)-[NSMutableArray objectAtIndex:](v41, "objectAtIndex:", v43--), "apply:", 0);
        while (v43 != -1);
      }
      next = undoStack->_next;

      undoStack = next;
    }
    while (next);
  }
  for (; v21; v21 = (uint64_t *)*v21)
  {
    *(_QWORD *)(v21[2] + 8) = undoStack;
    undoStack = (CAStateControllerUndo *)v21[2];
    -[CAStateControllerUndo setState:](undoStack, "setState:", v21[1]);
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v45 = (void *)objc_msgSend((id)v21[1], "elements");
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v79, v78, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v80 != v48)
            objc_enumerationMutation(v45);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * j), "apply:", undoStack);
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v79, v78, 16);
      }
      while (v47);
    }
  }
  v50 = v75;
  if (v75)
  {
    -[CAStateControllerLayer setCurrentState:](v75, "setCurrentState:", v77);
    v51 = v76;
    goto LABEL_79;
  }
  v51 = v76;
  v55 = v77;
  if (v77 | (unint64_t)undoStack)
  {
    v50 = -[CAStateControllerLayer initWithLayer:]([CAStateControllerLayer alloc], "initWithLayer:", v29);
    v56 = v51->_data->var1;
    v57 = CFRetain(v50);
    CFDictionarySetValue(v56, v29, v57);

    -[CAStateControllerLayer setCurrentState:](v50, "setCurrentState:", v55);
    if (!v50)
    {
      v75 = 0;
LABEL_80:
      v52 = v73;
      if (v77 && a5 > 0.0)
      {
        v53 = -[NSArray indexOfObjectIdenticalTo:](v13, "indexOfObjectIdenticalTo:", v77);
        v54 = v52 ? -[NSArray indexOfObjectIdenticalTo:](v13, "indexOfObjectIdenticalTo:", v52) : -1;
        if (v54 >= v53)
          objc_msgSend((id)v77, "previousDelay");
        else
          objc_msgSend((id)v77, "nextDelay");
        v59 = v58;
        if ((*(_QWORD *)&v58 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
        {
          v60 = -[NSArray count](v13, "count");
          if (v54 < v53)
            v61 = 1;
          else
            v61 = -1;
          v62 = v61 + v53;
          while (v62 >= -1)
          {
            v63 = v62;
            if (v62 < v60 && v62 != -1)
            {
              v64 = objc_msgSend(-[NSArray objectAtIndex:](v13, "objectAtIndex:", v62), "isEnabled");
              v62 = v63 + v61;
              if (!v64)
                continue;
            }
            if (v63 < v60)
            {
              v65 = v75;
              if ((v63 & 0x80000000) == 0)
                v65->_nextState = (CAState *)-[NSArray objectAtIndex:](v13, "objectAtIndex:", v63);
              v66 = begin_time((_CAStateControllerData *)v51->_data->var3) + v59 / a5;
              v67 = mach_absolute_time();
              v65->_nextTimer = (NSTimer *)objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", v51, sel__nextStateTimer_, v29, 0, fmax(v66 - CATimeWithHostTime(v67), 0.0));
              v68 = (void *)objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
              objc_msgSend(v68, "addTimer:forMode:", v65->_nextTimer, *MEMORY[0x1E0C99860]);
              v65->_nextSpeed = a5;
            }
            goto LABEL_105;
          }
        }
      }
      goto LABEL_105;
    }
LABEL_79:
    v75 = v50;
    v50->_undoStack = undoStack;
    goto LABEL_80;
  }
  objc_msgSend(0, "setCurrentState:", 0);
LABEL_105:
  WeakRetained = objc_loadWeakRetained(&v51->_data->var2);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "stateController:didSetStateOfLayer:", v51, v74);

  if ((v72 & 1) == 0)
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 0);
}

- (void)_applyTransition:(id)a3 layer:(id)a4 undo:(id)a5 speed:(float)a6
{
  CAStateControllerTransition *v11;
  double v12;
  double beginTime;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CAAnimation *v20;
  void *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _CAStateControllerData *data;
  void *Value;
  id WeakRetained;
  double v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = objc_alloc_init(CAStateControllerTransition);
  v11->_controller = self;
  v11->_layer = (CALayer *)a4;
  v11->_transition = (CAStateTransition *)a3;
  objc_msgSend(a3, "duration");
  v11->_duration = v12;
  v11->_speed = a6;
  +[CATransaction commitTime](CATransaction, "commitTime");
  v11->_beginTime = beginTime;
  if (beginTime == 0.0)
  {
    v14 = mach_absolute_time();
    v11->_beginTime = CATimeWithHostTime(v14);
    +[CATransaction setCommitTime:](CATransaction, "setCommitTime:");
    beginTime = v11->_beginTime;
  }
  v15 = v11->_duration / v11->_speed + beginTime;
  objc_msgSend(a4, "convertTime:fromLayer:", 0);
  v17 = v16;
  objc_msgSend(a4, "convertTime:fromLayer:", 0, v15);
  v19 = v18;
  v11->_masterKey = (NSString *)(id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" \"%@\"), objc_msgSend(a3, "fromState"), objc_msgSend(a3, "toState"));
  v20 = +[CAAnimation animation](CAAnimationGroup, "animation");
  -[CAAnimation setBeginTime:](v20, "setBeginTime:", v17);
  -[CAAnimation setDuration:](v20, "setDuration:", v19 - v17);
  -[CAAnimation setDelegate:](v20, "setDelegate:", v11);
  -[CAAnimation setCAStateControllerTransition:](v20, "setCAStateControllerTransition:", v11);
  objc_msgSend(a4, "addAnimation:forKey:", v20, v11->_masterKey);
  self->_data->var3 = v11;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v21 = (void *)objc_msgSend(a3, "elements");
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v22)
  {
    v24 = v22;
    v25 = *(_QWORD *)v33;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(v21);
        *(float *)&v23 = a6;
        -[CAStateController _applyTransitionElement:layer:undo:speed:](self, "_applyTransitionElement:layer:undo:speed:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v26++), a4, a5, v23);
      }
      while (v24 != v26);
      v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    }
    while (v24);
  }
  if (a5)
    objc_msgSend(a5, "addTransition:", v11);
  data = self->_data;
  data->var3 = 0;
  Value = (void *)CFDictionaryGetValue(data->var1, a4);
  if (Value)
    objc_msgSend(Value, "addTransition:", v11);
  WeakRetained = objc_loadWeakRetained(&self->_data->var2);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(float *)&v30 = a6;
    objc_msgSend(WeakRetained, "stateController:transitionDidStart:speed:", self, a3, v30);
  }

}

- (void)_applyTransitionElement:(id)a3 layer:(id)a4 undo:(id)a5 speed:(float)a6
{
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  double v25;
  float v26;
  double v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;

  if (objc_msgSend(a3, "isEnabled"))
  {
    v10 = objc_msgSend(a3, "animation");
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(a3, "target");
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v11, "duration");
        v15 = v14;
        v16 = begin_time((_CAStateControllerData *)self->_data->var3);
        objc_msgSend(v11, "beginTime");
        v18 = v17 / a6 + v16 + v15 / a6;
        objc_msgSend(v13, "convertTime:fromLayer:", 0);
        v20 = v19;
        objc_msgSend(v13, "convertTime:fromLayer:", 0, v18);
        v22 = v21;
        objc_msgSend(v11, "speed");
        if (v20 >= 0.0 && v22 > v20)
        {
          v25 = v22 - v20;
          v26 = v15 * v23 / (v22 - v20);
          if ((LODWORD(v26) & 0x7FFFFFFFu) <= 0x7F7FFFFF)
          {
            v31 = (id)objc_msgSend(v11, "copy");
            objc_msgSend(v31, "setBeginTime:", v20);
            if (v15 != v25)
            {
              *(float *)&v27 = v26;
              objc_msgSend(v31, "setSpeed:", v27);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && !objc_msgSend(v31, "fromValue")
              && !objc_msgSend(v31, "toValue")
              && !objc_msgSend(v31, "byValue"))
            {
              v28 = (void *)objc_msgSend(v13, "presentationLayer");
              v29 = objc_msgSend(v31, "keyPath");
              if (!v29)
                v29 = objc_msgSend(a3, "key");
              objc_msgSend(v31, "setFromValue:", objc_msgSend(v28, "valueForKeyPath:", v29));
            }
            v30 = objc_msgSend(a3, "key");
            if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v31, "keyPath"))
              objc_msgSend(v31, "setKeyPath:", v30);
            -[CAStateController _addAnimation:forKey:target:undo:](self, "_addAnimation:forKey:target:undo:", v31, v30, v13, a5);

          }
        }
      }
    }
  }
}

- (void)_addAnimation:(id)a3 forKey:(id)a4 target:(id)a5 undo:(id)a6
{
  CAStateControllerAnimation *v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = CFSTR("transition");
  objc_msgSend(a3, "setRemovedOnCompletion:", 0);
  objc_msgSend(a3, "setCAStateControllerTransition:", self->_data->var3);
  objc_msgSend(a5, "addAnimation:forKey:", a3, a4);
  if (a3)
  {
    v10 = -[CAStateControllerAnimation initWithLayer:key:]([CAStateControllerAnimation alloc], "initWithLayer:key:", a5, a4);
    objc_msgSend(self->_data->var3, "addAnimation:", v10);

  }
}

- (void)_removeTransition:(id)a3 layer:(id)a4
{
  objc_msgSend((id)CFDictionaryGetValue(self->_data->var1, a4), "removeTransition:", a3);
}

- (CALayer)layer
{
  return (CALayer *)self->_data->var0;
}

- (id)stateOfLayer:(id)a3
{
  if (a3)
    return (id)objc_msgSend((id)CFDictionaryGetValue(self->_data->var1, a3), "currentState");
  NSLog(CFSTR("trying to read state of nil layer."), a2);
  return 0;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_data->var2, a3);
}

- (CAStateController)initWithLayer:(id)a3
{
  CAStateController *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CAStateController;
  v4 = -[CAStateController init](&v6, sel_init);
  if (v4)
  {
    v4->_data = (_CAStateControllerData *)malloc_type_calloc(1uLL, 0x20uLL, 0xA0040069AE433uLL);
    v4->_data->var0 = a3;
    v4->_data->var1 = CFDictionaryCreateMutable(0, 0, 0, 0);
  }
  return v4;
}

- (CAStateControllerDelegate)delegate
{
  return (CAStateControllerDelegate *)objc_loadWeak(&self->_data->var2);
}

- (void)dealloc
{
  _CAStateControllerData *data;
  _CAStateControllerData *v4;
  const __CFDictionary *var1;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  data = self->_data;
  if (data)
  {

    v4 = self->_data;
    var1 = v4->var1;
    if (var1)
    {
      CFDictionaryApplyFunction(var1, (CFDictionaryApplierFunction)release_layer, 0);
      CFRelease(self->_data->var1);
      v4 = self->_data;
    }
    objc_storeWeak(&v4->var2, 0);
    free(self->_data);
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateController;
  -[CAStateController dealloc](&v6, sel_dealloc);
}

- (void)setState:(id)a3 ofLayer:(id)a4
{
  double v4;

  LODWORD(v4) = 0;
  -[CAStateController setState:ofLayer:transitionSpeed:](self, "setState:ofLayer:transitionSpeed:", a3, a4, v4);
}

- (void)setInitialStatesOfLayer:(id)a3 transitionSpeed:(float)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  double v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "states");
  if (v7)
  {
    v8 = v7;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v31;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
        if ((objc_msgSend(v14, "isInitial") & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v14 = 0;
    }
    *(float *)&v10 = a4;
    -[CAStateController setState:ofLayer:transitionSpeed:](self, "setState:ofLayer:transitionSpeed:", v14, a3, v10);
  }
  v15 = (void *)objc_msgSend(a3, "sublayers");
  if (v15)
  {
    v16 = v15;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    if (v17)
    {
      v19 = v17;
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v16);
          *(float *)&v18 = a4;
          -[CAStateController setInitialStatesOfLayer:transitionSpeed:](self, "setInitialStatesOfLayer:transitionSpeed:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), v18);
        }
        v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
      }
      while (v19);
    }
  }
  v22 = objc_msgSend(a3, "mask");
  if (v22)
  {
    *(float *)&v23 = a4;
    -[CAStateController setInitialStatesOfLayer:transitionSpeed:](self, "setInitialStatesOfLayer:transitionSpeed:", v22, v23);
  }
}

- (void)setInitialStatesOfLayer:(id)a3
{
  double v3;

  LODWORD(v3) = 0;
  -[CAStateController setInitialStatesOfLayer:transitionSpeed:](self, "setInitialStatesOfLayer:transitionSpeed:", a3, v3);
}

- (id)removeAllStateChanges
{
  __CFDictionary *Mutable;
  __CFDictionary *var1;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  const void *v9;
  const void *v10;
  double v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  var1 = self->_data->var1;
  v5 = -[__CFDictionary countByEnumeratingWithState:objects:count:](var1, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(var1);
        v9 = *(const void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = (const void *)objc_msgSend((id)CFDictionaryGetValue(self->_data->var1, v9), "currentState");
        if (v10)
        {
          CFDictionarySetValue(Mutable, v9, v10);
          LODWORD(v11) = 0;
          -[CAStateController setState:ofLayer:transitionSpeed:](self, "setState:ofLayer:transitionSpeed:", 0, v9, v11);
        }
      }
      v6 = -[__CFDictionary countByEnumeratingWithState:objects:count:](var1, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v6);
  }
  return Mutable;
}

- (void)restoreStateChanges:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  double v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(a3, "objectForKey:", v9);
        LODWORD(v11) = 0;
        -[CAStateController setState:ofLayer:transitionSpeed:](self, "setState:ofLayer:transitionSpeed:", v10, v9, v11);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v6);
  }
}

- (void)cancelTimers
{
  __CFDictionary *var1;

  var1 = self->_data->var1;
  if (var1)
    CFDictionaryApplyFunction(var1, (CFDictionaryApplierFunction)cancelTimer, 0);
}

- (void)_nextStateTimer:(id)a3
{
  _QWORD *Value;
  double v5;
  id v6;

  Value = CFDictionaryGetValue(self->_data->var1, (const void *)objc_msgSend(a3, "userInfo"));
  if (Value)
  {
    v6 = (id)Value[6];
    Value[5] = 0;
    Value[6] = 0;
    LODWORD(v5) = *((_DWORD *)Value + 14);
    -[CAStateController setState:ofLayer:transitionSpeed:](self, "setState:ofLayer:transitionSpeed:", v5);

  }
}

@end
