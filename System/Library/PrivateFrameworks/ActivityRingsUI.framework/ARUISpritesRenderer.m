@implementation ARUISpritesRenderer

- (void)renderSpriteSheet:(id)a3 intoContext:(id)a4 withCommandEncoder:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t numIndicies;
  id v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ARUISpriteRenderState renderPipelineState](self->_spriteRenderState, "renderPipelineState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRenderPipelineState:", v11);

  objc_msgSend(v8, "texture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "texture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFragmentTexture:atIndex:", v13, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_spriteVertexBuffer);
  objc_msgSend(v10, "setVertexBuffer:offset:atIndex:", WeakRetained, 0, 0);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = v8;
  objc_msgSend(v8, "sprites");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(obj);
        -[ARUISpriteUniformsCache uniformsForSprite:renderedInContext:](self->_cache, "uniformsForSprite:renderedInContext:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18), v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setVertexBytes:length:atIndex:", objc_msgSend(v19, "vertexAttributesBytes"), 64, 1);
        objc_msgSend(v10, "setFragmentBytes:length:atIndex:", objc_msgSend(v19, "uniformsBytes"), 32, 0);
        numIndicies = self->_numIndicies;
        v21 = objc_loadWeakRetained((id *)&self->_spriteIndexBuffer);
        objc_msgSend(v10, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, numIndicies, 0, v21, 0);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

}

- (ARUISpritesRenderer)initWithDeviceSPI:(id)a3 librarySPI:(id)a4
{
  id v6;
  id v7;
  ARUISpritesRenderer *v8;
  ARUISpriteRenderState *v9;
  ARUISpriteRenderState *spriteRenderState;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ARUISpritesRenderer;
  v8 = -[ARUISpritesRenderer init](&v12, sel_init);
  if (v8)
  {
    v9 = -[ARUISpriteRenderState initWithPipelineLibrary:]([ARUISpriteRenderState alloc], "initWithPipelineLibrary:", v7);
    spriteRenderState = v8->_spriteRenderState;
    v8->_spriteRenderState = v9;

    -[ARUISpritesRenderer _sharedInitWithDevice:](v8, "_sharedInitWithDevice:", v6);
  }

  return v8;
}

- (void)_sharedInitWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  ARUISpriteUniformsCache *v8;
  ARUISpriteUniformsCache *cache;

  v4 = a3;
  +[ARUISpritesStaticBufferFactory spritePositionsBufferWithDevice:](ARUISpritesStaticBufferFactory, "spritePositionsBufferWithDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_spriteVertexBuffer, v5);

  +[ARUISpritesStaticBufferFactory spriteIndexBufferWithDevice:](ARUISpritesStaticBufferFactory, "spriteIndexBufferWithDevice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeWeak((id *)&self->_spriteIndexBuffer, v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_spriteIndexBuffer);
  self->_numIndicies = (unint64_t)objc_msgSend(WeakRetained, "length") >> 1;

  +[ARUISpriteUniformsCache defaultCache](ARUISpriteUniformsCache, "defaultCache");
  v8 = (ARUISpriteUniformsCache *)objc_claimAutoreleasedReturnValue();
  cache = self->_cache;
  self->_cache = v8;

}

- (ARUISpritesRenderer)initWithDevice:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  ARUISpritesRenderer *v8;
  ARUISpriteRenderState *v9;
  ARUISpriteRenderState *spriteRenderState;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ARUISpritesRenderer;
  v8 = -[ARUISpritesRenderer init](&v12, sel_init);
  if (v8)
  {
    v9 = -[ARUISpriteRenderState initWithDevice:library:]([ARUISpriteRenderState alloc], "initWithDevice:library:", v6, v7);
    spriteRenderState = v8->_spriteRenderState;
    v8->_spriteRenderState = v9;

    -[ARUISpritesRenderer _sharedInitWithDevice:](v8, "_sharedInitWithDevice:", v6);
  }

  return v8;
}

+ (void)clearCaches
{
  +[ARUISpritesStaticBufferFactory clearCaches](ARUISpritesStaticBufferFactory, "clearCaches");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_spriteRenderState, 0);
  objc_destroyWeak((id *)&self->_spriteIndexBuffer);
  objc_destroyWeak((id *)&self->_spriteVertexBuffer);
}

@end
