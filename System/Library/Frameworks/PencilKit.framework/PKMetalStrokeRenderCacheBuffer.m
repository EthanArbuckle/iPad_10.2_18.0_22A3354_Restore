@implementation PKMetalStrokeRenderCacheBuffer

- (PKMetalStrokeRenderCacheBuffer)init
{
  objc_exception_throw(CFSTR("Not available"));
}

- (id)initWithBuffer:(void *)a3 offset:(void *)a4 numVertices:(void *)a5 vertexSize:(double)a6 bounds:(double)a7
{
  id v18;
  id *v19;
  objc_super v21;

  v18 = a2;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)PKMetalStrokeRenderCacheBuffer;
    v19 = (id *)objc_msgSendSuper2(&v21, sel_init);
    a1 = v19;
    if (v19)
    {
      objc_storeStrong(v19 + 1, a2);
      a1[3] = a4;
      a1[4] = a5;
      a1[2] = a3;
      *((double *)a1 + 5) = a6;
      *((double *)a1 + 6) = a7;
      *((double *)a1 + 7) = a8;
      *((double *)a1 + 8) = a9;
    }
  }

  return a1;
}

- (uint64_t)lockPurgeableResourcesAddToSet:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "count");
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 8));
    if (objc_msgSend(v4, "count") == v5 || (objc_msgSend(*(id *)(a1 + 8), "lock") & 1) != 0)
      a1 = objc_msgSend(*(id *)(a1 + 8), "isPurged") ^ 1;
    else
      a1 = 0;
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
