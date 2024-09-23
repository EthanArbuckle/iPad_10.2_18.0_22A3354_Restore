@implementation ARUISpritesParticleRenderer

- (ARUISpritesParticleRenderer)initWithDevice:(id)a3 library:(id)a4 bufferSize:(unint64_t)a5
{
  id v8;
  id v9;
  ARUISpritesParticleRenderer *v10;
  ARUISpriteParticleRenderState *v11;
  ARUISpriteParticleRenderState *spriteRenderState;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ARUISpritesParticleRenderer;
  v10 = -[ARUISpritesParticleRenderer init](&v14, sel_init);
  if (v10)
  {
    v11 = -[ARUISpriteParticleRenderState initWithDevice:library:]([ARUISpriteParticleRenderState alloc], "initWithDevice:library:", v8, v9);
    spriteRenderState = v10->_spriteRenderState;
    v10->_spriteRenderState = v11;

    -[ARUISpritesParticleRenderer _sharedInitWithDevice:bufferSize:](v10, "_sharedInitWithDevice:bufferSize:", v8, a5);
  }

  return v10;
}

- (ARUISpritesParticleRenderer)initWithDeviceSPI:(id)a3 librarySPI:(id)a4 bufferSize:(unint64_t)a5
{
  id v8;
  id v9;
  ARUISpritesParticleRenderer *v10;
  ARUISpriteParticleRenderState *v11;
  ARUISpriteParticleRenderState *spriteRenderState;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ARUISpritesParticleRenderer;
  v10 = -[ARUISpritesParticleRenderer init](&v14, sel_init);
  if (v10)
  {
    v11 = -[ARUISpriteParticleRenderState initWithPipelineLibrary:]([ARUISpriteParticleRenderState alloc], "initWithPipelineLibrary:", v9);
    spriteRenderState = v10->_spriteRenderState;
    v10->_spriteRenderState = v11;

    -[ARUISpritesParticleRenderer _sharedInitWithDevice:bufferSize:](v10, "_sharedInitWithDevice:bufferSize:", v8, a5);
  }

  return v10;
}

- (void)_sharedInitWithDevice:(id)a3 bufferSize:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  MTLBuffer *v10;
  MTLBuffer *vertexAttributesBuffer;
  MTLBuffer *v12;
  MTLBuffer *uniformsBuffer;

  v6 = a3;
  +[ARUISpritesStaticBufferFactory spritePositionsBufferWithDevice:](ARUISpritesStaticBufferFactory, "spritePositionsBufferWithDevice:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_spriteVertexBuffer, v7);

  +[ARUISpritesStaticBufferFactory spriteIndexBufferWithDevice:](ARUISpritesStaticBufferFactory, "spriteIndexBufferWithDevice:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_spriteIndexBuffer, v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_spriteIndexBuffer);
  self->_numIndicies = (unint64_t)objc_msgSend(WeakRetained, "length") >> 1;

  self->_bufferSize = a4;
  v10 = (MTLBuffer *)objc_msgSend(v6, "newBufferWithLength:options:", a4 << 6, 0);
  vertexAttributesBuffer = self->_vertexAttributesBuffer;
  self->_vertexAttributesBuffer = v10;

  v12 = (MTLBuffer *)objc_msgSend(v6, "newBufferWithLength:options:", 32 * self->_bufferSize, 0);
  uniformsBuffer = self->_uniformsBuffer;
  self->_uniformsBuffer = v12;

}

- (void)renderSpriteSheet:(id)a3 intoContext:(id)a4 withCommandEncoder:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t bufferSize;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  ARUISpriteUniforms *v29;
  _OWORD *v30;
  __int128 *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD *v35;
  _OWORD *v36;
  __int128 v37;
  unint64_t numIndicies;
  id v39;
  void *v40;
  void *v41;
  id v42;

  v42 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v42, "sprites");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  bufferSize = self->_bufferSize;

  if (v11 > bufferSize && os_variant_has_internal_ui())
  {
    v13 = (void *)MEMORY[0x24BDBCE88];
    v14 = *MEMORY[0x24BDBCB78];
    v15 = self->_bufferSize;
    objc_msgSend(v42, "sprites");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("The sprite particle buffer should be resized, instantiated with buffer size %lu, but received particle count of: %lu"), v15, objc_msgSend(v16, "count"));

  }
  -[ARUISpriteParticleRenderState renderPipelineState](self->_spriteRenderState, "renderPipelineState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRenderPipelineState:", v17);

  objc_msgSend(v42, "texture");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "texture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFragmentTexture:atIndex:", v19, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_spriteVertexBuffer);
  v41 = v9;
  objc_msgSend(v9, "setVertexBuffer:offset:atIndex:", WeakRetained, 0, 0);

  objc_msgSend(v42, "sprites");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22 >= self->_bufferSize)
    v23 = self->_bufferSize;
  else
    v23 = v22;
  if (v23)
  {
    v24 = 0;
    v25 = 0;
    for (i = 0; i != v23; ++i)
    {
      objc_msgSend(v42, "sprites");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndex:", i);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = -[ARUISpriteUniforms initWithSprite:inContext:]([ARUISpriteUniforms alloc], "initWithSprite:inContext:", v28, v8);
      v30 = (_OWORD *)(-[MTLBuffer contents](self->_vertexAttributesBuffer, "contents") + v25);
      v31 = -[ARUISpriteUniforms vertexAttributesBytes](v29, "vertexAttributesBytes");
      v32 = v31[3];
      v34 = *v31;
      v33 = v31[1];
      v30[2] = v31[2];
      v30[3] = v32;
      *v30 = v34;
      v30[1] = v33;
      v35 = (_OWORD *)(-[MTLBuffer contents](self->_uniformsBuffer, "contents") + v24);
      v36 = -[ARUISpriteUniforms uniformsBytes](v29, "uniformsBytes");
      v37 = v36[1];
      *v35 = *v36;
      v35[1] = v37;

      v25 += 64;
      v24 += 32;
    }
  }
  objc_msgSend(v41, "setVertexBuffer:offset:atIndex:", self->_vertexAttributesBuffer, 0, 1);
  objc_msgSend(v41, "setFragmentBuffer:offset:atIndex:", self->_uniformsBuffer, 0, 0);
  numIndicies = self->_numIndicies;
  v39 = objc_loadWeakRetained((id *)&self->_spriteIndexBuffer);
  objc_msgSend(v42, "sprites");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:", 3, numIndicies, 0, v39, 0, objc_msgSend(v40, "count"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteRenderState, 0);
  objc_storeStrong((id *)&self->_uniformsBuffer, 0);
  objc_storeStrong((id *)&self->_vertexAttributesBuffer, 0);
  objc_destroyWeak((id *)&self->_spriteIndexBuffer);
  objc_destroyWeak((id *)&self->_spriteVertexBuffer);
}

@end
