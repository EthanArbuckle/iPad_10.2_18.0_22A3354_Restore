@implementation AXSSKeyChord

+ (id)keyChordWithKeys:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithKeys:", v4);

  return v5;
}

+ (id)keyChordWithString:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("_"));
  v6 = objc_alloc((Class)a1);
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_msgSend(v6, "_initWithKeys:", &unk_1E5FA86B0);
  }
  else
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("_"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "_initWithKeys:", v9);

  }
  return v8;
}

+ (id)nullKeyChord
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "_initWithKeys:", MEMORY[0x1E0C9AA60]);
}

+ (id)keyFromKeyCode:(unint64_t)a3 unicodeCharacter:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;

  v5 = a4;
  if (a3 - 40 > 0x30)
    v6 = 0;
  else
    v6 = off_1E5F98C10[a3 - 40];
  if (-[__CFString length](v6, "length")
    || (v6 = (__CFString *)v5, -[__CFString length](v6, "length") == 1))
  {
    v7 = v6;
    v6 = v7;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_initWithKeys:(id)a3
{
  id v4;
  AXSSKeyChord *v5;
  AXSSKeyChord *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXSSKeyChord;
  v5 = -[AXSSKeyChord init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AXSSKeyChord _normalizeKeys:](v5, "_normalizeKeys:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSKeyChord setKeys:](v6, "setKeys:", v7);

  }
  return v6;
}

- (id)_normalizeKeys:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(__CFString **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (-[__CFString length](v11, "length", (_QWORD)v19) == 1
          && objc_msgSend(v4, "characterIsMember:", -[__CFString characterAtIndex:](v11, "characterAtIndex:", 0)))
        {
          -[__CFString lowercaseString](v11, "lowercaseString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

          if ((objc_msgSend(v5, "containsObject:", CFSTR("⇧")) & 1) != 0)
            continue;
          v13 = v5;
          v14 = CFSTR("⇧");
        }
        else
        {
          v13 = v5;
          v14 = v11;
        }
        objc_msgSend(v13, "addObject:", v14);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reverseObjectEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXSSKeyChord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  AXSSKeyChord *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("keys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v14 = 0;
          goto LABEL_11;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }

  self = (AXSSKeyChord *)-[AXSSKeyChord _initWithKeys:](self, "_initWithKeys:", v9);
  v14 = self;
LABEL_11:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSSKeyChord keys](self, "keys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("keys"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSKeyChord keys](self, "keys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: keys:[%@]"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[AXSSKeyChord isEqualToKeyChord:](self, "isEqualToKeyChord:", v4);

  return v5;
}

- (BOOL)isEqualToKeyChord:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXSSKeyChord keys](self, "keys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToArray:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AXSSKeyChord keys](self, "keys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  -[AXSSKeyChord keys](self, "keys", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXSSKeyChord keyChordWithKeys:](AXSSKeyChord, "keyChordWithKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isFunctionKeyChord
{
  NSNumber *cachedIsFunctionKey;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSNumber *v11;
  NSNumber *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  cachedIsFunctionKey = self->_cachedIsFunctionKey;
  if (cachedIsFunctionKey)
    return -[NSNumber BOOLValue](cachedIsFunctionKey, "BOOLValue");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AXSSKeyChord keys](self, "keys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Fn")) & 1) != 0
          || (objc_msgSend(&unk_1E5FA86C8, "containsObject:", v10) & 1) != 0)
        {
          v12 = self->_cachedIsFunctionKey;
          self->_cachedIsFunctionKey = (NSNumber *)MEMORY[0x1E0C9AAB0];

          return 1;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = self->_cachedIsFunctionKey;
  self->_cachedIsFunctionKey = (NSNumber *)MEMORY[0x1E0C9AAA0];

  return 0;
}

- (BOOL)containsModifier
{
  NSNumber *cachedContainsModifier;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSNumber *v10;
  NSNumber *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  cachedContainsModifier = self->_cachedContainsModifier;
  if (cachedContainsModifier)
    return -[NSNumber BOOLValue](cachedContainsModifier, "BOOLValue");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AXSSKeyChord keys](self, "keys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(&unk_1E5FA86E0, "containsObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)) & 1) != 0)
        {
          v11 = self->_cachedContainsModifier;
          self->_cachedContainsModifier = (NSNumber *)MEMORY[0x1E0C9AAB0];

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }

  v10 = self->_cachedContainsModifier;
  self->_cachedContainsModifier = (NSNumber *)MEMORY[0x1E0C9AAA0];

  return 0;
}

- (BOOL)isTextInputChord
{
  if (isTextInputChord_onceToken != -1)
    dispatch_once(&isTextInputChord_onceToken, &__block_literal_global_1);
  return -[AXSSKeyChord isTextInputTabChord](self, "isTextInputTabChord")
      || -[AXSSKeyChord isArrowKeyChord](self, "isArrowKeyChord")
      || -[AXSSKeyChord isEqualToKeyChord:](self, "isEqualToKeyChord:", isTextInputChord_spaceChord)
      || -[AXSSKeyChord isEqualToKeyChord:](self, "isEqualToKeyChord:", isTextInputChord_returnChord);
}

void __32__AXSSKeyChord_isTextInputChord__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[AXSSKeyChord keyChordWithKeys:](AXSSKeyChord, "keyChordWithKeys:", &unk_1E5FA86F8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isTextInputChord_spaceChord;
  isTextInputChord_spaceChord = v0;

  +[AXSSKeyChord keyChordWithKeys:](AXSSKeyChord, "keyChordWithKeys:", &unk_1E5FA8710);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isTextInputChord_returnChord;
  isTextInputChord_returnChord = v2;

}

- (BOOL)isArrowKeyChord
{
  void *v2;
  void *v3;
  BOOL v4;

  -[AXSSKeyChord keys](self, "keys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_120);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

uint64_t __31__AXSSKeyChord_isArrowKeyChord__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("↑")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("↓")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("←")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("→"));
  }

  return v3;
}

- (BOOL)isTextInputTabChord
{
  if (isTextInputTabChord_onceToken != -1)
    dispatch_once(&isTextInputTabChord_onceToken, &__block_literal_global_121);
  return -[AXSSKeyChord isEqualToKeyChord:](self, "isEqualToKeyChord:", isTextInputTabChord_tabChord)
      || -[AXSSKeyChord isEqualToKeyChord:](self, "isEqualToKeyChord:", isTextInputTabChord_shiftTabChord);
}

void __35__AXSSKeyChord_isTextInputTabChord__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[AXSSKeyChord keyChordWithKeys:](AXSSKeyChord, "keyChordWithKeys:", &unk_1E5FA8728);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isTextInputTabChord_tabChord;
  isTextInputTabChord_tabChord = v0;

  +[AXSSKeyChord keyChordWithKeys:](AXSSKeyChord, "keyChordWithKeys:", &unk_1E5FA8740);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isTextInputTabChord_shiftTabChord;
  isTextInputTabChord_shiftTabChord = v2;

}

- (BOOL)isNull
{
  void *v2;
  BOOL v3;

  -[AXSSKeyChord keys](self, "keys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (NSString)displayValue
{
  return (NSString *)-[AXSSKeyChord displayValueWithStyle:](self, "displayValueWithStyle:", 0);
}

- (id)displayValueWithStyle:(int64_t)a3
{
  return -[AXSSKeyChord displayValueWithStyle:isUSKeyboard:](self, "displayValueWithStyle:isUSKeyboard:", a3, 1);
}

- (id)displayValueWithStyle:(int64_t)a3 isUSKeyboard:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a4;
  if (a3 == 1)
  {
    -[AXSSKeyChord keys](self, "keys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__AXSSKeyChord_displayValueWithStyle_isUSKeyboard___block_invoke;
    v10[3] = &unk_1E5F98BA0;
    v11 = &unk_1E5FA8758;
    v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v10);

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = &unk_1E5FA8770;
    else
      v8 = &unk_1E5FA8758;

  }
  else
  {
    v8 = 0;
  }
  return -[AXSSKeyChord _displayValueWithSortedModifiers:isUSKeyboard:](self, "_displayValueWithSortedModifiers:isUSKeyboard:", v8, v4);
}

uint64_t __51__AXSSKeyChord_displayValueWithStyle_isUSKeyboard___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (id)_displayValueWithSortedModifiers:(id)a3 isUSKeyboard:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  BOOL v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  -[AXSSKeyChord keys](self, "keys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__AXSSKeyChord__displayValueWithSortedModifiers_isUSKeyboard___block_invoke;
    v17[3] = &unk_1E5F98BC8;
    v18 = v6;
    objc_msgSend(v7, "sortedArrayWithOptions:usingComparator:", 16, v17);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __62__AXSSKeyChord__displayValueWithSortedModifiers_isUSKeyboard___block_invoke_2;
  v14[3] = &unk_1E5F98BF0;
  v16 = a4;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  objc_msgSend(v7, "ax_mappedArrayUsingBlock:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(" "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __62__AXSSKeyChord__displayValueWithSortedModifiers_isUSKeyboard___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "indexOfObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v6);

  if (v7 == v8)
    return 0;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  if (v7 < v8)
    v10 = -1;
  else
    v10 = 1;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return -1;
  else
    return v10;
}

id __62__AXSSKeyChord__displayValueWithSortedModifiers_isUSKeyboard___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;

  v3 = a2;
  objc_msgSend(v3, "axss_keyChordKeyDisplayValueForUSKeyboard:", *(unsigned __int8 *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "length") == 1
      && objc_msgSend(*(id *)(a1 + 32), "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", 0)))
    {
      objc_msgSend(v5, "uppercaseStringWithLocale:", 0);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v6;
    }
  }
  else
  {
    FKALogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__AXSSKeyChord__displayValueWithSortedModifiers_isUSKeyboard___block_invoke_2_cold_1((uint64_t)v3, v7);

    v5 = v3;
  }

  return v5;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
  objc_storeStrong((id *)&self->_keys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_cachedContainsModifier, 0);
  objc_storeStrong((id *)&self->_cachedIsFunctionKey, 0);
}

void __62__AXSSKeyChord__displayValueWithSortedModifiers_isUSKeyboard___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AF5CC000, a2, OS_LOG_TYPE_ERROR, "Error getting value from key %@", (uint8_t *)&v2, 0xCu);
}

@end
