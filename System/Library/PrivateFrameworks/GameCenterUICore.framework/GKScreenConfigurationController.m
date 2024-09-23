@implementation GKScreenConfigurationController

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__GKScreenConfigurationController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, block);
  return (id)sharedController_sharedController;
}

void __51__GKScreenConfigurationController_sharedController__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;

}

+ (double)_scaleForCurrentDisplayConfiguration
{
  void *v2;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDF6D38], "screens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__GKScreenConfigurationController__scaleForCurrentDisplayConfiguration__block_invoke;
  v5[3] = &unk_24DC279A8;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __71__GKScreenConfigurationController__scaleForCurrentDisplayConfiguration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  double v4;
  uint64_t v5;

  result = objc_msgSend(a2, "scale");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 > *(double *)(v5 + 24))
    *(double *)(v5 + 24) = v4;
  return result;
}

- (GKScreenConfigurationController)init
{
  GKScreenConfigurationController *v2;
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKScreenConfigurationController;
  v2 = -[GKScreenConfigurationController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "_scaleForCurrentDisplayConfiguration");
    v2->_greatestScreenScale = v3;
  }
  return v2;
}

- (void)registerListener:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t block;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  GKScreenConfigurationController *v12;

  v6 = a3;
  block = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __52__GKScreenConfigurationController_registerListener___block_invoke;
  v11 = &unk_24DC27630;
  v12 = self;
  if (registerListener__onceToken != -1)
    dispatch_once(&registerListener__onceToken, &block);
  -[GKScreenConfigurationController emitter](self, "emitter", v6, block, v9, v10, v11, v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerListener:", v7);
  if (objc_msgSend(v4, "listenerRegisteredForSelector:", sel_greatestScreenScaleDidChange_))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__screensDidChange_, *MEMORY[0x24BDF7D58], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__screensDidChange_, *MEMORY[0x24BDF7D60], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__screensDidChange_, *MEMORY[0x24BDF7D68], 0);

  }
}

void __52__GKScreenConfigurationController_registerListener___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE3A190];
  v5[0] = &unk_2550F71A8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventEmitterForProtocols:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setEmitter:", v4);

}

- (void)unregisterListener:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[GKScreenConfigurationController emitter](self, "emitter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterListener:", v4);

  if ((objc_msgSend(v6, "listenerRegisteredForSelector:", sel_greatestScreenScaleDidChange_) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self);

  }
}

- (void)_screensDidChange:(id)a3
{
  double v4;
  double v5;
  id v6;

  objc_msgSend((id)objc_opt_class(), "_scaleForCurrentDisplayConfiguration");
  v5 = v4;
  if (self->_greatestScreenScale != v4)
  {
    self->_greatestScreenScale = v4;
    -[GKScreenConfigurationController emitter](self, "emitter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "greatestScreenScaleDidChange:", v5);

  }
}

- (GKEventEmitter)emitter
{
  return self->_emitter;
}

- (void)setEmitter:(id)a3
{
  objc_storeStrong((id *)&self->_emitter, a3);
}

- (double)greatestScreenScale
{
  return self->_greatestScreenScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emitter, 0);
}

@end
