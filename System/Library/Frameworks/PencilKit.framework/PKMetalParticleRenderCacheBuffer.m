@implementation PKMetalParticleRenderCacheBuffer

- (_QWORD)initWithUniforms:(uint64_t)a3 points:(uint64_t)a4 numPoints:(void *)a5 resourceHandler:
{
  id v9;
  _QWORD *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  unint64_t v15;
  objc_super v17;

  v9 = a5;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)PKMetalParticleRenderCacheBuffer;
    v10 = objc_msgSendSuper2(&v17, sel_init);
    a1 = v10;
    if (v10)
    {
      v10[7] = a4;
      v11 = -[PKMetalResourceHandler newPurgeableBufferWithLength:bytes:outOffset:](v9, 56, a2, (uint64_t)(v10 + 3));
      v12 = (void *)a1[1];
      a1[1] = v11;

      v13 = -[PKMetalResourceHandler newPurgeableBufferWithLength:bytes:outOffset:](v9, 32 * a4, a3, (uint64_t)(a1 + 4));
      v14 = (void *)a1[2];
      a1[2] = v13;

      v15 = *(_DWORD *)(a3 + 32 * a4 - 24) + 4 * *(unsigned __int16 *)(a3 + 32 * a4 - 4);
      a1[5] = v15;
      a1[6] = v15 >> 2;
    }
  }

  return a1;
}

- (uint64_t)lockPurgeableResourcesAddToSet:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "count");
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 16));
    if ((objc_msgSend(v4, "count") == v5 || (objc_msgSend(*(id *)(a1 + 16), "lock") & 1) != 0)
      && (*(_QWORD *)(a1 + 8) == *(_QWORD *)(a1 + 16)
       || (v6 = objc_msgSend(v4, "count"),
           objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 8)),
           objc_msgSend(v4, "count") == v6)
       || objc_msgSend(*(id *)(a1 + 8), "lock"))
      && (objc_msgSend(*(id *)(a1 + 16), "isPurged") & 1) == 0)
    {
      a1 = objc_msgSend(*(id *)(a1 + 8), "isPurged") ^ 1;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pkStrokePointBuffer, 0);
  objc_storeStrong((id *)&self->_pkUniformsBuffer, 0);
}

@end
