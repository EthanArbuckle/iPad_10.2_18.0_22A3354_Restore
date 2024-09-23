@implementation ICNoteData

- (void)willAccessValueForKey:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("data")))
    -[ICNoteData saveNoteDataIfNeeded](self, "saveNoteDataIfNeeded");
  v5.receiver = self;
  v5.super_class = (Class)ICNoteData;
  -[ICNoteData willAccessValueForKey:](&v5, sel_willAccessValueForKey_, v4);

}

- (BOOL)saveNoteDataIfNeeded
{
  void *v3;
  BOOL v4;
  void *v5;
  char v6;
  void *v7;

  if (!-[ICNoteData needsToBeSaved](self, "needsToBeSaved"))
  {
    -[ICNoteData note](self, "note");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "needsInitialDerivedAttributesUpdate") & 1) != 0)
    {
      v4 = -[ICNoteData isSettingNoteData](self, "isSettingNoteData");

      if (!v4)
        goto LABEL_6;
    }
    else
    {

    }
    return 0;
  }
  if (-[ICNoteData isSettingNoteData](self, "isSettingNoteData"))
    return 0;
LABEL_6:
  -[ICNoteData setSettingNoteData:](self, "setSettingNoteData:", 1);
  if (-[ICNoteData needsToBeSaved](self, "needsToBeSaved"))
  {
    -[ICNoteData note](self, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "saveNoteData");

  }
  else
  {
    v6 = 0;
  }
  -[ICNoteData note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateDerivedAttributesIfNeeded");

  -[ICNoteData setSettingNoteData:](self, "setSettingNoteData:", 0);
  -[ICNoteData setNeedsToBeSaved:](self, "setNeedsToBeSaved:", 0);
  return v6;
}

- (BOOL)needsToBeSaved
{
  return self->needsToBeSaved;
}

- (void)willSave
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ic_loggingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Skipping note data save for %@ because merge is blocked", (uint8_t *)&v4, 0xCu);

}

- (void)setCryptoTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNoteData cryptoTag](self, "cryptoTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteData willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cryptoTag"));
  -[ICNoteData setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("cryptoTag"));
  -[ICNoteData didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cryptoTag"));
  v6 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((id)*MEMORY[0x1E0C9B0D0] == v4)
    v7 = 0;
  else
    v7 = v4;
  v8 = v7;
  if (v6 == v5)
    v9 = 0;
  else
    v9 = v5;
  v10 = v9;
  if (!(v8 | v10))
  {
LABEL_15:
    v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ICNoteData setCryptoTag:].cold.1(self);
    goto LABEL_19;
  }
  v11 = (void *)v10;
  if (v8)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {

  }
  else
  {
    v13 = objc_msgSend((id)v8, "isEqual:", v10);

    if (v13)
      goto LABEL_15;
  }
  v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = objc_opt_class();
    -[ICNoteData note](self, "note");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v15;
    v20 = 2112;
    v21 = v17;
    v22 = 2048;
    v23 = objc_msgSend(v4, "hash");
    _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_INFO, "Updated crypto goo for %@ (%@): cryptoTag.hash = %lu", (uint8_t *)&v18, 0x20u);

  }
LABEL_19:

}

- (void)setCryptoInitializationVector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNoteData cryptoInitializationVector](self, "cryptoInitializationVector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteData willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cryptoInitializationVector"));
  -[ICNoteData setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("cryptoInitializationVector"));
  -[ICNoteData didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cryptoInitializationVector"));
  v6 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((id)*MEMORY[0x1E0C9B0D0] == v4)
    v7 = 0;
  else
    v7 = v4;
  v8 = v7;
  if (v6 == v5)
    v9 = 0;
  else
    v9 = v5;
  v10 = v9;
  if (!(v8 | v10))
  {
LABEL_15:
    v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ICNoteData setCryptoInitializationVector:].cold.1(self);
    goto LABEL_19;
  }
  v11 = (void *)v10;
  if (v8)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {

  }
  else
  {
    v13 = objc_msgSend((id)v8, "isEqual:", v10);

    if (v13)
      goto LABEL_15;
  }
  v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = objc_opt_class();
    -[ICNoteData note](self, "note");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v15;
    v20 = 2112;
    v21 = v17;
    v22 = 2048;
    v23 = objc_msgSend(v4, "hash");
    _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_INFO, "Updated crypto goo for %@ (%@): cryptoInitializationVector.hash = %lu", (uint8_t *)&v18, 0x20u);

  }
LABEL_19:

}

- (void)setNeedsToBeSaved:(BOOL)a3
{
  self->needsToBeSaved = a3;
}

- (BOOL)isSettingNoteData
{
  return self->settingNoteData;
}

- (void)setSettingNoteData:(BOOL)a3
{
  self->settingNoteData = a3;
}

- (BOOL)didBlockLastSave
{
  return self->didBlockLastSave;
}

- (void)setDidBlockLastSave:(BOOL)a3
{
  self->didBlockLastSave = a3;
}

- (void)setCryptoTag:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_opt_class();
  objc_msgSend(a1, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_2(&dword_1BD918000, v4, v5, "Updated crypto goo to the same value for %@ (%@): cryptoTag.hash = %lu", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)setCryptoInitializationVector:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_opt_class();
  objc_msgSend(a1, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_2(&dword_1BD918000, v4, v5, "Updated crypto goo to the same value for %@ (%@): cryptoInitializationVector.hash = %lu", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

@end
