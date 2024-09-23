@implementation AXEventKeyInfoRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXEventKeyInfoRepresentation)initWithCoder:(id)a3
{
  id v4;
  AXEventKeyInfoRepresentation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXEventKeyInfoRepresentation;
  v5 = -[AXEventKeyInfoRepresentation init](&v13, sel_init);
  if (v5)
  {
    -[AXEventKeyInfoRepresentation setKeyCode:](v5, "setKeyCode:", (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("keyCode")));
    -[AXEventKeyInfoRepresentation setUsagePage:](v5, "setUsagePage:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("usagePage")));
    -[AXEventKeyInfoRepresentation setKeyDown:](v5, "setKeyDown:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("keyDown")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unmodifiedInput"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventKeyInfoRepresentation setUnmodifiedInput:](v5, "setUnmodifiedInput:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modifiedInput"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventKeyInfoRepresentation setModifiedInput:](v5, "setModifiedInput:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shiftModifiedInput"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventKeyInfoRepresentation setShiftModifiedInput:](v5, "setShiftModifiedInput:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupUnmodifiedInput"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventKeyInfoRepresentation setBackupUnmodifiedInput:](v5, "setBackupUnmodifiedInput:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupModifiedInput"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventKeyInfoRepresentation setBackupModifiedInput:](v5, "setBackupModifiedInput:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupShiftModifiedInput"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventKeyInfoRepresentation setBackupShiftModifiedInput:](v5, "setBackupShiftModifiedInput:", v11);

    -[AXEventKeyInfoRepresentation setModifierState:](v5, "setModifierState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("modifierState")));
    -[AXEventKeyInfoRepresentation setGsModifierState:](v5, "setGsModifierState:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("gsModifierState")));
    -[AXEventKeyInfoRepresentation setAlternativeKeyCode:](v5, "setAlternativeKeyCode:", (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("alternativeKeyCode")));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXEventKeyInfoRepresentation *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc_init(AXEventKeyInfoRepresentation);
  -[AXEventKeyInfoRepresentation unmodifiedInput](self, "unmodifiedInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventKeyInfoRepresentation setUnmodifiedInput:](v4, "setUnmodifiedInput:", v5);

  -[AXEventKeyInfoRepresentation shiftModifiedInput](self, "shiftModifiedInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventKeyInfoRepresentation setShiftModifiedInput:](v4, "setShiftModifiedInput:", v6);

  -[AXEventKeyInfoRepresentation setModifierState:](v4, "setModifierState:", -[AXEventKeyInfoRepresentation modifierState](self, "modifierState"));
  -[AXEventKeyInfoRepresentation setGsModifierState:](v4, "setGsModifierState:", -[AXEventKeyInfoRepresentation gsModifierState](self, "gsModifierState"));
  -[AXEventKeyInfoRepresentation modifiedInput](self, "modifiedInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventKeyInfoRepresentation setModifiedInput:](v4, "setModifiedInput:", v7);

  -[AXEventKeyInfoRepresentation setKeyCode:](v4, "setKeyCode:", -[AXEventKeyInfoRepresentation keyCode](self, "keyCode"));
  -[AXEventKeyInfoRepresentation setUsagePage:](v4, "setUsagePage:", -[AXEventKeyInfoRepresentation usagePage](self, "usagePage"));
  -[AXEventKeyInfoRepresentation setAlternativeKeyCode:](v4, "setAlternativeKeyCode:", -[AXEventKeyInfoRepresentation alternativeKeyCode](self, "alternativeKeyCode"));
  -[AXEventKeyInfoRepresentation setKeyDown:](v4, "setKeyDown:", -[AXEventKeyInfoRepresentation keyDown](self, "keyDown"));
  -[AXEventKeyInfoRepresentation backupUnmodifiedInput](self, "backupUnmodifiedInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventKeyInfoRepresentation setBackupUnmodifiedInput:](v4, "setBackupUnmodifiedInput:", v8);

  -[AXEventKeyInfoRepresentation backupShiftModifiedInput](self, "backupShiftModifiedInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventKeyInfoRepresentation setBackupShiftModifiedInput:](v4, "setBackupShiftModifiedInput:", v9);

  -[AXEventKeyInfoRepresentation backupModifiedInput](self, "backupModifiedInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventKeyInfoRepresentation setBackupModifiedInput:](v4, "setBackupModifiedInput:", v10);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[AXEventKeyInfoRepresentation keyCode](self, "keyCode"), CFSTR("keyCode"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[AXEventKeyInfoRepresentation alternativeKeyCode](self, "alternativeKeyCode"), CFSTR("alternativeKeyCode"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[AXEventKeyInfoRepresentation usagePage](self, "usagePage"), CFSTR("usagePage"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXEventKeyInfoRepresentation keyDown](self, "keyDown"), CFSTR("keyDown"));
  -[AXEventKeyInfoRepresentation unmodifiedInput](self, "unmodifiedInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("unmodifiedInput"));

  -[AXEventKeyInfoRepresentation modifiedInput](self, "modifiedInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("modifiedInput"));

  -[AXEventKeyInfoRepresentation shiftModifiedInput](self, "shiftModifiedInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("shiftModifiedInput"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[AXEventKeyInfoRepresentation modifierState](self, "modifierState"), CFSTR("modifierState"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[AXEventKeyInfoRepresentation gsModifierState](self, "gsModifierState"), CFSTR("gsModifierState"));
  -[AXEventKeyInfoRepresentation backupModifiedInput](self, "backupModifiedInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("backupModifiedInput"));

  -[AXEventKeyInfoRepresentation backupUnmodifiedInput](self, "backupUnmodifiedInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("backupUnmodifiedInput"));

  -[AXEventKeyInfoRepresentation backupShiftModifiedInput](self, "backupShiftModifiedInput");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("backupShiftModifiedInput"));

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("keyCode:%hu usagePage:%u down:%u modState:%u unmodIn:%@ modIn:%@ shftIn:%@"), self->_keyCode, self->_usagePage, self->_keyDown, self->_modifierState, self->_unmodifiedInput, self->_modifiedInput, self->_shiftModifiedInput);
}

+ (void)prepareForKeycodeTranslation
{
  objc_msgSend(a1, "_getUIKitKeyboardRef");
  objc_msgSend(a1, "_getUSUIKitKeyboardRef");
}

- (__GSKeyboard)_getUIKitKeyboardRef
{
  return (__GSKeyboard *)objc_msgSend((id)objc_opt_class(), "_getUIKitKeyboardRef");
}

- (__GSKeyboard)_getUSUIKitKeyboardRef
{
  return (__GSKeyboard *)objc_msgSend((id)objc_opt_class(), "_getUSUIKitKeyboardRef");
}

+ (__GSKeyboard)_getUSUIKitKeyboardRef
{
  __GSKeyboard *result;

  if (_getUSUIKitKeyboardRef_onceToken != -1)
    dispatch_once(&_getUSUIKitKeyboardRef_onceToken, &__block_literal_global_32);
  result = (__GSKeyboard *)_getUSUIKitKeyboardRef__KeyboardRef;
  if (!_getUSUIKitKeyboardRef__KeyboardRef)
  {
    AXPerformBlockSynchronouslyOnMainThread();
    return (__GSKeyboard *)_getUSUIKitKeyboardRef__KeyboardRef;
  }
  return result;
}

void __54__AXEventKeyInfoRepresentation__getUSUIKitKeyboardRef__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0DBE478];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_206_0);

}

void __54__AXEventKeyInfoRepresentation__getUSUIKitKeyboardRef__block_invoke_2()
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_207);
}

__GSKeyboard *__54__AXEventKeyInfoRepresentation__getUSUIKitKeyboardRef__block_invoke_3()
{
  if (_getUSUIKitKeyboardRef__KeyboardRef)
  {
    GSKeyboardRelease();
    _getUSUIKitKeyboardRef__KeyboardRef = 0;
  }
  return +[AXEventKeyInfoRepresentation _getUIKitKeyboardRef](AXEventKeyInfoRepresentation, "_getUIKitKeyboardRef");
}

uint64_t __54__AXEventKeyInfoRepresentation__getUSUIKitKeyboardRef__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_getUIKitKeyboardRef");
  if (result)
  {
    GSKeyboardGetHWKeyboardType();
    result = GSKeyboardCreate();
    _getUSUIKitKeyboardRef__KeyboardRef = result;
  }
  return result;
}

+ (unsigned)_getIOHIDKeyboardTypeForGSKeyboardType:(unsigned __int8)a3
{
  unsigned __int8 v3;
  unsigned __int8 v4;

  if (a3 == 202)
    v3 = 0;
  else
    v3 = a3;
  if (a3 == 203)
    v4 = 1;
  else
    v4 = v3;
  if (a3 == 207)
    return 2;
  else
    return v4;
}

+ (__GSKeyboard)_getUIKitKeyboardRef
{
  __GSKeyboard *result;

  if (_getUIKitKeyboardRef_onceToken != -1)
    dispatch_once(&_getUIKitKeyboardRef_onceToken, &__block_literal_global_210);
  result = (__GSKeyboard *)_getUIKitKeyboardRef__KeyboardRef;
  if (!_getUIKitKeyboardRef__KeyboardRef)
  {
    AXPerformBlockSynchronouslyOnMainThread();
    return (__GSKeyboard *)_getUIKitKeyboardRef__KeyboardRef;
  }
  return result;
}

void __52__AXEventKeyInfoRepresentation__getUIKitKeyboardRef__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0DBE478];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_211);

}

void __52__AXEventKeyInfoRepresentation__getUIKitKeyboardRef__block_invoke_2()
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_212_0);
}

__GSKeyboard *__52__AXEventKeyInfoRepresentation__getUIKitKeyboardRef__block_invoke_3()
{
  if (_getUIKitKeyboardRef__KeyboardRef)
  {
    GSKeyboardRelease();
    _getUIKitKeyboardRef__KeyboardRef = 0;
  }
  return +[AXEventKeyInfoRepresentation _getUIKitKeyboardRef](AXEventKeyInfoRepresentation, "_getUIKitKeyboardRef");
}

void __52__AXEventKeyInfoRepresentation__getUIKitKeyboardRef__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIApplication")), "safeValueForKey:", CFSTR("sharedApplication"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIKeyboardImpl")), "safeValueForKey:", CFSTR("sharedInstance"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("setInputModeFromPreferences"));

  }
  objc_msgSend(*(id *)(a1 + 32), "_getIOHIDKeyboardTypeForGSKeyboardType:", GSEventGetHardwareKeyboardType());
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getUIKeyboardInputModeControllerClass_softClass;
  v14 = getUIKeyboardInputModeControllerClass_softClass;
  if (!getUIKeyboardInputModeControllerClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getUIKeyboardInputModeControllerClass_block_invoke;
    v10[3] = &unk_1E24C4AE0;
    v10[4] = &v11;
    __getUIKeyboardInputModeControllerClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v6, "sharedInputModeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hardwareInputMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "automaticHardwareLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _getUIKitKeyboardRef__KeyboardRef = GSKeyboardCreate();
}

- (void)translateStringToKeycode
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  unsigned __int16 v7;

  -[AXEventKeyInfoRepresentation modifiedInput](self, "modifiedInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[AXEventKeyInfoRepresentation modifiedInput](self, "modifiedInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "characterAtIndex:", 0);

    if ((v6 - 97) > 0x19)
    {
      if ((v6 - 65) > 0x19)
      {
        if (v6 == 48)
        {
          v7 = 39;
        }
        else if ((v6 - 49) > 8)
        {
          if (v6 != 32)
          {
LABEL_14:
            -[AXEventKeyInfoRepresentation setUsagePage:](self, "setUsagePage:", 7);
            return;
          }
          v7 = 44;
        }
        else
        {
          v7 = v6 - 19;
        }
      }
      else
      {
        v7 = v6 - 61;
      }
    }
    else
    {
      v7 = v6 - 93;
    }
    -[AXEventKeyInfoRepresentation setKeyCode:](self, "setKeyCode:", v7);
    goto LABEL_14;
  }
}

- (void)translateKeycode
{
  unsigned __int16 *v3;
  unsigned __int16 *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;
  _QWORD v49[3];
  __int16 v50;
  _QWORD v51[3];
  __int16 v52;

  if (-[AXEventKeyInfoRepresentation usagePage](self, "usagePage") == 7
    || -[AXEventKeyInfoRepresentation usagePage](self, "usagePage") == 65281
    || -[AXEventKeyInfoRepresentation usagePage](self, "usagePage") == 255)
  {
    v3 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0xA2uLL, 0x10000402B2F1F51uLL);
    v4 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0xA2uLL, 0x10000402B2F1F51uLL);
    -[AXEventKeyInfoRepresentation keyDown](self, "keyDown");
    if (-[AXEventKeyInfoRepresentation alternativeKeyCode](self, "alternativeKeyCode"))
      v5 = -[AXEventKeyInfoRepresentation alternativeKeyCode](self, "alternativeKeyCode");
    else
      v5 = -[AXEventKeyInfoRepresentation keyCode](self, "keyCode");
    v6 = v5;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    v52 = 0;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    v50 = 0;
    if (v5)
    {
      v45 = 0;
      v46 = &v45;
      v47 = 0x2020000000;
      v48 = 0;
      v39 = 0;
      v40 = &v39;
      v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__11;
      v43 = __Block_byref_object_dispose__11;
      v44 = 0;
      v33 = 0;
      v34 = &v33;
      v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__11;
      v37 = __Block_byref_object_dispose__11;
      v38 = 0;
      v29 = 0;
      v30 = &v29;
      v31 = 0x2020000000;
      v32 = 0;
      v25 = 0;
      v26 = &v25;
      v27 = 0x2020000000;
      v28 = 0;
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__11;
      v23 = __Block_byref_object_dispose__11;
      v24 = 0;
      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v18 = 0;
      AXPerformBlockSynchronouslyOnMainThread();
      if (*((_BYTE *)v16 + 24) && !*((_DWORD *)v46 + 6))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v3 + 5, v3[4]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXEventKeyInfoRepresentation setModifiedInput:](self, "setModifiedInput:", v7);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v3 + 30, v3[29]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXEventKeyInfoRepresentation setUnmodifiedInput:](self, "setUnmodifiedInput:", v8);

        -[AXEventKeyInfoRepresentation setShiftModifiedInput:](self, "setShiftModifiedInput:", v40[5]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v4 + 5, v4[4]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend((id)v20[5], "length") && *((_DWORD *)v26 + 6) == -1)
        {
          -[AXEventKeyInfoRepresentation setBackupModifiedInput:](self, "setBackupModifiedInput:", v9);
          -[AXEventKeyInfoRepresentation setBackupUnmodifiedInput:](self, "setBackupUnmodifiedInput:", v20[5]);
          -[AXEventKeyInfoRepresentation setBackupShiftModifiedInput:](self, "setBackupShiftModifiedInput:", v34[5]);
        }
        v10 = *((_DWORD *)v30 + 6);
        v11 = (v10 & 0x1010000) != 0;
        if ((v10 & 0x480000) != 0)
          v11 |= 2u;
        if ((v10 & 0x900000) != 0)
          v11 |= 4u;
        if ((v10 & 0x220000) != 0)
          v11 |= 8u;
        v12 = v11 | (v10 >> 14) & 0x10;
        if ((v6 - 83) < 0x11 || v6 == 103)
          v12 |= 0x20u;
        if (_AXSimulatedEventKeyDown)
          v14 = v12 | 0x40;
        else
          v14 = v12;
        -[AXEventKeyInfoRepresentation setModifierState:](self, "setModifierState:", v14);
        -[AXEventKeyInfoRepresentation setGsModifierState:](self, "setGsModifierState:", *((unsigned int *)v30 + 6));

      }
      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(&v19, 8);

      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v33, 8);

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(&v45, 8);
    }
    free(v3);
    free(v4);
    _Block_object_dispose(v49, 8);
    _Block_object_dispose(v51, 8);
  }
}

void __48__AXEventKeyInfoRepresentation_translateKeycode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[48];
  _BYTE v19[48];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_getUIKitKeyboardRef");
  v3 = objc_msgSend(*(id *)(a1 + 32), "_getUSUIKitKeyboardRef");
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = GSKeyboardTranslateKeyExtended();
    v5 = *(_QWORD *)(a1 + 120);
    v16 = v5 + 108;
    v17 = v5 + 110;
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24;
    GSKeyboardTranslateKeyExtended();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v19, *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v15, v18, v16, v17);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v18, *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = GSKeyboardGetLiveModifierState();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", *(_QWORD *)(a1 + 120) + 60, *(unsigned __int16 *)(*(_QWORD *)(a1 + 120) + 58));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "length"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "characterAtIndex:", 0);
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = GSKeyboardGetKeyCodeForChar();
      }
    }
  }
}

- (unsigned)keyCode
{
  return self->_keyCode;
}

- (void)setKeyCode:(unsigned __int16)a3
{
  self->_keyCode = a3;
}

- (unsigned)alternativeKeyCode
{
  return self->_alternativeKeyCode;
}

- (void)setAlternativeKeyCode:(unsigned __int16)a3
{
  self->_alternativeKeyCode = a3;
}

- (unsigned)usagePage
{
  return self->_usagePage;
}

- (void)setUsagePage:(unsigned int)a3
{
  self->_usagePage = a3;
}

- (BOOL)keyDown
{
  return self->_keyDown;
}

- (void)setKeyDown:(BOOL)a3
{
  self->_keyDown = a3;
}

- (NSString)unmodifiedInput
{
  return self->_unmodifiedInput;
}

- (void)setUnmodifiedInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)modifiedInput
{
  return self->_modifiedInput;
}

- (void)setModifiedInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)shiftModifiedInput
{
  return self->_shiftModifiedInput;
}

- (void)setShiftModifiedInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unsigned)modifierState
{
  return self->_modifierState;
}

- (void)setModifierState:(unsigned int)a3
{
  self->_modifierState = a3;
}

- (NSString)backupUnmodifiedInput
{
  return self->_backupUnmodifiedInput;
}

- (void)setBackupUnmodifiedInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)backupModifiedInput
{
  return self->_backupModifiedInput;
}

- (void)setBackupModifiedInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)backupShiftModifiedInput
{
  return self->_backupShiftModifiedInput;
}

- (void)setBackupShiftModifiedInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unsigned)gsModifierState
{
  return self->_gsModifierState;
}

- (void)setGsModifierState:(unsigned int)a3
{
  self->_gsModifierState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupShiftModifiedInput, 0);
  objc_storeStrong((id *)&self->_backupModifiedInput, 0);
  objc_storeStrong((id *)&self->_backupUnmodifiedInput, 0);
  objc_storeStrong((id *)&self->_shiftModifiedInput, 0);
  objc_storeStrong((id *)&self->_modifiedInput, 0);
  objc_storeStrong((id *)&self->_unmodifiedInput, 0);
}

@end
