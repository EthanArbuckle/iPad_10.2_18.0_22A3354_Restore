@implementation _GCKeyboardAndMouseEventSubject

- (_GCKeyboardAndMouseEventSubject)init
{
  _GCKeyboardAndMouseEventSubject *v2;
  uint64_t v3;
  NSArray *buttonEventObservers;
  uint64_t v5;
  NSArray *keyboardEventObservers;
  uint64_t v7;
  NSArray *scrollEventObservers;
  uint64_t v9;
  NSArray *digitizerEventObservers;
  uint64_t v11;
  NSArray *pointerEventObservers;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_GCKeyboardAndMouseEventSubject;
  v2 = -[_GCKeyboardAndMouseEventSubject init](&v14, sel_init);
  v3 = objc_opt_new();
  buttonEventObservers = v2->_buttonEventObservers;
  v2->_buttonEventObservers = (NSArray *)v3;

  v5 = objc_opt_new();
  keyboardEventObservers = v2->_keyboardEventObservers;
  v2->_keyboardEventObservers = (NSArray *)v5;

  v7 = objc_opt_new();
  scrollEventObservers = v2->_scrollEventObservers;
  v2->_scrollEventObservers = (NSArray *)v7;

  v9 = objc_opt_new();
  digitizerEventObservers = v2->_digitizerEventObservers;
  v2->_digitizerEventObservers = (NSArray *)v9;

  v11 = objc_opt_new();
  pointerEventObservers = v2->_pointerEventObservers;
  v2->_pointerEventObservers = (NSArray *)v11;

  return v2;
}

- (NSArray)buttonEventObservers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setButtonEventObservers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)keyboardEventObservers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKeyboardEventObservers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)scrollEventObservers
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setScrollEventObservers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSArray)digitizerEventObservers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDigitizerEventObservers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSArray)pointerEventObservers
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPointerEventObservers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerEventObservers, 0);
  objc_storeStrong((id *)&self->_digitizerEventObservers, 0);
  objc_storeStrong((id *)&self->_scrollEventObservers, 0);
  objc_storeStrong((id *)&self->_keyboardEventObservers, 0);
  objc_storeStrong((id *)&self->_buttonEventObservers, 0);
}

- (void)publishButtonEvent:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    a1[1] = objc_msgSend(v3, "mask");
    objc_getProperty(a1, sel_buttonEventObservers, 16, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++) + 16))();
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)addMaskAndPublishButtonEvent:(uint64_t)a3 atTimestamp:
{
  id v6;

  if (a1)
  {
    v6 = (id)objc_opt_new();
    objc_msgSend(v6, "setTimestamp:", a3);
    objc_msgSend(v6, "setMask:", a1[1] | a2);
    -[_GCKeyboardAndMouseEventSubject publishButtonEvent:](a1, v6);

  }
}

- (void)removeMaskAndPublishButtonEvent:(uint64_t)a3 atTimestamp:
{
  id v6;

  if (a1)
  {
    v6 = (id)objc_opt_new();
    objc_msgSend(v6, "setTimestamp:", a3);
    objc_msgSend(v6, "setMask:", a1[1] & ~a2);
    -[_GCKeyboardAndMouseEventSubject publishButtonEvent:](a1, v6);

  }
}

- (id)observeButtonEvents:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _GCObservation *v14;
  id v15;
  _GCObservation *v16;
  _QWORD v18[5];
  id v19;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[_GCKeyboardAndMouseEventSubject buttonEventObservers](self, "buttonEventObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x2199DEBB0](v4);
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    do
    {
      -[_GCKeyboardAndMouseEventSubject buttonEventObservers](self, "buttonEventObservers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      v10 = (void *)MEMORY[0x2199DEBB0](v4);
      objc_msgSend(v9, "addObject:", v10);

      -[_GCKeyboardAndMouseEventSubject setButtonEventObservers:](self, "setButtonEventObservers:", v9);
      -[_GCKeyboardAndMouseEventSubject buttonEventObservers](self, "buttonEventObservers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x2199DEBB0](v4);
      v13 = objc_msgSend(v11, "containsObject:", v12);

    }
    while (!v13);
  }
  v14 = [_GCObservation alloc];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __63___GCKeyboardAndMouseEventSubject_Button__observeButtonEvents___block_invoke;
  v18[3] = &unk_24D2B2AD0;
  v18[4] = self;
  v19 = v4;
  v15 = v4;
  v16 = -[_GCObservation initWithCleanupHandler:](v14, "initWithCleanupHandler:", v18);

  return v16;
}

- (void)publishKeyboardEvent:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_getProperty(a1, sel_keyboardEventObservers, 24, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (id)observeKeyboardEvents:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _GCObservation *v14;
  id v15;
  _GCObservation *v16;
  _QWORD v18[5];
  id v19;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[_GCKeyboardAndMouseEventSubject keyboardEventObservers](self, "keyboardEventObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x2199DEBB0](v4);
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    do
    {
      -[_GCKeyboardAndMouseEventSubject keyboardEventObservers](self, "keyboardEventObservers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      v10 = (void *)MEMORY[0x2199DEBB0](v4);
      objc_msgSend(v9, "addObject:", v10);

      -[_GCKeyboardAndMouseEventSubject setKeyboardEventObservers:](self, "setKeyboardEventObservers:", v9);
      -[_GCKeyboardAndMouseEventSubject keyboardEventObservers](self, "keyboardEventObservers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x2199DEBB0](v4);
      v13 = objc_msgSend(v11, "containsObject:", v12);

    }
    while (!v13);
  }
  v14 = [_GCObservation alloc];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __67___GCKeyboardAndMouseEventSubject_Keyboard__observeKeyboardEvents___block_invoke;
  v18[3] = &unk_24D2B2AD0;
  v18[4] = self;
  v19 = v4;
  v15 = v4;
  v16 = -[_GCObservation initWithCleanupHandler:](v14, "initWithCleanupHandler:", v18);

  return v16;
}

- (void)publishScrollEvent:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_getProperty(a1, sel_scrollEventObservers, 32, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (id)observeScrollEvents:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _GCObservation *v14;
  id v15;
  _GCObservation *v16;
  _QWORD v18[5];
  id v19;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[_GCKeyboardAndMouseEventSubject scrollEventObservers](self, "scrollEventObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x2199DEBB0](v4);
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    do
    {
      -[_GCKeyboardAndMouseEventSubject scrollEventObservers](self, "scrollEventObservers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      v10 = (void *)MEMORY[0x2199DEBB0](v4);
      objc_msgSend(v9, "addObject:", v10);

      -[_GCKeyboardAndMouseEventSubject setScrollEventObservers:](self, "setScrollEventObservers:", v9);
      -[_GCKeyboardAndMouseEventSubject scrollEventObservers](self, "scrollEventObservers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x2199DEBB0](v4);
      v13 = objc_msgSend(v11, "containsObject:", v12);

    }
    while (!v13);
  }
  v14 = [_GCObservation alloc];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __63___GCKeyboardAndMouseEventSubject_Scroll__observeScrollEvents___block_invoke;
  v18[3] = &unk_24D2B2AD0;
  v18[4] = self;
  v19 = v4;
  v15 = v4;
  v16 = -[_GCObservation initWithCleanupHandler:](v14, "initWithCleanupHandler:", v18);

  return v16;
}

- (void)publishDigitizerEvent:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_getProperty(a1, sel_digitizerEventObservers, 40, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (id)observeDigitizerEvents:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _GCObservation *v14;
  id v15;
  _GCObservation *v16;
  _QWORD v18[5];
  id v19;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[_GCKeyboardAndMouseEventSubject digitizerEventObservers](self, "digitizerEventObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x2199DEBB0](v4);
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    do
    {
      -[_GCKeyboardAndMouseEventSubject digitizerEventObservers](self, "digitizerEventObservers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      v10 = (void *)MEMORY[0x2199DEBB0](v4);
      objc_msgSend(v9, "addObject:", v10);

      -[_GCKeyboardAndMouseEventSubject setDigitizerEventObservers:](self, "setDigitizerEventObservers:", v9);
      -[_GCKeyboardAndMouseEventSubject digitizerEventObservers](self, "digitizerEventObservers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x2199DEBB0](v4);
      v13 = objc_msgSend(v11, "containsObject:", v12);

    }
    while (!v13);
  }
  v14 = [_GCObservation alloc];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __69___GCKeyboardAndMouseEventSubject_Digitizer__observeDigitizerEvents___block_invoke;
  v18[3] = &unk_24D2B2AD0;
  v18[4] = self;
  v19 = v4;
  v15 = v4;
  v16 = -[_GCObservation initWithCleanupHandler:](v14, "initWithCleanupHandler:", v18);

  return v16;
}

- (void)publishPointerEvent:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_getProperty(a1, sel_pointerEventObservers, 48, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (id)observePointerEvents:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _GCObservation *v14;
  id v15;
  _GCObservation *v16;
  _QWORD v18[5];
  id v19;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[_GCKeyboardAndMouseEventSubject pointerEventObservers](self, "pointerEventObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x2199DEBB0](v4);
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    do
    {
      -[_GCKeyboardAndMouseEventSubject pointerEventObservers](self, "pointerEventObservers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      v10 = (void *)MEMORY[0x2199DEBB0](v4);
      objc_msgSend(v9, "addObject:", v10);

      -[_GCKeyboardAndMouseEventSubject setPointerEventObservers:](self, "setPointerEventObservers:", v9);
      -[_GCKeyboardAndMouseEventSubject pointerEventObservers](self, "pointerEventObservers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x2199DEBB0](v4);
      v13 = objc_msgSend(v11, "containsObject:", v12);

    }
    while (!v13);
  }
  v14 = [_GCObservation alloc];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65___GCKeyboardAndMouseEventSubject_Pointer__observePointerEvents___block_invoke;
  v18[3] = &unk_24D2B2AD0;
  v18[4] = self;
  v19 = v4;
  v15 = v4;
  v16 = -[_GCObservation initWithCleanupHandler:](v14, "initWithCleanupHandler:", v18);

  return v16;
}

@end
