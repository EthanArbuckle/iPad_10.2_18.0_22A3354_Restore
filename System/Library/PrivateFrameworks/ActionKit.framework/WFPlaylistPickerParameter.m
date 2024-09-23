@implementation WFPlaylistPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFPlaylistPickerParameter)initWithDefinition:(id)a3
{
  id v4;
  WFPlaylistPickerParameter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  WFPlaylistSubstitutableState *v9;
  WFPlaylistDescriptor *v10;
  uint64_t v11;
  WFPlaylistSubstitutableState *entireLibraryState;
  WFPlaylistPickerParameter *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFPlaylistPickerParameter;
  v5 = -[WFPlaylistPickerParameter initWithDefinition:](&v15, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ShowLibrary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_showLibrary = objc_msgSend(v8, "BOOLValue");

    v9 = [WFPlaylistSubstitutableState alloc];
    v10 = -[WFPlaylistDescriptor initWithEntireMusicLibrary]([WFPlaylistDescriptor alloc], "initWithEntireMusicLibrary");
    v11 = -[WFVariableSubstitutableParameterState initWithValue:](v9, "initWithValue:", v10);
    entireLibraryState = v5->_entireLibraryState;
    v5->_entireLibraryState = (WFPlaylistSubstitutableState *)v11;

    v13 = v5;
  }

  return v5;
}

- (void)setActionResources:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "anyObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  WFEnforceClass(v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPlaylistPickerParameter setAppleMusicAccessResource:](self, "setAppleMusicAccessResource:", v5);

}

- (void)setAppleMusicAccessResource:(id)a3
{
  WFAppleMusicAccessResource **p_appleMusicAccessResource;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_appleMusicAccessResource = &self->_appleMusicAccessResource;
  v6 = (_QWORD *)MEMORY[0x24BEC4628];
  if (self->_appleMusicAccessResource)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, *v6, *p_appleMusicAccessResource);

  }
  objc_storeStrong((id *)&self->_appleMusicAccessResource, a3);
  if (*p_appleMusicAccessResource)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_authorizationStatusDidChange, *v6, *p_appleMusicAccessResource);

  }
}

- (void)wasAddedToWorkflow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFPlaylistPickerParameter;
  -[WFPlaylistPickerParameter wasAddedToWorkflow](&v5, sel_wasAddedToWorkflow);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getMPMediaLibraryDidChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_possibleStatesDidChange, v4, 0);

  -[WFPlaylistPickerParameter updateChangeNotificationRegistration](self, "updateChangeNotificationRegistration");
}

- (void)wasRemovedFromWorkflow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFPlaylistPickerParameter;
  -[WFPlaylistPickerParameter wasRemovedFromWorkflow](&v5, sel_wasRemovedFromWorkflow);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getMPMediaLibraryDidChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

  -[WFPlaylistPickerParameter updateChangeNotificationRegistration](self, "updateChangeNotificationRegistration");
}

- (void)authorizationStatusDidChange
{
  -[WFPlaylistPickerParameter possibleStatesDidChange](self, "possibleStatesDidChange");
  -[WFPlaylistPickerParameter updateChangeNotificationRegistration](self, "updateChangeNotificationRegistration");
}

- (void)updateChangeNotificationRegistration
{
  uint64_t v3;
  _BOOL4 v4;
  id v5;

  v3 = -[WFPlaylistPickerParameter isInsideWorkflow](self, "isInsideWorkflow");
  v4 = -[WFPlaylistPickerParameter generatingNotifications](self, "generatingNotifications");
  if (!(_DWORD)v3)
  {
    if (!v4)
      return;
    objc_msgSend(getMPMediaLibraryClass_12905(), "defaultMediaLibrary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endGeneratingLibraryChangeNotifications");
    goto LABEL_7;
  }
  if (!v4 && objc_msgSend((id)objc_opt_class(), "hasPlaylistAccess"))
  {
    objc_msgSend(getMPMediaLibraryClass_12905(), "defaultMediaLibrary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginGeneratingLibraryChangeNotifications");
LABEL_7:
    -[WFPlaylistPickerParameter setGeneratingNotifications:](self, "setGeneratingNotifications:", v3);

  }
}

- (void)possibleStatesDidChange
{
  NSArray *possibleStates;
  objc_super v4;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFPlaylistPickerParameter;
  -[WFPlaylistPickerParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
}

- (NSArray)possibleStates
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  void *v9;
  NSArray *possibleStates;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (!self->_possibleStates && objc_msgSend((id)objc_opt_class(), "hasPlaylistAccess"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v3 = (void *)getMPMediaQueryClass_softClass_12883;
    v16 = getMPMediaQueryClass_softClass_12883;
    if (!getMPMediaQueryClass_softClass_12883)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __getMPMediaQueryClass_block_invoke_12884;
      v12[3] = &unk_24F8BB430;
      v12[4] = &v13;
      __getMPMediaQueryClass_block_invoke_12884((uint64_t)v12);
      v3 = (void *)v14[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v13, 8);
    objc_msgSend(v4, "playlistsQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_compactMap:", &__block_literal_global_12885);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSArray *)objc_msgSend(v7, "mutableCopy");

    if (-[WFPlaylistPickerParameter showLibrary](self, "showLibrary"))
    {
      -[WFPlaylistPickerParameter entireLibraryState](self, "entireLibraryState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray insertObject:atIndex:](v8, "insertObject:atIndex:", v9, 0);

    }
    possibleStates = self->_possibleStates;
    self->_possibleStates = v8;

  }
  return self->_possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "entireMusicLibrary");

  if (v5)
  {
    WFLocalizedString(CFSTR("My Music Library"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playlistName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)defaultSerializedRepresentation
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[WFPlaylistPickerParameter showLibrary](self, "showLibrary"))
  {
    -[WFPlaylistPickerParameter entireLibraryState](self, "entireLibraryState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serializedRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFPlaylistPickerParameter;
    -[WFPlaylistPickerParameter defaultSerializedRepresentation](&v6, sel_defaultSerializedRepresentation);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)showLibrary
{
  return self->_showLibrary;
}

- (WFPlaylistSubstitutableState)entireLibraryState
{
  return self->_entireLibraryState;
}

- (void)setEntireLibraryState:(id)a3
{
  objc_storeStrong((id *)&self->_entireLibraryState, a3);
}

- (BOOL)generatingNotifications
{
  return self->_generatingNotifications;
}

- (void)setGeneratingNotifications:(BOOL)a3
{
  self->_generatingNotifications = a3;
}

- (WFAppleMusicAccessResource)appleMusicAccessResource
{
  return self->_appleMusicAccessResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleMusicAccessResource, 0);
  objc_storeStrong((id *)&self->_entireLibraryState, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

WFPlaylistSubstitutableState *__43__WFPlaylistPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  WFPlaylistSubstitutableState *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getMPMediaPlaylistClass_softClass;
  v11 = getMPMediaPlaylistClass_softClass;
  if (!getMPMediaPlaylistClass_softClass)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getMPMediaPlaylistClass_block_invoke;
    v7[3] = &unk_24F8BB430;
    v7[4] = &v8;
    __getMPMediaPlaylistClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[WFPlaylistSubstitutableState initWithPlaylist:]([WFPlaylistSubstitutableState alloc], "initWithPlaylist:", v2);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)hasPlaylistAccess
{
  return objc_msgSend(getMPMediaLibraryClass_12905(), "authorizationStatus") == 3;
}

+ (id)referencedActionResourceClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

@end
