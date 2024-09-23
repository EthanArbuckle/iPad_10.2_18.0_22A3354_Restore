@implementation BLSBacklightSceneUpdateContext

- (BLSBacklightSceneUpdateContext)initWithVisualState:(id)a3 previousVisualState:(id)a4 frameSpecifier:(id)a5 animated:(BOOL)a6 triggerEvent:(id)a7 touchTargetable:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BLSBacklightSceneUpdateContext *v18;
  BLSBacklightSceneUpdateContext *v19;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)BLSBacklightSceneUpdateContext;
  v18 = -[BLSBacklightSceneUpdateContext init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_visualState, a3);
    objc_storeStrong((id *)&v19->_previousVisualState, a4);
    objc_storeStrong((id *)&v19->_frameSpecifier, a5);
    v19->_animated = a6;
    objc_storeStrong((id *)&v19->_triggerEvent, a7);
    v19->_touchTargetable = a8;
  }

  return v19;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_visualState, CFSTR("new"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_previousVisualState, CFSTR("previous"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_frameSpecifier, CFSTR("specifier"), 1);
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_animated, CFSTR("animated"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", self->_touchTargetable, CFSTR("touchTarget"));
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_triggerEvent, CFSTR("trigger"), 1);
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_visualState);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_previousVisualState);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_frameSpecifier);
  v7 = (id)objc_msgSend(v3, "appendBool:", self->_animated);
  v8 = (id)objc_msgSend(v3, "appendBool:", self->_touchTargetable);
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  BLSBacklightSceneVisualState *visualState;
  uint64_t v7;
  id v8;
  id v9;
  BLSBacklightSceneVisualState *previousVisualState;
  id v11;
  id v12;
  BLSAlwaysOnFrameSpecifier *frameSpecifier;
  id v14;
  id v15;
  _BOOL8 animated;
  id v17;
  id v18;
  uint64_t touchTargetable;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  visualState = self->_visualState;
  v7 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke;
  v31[3] = &unk_1E621A808;
  v8 = v4;
  v32 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", visualState, v31);
  previousVisualState = self->_previousVisualState;
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_2;
  v29[3] = &unk_1E621A808;
  v11 = v8;
  v30 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", previousVisualState, v29);
  frameSpecifier = self->_frameSpecifier;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_3;
  v27[3] = &unk_1E621A808;
  v14 = v11;
  v28 = v14;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", frameSpecifier, v27);
  animated = self->_animated;
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_4;
  v25[3] = &unk_1E621ACF0;
  v17 = v14;
  v26 = v17;
  v18 = (id)objc_msgSend(v5, "appendBool:counterpart:", animated, v25);
  touchTargetable = self->_touchTargetable;
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_5;
  v23[3] = &unk_1E621ACF0;
  v24 = v17;
  v20 = v17;
  v21 = (id)objc_msgSend(v5, "appendBool:counterpart:", touchTargetable, v23);
  LOBYTE(touchTargetable) = objc_msgSend(v5, "isEqual");

  return touchTargetable;
}

uint64_t __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "visualState");
}

uint64_t __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "previousVisualState");
}

uint64_t __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "frameSpecifier");
}

uint64_t __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isAnimated");
}

uint64_t __42__BLSBacklightSceneUpdateContext_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isTouchTargetable");
}

- (BLSBacklightSceneVisualState)visualState
{
  return self->_visualState;
}

- (BLSBacklightSceneVisualState)previousVisualState
{
  return self->_previousVisualState;
}

- (BLSAlwaysOnFrameSpecifier)frameSpecifier
{
  return self->_frameSpecifier;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (BLSBacklightChangeEvent)triggerEvent
{
  return self->_triggerEvent;
}

- (BOOL)isTouchTargetable
{
  return self->_touchTargetable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerEvent, 0);
  objc_storeStrong((id *)&self->_frameSpecifier, 0);
  objc_storeStrong((id *)&self->_previousVisualState, 0);
  objc_storeStrong((id *)&self->_visualState, 0);
}

@end
