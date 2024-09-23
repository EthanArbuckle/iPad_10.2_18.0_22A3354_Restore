@implementation CHSMutableConfiguredWidgetDescriptor

- (void)setSuggestion:(BOOL)a3
{
  self->super._suggestion = a3;
}

- (void)setSystemConfigured:(BOOL)a3
{
  self->super._systemConfigured = a3;
}

- (void)setSupportedColorSchemes:(unint64_t)a3
{
  self->super._supportedColorSchemes = a3;
}

- (void)setSupportedRenderingModes:(unint64_t)a3
{
  char v3;
  void *v5;
  _BOOL4 IsAccessory;
  CHSWidgetRenderScheme *v7;
  CHSWidgetRenderScheme *v8;
  CHSWidgetRenderScheme *v9;
  id v10;

  v3 = a3;
  v10 = (id)objc_opt_new();
  if ((v3 & 1) != 0)
  {
    -[CHSConfiguredWidgetDescriptor widget](self, "widget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IsAccessory = CHSWidgetFamilyIsAccessory(objc_msgSend(v5, "family"));

    v7 = -[CHSWidgetRenderScheme initWithRenderingModes:backgroundViewPolicy:]([CHSWidgetRenderScheme alloc], "initWithRenderingModes:backgroundViewPolicy:", 1, IsAccessory);
    objc_msgSend(v10, "addObject:", v7);

  }
  if ((v3 & 4) != 0)
  {
    v8 = -[CHSWidgetRenderScheme initWithRenderingModes:backgroundViewPolicy:]([CHSWidgetRenderScheme alloc], "initWithRenderingModes:backgroundViewPolicy:", 4, 1);
    objc_msgSend(v10, "addObject:", v8);

  }
  if ((v3 & 2) != 0)
  {
    v9 = -[CHSWidgetRenderScheme initWithRenderingModes:backgroundViewPolicy:]([CHSWidgetRenderScheme alloc], "initWithRenderingModes:backgroundViewPolicy:", 2, 1);
    objc_msgSend(v10, "addObject:", v9);

  }
  -[CHSMutableConfiguredWidgetDescriptor setSupportedRenderSchemes:](self, "setSupportedRenderSchemes:", v10);

}

- (void)setSupportsTinting:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 7;
  else
    v3 = 1;
  -[CHSMutableConfiguredWidgetDescriptor setSupportedRenderingModes:](self, "setSupportedRenderingModes:", v3);
}

- (void)setSupportedRenderSchemes:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSArray *supportedRenderSchemes;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "_compatibilityRenderSchemesFromDeprecatedRenderingModes", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          -[NSArray addObjectsFromArray:](v5, "addObjectsFromArray:", v11);
        }
        else
        {
          v12 = (void *)objc_msgSend(v10, "copy");
          -[NSArray addObject:](v5, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  supportedRenderSchemes = self->super._supportedRenderSchemes;
  self->super._supportedRenderSchemes = v5;

}

- (void)setSupportsLowLuminance:(BOOL)a3
{
  self->super._supportsLowLuminance = a3;
}

- (void)setShowsWidgetLabel:(BOOL)a3
{
  self->super._showsWidgetLabel = a3;
}

- (void)setDisplayProperties:(id)a3
{
  objc_storeStrong((id *)&self->super._displayProperties, a3);
}

- (void)setRefreshStrategy:(id)a3
{
  objc_storeStrong((id *)&self->super._refreshStrategy, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSConfiguredWidgetDescriptor _initWithDescriptor:]([CHSConfiguredWidgetDescriptor alloc], "_initWithDescriptor:", self);
}

@end
