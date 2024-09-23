@implementation CNUIBackgroundColors

- (CNUIBackgroundColors)initWithData:(id)a3
{
  id v4;
  CNUIBackgroundColors *v5;
  CNUIBackgroundColors *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  CNUIBackgroundColors *v19;
  NSObject *v20;
  CNUIBackgroundColors *v21;
  NSObject *v22;
  CNUIBackgroundColors *v23;

  v4 = a3;
  v5 = -[CNUIBackgroundColors init](self, "init");
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
      if (v7)
      {
        (*(void (**)(void))(*MEMORY[0x1E0D13888] + 16))();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("contactImage"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNUIColorSerialization colorsFromDictionaries:](CNUIColorSerialization, "colorsFromDictionaries:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          v13 = MEMORY[0x1E0C9AA60];
          if (v11)
            v14 = v11;
          else
            v14 = MEMORY[0x1E0C9AA60];
          -[CNUIBackgroundColors setContactImage:](v6, "setContactImage:", v14);

          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("contactPoster"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNUIColorSerialization colorsFromDictionaries:](CNUIColorSerialization, "colorsFromDictionaries:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v16)
            v18 = v16;
          else
            v18 = v13;
          -[CNUIBackgroundColors setContactPoster:](v6, "setContactPoster:", v18);

        }
        else
        {
          +[CNUICoreLogProvider color_os_log](CNUICoreLogProvider, "color_os_log");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[CNUIBackgroundColors initWithData:].cold.2();

        }
        v23 = v6;

      }
      else
      {
        +[CNUICoreLogProvider color_os_log](CNUICoreLogProvider, "color_os_log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[CNUIBackgroundColors initWithData:].cold.1();

        v21 = v6;
      }

    }
    else
    {
      v19 = v5;
    }
  }

  return v6;
}

- (void)setContactPoster:(id)a3
{
  objc_storeStrong((id *)&self->_contactPoster, a3);
}

- (void)setContactImage:(id)a3
{
  objc_storeStrong((id *)&self->_contactImage, a3);
}

- (CNUIBackgroundColors)init
{
  CNUIBackgroundColors *v2;
  CNUIBackgroundColors *v3;
  uint64_t v4;
  CNUIBackgroundColors *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNUIBackgroundColors;
  v2 = -[CNUIBackgroundColors init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = MEMORY[0x1E0C9AA60];
    -[CNUIBackgroundColors setContactImage:](v2, "setContactImage:", MEMORY[0x1E0C9AA60]);
    -[CNUIBackgroundColors setContactPoster:](v3, "setContactPoster:", v4);
    v5 = v3;
  }

  return v3;
}

- (NSArray)contactImage
{
  return self->_contactImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPoster, 0);
  objc_storeStrong((id *)&self->_contactImage, 0);
}

- (NSData)data
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v3 = *MEMORY[0x1E0D137F8];
  -[CNUIBackgroundColors contactImage](self, "contactImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  -[CNUIBackgroundColors contactPoster](self, "contactPoster");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v6);

  if (!v5 || (v7 & 1) == 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    if ((v5 & 1) == 0)
    {
      -[CNUIBackgroundColors contactImage](self, "contactImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNUIColorSerialization dictionariesForColors:](CNUIColorSerialization, "dictionariesForColors:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("contactImage"));
    }
    if ((v7 & 1) == 0)
    {
      -[CNUIBackgroundColors contactPoster](self, "contactPoster");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNUIColorSerialization dictionariesForColors:](CNUIColorSerialization, "dictionariesForColors:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("contactPoster"));
    }
    (*(void (**)(void))(*MEMORY[0x1E0D13858] + 16))();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "dataUsingEncoding:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
LABEL_16:

        return (NSData *)v8;
      }
      +[CNUICoreLogProvider color_os_log](CNUICoreLogProvider, "color_os_log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CNUIBackgroundColors data].cold.2();
    }
    else
    {
      +[CNUICoreLogProvider color_os_log](CNUICoreLogProvider, "color_os_log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CNUIBackgroundColors data].cold.1();
      v8 = 0;
    }

    goto LABEL_16;
  }
  v8 = 0;
  return (NSData *)v8;
}

- (NSArray)contactPoster
{
  return self->_contactPoster;
}

- (void)initWithData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1DD140000, v0, v1, "[CNUIBackgroundColors initWithData:] Failed to decode NSData to string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1DD140000, v0, v1, "[CNUIBackgroundColors initWithData:] Failed to decode JSON string to dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)data
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1DD140000, v0, v1, "[CNUIBackgroundColors data] Failed to convert string to NSData", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
