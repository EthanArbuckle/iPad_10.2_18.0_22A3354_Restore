@implementation ARUICelebrationsRenderer

- (void)renderCelebrationsForRings:(id)a3 withCommandBuffer:(id)a4 intoTexture:(id)a5 withContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  VFXRenderer *renderer;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[ARUICelebrationsRenderer _needsCelebrationRenderPassOn:](self, "_needsCelebrationRenderPassOn:", v10))
  {
    v24 = v12;
    -[VFXRenderer setTexture:](self->_renderer, "setTexture:", v12);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = v10;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v19, "celebration");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            objc_msgSend(v20, "apply:context:", v19, v13);
            renderer = self->_renderer;
            objc_msgSend(v21, "scene");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[VFXRenderer setScene:](renderer, "setScene:", v23);

            -[VFXRenderer encodeWithCommandBuffer:](self->_renderer, "encodeWithCommandBuffer:", v11);
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v16);
    }

    v12 = v24;
    v10 = v25;
  }

}

- (BOOL)_needsCelebrationRenderPassOn:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__ARUICelebrationsRenderer__needsCelebrationRenderPassOn___block_invoke;
  v6[3] = &unk_24CEC63B8;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __58__ARUICelebrationsRenderer__needsCelebrationRenderPassOn___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;

  objc_msgSend(a2, "celebration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (ARUICelebrationsRenderer)initWithDevice:(id)a3 commandQueue:(id)a4
{
  id v6;
  id v7;
  ARUICelebrationsRenderer *v8;
  ARUICelebrationsRenderer *v9;
  uint64_t v10;
  VFXRenderer *renderer;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ARUICelebrationsRenderer;
  v8 = -[ARUICelebrationsRenderer init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_device, v6);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BEBFB38]), "initWithCommandQueue:", v7);
    renderer = v9->_renderer;
    v9->_renderer = (VFXRenderer *)v10;

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_destroyWeak((id *)&self->_device);
}

@end
