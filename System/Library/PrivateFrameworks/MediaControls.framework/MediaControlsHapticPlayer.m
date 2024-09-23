@implementation MediaControlsHapticPlayer

- (void)prepare
{
  CHHapticEngine *v3;
  id v4;
  CHHapticEngine *engine;
  CHHapticEngine *v6;
  _QWORD v7[5];
  id v8;

  v8 = 0;
  v3 = (CHHapticEngine *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DCC8]), "initAndReturnError:", &v8);
  v4 = v8;
  engine = self->_engine;
  self->_engine = v3;

  -[MediaControlsHapticPlayer checkError:](self, "checkError:", v4);
  -[MediaControlsHapticPlayer setupExpandedButtonChanged](self, "setupExpandedButtonChanged");
  v6 = self->_engine;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__MediaControlsHapticPlayer_prepare__block_invoke;
  v7[3] = &unk_1E5819098;
  v7[4] = self;
  -[CHHapticEngine prewarmWithCompletionHandler:](v6, "prewarmWithCompletionHandler:", v7);

}

uint64_t __36__MediaControlsHapticPlayer_prepare__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkError:", a2);
}

- (void)tearDown
{
  CHHapticEngine *engine;
  _QWORD v4[5];

  -[CHHapticEngine stopPrewarm](self->_engine, "stopPrewarm");
  engine = self->_engine;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__MediaControlsHapticPlayer_tearDown__block_invoke;
  v4[3] = &unk_1E5819098;
  v4[4] = self;
  -[CHHapticEngine stopWithCompletionHandler:](engine, "stopWithCompletionHandler:", v4);
}

uint64_t __37__MediaControlsHapticPlayer_tearDown__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkError:", a2);
}

- (void)dealloc
{
  objc_super v3;

  -[MediaControlsHapticPlayer tearDown](self, "tearDown");
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsHapticPlayer;
  -[MediaControlsHapticPlayer dealloc](&v3, sel_dealloc);
}

- (void)expandedButtonChanged
{
  CHHapticEngine *engine;
  id v4;
  CHHapticPatternPlayer *expandedButtonChangedPlayer;
  id v6;
  id v7;
  id v8;

  engine = self->_engine;
  v8 = 0;
  -[CHHapticEngine startAndReturnError:](engine, "startAndReturnError:", &v8);
  v4 = v8;
  -[MediaControlsHapticPlayer checkError:](self, "checkError:", v4);
  expandedButtonChangedPlayer = self->_expandedButtonChangedPlayer;
  v7 = v4;
  -[CHHapticPatternPlayer startAtTime:error:](expandedButtonChangedPlayer, "startAtTime:error:", &v7, 0.0);
  v6 = v7;

  -[MediaControlsHapticPlayer checkError:](self, "checkError:", v6);
}

- (void)checkError:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    MCLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_ERROR, "[MediaControlsHapticPlayer] Error: %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)setupExpandedButtonChanged
{
  id v3;
  uint64_t v4;
  id v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  CHHapticEngine *engine;
  CHHapticPatternPlayer *v21;
  id v22;
  CHHapticPatternPlayer *expandedButtonChangedPlayer;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C9DCE0]);
  v4 = *MEMORY[0x1E0C9DC78];
  v5 = objc_alloc(MEMORY[0x1E0C9DCE8]);
  LODWORD(v6) = 1.0;
  v7 = (void *)objc_msgSend(v5, "initWithParameterID:value:", *MEMORY[0x1E0C9DC58], v6);
  v27[0] = v7;
  v8 = objc_alloc(MEMORY[0x1E0C9DCE8]);
  LODWORD(v9) = 1.0;
  v10 = (void *)objc_msgSend(v8, "initWithParameterID:value:", *MEMORY[0x1E0C9DC68], v9);
  v27[1] = v10;
  v11 = objc_alloc(MEMORY[0x1E0C9DCE8]);
  LODWORD(v12) = 1.0;
  v13 = (void *)objc_msgSend(v11, "initWithParameterID:value:", *MEMORY[0x1E0C9DC50], v12);
  v27[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v3, "initWithEventType:parameters:relativeTime:", v4, v14, 0.0);

  v16 = objc_alloc(MEMORY[0x1E0C9DD08]);
  v26 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v18 = (void *)objc_msgSend(v16, "initWithEvents:parameters:error:", v17, MEMORY[0x1E0C9AA60], &v25);
  v19 = v25;

  -[MediaControlsHapticPlayer checkError:](self, "checkError:", v19);
  engine = self->_engine;
  v24 = v19;
  -[CHHapticEngine createPrivilegedPlayerWithPlayable:error:](engine, "createPrivilegedPlayerWithPlayable:error:", v18, &v24);
  v21 = (CHHapticPatternPlayer *)objc_claimAutoreleasedReturnValue();
  v22 = v24;

  expandedButtonChangedPlayer = self->_expandedButtonChangedPlayer;
  self->_expandedButtonChangedPlayer = v21;

  -[MediaControlsHapticPlayer checkError:](self, "checkError:", v22);
}

- (CHHapticEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
  objc_storeStrong((id *)&self->_engine, a3);
}

- (CHHapticPatternPlayer)expandedButtonChangedPlayer
{
  return self->_expandedButtonChangedPlayer;
}

- (void)setExpandedButtonChangedPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_expandedButtonChangedPlayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedButtonChangedPlayer, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

@end
