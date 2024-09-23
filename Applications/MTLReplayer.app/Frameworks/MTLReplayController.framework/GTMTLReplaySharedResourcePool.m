@implementation GTMTLReplaySharedResourcePool

- (GTMTLReplaySharedResourcePool)initWithDevice:(id)a3 bufferCapacity:(unint64_t)a4
{
  id v7;
  GTMTLReplaySharedResourcePool *v8;
  GTMTLReplaySharedResourcePool *v9;
  NSMutableArray *v10;
  NSMutableArray *pooledBuffers;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTMTLReplaySharedResourcePool;
  v8 = -[GTMTLReplaySharedResourcePool init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_defaultBufferCapacity = a4;
    pthread_mutex_init(&v9->_mutex, 0);
    pthread_cond_init(&v9->_cond, 0);
    v9->_maxPooledBuffers = 8;
    v10 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v9->_maxPooledBuffers);
    pooledBuffers = v9->_pooledBuffers;
    v9->_pooledBuffers = v10;

    v9->_maxSize = (unint64_t)(unsigned __int16)word_753138 << 20;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  pthread_cond_destroy(&self->_cond);
  pthread_mutex_destroy(&self->_mutex);
  v3.receiver = self;
  v3.super_class = (Class)GTMTLReplaySharedResourcePool;
  -[GTMTLReplaySharedResourcePool dealloc](&v3, "dealloc");
}

- (void)waitUntilCapacity
{
  _opaque_pthread_mutex_t *p_mutex;
  unint64_t maxSize;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  maxSize = self->_maxSize;
  v5 = atomic_load(&self->_usedSize);
  if (maxSize < v5)
  {
    do
    {
      pthread_cond_wait(&self->_cond, p_mutex);
      v6 = self->_maxSize;
      v7 = atomic_load(&self->_usedSize);
    }
    while (v6 < v7);
  }
  pthread_mutex_unlock(p_mutex);
}

- (id)newBufferHeapWithLength:(unint64_t)a3
{
  _opaque_pthread_mutex_t *p_mutex;
  unint64_t *p_usedSize;
  unint64_t v7;
  id v8;
  id result;
  GTMTLReplaySharedBufferHeap *v10;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  p_usedSize = &self->_usedSize;
  do
    v7 = __ldaxr(p_usedSize);
  while (__stlxr(v7 + a3, p_usedSize));
  if (self->_defaultBufferCapacity != a3)
  {
    pthread_mutex_unlock(p_mutex);
    goto LABEL_7;
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_pooledBuffers, "lastObject"));
  -[NSMutableArray removeLastObject](self->_pooledBuffers, "removeLastObject");
  pthread_mutex_unlock(p_mutex);
  if (!v8)
  {
LABEL_7:
    result = -[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", a3, 256);
    v8 = result;
    if (!result)
      return result;
  }
  v10 = -[GTMTLReplaySharedBufferHeap initWithBuffer:resourcePool:]([GTMTLReplaySharedBufferHeap alloc], "initWithBuffer:resourcePool:", v8, self);

  return v10;
}

- (id)newTextureWithDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t *p_usedSize;
  unint64_t v10;
  id v11;
  char *v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t *v21;
  unint64_t v22;
  unsigned int v23;
  unsigned int v24;
  unint64_t v25;
  unsigned int v26;
  __CFDictionary *Mutable;
  CFNumberRef v28;
  CFNumberRef v29;
  CFNumberRef v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  CFNumberRef v35;
  CFNumberRef v36;
  CFMutableDictionaryRef v37;
  CFNumberRef v38;
  CFNumberRef v39;
  CFNumberRef v40;
  CFNumberRef v41;
  CFNumberRef v42;
  CFNumberRef v43;
  __CFDictionary *v44;
  CFNumberRef v45;
  CFNumberRef v46;
  CFNumberRef v47;
  const __CFDictionary *v48;
  CFNumberRef v49;
  CFNumberRef v50;
  CFNumberRef v51;
  CFArrayRef v52;
  CFNumberRef v53;
  CFNumberRef v54;
  unint64_t v55;
  CFNumberRef v56;
  CFNumberRef v57;
  void *v58;
  GTMTLReplaySharedTexture *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  CFStringRef v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  id *v71;
  unsigned int v72;
  const __CFString *v73;
  void *v74;
  CFMutableDictionaryRef valuePtr;
  __CFDictionary *v76;

  v6 = a3;
  v7 = -[MTLDevice heapTextureSizeAndAlignWithDescriptor:](self->_device, "heapTextureSizeAndAlignWithDescriptor:", v6);
  v8 = (unint64_t)v7;
  if (v7)
  {
    p_usedSize = &self->_usedSize;
    do
      v10 = __ldaxr(p_usedSize);
    while (__stlxr((unint64_t)v7 + v10, p_usedSize));
    v11 = -[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v6);
  }
  else
  {
    v12 = (char *)objc_msgSend(v6, "pixelFormat");
    if (v12 == (_BYTE *)&stru_1F8.addr + 4)
      v13 = 875704438;
    else
      v13 = 0;
    v14 = objc_msgSend(v6, "width");
    v15 = objc_msgSend(v6, "height");
    if (v14)
    {
      v16 = v15;
      if (v15)
      {
        if (v12 == (_BYTE *)&stru_1F8.addr + 4)
        {
          v8 = MinBytesPerRow(v13, v14);
          if (v8)
          {
            if (IsBiplanar(v13))
            {
              v17 = (v14 + 1) >> 1;
              v18 = MinBytesPerRow(826486840, v14);
              v19 = MinBytesPerRow(843264056, v17);
              if (v18 <= v19)
                v20 = v19;
              else
                v20 = v18;
              v8 = (v16 + ((v16 + 1) >> 1)) * ((v20 + 15) & 0xFFFFFFF0);
            }
            else
            {
              v8 = ((v8 + 15) & 0x1FFFFFFF0) * v14;
            }
          }
        }
      }
    }
    v21 = &self->_usedSize;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 + v8, v21));
    v23 = objc_msgSend(v6, "width");
    v24 = objc_msgSend(v6, "height");
    v25 = 0;
    if (v23)
    {
      v26 = v24;
      if (v24)
      {
        if (v12 == (_BYTE *)&stru_1F8.addr + 4)
        {
          v25 = MinBytesPerRow(v13, v23);
          if (v25)
          {
            v71 = a4;
            Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            LODWORD(valuePtr) = v23;
            v28 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
            CFDictionarySetValue(Mutable, kIOSurfaceWidth, v28);
            CFRelease(v28);
            LODWORD(valuePtr) = v26;
            v29 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
            CFDictionarySetValue(Mutable, kIOSurfaceHeight, v29);
            CFRelease(v29);
            LODWORD(valuePtr) = v13;
            v30 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
            CFDictionarySetValue(Mutable, kIOSurfacePixelFormat, v30);
            CFRelease(v30);
            if (IsBiplanar(v13))
            {
              v67 = BytesPerElement(826486840);
              v70 = BytesPerElement(843264056);
              v68 = ElementWidth(826486840);
              v69 = ElementWidth(843264056);
              v31 = MinBytesPerRow(826486840, v23);
              v32 = MinBytesPerRow(843264056, (v23 + 1) >> 1);
              if (v31 <= v32)
                v33 = v32;
              else
                v33 = v31;
              v34 = (v33 + 15) & 0xFFFFFFF0;
              LODWORD(valuePtr) = v34;
              v35 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
              CFDictionarySetValue(Mutable, kIOSurfaceBytesPerRow, v35);
              CFRelease(v35);
              LODWORD(valuePtr) = (v26 + ((v26 + 1) >> 1)) * v34;
              v36 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
              CFDictionarySetValue(Mutable, kIOSurfaceAllocSize, v36);
              CFRelease(v36);
              v37 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              valuePtr = v37;
              v72 = v23;
              v38 = CFNumberCreate(0, kCFNumberIntType, &v72);
              CFDictionarySetValue(v37, kIOSurfacePlaneWidth, v38);
              CFRelease(v38);
              v72 = v26;
              v39 = CFNumberCreate(0, kCFNumberIntType, &v72);
              CFDictionarySetValue(v37, kIOSurfacePlaneHeight, v39);
              CFRelease(v39);
              v66 = kIOSurfacePlaneOffset;
              v72 = 0;
              v40 = CFNumberCreate(0, kCFNumberIntType, &v72);
              CFDictionarySetValue(v37, kIOSurfacePlaneOffset, v40);
              CFRelease(v40);
              v72 = v34;
              v41 = CFNumberCreate(0, kCFNumberIntType, &v72);
              CFDictionarySetValue(v37, kIOSurfacePlaneBytesPerRow, v41);
              CFRelease(v41);
              v72 = v67;
              v42 = CFNumberCreate(0, kCFNumberIntType, &v72);
              CFDictionarySetValue(v37, kIOSurfacePlaneBytesPerElement, v42);
              CFRelease(v42);
              v72 = v68;
              v43 = CFNumberCreate(0, kCFNumberIntType, &v72);
              CFDictionarySetValue(v37, kIOSurfacePlaneElementWidth, v43);
              CFRelease(v43);
              v44 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              v76 = v44;
              v72 = (v23 + 1) >> 1;
              v45 = CFNumberCreate(0, kCFNumberIntType, &v72);
              CFDictionarySetValue(v44, kIOSurfacePlaneWidth, v45);
              CFRelease(v45);
              v72 = (v26 + 1) >> 1;
              v46 = CFNumberCreate(0, kCFNumberIntType, &v72);
              CFDictionarySetValue(v44, kIOSurfacePlaneHeight, v46);
              CFRelease(v46);
              v72 = v34 * v26;
              v47 = CFNumberCreate(0, kCFNumberIntType, &v72);
              CFDictionarySetValue(v44, kIOSurfacePlaneOffset, v47);
              CFRelease(v47);
              v72 = v34;
              v48 = Mutable;
              v49 = CFNumberCreate(0, kCFNumberIntType, &v72);
              CFDictionarySetValue(v44, kIOSurfacePlaneBytesPerRow, v49);
              CFRelease(v49);
              v72 = v70;
              v50 = CFNumberCreate(0, kCFNumberIntType, &v72);
              CFDictionarySetValue(v44, kIOSurfacePlaneBytesPerElement, v50);
              CFRelease(v50);
              v72 = v69;
              v51 = CFNumberCreate(0, kCFNumberIntType, &v72);
              CFDictionarySetValue(v44, kIOSurfacePlaneElementWidth, v51);
              CFRelease(v51);
              v52 = CFArrayCreate(0, (const void **)&valuePtr, 2, &kCFTypeArrayCallBacks);
              CFDictionarySetValue(Mutable, kIOSurfacePlaneInfo, v52);
              CFRelease(v52);
              CFRelease(valuePtr);
              v53 = v76;
            }
            else
            {
              LODWORD(valuePtr) = (v25 + 15) & 0xFFFFFFF0;
              v54 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
              v48 = Mutable;
              CFDictionarySetValue(Mutable, kIOSurfaceBytesPerRow, v54);
              CFRelease(v54);
              v55 = ElementWidth(v13);
              if (v55 >= 2)
              {
                LODWORD(valuePtr) = v55;
                v56 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
                CFDictionarySetValue(Mutable, kIOSurfaceElementWidth, v56);
                CFRelease(v56);
              }
              LODWORD(valuePtr) = BytesPerElement(v13);
              v57 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
              CFDictionarySetValue(Mutable, kIOSurfaceBytesPerElement, v57);
              v53 = v57;
            }
            CFRelease(v53);
            a4 = v71;
            v25 = (unint64_t)IOSurfaceCreate(v48);
            CFRelease(v48);
          }
        }
      }
    }
    v11 = -[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v6, v25, 0, v66);
  }
  v58 = v11;
  if (v11)
  {
    v59 = -[GTMTLReplaySharedTexture initWithAllocatedSize:resourcePool:]([GTMTLReplaySharedTexture alloc], "initWithAllocatedSize:resourcePool:", v8, self);
    objc_setAssociatedObject(v58, &AssociatedObjectKey, v59, (char *)&dword_0 + 1);
    v60 = v58;

  }
  else
  {
    v73 = CFSTR("GTErrorKeyMTLTextureDescriptor");
    v61 = SerializeMTLTextureDescriptorToDictionary(v6);
    v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    v74 = v62;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));

    GTMTLReplay_fillError(a4, 101, v63);
    if (a4)
      v64 = *a4;
    else
      v64 = 0;
    GTMTLReplay_handleNSError(v64);

  }
  return v58;
}

- (void)reclaimBuffer:(id)a3
{
  id v4;
  id v5;
  unint64_t *p_usedSize;
  unint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  pthread_mutex_lock(&self->_mutex);
  if (v5 == (id)self->_defaultBufferCapacity
    && (unint64_t)-[NSMutableArray count](self->_pooledBuffers, "count") < self->_maxPooledBuffers)
  {
    -[NSMutableArray addObject:](self->_pooledBuffers, "addObject:", v4);
  }
  pthread_mutex_unlock(&self->_mutex);

  p_usedSize = &self->_usedSize;
  do
    v7 = __ldaxr(p_usedSize);
  while (__stlxr(v7 - (_QWORD)v5, p_usedSize));
  pthread_cond_broadcast(&self->_cond);
}

- (void)reclaimAllocatedSize:(unint64_t)a3
{
  unint64_t *p_usedSize;
  unint64_t v4;

  p_usedSize = &self->_usedSize;
  do
    v4 = __ldaxr(p_usedSize);
  while (__stlxr(v4 - a3, p_usedSize));
  pthread_cond_broadcast(&self->_cond);
}

- (void)setMaxPooledBuffers:(unint64_t)a3
{
  _opaque_pthread_mutex_t *p_mutex;
  char *v6;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  v6 = (char *)-[NSMutableArray count](self->_pooledBuffers, "count");
  if ((unint64_t)v6 > a3)
    -[NSMutableArray removeObjectsInRange:](self->_pooledBuffers, "removeObjectsInRange:", a3, &v6[-a3]);
  self->_maxPooledBuffers = a3;
  pthread_mutex_unlock(p_mutex);
}

- (void)releasePooledBuffers
{
  _opaque_pthread_mutex_t *p_mutex;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  -[NSMutableArray removeAllObjects](self->_pooledBuffers, "removeAllObjects");
  pthread_mutex_unlock(p_mutex);
}

- (MTLDevice)device
{
  return self->_device;
}

- (unint64_t)defaultBufferCapacity
{
  return self->_defaultBufferCapacity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_pooledBuffers, 0);
}

@end
