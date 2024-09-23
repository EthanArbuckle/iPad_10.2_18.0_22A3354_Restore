@implementation AXSSKeyboardCommandCategory

+ (id)allCategoriesForAvailableCommands:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[7];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a1, "_basicCommandsFromAvailableCommands:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v6;
  objc_msgSend(a1, "_movementCommandsFromAvailableCommands:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v7;
  objc_msgSend(a1, "_interactionCommandsFromAvailableCommands:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v8;
  objc_msgSend(a1, "_deviceCommandsFromAvailableCommands:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v9;
  objc_msgSend(a1, "_pointerCommandsFromAvailableCommands:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v10;
  objc_msgSend(a1, "_gesturesCommandsFromAvailableCommands:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v11;
  objc_msgSend(a1, "_advancedCommandsFromAvailableCommands:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v18, "commands");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        if (v20)
          objc_msgSend(v5, "addObject:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v15);
  }

  return v5;
}

+ (id)_categoryWithCommandIdentifiers:(id)a3 availableCommands:(id)a4 localizedName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:](AXSSKeyboardCommand, "commandWithStandardCommandIdentifier:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16), (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  objc_msgSend(a1, "_categoryWithCommands:availableCommands:localizedName:", v11, v9, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_categoryWithCommands:(id)a3 availableCommands:(id)a4 localizedName:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  AXSSKeyboardCommandCategory *v12;
  void *v13;
  AXSSKeyboardCommandCategory *v14;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__AXSSKeyboardCommandCategory__categoryWithCommands_availableCommands_localizedName___block_invoke;
  v16[3] = &unk_1E5F99FF0;
  v17 = v7;
  v8 = v7;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "indexesOfObjectsPassingTest:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [AXSSKeyboardCommandCategory alloc];
  objc_msgSend(v10, "objectsAtIndexes:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[AXSSKeyboardCommandCategory initWithCommands:localizedName:](v12, "initWithCommands:localizedName:", v13, v9);
  return v14;
}

uint64_t __85__AXSSKeyboardCommandCategory__categoryWithCommands_availableCommands_localizedName___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

+ (id)_basicCommandsFromAvailableCommands:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("Help");
  v12 = CFSTR("GoToNextElement");
  v13 = CFSTR("GoToPreviousElement");
  v14 = CFSTR("MoveUp");
  v15 = CFSTR("MoveDown");
  v16 = CFSTR("MoveLeft");
  v17 = CFSTR("MoveRight");
  v18 = CFSTR("PerformDefaultAction");
  v19 = CFSTR("GoHome");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v11, 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class(), v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("BASIC"), &stru_1E5F9A110, CFSTR("FullKeyboardAccess"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_categoryWithCommandIdentifiers:availableCommands:localizedName:", v6, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_movementCommandsFromAvailableCommands:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("GoToNextElement");
  v12 = CFSTR("GoToPreviousElement");
  v13 = CFSTR("MoveUp");
  v14 = CFSTR("MoveDown");
  v15 = CFSTR("MoveLeft");
  v16 = CFSTR("MoveRight");
  v17 = CFSTR("GoToFirstElement");
  v18 = CFSTR("GoToLastElement");
  v19 = CFSTR("MoveInsideNext");
  v20 = CFSTR("MoveInsidePrevious");
  v21 = CFSTR("EnterContainer");
  v22 = CFSTR("ExitContainer");
  v23 = CFSTR("GoToNextSection");
  v24 = CFSTR("GoToPreviousSection");
  v25 = CFSTR("ActivateTypeahead");
  v26 = CFSTR("ApplicationList");
  v27 = CFSTR("WindowList");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v11, 17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class(), v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
    v27,
    v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MOVEMENT"), &stru_1E5F9A110, CFSTR("FullKeyboardAccess"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_categoryWithCommandIdentifiers:availableCommands:localizedName:", v6, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_interactionCommandsFromAvailableCommands:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("PerformDefaultAction");
  v11[1] = CFSTR("PerformEscape");
  v11[2] = CFSTR("OpenContextualMenu");
  v11[3] = CFSTR("ShowAccessibilityActions");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("INTERACTION"), &stru_1E5F9A110, CFSTR("FullKeyboardAccess"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_categoryWithCommandIdentifiers:availableCommands:localizedName:", v6, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_advancedCommandsFromAvailableCommands:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[15];

  v11[14] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("NextButton");
  v11[1] = CFSTR("PreviousButton");
  v11[2] = CFSTR("NextCheckbox");
  v11[3] = CFSTR("PreviousCheckbox");
  v11[4] = CFSTR("NextTable");
  v11[5] = CFSTR("PreviousTable");
  v11[6] = CFSTR("NextImage");
  v11[7] = CFSTR("PreviousImage");
  v11[8] = CFSTR("NextLink");
  v11[9] = CFSTR("PreviousLink");
  v11[10] = CFSTR("NextHeading");
  v11[11] = CFSTR("PreviousHeading");
  v11[12] = CFSTR("NextTextField");
  v11[13] = CFSTR("PreviousTextField");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v11, 14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ADVANCED"), &stru_1E5F9A110, CFSTR("FullKeyboardAccess"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_categoryWithCommandIdentifiers:availableCommands:localizedName:", v6, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_deviceCommandsFromAvailableCommands:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("GoHome");
  v12 = CFSTR("ToggleMenuBar");
  v13 = CFSTR("ToggleAppSwitcher");
  v14 = CFSTR("ToggleControlCenter");
  v15 = CFSTR("ToggleNotificationCenter");
  v16 = CFSTR("ToggleDock");
  v17 = CFSTR("ToggleAppLibrary");
  v18 = CFSTR("ToggleQuickNote");
  v19 = CFSTR("LockScreen");
  v20 = CFSTR("RebootDevice");
  v21 = CFSTR("ActivateSiri");
  v22 = CFSTR("ActivateAccessibilityShortcut");
  v23 = CFSTR("ActivateSOS");
  v24 = CFSTR("RotateDevice");
  v25 = CFSTR("ArmApplePay");
  v26 = CFSTR("PerformSysdiagnose");
  v27 = CFSTR("TogglePassthroughMode");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v11, 17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class(), v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
    v27,
    v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DEVICE"), &stru_1E5F9A110, CFSTR("FullKeyboardAccess"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_categoryWithCommandIdentifiers:availableCommands:localizedName:", v6, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_pointerCommandsFromAvailableCommands:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("MovePointerToFocus");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class(), v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("POINTER"), &stru_1E5F9A110, CFSTR("FullKeyboardAccess"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_categoryWithCommandIdentifiers:availableCommands:localizedName:", v6, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_gesturesCommandsFromAvailableCommands:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[17];

  v11[16] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("Gestures");
  v11[1] = CFSTR("PressAndLift");
  v11[2] = CFSTR("3DTouch");
  v11[3] = CFSTR("SwipeUp");
  v11[4] = CFSTR("SwipeDown");
  v11[5] = CFSTR("SwipeLeft");
  v11[6] = CFSTR("SwipeRight");
  v11[7] = CFSTR("PinchIn");
  v11[8] = CFSTR("PinchOut");
  v11[9] = CFSTR("RotateLeft");
  v11[10] = CFSTR("RotateRight");
  v11[11] = CFSTR("TwoFingerPressAndLift");
  v11[12] = CFSTR("TwoFingerSwipeDown");
  v11[13] = CFSTR("TwoFingerSwipeLeft");
  v11[14] = CFSTR("TwoFingerSwipeRight");
  v11[15] = CFSTR("TwoFingerSwipeUp");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v11, 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GESTURES"), &stru_1E5F9A110, CFSTR("FullKeyboardAccess"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_categoryWithCommandIdentifiers:availableCommands:localizedName:", v6, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (AXSSKeyboardCommandCategory)initWithCommands:(id)a3 localizedName:(id)a4
{
  id v7;
  id v8;
  AXSSKeyboardCommandCategory *v9;
  AXSSKeyboardCommandCategory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXSSKeyboardCommandCategory;
  v9 = -[AXSSKeyboardCommandCategory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedName, a4);
    objc_storeStrong((id *)&v10->_commands, a3);
  }

  return v10;
}

- (NSArray)commands
{
  return self->_commands;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_commands, 0);
}

@end
