@implementation UIView(AccessibilityDragAndDrop)

- (uint64_t)_accessibilityDragAndDropTargetViewForDrop:()AccessibilityDragAndDrop
{
  return objc_msgSend(a1, "_accessibilityDragAndDropTargetViewForDrop:eventGestureController:", a3, 0);
}

- (id)_accessibilityDragAndDropTargetViewForDrop:()AccessibilityDragAndDrop eventGestureController:
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "superview");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v17 = a4;
    do
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v6, "interactions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
LABEL_5:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "delegate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = 0;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;

          if (v9 == ++v11)
          {
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
            if (v9)
              goto LABEL_5;
            goto LABEL_14;
          }
        }
        v14 = v6;
        if (v17)
          *v17 = objc_retainAutorelease(v13);

        if (v14)
          goto LABEL_20;
      }
      else
      {
LABEL_14:

      }
      objc_msgSend(v6, "superview");
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v15;
    }
    while (v15);
  }
  v14 = 0;
LABEL_20:

  return v14;
}

@end
