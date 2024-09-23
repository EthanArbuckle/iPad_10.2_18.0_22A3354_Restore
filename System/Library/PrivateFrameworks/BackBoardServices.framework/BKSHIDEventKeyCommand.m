@implementation BKSHIDEventKeyCommand

- (BKSHIDEventKeyCommand)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventKeyCommand *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventKeyCommand *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventKeyCommand"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BKSHIDEventKeyCommand.m");
    v17 = 1024;
    v18 = 110;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventKeyCommand *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithInput:(id)a3 keyCode:(int64_t)a4 modifierFlags:(int64_t)a5
{
  id v8;
  BKSHIDEventKeyCommand *v9;
  uint64_t v10;
  NSString *input;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKSHIDEventKeyCommand;
  v9 = -[BKSHIDEventKeyCommand init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    input = v9->_input;
    v9->_input = (NSString *)v10;

    objc_storeStrong((id *)&v9->_unmodifiedInput, v9->_input);
    v9->_keyCode = a4;
    v9->_modifierFlags = a5;
    v9->_usagePage = 7;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *input;
  id v5;

  input = self->_input;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", input, CFSTR("input"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_keyCode, CFSTR("keyCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_modifierFlags, CFSTR("modifierFlags"));

}

- (BKSHIDEventKeyCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BKSHIDEventKeyCommand *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("input"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("keyCode"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("modifierFlags"));

  v8 = -[BKSHIDEventKeyCommand _initWithInput:keyCode:modifierFlags:](self, "_initWithInput:keyCode:modifierFlags:", v5, v6, v7);
  return v8;
}

- (unint64_t)hash
{
  int64_t keyCode;
  unint64_t modifierFlags;
  NSUInteger v5;

  keyCode = self->_keyCode;
  if (keyCode == -1)
  {
    v5 = -[NSString hash](self->_input, "hash") & 0xFFFFFFFFFF40FFFFLL;
    modifierFlags = self->_modifierFlags;
  }
  else
  {
    modifierFlags = keyCode & 0xFFFFFFFFFF40FFFFLL;
    v5 = self->_modifierFlags;
  }
  return v5 | modifierFlags;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSHIDEventKeyCommand input](self, "input");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "input");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKSHIDEventKeyCommand input](self, "input");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v11)
        goto LABEL_9;
    }
    v13 = objc_msgSend(v5, "keyCode");
    if (v13 == -[BKSHIDEventKeyCommand keyCode](self, "keyCode"))
    {
      v14 = objc_msgSend(v5, "modifierFlags");
      v12 = v14 == -[BKSHIDEventKeyCommand modifierFlags](self, "modifierFlags");
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  BKSHIDEventKeyCommand *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __36__BKSHIDEventKeyCommand_description__block_invoke;
  v10 = &unk_1E1EA1BF8;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)_appendKeyWithoutModifiersToDescriptionTarget:(id)a3 keyCodeString:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[BKSHIDEventKeyCommand _sanitizedInputForDescription](self, "_sanitizedInputForDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v8, "appendString:", v7);
    if (v6)
    {
      objc_msgSend(v8, "appendString:", CFSTR(" "));
LABEL_5:
      objc_msgSend(v8, "appendString:", v6);
    }
  }
  else if (v6)
  {
    goto LABEL_5;
  }

}

- (void)_appendPropertiesCommon:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__BKSHIDEventKeyCommand__appendPropertiesCommon___block_invoke;
  v6[3] = &unk_1E1E9FC88;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "appendCustomFormatWithName:block:", 0, v6);

}

- (id)_sanitizedInputForDescription
{
  void *v2;
  void *v3;

  -[BKSHIDEventKeyCommand input](self, "input");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isTextualKeyCommand
{
  return (-[BKSHIDEventKeyCommand modifierFlags](self, "modifierFlags") & 0x140000) == 0;
}

- (BOOL)isModifierOnlyCommand
{
  int64_t v3;
  void *v4;

  v3 = -[BKSHIDEventKeyCommand modifierFlags](self, "modifierFlags");
  if (v3)
  {
    -[BKSHIDEventKeyCommand input](self, "input");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      LOBYTE(v3) = 0;
    }
    else if (-[BKSHIDEventKeyCommand keyCode](self, "keyCode") == -1)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = objc_msgSend((id)objc_opt_class(), "_isModifierKeyWithPage:usage:", -[BKSHIDEventKeyCommand usagePage](self, "usagePage"), -[BKSHIDEventKeyCommand keyCode](self, "keyCode"));
    }
  }
  return v3;
}

- (BOOL)isRoutableKeyCommand
{
  return (-[BKSHIDEventKeyCommand modifierFlags](self, "modifierFlags") & 0x940000) != 0;
}

- (int64_t)describes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  int64_t v33;
  uint64_t v34;
  unint64_t v36;
  void *v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (!v6)
  {
    v9 = 0;
    goto LABEL_34;
  }
  if (objc_msgSend(v6, "isModifierOnlyCommand"))
  {
    v8 = -[BKSHIDEventKeyCommand modifierFlags](self, "modifierFlags");
    v9 = (objc_msgSend(v7, "modifierFlags") & v8) != 0;
    goto LABEL_34;
  }
  if (-[BKSHIDEventKeyCommand keyCode](self, "keyCode") != -1)
  {
    v10 = objc_msgSend(v7, "keyCode");
    if (v10 == -[BKSHIDEventKeyCommand keyCode](self, "keyCode"))
    {
      v11 = -[BKSHIDEventKeyCommand modifierFlags](self, "modifierFlags");
      if (v11 == objc_msgSend(v7, "modifierFlags"))
        goto LABEL_33;
    }
  }
  objc_msgSend(v7, "unmodifiedInput");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_16;
  v13 = (void *)v12;
  objc_msgSend(v7, "commandModifiedInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    goto LABEL_15;
  objc_msgSend(v7, "unmodifiedInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSHIDEventKeyCommand input](self, "input");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "caseInsensitiveCompare:", v15))
  {

LABEL_15:
    goto LABEL_16;
  }
  v33 = -[BKSHIDEventKeyCommand modifierFlags](self, "modifierFlags");
  v34 = objc_msgSend(v7, "modifierFlags");

  if (v33 == v34)
    goto LABEL_33;
LABEL_16:
  objc_msgSend(v7, "commandModifiedInput");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v7, "commandModifiedInput");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSHIDEventKeyCommand input](self, "input");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "caseInsensitiveCompare:", v19))
    {

      goto LABEL_20;
    }
    v20 = -[BKSHIDEventKeyCommand modifierFlags](self, "modifierFlags");
    v21 = objc_msgSend(v7, "modifierFlags");

    if (v20 != v21)
      goto LABEL_20;
LABEL_33:
    v9 = 3;
    goto LABEL_34;
  }
LABEL_20:
  -[BKSHIDEventKeyCommand input](self, "input");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "uppercaseString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSHIDEventKeyCommand input](self, "input");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lowercaseString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "isEqualToString:", v25))
  {
    objc_msgSend(v7, "shiftModifiedInput");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSHIDEventKeyCommand input](self, "input");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isEqualToString:", v27))
    {
      objc_msgSend(v7, "shiftModifiedInput");
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unmodifiedInput");
      v29 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v28;
      v30 = (void *)v28;
      v31 = (void *)v29;
      if ((objc_msgSend(v30, "isEqualToString:", v29) & 1) != 0)
      {
        v32 = 0;
      }
      else
      {
        v36 = objc_msgSend(v7, "modifierFlags") & 0xFFFFFFFFFFFDFFFFLL;
        v32 = v36 == -[BKSHIDEventKeyCommand modifierFlags](self, "modifierFlags");
      }

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  if (v32)
    v9 = 3;
  else
    v9 = 0;
LABEL_34:

  return v9;
}

- (NSString)input
{
  return self->_input;
}

- (int64_t)keyCode
{
  return self->_keyCode;
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (NSString)unmodifiedInput
{
  return self->_unmodifiedInput;
}

- (void)setUnmodifiedInput:(id)a3
{
  objc_storeStrong((id *)&self->_unmodifiedInput, a3);
}

- (NSString)shiftModifiedInput
{
  return self->_shiftModifiedInput;
}

- (void)setShiftModifiedInput:(id)a3
{
  objc_storeStrong((id *)&self->_shiftModifiedInput, a3);
}

- (NSString)commandModifiedInput
{
  return self->_commandModifiedInput;
}

- (void)setCommandModifiedInput:(id)a3
{
  objc_storeStrong((id *)&self->_commandModifiedInput, a3);
}

- (int64_t)usagePage
{
  return self->_usagePage;
}

- (void)setUsagePage:(int64_t)a3
{
  self->_usagePage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandModifiedInput, 0);
  objc_storeStrong((id *)&self->_shiftModifiedInput, 0);
  objc_storeStrong((id *)&self->_unmodifiedInput, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

void __49__BKSHIDEventKeyCommand__appendPropertiesCommon___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int16 *v12;
  void *v13;
  __CFString *v14;
  const __CFString *v15;
  __int16 v16;
  __int16 v17;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v4
    && (objc_msgSend(*(id *)(a1 + 40), "style"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "clientInformation"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "containsObject:", CFSTR("skipModifiers")),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    BSDescriptionStreamAppendBKSKeyModifierFlags(v3, v4);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(*(id *)(a1 + 32), "keyCode");
  v10 = v9;
  if ((v9 - 1) > 0xFFFFFFFD)
  {
    v13 = 0;
    if (!v8)
      goto LABEL_27;
    goto LABEL_25;
  }
  if ((v9 - 4) > 0x19)
  {
    if ((v9 - 30) > 8)
    {
      if ((int)v9 > 223)
      {
        switch((int)v9)
        {
          case 224:
            v14 = CFSTR("lctrl");
            break;
          case 225:
            v14 = CFSTR("lshft");
            break;
          case 226:
            v14 = CFSTR("lopt");
            break;
          case 227:
            v14 = CFSTR("lcmd");
            break;
          case 228:
            v14 = CFSTR("rctrl");
            break;
          case 229:
            v14 = CFSTR("rshft");
            break;
          case 230:
            v14 = CFSTR("ropt");
            break;
          case 231:
            v14 = CFSTR("rcmd");
            break;
          default:
            goto LABEL_24;
        }
        v15 = CFSTR(" ");
LABEL_14:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%02X:%@)"), v10, v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v8 & 1) == 0)
          goto LABEL_27;
        goto LABEL_26;
      }
      switch((int)v9)
      {
        case 'O':
          v14 = CFSTR("rightArrow");
          break;
        case 'P':
          v14 = CFSTR("leftArrow");
          break;
        case 'Q':
          v14 = CFSTR("downArrow");
          break;
        case 'R':
          v14 = CFSTR("upArrow");
          break;
        default:
          if ((_DWORD)v9 == 39)
          {
            v14 = CFSTR("0");
          }
          else
          {
            if ((_DWORD)v9 != 44)
              goto LABEL_24;
            v14 = CFSTR("space");
          }
          break;
      }
LABEL_13:
      v15 = CFSTR("-");
      goto LABEL_14;
    }
    v16 = v9 + 19;
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = &v16;
  }
  else
  {
    v17 = v9 + 93;
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = &v17;
  }
  objc_msgSend(v11, "stringWithCharacters:length:", v12, 1);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v14)
    goto LABEL_13;
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(code: %02X)"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) != 0)
  {
LABEL_25:
    v15 = CFSTR("-");
LABEL_26:
    objc_msgSend(v3, "appendString:", v15);
  }
LABEL_27:
  objc_msgSend(*(id *)(a1 + 32), "_appendKeyWithoutModifiersToDescriptionTarget:keyCodeString:", v3, v13);

}

uint64_t __36__BKSHIDEventKeyCommand_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appendPropertiesCommon:", *(_QWORD *)(a1 + 40));
}

+ (id)keyCommandWithInput:(id)a3 modifierFlags:(int64_t)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {

    v5 = 0;
  }
  v8 = -[BKSHIDEventKeyCommand _initWithInput:keyCode:modifierFlags:]([BKSHIDEventKeyCommand alloc], "_initWithInput:keyCode:modifierFlags:", v5, -1, a4);

  return v8;
}

+ (id)keyCommandWithKeyCode:(int64_t)a3 modifierFlags:(int64_t)a4
{
  return -[BKSHIDEventKeyCommand _initWithInput:keyCode:modifierFlags:]([BKSHIDEventKeyCommand alloc], "_initWithInput:keyCode:modifierFlags:", 0, a3, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_descriptionForKeyCommandCollection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("collection must be an NSSet, NSArray, or NSOrderedSet"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v24 = v14;
      v25 = 2114;
      v26 = v16;
      v27 = 2048;
      v28 = a1;
      v29 = 2114;
      v30 = CFSTR("BKSHIDEventKeyCommand.m");
      v31 = 1024;
      v32 = 328;
      v33 = 2114;
      v34 = v13;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A107E38);
  }
  objc_msgSend(v5, "bs_dictionaryByPartitioning:", &__block_literal_global_298);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01758], "build:", &__block_literal_global_45);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_3;
  v20 = &unk_1E1E9FD60;
  v21 = v8;
  v22 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(v10, "appendDictionary:withName:itemBlock:", v6, 0, &v17);
  objc_msgSend(v10, "description", v17, v18, v19, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)keyCommandForEvent:(__IOHIDEvent *)a3 gsKeyboard:(__GSKeyboard *)a4
{
  return (id)objc_msgSend(a1, "keyCommandForEvent:gsKeyboard:activeModifiers:", a3, a4, 0);
}

+ (id)keyCommandForEvent:(__IOHIDEvent *)a3 gsKeyboard:(__GSKeyboard *)a4 activeModifiers:(int64_t *)a5
{
  uint64_t IntegerValue;
  uint64_t v8;
  uint64_t v9;
  int64_t v12;
  unsigned int LiveModifierState;
  int64_t v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  unsigned int v18;
  unint64_t v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  char *v27;
  _BYTE *v28;
  int *v29;
  _BYTE *v30;
  __int16 *v31;
  uint64_t v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  int v36;
  _BYTE v37[48];
  _BYTE v38[48];
  _BYTE v39[48];
  _WORD v40[24];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  IntegerValue = IOHIDEventGetIntegerValue();
  v8 = IOHIDEventGetIntegerValue();
  v9 = IOHIDEventGetIntegerValue();
  objc_msgSend((id)objc_opt_class(), "_isModifierKeyWithPage:usage:", v9, IntegerValue);
  if ((unint64_t)(IntegerValue - 83) < 0x11 || IntegerValue == 103 || IntegerValue == 133)
    v12 = 0x200000;
  else
    v12 = 0;
  if (a4 && MEMORY[0x1E0D27C30])
  {
    v35 = 0;
    v36 = 0;
    v34 = 0;
    LiveModifierState = GSKeyboardGetLiveModifierState();
    v32 = 0;
    v33 = v9;
    v31 = &v34;
    v29 = &v35;
    v30 = v37;
    v27 = (char *)&v35 + 2;
    v28 = v38;
    GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
    if (v8)
    {
      v14 = v12;
      LiveModifierState = GSKeyboardGetLiveModifierState();
    }
    else
    {
      v14 = v12;
    }
    if ((LiveModifierState & 0x480000) != 0)
      v16 = ((unint64_t)((LiveModifierState & 0x1010000) != 0) << 20) | 0x80000;
    else
      v16 = (unint64_t)((LiveModifierState & 0x1010000) != 0) << 20;
    if ((LiveModifierState & 0x900000) != 0)
      v16 |= 0x40000uLL;
    if ((LiveModifierState & 0x220000) != 0)
      v16 |= 0x20000uLL;
    v17 = v16 | (LiveModifierState >> 3) & 0x800000 | (LiveModifierState >> 2) & 0x10000 | (unint64_t)v14;
    if (a5)
    {
      v18 = GSKeyboardGetLiveModifierState();
      if ((v18 & 0x480000) != 0)
        v19 = ((unint64_t)((v18 & 0x1010000) != 0) << 20) | 0x80000;
      else
        v19 = (unint64_t)((v18 & 0x1010000) != 0) << 20;
      if ((v18 & 0x900000) != 0)
        v19 |= 0x40000uLL;
      if ((v18 & 0x220000) != 0)
        v19 |= 0x20000uLL;
      *a5 = v19 | (v18 >> 3) & 0x800000 | (v18 >> 2) & 0x10000;
    }
    if (HIWORD(v36))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v40, (char *)&v35 + 2, v38, &v35, v37, &v34, 0, v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend((id)objc_opt_class(), "keyCommandWithInput:modifierFlags:", v20, v17);
    v21 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v21[2] = IntegerValue;
    if ((_WORD)v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v39);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setUnmodifiedInput:", v22);

    }
    if (HIWORD(v35))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v38);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setShiftModifiedInput:", v23);

    }
    if ((_WORD)v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v37);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setCommandModifiedInput:", v24);

    }
    objc_msgSend(v21, "setUsagePage:", v9, v27, v28, v29, v30, v31, v32, v33);

    return v21;
  }
  if (a5)
    *a5 = v12;
  v40[0] = 0;
  if ((unsigned __int16)IntegerValue - 4 > 0x19)
  {
    if ((unsigned __int16)IntegerValue - 30 <= 9)
    {
      v15 = IntegerValue + 18;
      goto LABEL_57;
    }
    if ((unsigned __int16)IntegerValue - 89 <= 9)
    {
      v15 = IntegerValue - 41;
      goto LABEL_57;
    }
    if ((unsigned __int16)IntegerValue > 0x57u)
    {
      if ((unsigned __int16)IntegerValue != 88)
      {
        if ((unsigned __int16)IntegerValue != 133)
          goto LABEL_52;
        goto LABEL_55;
      }
    }
    else if ((unsigned __int16)IntegerValue != 40)
    {
      if ((unsigned __int16)IntegerValue != 54)
      {
LABEL_52:
        objc_msgSend((id)objc_opt_class(), "keyCommandWithKeyCode:modifierFlags:", (unsigned __int16)IntegerValue, v12);
        return (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_55:
      v15 = 44;
      goto LABEL_57;
    }
    v15 = 13;
    goto LABEL_57;
  }
  v15 = IntegerValue + 93;
LABEL_57:
  LOBYTE(v40[0]) = v15;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v40);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "keyCommandWithInput:modifierFlags:", v26, v12);
  v21 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v21[2] = (unsigned __int16)IntegerValue;
  objc_msgSend(v21, "setUnmodifiedInput:", v26);

  return v21;
}

+ (BOOL)_isModifierKeyWithPage:(int64_t)a3 usage:(int64_t)a4
{
  if (a3 != 7)
    return GSKeyboardIsGlobeKeyUsagePair() != 0;
  return (unint64_t)(a4 - 224) < 8 || a4 == 83 || a4 == 57;
}

+ (BOOL)_shouldMatchKeyCommandsForEvent:(__IOHIDEvent *)a3 gsKeyboard:(__GSKeyboard *)a4
{
  uint64_t IntegerValue;

  if (!a4)
    return 0;
  IntegerValue = IOHIDEventGetIntegerValue();
  return (objc_msgSend(a1, "_isModifierKeyWithPage:usage:", IntegerValue, IOHIDEventGetIntegerValue()) & 1) != 0
      || (GSKeyboardGetModifierState() & 0x5910000) != 0;
}

void __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_4;
  v13[3] = &unk_1E1E9FD38;
  v14 = v7;
  v15 = *(id *)(a1 + 40);
  v16 = v6;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_7;
  v11[3] = &unk_1E1EA0988;
  v12 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v14, "appendCustomFormatForValue:withCustomFormatForName:", v13, v11);

}

void __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_5;
  v4[3] = &unk_1E1EA1BF8;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v5, "overlayStyle:block:", v3, v4);

}

void __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  BSDescriptionStreamAppendBKSKeyModifierFlags(v3, objc_msgSend(v2, "unsignedIntValue"));

}

void __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_5(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_6;
  v3[3] = &unk_1E1E9FD10;
  v4 = v1;
  objc_msgSend(v4, "appendCollection:withName:itemBlock:", v2, 0, v3);

}

id __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", a2, 0);
}

void __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setCollectionLineBreak:", 2);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("skipModifiers"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClientInformation:", v3);

}

uint64_t __61__BKSHIDEventKeyCommand__descriptionForKeyCommandCollection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "modifierFlags"));
}

@end
