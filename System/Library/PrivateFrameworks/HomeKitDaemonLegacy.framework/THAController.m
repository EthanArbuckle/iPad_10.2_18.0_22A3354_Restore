@implementation THAController

- (THAController)initWithName:(id)a3 identifier:(unsigned int)a4 ticksPerSecond:(unint64_t)a5 supportedButtons:(id)a6 supportsSiri:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  THAController *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  NSSet *selectedButtons;
  objc_super v20;

  v7 = a7;
  v12 = a3;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)THAController;
  v14 = -[THAController init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v15;

    v14->_identifier = a4;
    v14->_ticksPerSecond = a5;
    v14->_supportsSiri = v7;
    +[THAController selectButtonConfiguration:supportsSiri:](THAController, "selectButtonConfiguration:supportsSiri:", v13, v7);
    v17 = objc_claimAutoreleasedReturnValue();
    selectedButtons = v14->_selectedButtons;
    v14->_selectedButtons = (NSSet *)v17;

  }
  return v14;
}

- (BOOL)dispatchButtonEvent:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type") != 12;

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (unint64_t)ticksPerSecond
{
  return self->_ticksPerSecond;
}

- (void)setTicksPerSecond:(unint64_t)a3
{
  self->_ticksPerSecond = a3;
}

- (BOOL)supportsSiri
{
  return self->_supportsSiri;
}

- (void)setSupportsSiri:(BOOL)a3
{
  self->_supportsSiri = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)selected
{
  return self->_selected;
}

- (NSSet)selectedButtons
{
  return self->_selectedButtons;
}

- (void)setSelectedButtons:(id)a3
{
  objc_storeStrong((id *)&self->_selectedButtons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedButtons, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)selectButtonConfiguration:(id)a3 supportsSiri:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "type", (_QWORD)v18);
        if ((unint64_t)(v13 - 1) < 0xB || (v13 == 12 ? (v14 = !v4) : (v14 = 1), !v14))
          objc_msgSend(v6, "addObject:", v12);
        ++v11;
      }
      while (v9 != v11);
      v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v9 = v15;
    }
    while (v15);
  }

  v16 = (void *)objc_msgSend(v6, "copy");
  return v16;
}

@end
