@implementation GCKeyboardInput

- (GCKeyboardInput)initWithIdentifier:(id)a3
{
  GCKeyboardInput *v3;
  void *v4;
  uint64_t v5;
  NSSet *allCodes;
  uint64_t v7;
  NSArray *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSArray *keys;
  _OWORD v19[4];
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)GCKeyboardInput;
  v3 = -[GCPhysicalInputProfile initWithIdentifier:](&v25, sel_initWithIdentifier_, a3);
  if (v3)
  {
    ::allCodes();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    allCodes = v3->_allCodes;
    v3->_allCodes = (NSSet *)v5;

    v7 = 231;
    +[NSMutableArray arrayWithCapacity:](&off_254DEBB20, "arrayWithCapacity:", 231);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    do
    {
      +[NSNull null](&off_254E06A98, "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v8, "addObject:", v9);

      --v7;
    }
    while (v7);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v14), "longValue");
          memset(v19, 0, sizeof(v19));
          v20 = 0;
          nameForKeyCode(v15);
          *(_QWORD *)&v19[0] = objc_claimAutoreleasedReturnValue();
          WORD4(v19[0]) = 257;
          -[GCPhysicalInputProfile _keyboardButtonWithInfo:](v3, "_keyboardButtonWithInfo:", v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setKeyCode:", v15);
          -[NSArray setObject:atIndexedSubscript:](v8, "setObject:atIndexedSubscript:", v16, v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    keys = v3->_keys;
    v3->_keys = v8;

    v3->_numberOfKeysPressed = 0;
  }
  return v3;
}

- (id)name
{
  return CFSTR("Keyboard");
}

- (BOOL)hasButton:(int64_t)a3
{
  NSSet *allCodes;
  void *v4;

  allCodes = self->_allCodes;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(allCodes) = -[NSSet containsObject:](allCodes, "containsObject:", v4);

  return (char)allCodes;
}

- (BOOL)isAnyKeyPressed
{
  return self->_numberOfKeysPressed > 0;
}

- (GCControllerButtonInput)buttonForKeyCode:(GCKeyCode)code
{
  void *v5;

  if (-[GCKeyboardInput hasButton:](self, "hasButton:"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_keys, "objectAtIndexedSubscript:", code);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (GCControllerButtonInput *)v5;
}

- (GCKeyboardValueChangedHandler)keyChangedHandler
{
  return self->_keyChangedHandler;
}

- (void)setKeyChangedHandler:(GCKeyboardValueChangedHandler)keyChangedHandler
{
  objc_setProperty_nonatomic_copy(self, a2, keyChangedHandler, 688);
}

- (id)keyChangedHandlerPrivate
{
  return self->_keyChangedHandlerPrivate;
}

- (void)setKeyChangedHandlerPrivate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keyChangedHandlerPrivate, 0);
  objc_storeStrong(&self->_keyChangedHandler, 0);
  objc_storeStrong(&self->_keyboardEventObservation, 0);
  objc_storeStrong((id *)&self->_allCodes, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (void)_handleKeyboardEvent:(_DWORD *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  double v9;
  int v10;
  int v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "usage");
    v6 = objc_msgSend(v4, "down");
    if (objc_msgSend(v4, "usagePage") == 7
      && (v5 & 0x8000000000000000) == 0
      && objc_msgSend(a1, "hasButton:", v5))
    {
      objc_msgSend(a1, "_receivedEvent");
      objc_msgSend(a1, "buttonForKeyCode:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(a1, "handlerQueue");
        v8 = objc_claimAutoreleasedReturnValue();
        *(float *)&v9 = (float)v6;
        if (objc_msgSend(v7, "_setValue:queue:", v8, v9))
        {
          v10 = a1[168];
          if (v6)
            v11 = v10 + 1;
          else
            v11 = v10 - 1;
          a1[168] = v11 & ~(v11 >> 31);
          v12[0] = MEMORY[0x24BDAC760];
          v12[1] = 3221225472;
          v12[2] = __48__GCKeyboardInput_PubSub___handleKeyboardEvent___block_invoke;
          v12[3] = &unk_24D2B5DA0;
          v12[4] = a1;
          v13 = v7;
          v14 = v5;
          v15 = v6;
          dispatch_async(v8, v12);

        }
      }

    }
  }

}

void __48__GCKeyboardInput_PubSub___handleKeyboardEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "valueDidChangeHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v2;
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[86];
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    v3 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v3, "keyChangedHandlerPrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "keyChangedHandlerPrivate");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, BOOL))v6)[2](v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56) != 0);

  }
}

- (void)setKeyboardEventSource:(id)a3
{
  id keyboardEventObservation;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  keyboardEventObservation = self->_keyboardEventObservation;
  self->_keyboardEventObservation = 0;
  v5 = a3;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__GCKeyboardInput_PubSub__setKeyboardEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e28_v16__0____GCKeyboardEvent__8lu32l8;
  v8[4] = self;
  objc_msgSend(v5, "observeKeyboardEvents:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_keyboardEventObservation;
  self->_keyboardEventObservation = v6;

}

void __50__GCKeyboardInput_PubSub__setKeyboardEventSource___block_invoke(uint64_t a1, void *a2)
{
  -[GCKeyboardInput _handleKeyboardEvent:](*(_DWORD **)(a1 + 32), a2);
}

- (void)handleKeyboardEvent:(id)a3
{
  -[GCKeyboardInput _handleKeyboardEvent:](self, a3);
}

@end
