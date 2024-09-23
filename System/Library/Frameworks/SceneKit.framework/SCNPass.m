@implementation SCNPass

- (SCNPass)initWithFXPass:(__C3DFXPass *)a3 technique:(id)a4
{
  SCNPass *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNPass;
  v6 = -[SCNPass init](&v8, sel_init);
  if (v6)
  {
    v6->_fxPass = (__C3DFXPass *)CFRetain(a3);
    v6->_technique = (SCNTechnique *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_fxPass);
  v3.receiver = self;
  v3.super_class = (Class)SCNPass;
  -[SCNPass dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  self->_technique = 0;
}

- (void)setInitializationHandler:(id)a3
{
  C3DFXPassSetInitializeBlock((uint64_t)self->_fxPass, a3);
  C3DFXPassSetInitializeCallback((uint64_t)self->_fxPass, (uint64_t)SCNPassInitialize);
}

- (id)initializationHandler
{
  return (id)C3DFXPassGetInitializeBlock((uint64_t)self->_fxPass);
}

- (void)setExecutionHandler:(id)a3
{
  C3DFXPassSetExecuteBlock((uint64_t)self->_fxPass, a3);
  C3DFloorSetReflectionCategoryBitMask((uint64_t)self->_fxPass, (uint64_t)SCNPassExecute);
}

- (id)executionHandler
{
  return (id)C3DFXPassGetExecuteBlock((uint64_t)self->_fxPass);
}

- (void)setValue:(id)a3 forPassPropertyKey:(int64_t)a4
{
  __C3DScene *v7;
  SCNTechnique *technique;
  _QWORD v9[7];

  v7 = -[SCNTechnique sceneRef](self->_technique, "sceneRef");
  technique = self->_technique;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__SCNPass_setValue_forPassPropertyKey___block_invoke;
  v9[3] = &unk_1EA59E2B0;
  v9[5] = self;
  v9[6] = a4;
  v9[4] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, technique, v9);
}

void __39__SCNPass_setValue_forPassPropertyKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t SharedInstance;

  v2 = *(_QWORD *)(a1 + 48);
  if ((unint64_t)(v2 - 1) < 5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "floatValue");
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + (((v3 << 32) - 0x100000000) >> 30) + 392) = v4;
    }
LABEL_4:
    SharedInstance = C3DNotificationCenterGetSharedInstance();
    C3DNotificationCenterPostNotification(SharedInstance, CFSTR("kC3DNotificationEngineContextInvalidatePasses"), (const void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "sceneRef"), 0, 1u);
    return;
  }
  if (v2 == 6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 200) = objc_msgSend(*(id *)(a1 + 32), "unsignedLongValue");
    goto LABEL_4;
  }
  if (v2 == 7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 208) = objc_msgSend(*(id *)(a1 + 32), "unsignedLongValue");
    goto LABEL_4;
  }
}

- (id)valueForPassPropertyKey:(int64_t)a3
{
  double v5;
  uint64_t v6;
  void *v7;
  void *var3;
  void *v9;

  +[SCNTransaction lock](SCNTransaction, "lock");
  if ((unint64_t)(a3 - 1) >= 5)
  {
    if (a3 == 6)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      var3 = self->_fxPass->var49.var3;
    }
    else
    {
      if (a3 != 7)
      {
        v9 = 0;
        goto LABEL_9;
      }
      v7 = (void *)MEMORY[0x1E0CB37E8];
      var3 = self->_fxPass->var49.var4;
    }
    v6 = objc_msgSend(v7, "numberWithUnsignedLong:", var3);
  }
  else
  {
    LODWORD(v5) = *(&self->_fxPass->var54 + (a3 - 1));
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  }
  v9 = (void *)v6;
LABEL_9:
  +[SCNTransaction unlock](SCNTransaction, "unlock");
  return v9;
}

@end
