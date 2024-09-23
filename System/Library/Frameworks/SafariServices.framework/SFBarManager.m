@implementation SFBarManager

void __55___SFBarManager__updateRegistrationWithToken_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectAtIndexedSubscript:", a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setBarItem:enabled:", a2, objc_msgSend(*(id *)(a1 + 32), "isBarItemEnabled:", a2));
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v12, "menu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBarItem:menu:", a2, v5);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "setBarItem:hidden:", a2, objc_msgSend(v12, "isHidden"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "setBarItem:selected:", a2, objc_msgSend(v12, "isSelected"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v12, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forBarItem:", v7, a2);

  }
  if (objc_msgSend(v12, "hasImage") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v12, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:forBarItem:", v9, a2);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v12, "attributedTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttributedTitle:forBarItem:", v11, a2);

  }
}

uint64_t __57___SFBarManager_performCoalescedUpdatesAnimated_updates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performCoalescedUpdatesNowAnimated:", *(unsigned __int8 *)(a1 + 40));
}

@end
