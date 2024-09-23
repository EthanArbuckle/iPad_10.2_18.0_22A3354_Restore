@implementation ARUIRingsRenderer

- (void)_renderEntireRings:(id)a3 intoContext:(id)a4 withCommandEncoder:(id)a5 forState:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v18, "count"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(v18, "objectAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARUIRingUniformsCache uniformsForRing:renderedInContext:](self->_cache, "uniformsForRing:renderedInContext:", v14, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "shouldRunStateForRing:", v14))
      {
        objc_msgSend(v11, "setVertexBytes:length:atIndex:", objc_msgSend(v15, "vertexAttributesBytes"), 128, 1);
        objc_msgSend(v11, "setFragmentBytes:length:atIndex:", objc_msgSend(v15, "uniformsBytes"), 128, 0);
        objc_msgSend(v11, "device");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[ARUIRingsStaticBufferFactory ringIndexBufferWithDevice:](ARUIRingsStaticBufferFactory, "ringIndexBufferWithDevice:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, self->_indexCount, 0, v17, 0);
      }

      ++v13;
    }
    while (v13 < objc_msgSend(v18, "count"));
  }

}

- (void)renderRings:(id)a3 intoContext:(id)a4 withCommandEncoder:(id)a5 forState:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v12, "renderPipelineState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRenderPipelineState:", v13);

  v14 = objc_msgSend(v12, "renderArea");
  if (v14 == 1)
  {
    -[ARUIRingsRenderer _renderRingsFollowingPercent:intoContext:withCommandEncoder:forState:](self, "_renderRingsFollowingPercent:intoContext:withCommandEncoder:forState:", v15, v10, v11, v12);
  }
  else if (!v14)
  {
    -[ARUIRingsRenderer _renderEntireRings:intoContext:withCommandEncoder:forState:](self, "_renderEntireRings:intoContext:withCommandEncoder:forState:", v15, v10, v11, v12);
  }

}

- (void)beginRenderingWithCommandEncoder:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARUIRingsStaticBufferFactory ringVertexPositionsBufferWithDevice:](ARUIRingsStaticBufferFactory, "ringVertexPositionsBufferWithDevice:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setVertexBuffer:offset:atIndex:", v5, 0, 0);
}

- (ARUIRingsRenderer)initWithDevice:(id)a3
{
  id v4;
  ARUIRingsRenderer *v5;
  id v6;
  void *v7;
  uint64_t v8;
  ARUIRingUniformsCache *cache;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARUIRingsRenderer;
  v5 = -[ARUIRingsRenderer init](&v11, sel_init);
  if (v5)
  {
    v6 = +[ARUIRingsStaticBufferFactory ringVertexPositionsBufferWithDevice:](ARUIRingsStaticBufferFactory, "ringVertexPositionsBufferWithDevice:", v4);
    +[ARUIRingsStaticBufferFactory ringIndexBufferWithDevice:](ARUIRingsStaticBufferFactory, "ringIndexBufferWithDevice:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_indexCount = (unint64_t)objc_msgSend(v7, "length") >> 1;
    +[ARUIRingUniformsCache defaultCache](ARUIRingUniformsCache, "defaultCache");
    v8 = objc_claimAutoreleasedReturnValue();
    cache = v5->_cache;
    v5->_cache = (ARUIRingUniformsCache *)v8;

  }
  return v5;
}

- (void)_renderRingsFollowingPercent:(id)a3 intoContext:(id)a4 withCommandEncoder:(id)a5 forState:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  unint64_t indexCount;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  float v19;
  float v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  ARUIRingsRenderer *v35;
  id v36;
  id v37;

  v37 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = +[ARUIRingsStaticBufferFactory circleSegments](ARUIRingsStaticBufferFactory, "circleSegments");
  v34 = objc_msgSend(v12, "centeredAroundPercentSegmentDrawCount");
  indexCount = self->_indexCount;
  if (objc_msgSend(v37, "count"))
  {
    v15 = 0;
    v30 = indexCount / v13 * v34;
    v31 = indexCount / v13;
    v33 = 2 * (indexCount / v13);
    v32 = indexCount / v13 * (v34 - 1);
    v35 = self;
    v36 = v12;
    while (1)
    {
      objc_msgSend(v37, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARUIRingUniformsCache uniformsForRing:renderedInContext:](self->_cache, "uniformsForRing:renderedInContext:", v16, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "shouldRunStateForRing:", v16))
        break;
LABEL_12:

      if (++v15 >= (unint64_t)objc_msgSend(v37, "count"))
        goto LABEL_13;
    }
    v18 = v10;
    objc_msgSend(v11, "setVertexBytes:length:atIndex:", objc_msgSend(v17, "vertexAttributesBytes"), 128, 1);
    objc_msgSend(v11, "setFragmentBytes:length:atIndex:", objc_msgSend(v17, "uniformsBytes"), 128, 0);
    objc_msgSend(v16, "percentage");
    v20 = v19;
    v21 = vcvtmd_s64_f64((double)v13 * v19) % v13;
    objc_msgSend(v11, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[ARUIRingsStaticBufferFactory ringIndexBufferWithDevice:](ARUIRingsStaticBufferFactory, "ringIndexBufferWithDevice:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 >= 1.0 || v21)
    {
      v26 = (v13 - 1 + v21) % v13;
      v27 = v33 * v26;
      if (v26 + v34 <= v13)
      {
        v24 = v11;
        v25 = v30;
        v29 = v23;
        goto LABEL_11;
      }
      v28 = v13 - v26;
      objc_msgSend(v11, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, (v13 - v26) * v31, 0, v23, v27);
      v25 = (v34 - v28) * v31;
      v24 = v11;
    }
    else
    {
      v24 = v11;
      v25 = v32;
    }
    v29 = v23;
    v27 = 0;
LABEL_11:
    objc_msgSend(v24, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, v25, 0, v29, v27);
    v10 = v18;

    self = v35;
    v12 = v36;
    goto LABEL_12;
  }
LABEL_13:

}

- (void)clearCaches
{
  +[ARUIRingsStaticBufferFactory clearCaches](ARUIRingsStaticBufferFactory, "clearCaches");
  -[ARUIRingUniformsCache clearCache](self->_cache, "clearCache");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
