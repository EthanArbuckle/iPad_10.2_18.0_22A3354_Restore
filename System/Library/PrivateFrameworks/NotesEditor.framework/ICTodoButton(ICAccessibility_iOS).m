@implementation ICTodoButton(ICAccessibility_iOS)

- (BOOL)isAccessibilityElement
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)accessibilityContainer
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&off_1F04897C0;
  objc_msgSendSuper2(&v6, sel_accessibilityContainer);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
    while (!objc_msgSend(v3, "conformsToProtocol:", &unk_1F04A7230))
    {
      objc_msgSend(v3, "accessibilityContainer");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v4;
      if (!v4)
        goto LABEL_8;
    }
    v3 = v3;

    v2 = v3;
  }
  else
  {
    v3 = 0;
  }
LABEL_8:

  return v2;
}

- (id)icaxBaseAccessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Checklist item"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "icaxCorrespondingParagraphText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __ICAccessibilityStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityAttributedLabel
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_msgSend(a1, "isDone");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("completed");
  else
    v5 = CFSTR("incomplete");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1EA7E9860, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "icaxBaseAccessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "icaxAttributedStringWithLowPitchPrefix:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityUserInputLabels
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_msgSend(v2, "initWithArray:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(a1, "icaxCorrespondingParagraphText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" -"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") >= 5)
  {
    objc_msgSend(v6, "subarrayWithRange:", 0, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" "));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v3, "addObject:", v8);

  }
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(a1, "accessibilityAttributedLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
    objc_msgSend(v3, "addObject:", v10);

  return v3;
}

- (id)icaxDragSourceName
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Checklist item"), &stru_1EA7E9860, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)accessibilityDragSourceDescriptors
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_icaxParentTextView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accessibilityDragSourceDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)accessibilityDropPointDescriptors
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_icaxParentTextView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accessibilityDropPointDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_accessibilitySupportsActivateAction
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_icaxNote");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEditable");

  return v2;
}

- (uint64_t)accessibilityActivate
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "_icaxParentTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_icaxNote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditable");

  if ((_DWORD)v4)
  {
    if ((objc_msgSend(a1, "accessibilityElementIsFocused") & 1) != 0
      || objc_msgSend(v2, "isFirstResponder"))
    {
      v5 = objc_msgSend(a1, "isDone");
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5)
        v8 = CFSTR("incomplete: %@");
      else
        v8 = CFSTR("completed: %@");
      objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1EA7E9860, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "icaxCorrespondingParagraphText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringWithFormat:", v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "sendActionsForControlEvents:", 64);
      ICAccessibilityPostHighPriorityAnnouncementNotification();

    }
    else if (UIAccessibilityIsSwitchControlRunning())
    {
      objc_msgSend(a1, "sendActionsForControlEvents:", 64);
    }
    else
    {
      objc_msgSend(a1, "_icaxBeginEditingAtEndOfCorrespondingParagraph");
    }
  }

  return v4;
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_icaxNote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditable");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Edit checklist item"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC33F0]), "initWithName:target:selector:", v6, a1, sel__icaxBeginEditingAtEndOfCorrespondingParagraph);
    objc_msgSend(v2, "addObject:", v7);

  }
  v8 = (void *)objc_msgSend(v2, "copy");

  return v8;
}

- (uint64_t)_accessibilityShouldUseViewHierarchyForFindingScrollParent
{
  return 1;
}

- (id)accessibilityCustomRotors
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_icaxParentTextView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAccessibilityCustomRotorController sharedInstance](ICAccessibilityCustomRotorController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNoteEditorViewController:", v2);

  +[ICAccessibilityCustomRotorController sharedInstance](ICAccessibilityCustomRotorController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedTextViewRotors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_icaxParentTextView
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  while ((objc_opt_isKindOfClass() & 1) == 0 && v1)
  {
    v2 = v1;
    objc_msgSend(v1, "superview");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
  }
  return v1;
}

- (uint64_t)_icaxBeginEditingAtEndOfCorrespondingParagraph
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "_icaxParentTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "trackedParagraph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "characterRange");
  v6 = v5;

  if ((objc_msgSend(v2, "isFirstResponder") & 1) != 0)
    objc_msgSend(v2, "setSelectedRange:", v6 + v4 - 1, 0);
  else
    objc_msgSend(v2, "icaxBeginEditingInStorageRange:", v6 + v4 - 1, 0);

  return 1;
}

- (id)_icaxNote
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_icaxParentTextView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)supportedRotorTypes
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("ICAccessibilityRotorTypeChecklist");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)textRangeInNote
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "trackedParagraph");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "characterRange");

  return v2;
}

@end
