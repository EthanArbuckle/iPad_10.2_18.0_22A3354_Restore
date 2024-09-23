@implementation GCKeyboardAndMouseEventSubject

void __63___GCKeyboardAndMouseEventSubject_Button__observeButtonEvents___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "buttonEventObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
  v4 = objc_msgSend(v2, "containsObject:", v3);

  if (v4)
  {
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "buttonEventObservers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      v7 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
      objc_msgSend(v6, "removeObject:", v7);

      objc_msgSend(*(id *)(a1 + 32), "setButtonEventObservers:", v6);
      objc_msgSend(*(id *)(a1 + 32), "buttonEventObservers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
      v10 = objc_msgSend(v8, "containsObject:", v9);

    }
    while ((v10 & 1) != 0);
  }
}

void __67___GCKeyboardAndMouseEventSubject_Keyboard__observeKeyboardEvents___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "keyboardEventObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
  v4 = objc_msgSend(v2, "containsObject:", v3);

  if (v4)
  {
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "keyboardEventObservers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      v7 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
      objc_msgSend(v6, "removeObject:", v7);

      objc_msgSend(*(id *)(a1 + 32), "setKeyboardEventObservers:", v6);
      objc_msgSend(*(id *)(a1 + 32), "keyboardEventObservers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
      v10 = objc_msgSend(v8, "containsObject:", v9);

    }
    while ((v10 & 1) != 0);
  }
}

void __63___GCKeyboardAndMouseEventSubject_Scroll__observeScrollEvents___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "scrollEventObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
  v4 = objc_msgSend(v2, "containsObject:", v3);

  if (v4)
  {
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "scrollEventObservers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      v7 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
      objc_msgSend(v6, "removeObject:", v7);

      objc_msgSend(*(id *)(a1 + 32), "setScrollEventObservers:", v6);
      objc_msgSend(*(id *)(a1 + 32), "scrollEventObservers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
      v10 = objc_msgSend(v8, "containsObject:", v9);

    }
    while ((v10 & 1) != 0);
  }
}

void __69___GCKeyboardAndMouseEventSubject_Digitizer__observeDigitizerEvents___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "digitizerEventObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
  v4 = objc_msgSend(v2, "containsObject:", v3);

  if (v4)
  {
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "digitizerEventObservers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      v7 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
      objc_msgSend(v6, "removeObject:", v7);

      objc_msgSend(*(id *)(a1 + 32), "setDigitizerEventObservers:", v6);
      objc_msgSend(*(id *)(a1 + 32), "digitizerEventObservers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
      v10 = objc_msgSend(v8, "containsObject:", v9);

    }
    while ((v10 & 1) != 0);
  }
}

void __65___GCKeyboardAndMouseEventSubject_Pointer__observePointerEvents___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "pointerEventObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
  v4 = objc_msgSend(v2, "containsObject:", v3);

  if (v4)
  {
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "pointerEventObservers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      v7 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
      objc_msgSend(v6, "removeObject:", v7);

      objc_msgSend(*(id *)(a1 + 32), "setPointerEventObservers:", v6);
      objc_msgSend(*(id *)(a1 + 32), "pointerEventObservers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
      v10 = objc_msgSend(v8, "containsObject:", v9);

    }
    while ((v10 & 1) != 0);
  }
}

@end
