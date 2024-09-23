@implementation HUScrollGestureRecognitionResolver

- (HUScrollGestureRecognitionResolver)init
{
  HUScrollGestureRecognitionResolver *v2;
  uint64_t v3;
  NSMutableSet *mutablePanGestureReocgnizers;
  uint64_t v5;
  NSMutableSet *conflictingGestureStates;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUScrollGestureRecognitionResolver;
  v2 = -[HUScrollGestureRecognitionResolver init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    mutablePanGestureReocgnizers = v2->_mutablePanGestureReocgnizers;
    v2->_mutablePanGestureReocgnizers = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    conflictingGestureStates = v2->_conflictingGestureStates;
    v2->_conflictingGestureStates = (NSMutableSet *)v5;

    v2->_conflictingGestureActivationDelay = 0.15;
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[5];
  _QWORD v10[5];

  -[HUScrollGestureRecognitionResolver mutablePanGestureReocgnizers](self, "mutablePanGestureReocgnizers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__HUScrollGestureRecognitionResolver_dealloc__block_invoke;
  v10[3] = &unk_1E6F50970;
  v10[4] = self;
  objc_msgSend(v4, "na_each:", v10);

  -[HUScrollGestureRecognitionResolver conflictingGestureStates](self, "conflictingGestureStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __45__HUScrollGestureRecognitionResolver_dealloc__block_invoke_2;
  v9[3] = &unk_1E6F50998;
  v9[4] = self;
  objc_msgSend(v7, "na_each:", v9);

  v8.receiver = self;
  v8.super_class = (Class)HUScrollGestureRecognitionResolver;
  -[HUScrollGestureRecognitionResolver dealloc](&v8, sel_dealloc);
}

uint64_t __45__HUScrollGestureRecognitionResolver_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removePanGestureRecognizer:", a2);
}

uint64_t __45__HUScrollGestureRecognitionResolver_dealloc__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeConflictingGestureState:", a2);
}

- (NSSet)conflictingGestureRecognizers
{
  void *v2;
  void *v3;

  -[HUScrollGestureRecognitionResolver conflictingGestureStates](self, "conflictingGestureStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_57);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

uint64_t __67__HUScrollGestureRecognitionResolver_conflictingGestureRecognizers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "gestureRecognizer");
}

- (void)addPanGestureRecognizer:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HUScrollGestureRecognitionResolver mutablePanGestureReocgnizers](self, "mutablePanGestureReocgnizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if ((v5 & 1) == 0)
  {
    -[HUScrollGestureRecognitionResolver mutablePanGestureReocgnizers](self, "mutablePanGestureReocgnizers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    objc_msgSend(v7, "addTarget:action:", self, sel__handlePanGesture_);
  }

}

- (void)removePanGestureRecognizer:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HUScrollGestureRecognitionResolver mutablePanGestureReocgnizers](self, "mutablePanGestureReocgnizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if (v5)
  {
    -[HUScrollGestureRecognitionResolver mutablePanGestureReocgnizers](self, "mutablePanGestureReocgnizers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v7);

    objc_msgSend(v7, "removeTarget:action:", self, sel__handlePanGesture_);
  }

}

- (void)addConflictingGestureRecognizer:(id)a3
{
  _HUScrollGestureRecognitionState *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HUScrollGestureRecognitionResolver _stateForConflictingGestureRecognizer:](self, "_stateForConflictingGestureRecognizer:");
  v4 = (_HUScrollGestureRecognitionState *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[_HUScrollGestureRecognitionState initWithGestureRecognizer:]([_HUScrollGestureRecognitionState alloc], "initWithGestureRecognizer:", v6);
    -[HUScrollGestureRecognitionResolver conflictingGestureStates](self, "conflictingGestureStates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

    objc_msgSend(v6, "addTarget:action:", self, sel__handleConflictingGesture_);
  }

}

- (void)removeConflictingGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;

  -[HUScrollGestureRecognitionResolver _stateForConflictingGestureRecognizer:](self, "_stateForConflictingGestureRecognizer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[HUScrollGestureRecognitionResolver _removeConflictingGestureState:](self, "_removeConflictingGestureState:", v4);
    v4 = v5;
  }

}

- (void)_removeConflictingGestureState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "activationTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  objc_msgSend(v4, "gestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTarget:action:", self, sel__handleConflictingGesture_);

  -[HUScrollGestureRecognitionResolver conflictingGestureStates](self, "conflictingGestureStates");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v4);

}

- (id)_stateForConflictingGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUScrollGestureRecognitionResolver conflictingGestureStates](self, "conflictingGestureStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__HUScrollGestureRecognitionResolver__stateForConflictingGestureRecognizer___block_invoke;
  v9[3] = &unk_1E6F50A00;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __76__HUScrollGestureRecognitionResolver__stateForConflictingGestureRecognizer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "gestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)_handlePanGesture:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 1)
      -[HUScrollGestureRecognitionResolver _cancelConflictingGestures](self, "_cancelConflictingGestures");
  }
  else
  {
    -[HUScrollGestureRecognitionResolver _clearSimultaenouslyRecognizedGestures](self, "_clearSimultaenouslyRecognizedGestures");
  }
}

- (void)_activeTimerDidFireForOtherGesture:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[HUScrollGestureRecognitionResolver _stateForConflictingGestureRecognizer:](self, "_stateForConflictingGestureRecognizer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "setActivationTimer:", 0);
    -[HUScrollGestureRecognitionResolver mutablePanGestureReocgnizers](self, "mutablePanGestureReocgnizers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_each:", &__block_literal_global_28);

    v4 = v6;
  }

}

void __73__HUScrollGestureRecognitionResolver__activeTimerDidFireForOtherGesture___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setEnabled:", 0);
  objc_msgSend(v2, "setEnabled:", 1);

}

- (void)_handleConflictingGesture:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  -[HUScrollGestureRecognitionResolver _stateForConflictingGestureRecognizer:](self, "_stateForConflictingGestureRecognizer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    NSLog(CFSTR("unexpected event from gesture recognizer %@"), v4);
  v6 = objc_msgSend(v4, "state");
  if ((unint64_t)(v6 - 3) >= 3)
  {
    if (v6 == 1)
    {
      objc_msgSend(v5, "activationTimer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cancel");

      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUScrollGestureRecognitionResolver conflictingGestureActivationDelay](self, "conflictingGestureActivationDelay");
      v11 = v10;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__HUScrollGestureRecognitionResolver__handleConflictingGesture___block_invoke;
      v13[3] = &unk_1E6F50A68;
      objc_copyWeak(&v15, &location);
      v14 = v4;
      objc_msgSend(v9, "afterDelay:performBlock:", v13, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setActivationTimer:", v12);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend(v5, "activationTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancel");

    objc_msgSend(v5, "setActivationTimer:", 0);
  }

}

void __64__HUScrollGestureRecognitionResolver__handleConflictingGesture___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_activeTimerDidFireForOtherGesture:", *(_QWORD *)(a1 + 32));

}

- (void)_cancelConflictingGestures
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HUScrollGestureRecognitionResolver conflictingGestureStates](self, "conflictingGestureStates", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "gestureRecognizer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEnabled");
        objc_msgSend(v8, "setEnabled:", 0);
        objc_msgSend(v8, "setEnabled:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[HUScrollGestureRecognitionResolver _clearSimultaenouslyRecognizedGestures](self, "_clearSimultaenouslyRecognizedGestures");
}

- (void)_clearSimultaenouslyRecognizedGestures
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[HUScrollGestureRecognitionResolver conflictingGestureStates](self, "conflictingGestureStates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "activationTimer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "cancel");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (double)conflictingGestureActivationDelay
{
  return self->_conflictingGestureActivationDelay;
}

- (void)setConflictingGestureActivationDelay:(double)a3
{
  self->_conflictingGestureActivationDelay = a3;
}

- (NSMutableSet)mutablePanGestureReocgnizers
{
  return self->_mutablePanGestureReocgnizers;
}

- (NSMutableSet)conflictingGestureStates
{
  return self->_conflictingGestureStates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictingGestureStates, 0);
  objc_storeStrong((id *)&self->_mutablePanGestureReocgnizers, 0);
}

@end
