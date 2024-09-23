@implementation ARBufferPopulationRegistry

- (ARBufferPopulationRegistry)init
{
  ARBufferPopulationRegistry *v2;
  uint64_t v3;
  NSMutableDictionary *bufferToLabelLUT;
  uint64_t v5;
  NSMutableDictionary *labelToBuffersLUT;
  uint64_t v7;
  NSMutableDictionary *labelToSignpostTypeLUT;
  uint64_t v9;
  NSMutableDictionary *bufferToTimestampLUT;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ARBufferPopulationRegistry;
  v2 = -[ARBufferPopulationRegistry init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    bufferToLabelLUT = v2->_bufferToLabelLUT;
    v2->_bufferToLabelLUT = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    labelToBuffersLUT = v2->_labelToBuffersLUT;
    v2->_labelToBuffersLUT = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    labelToSignpostTypeLUT = v2->_labelToSignpostTypeLUT;
    v2->_labelToSignpostTypeLUT = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    bufferToTimestampLUT = v2->_bufferToTimestampLUT;
    v2->_bufferToTimestampLUT = (NSMutableDictionary *)v9;

  }
  return v2;
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_bufferToLabelLUT, "count");
}

- (unint64_t)countWithLabel:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKey:](self->_labelToBuffersLUT, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)description
{
  void *v3;
  NSMutableDictionary *labelToBuffersLUT;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ARBufferPopulationRegistry *v10;

  v3 = (void *)objc_opt_new();
  labelToBuffersLUT = self->_labelToBuffersLUT;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__ARBufferPopulationRegistry_description__block_invoke;
  v8[3] = &unk_1E66755C8;
  v5 = v3;
  v9 = v5;
  v10 = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](labelToBuffersLUT, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = v5;

  return v6;
}

void __41__ARBufferPopulationRegistry_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  IOSurfaceRef v14;
  __IOSurface *v15;
  uint64_t v16;
  uint64_t v17;
  void *BaseAddress;
  uint64_t UseCount;
  size_t Width;
  size_t Height;
  OSType PixelFormat;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v30 = a1;
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(v6, "count");
  v9 = objc_msgSend(v6, "count");
  v10 = CFSTR("]");
  if (v9)
    v10 = &stru_1E6676798;
  v28 = v5;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@ (%ld): [%@\n"), v5, v8, v10);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v6;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "unsignedIntValue");
        v14 = IOSurfaceLookup(v13);
        if (v14)
        {
          v15 = v14;
          objc_msgSend(*(id *)(v30 + 40), "timestampForSurfaceID:", v12);
          v17 = v16;
          IOSurfaceLock(v15, 1u, 0);
          BaseAddress = IOSurfaceGetBaseAddress(v15);
          UseCount = IOSurfaceGetUseCount(v15);
          Width = IOSurfaceGetWidth(v15);
          Height = IOSurfaceGetHeight(v15);
          PixelFormat = IOSurfaceGetPixelFormat(v15);
          AROSTypeToString(PixelFormat);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          IOSurfaceGetAllocSize(v15);
          NSLocalizedFileSizeDescription();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          IOSurfaceUnlock(v15, 1u, 0);
          CFRelease(v15);
          objc_msgSend(*(id *)(v30 + 32), "appendFormat:", CFSTR("\tIOSurface [%p] - id: %d (0x%x), rc: %ld, dims: %ldx%ld, format: %@, size: %@, timestamp: %f\n"), BaseAddress, v13, v13, UseCount, Width, Height, v23, v24, v17);

        }
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v32);
  }

  v25 = *(void **)(v30 + 32);
  v26 = objc_msgSend(obj, "count");
  v27 = CFSTR("]\n");
  if (!v26)
    v27 = &stru_1E6676798;
  objc_msgSend(v25, "appendFormat:", CFSTR("%@"), v27);

}

- (id)labelForBufferWithSurfaceID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_bufferToLabelLUT, "objectForKey:", a3);
}

- (void)registerBufferWithSurfaceID:(id)a3 label:(id)a4 signpostType:(id)a5 timestamp:(double)a6
{
  id v10;
  NSMutableDictionary *bufferToLabelLUT;
  id v12;
  NSMutableDictionary *bufferToTimestampLUT;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  bufferToLabelLUT = self->_bufferToLabelLUT;
  v12 = a5;
  -[NSMutableDictionary setObject:forKey:](bufferToLabelLUT, "setObject:forKey:", v10, v16);
  -[NSMutableDictionary setObject:forKey:](self->_labelToSignpostTypeLUT, "setObject:forKey:", v12, v10);

  bufferToTimestampLUT = self->_bufferToTimestampLUT;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](bufferToTimestampLUT, "setObject:forKey:", v14, v16);

  -[NSMutableDictionary objectForKey:](self->_labelToBuffersLUT, "objectForKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v15 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKey:](self->_labelToBuffersLUT, "setObject:forKey:", v15, v10);
  }
  objc_msgSend(v15, "addObject:", v16);

}

- (int)signpostTypeForLabel:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  -[NSMutableDictionary objectForKey:](self->_labelToSignpostTypeLUT, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v5 = 0;

  return v5;
}

- (double)timestampForSurfaceID:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[NSMutableDictionary objectForKey:](self->_bufferToTimestampLUT, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (id)surfaceIDsForBuffersWithLabel:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_labelToBuffersLUT, "objectForKey:", a3);
}

- (void)unregisterBufferWithSurfaceID:(id)a3
{
  NSMutableDictionary *bufferToLabelLUT;
  id v5;
  void *v6;
  id v7;

  bufferToLabelLUT = self->_bufferToLabelLUT;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](bufferToLabelLUT, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_bufferToLabelLUT, "removeObjectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_bufferToTimestampLUT, "removeObjectForKey:", v5);
  -[NSMutableDictionary objectForKey:](self->_labelToBuffersLUT, "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferToTimestampLUT, 0);
  objc_storeStrong((id *)&self->_labelToBuffersLUT, 0);
  objc_storeStrong((id *)&self->_labelToSignpostTypeLUT, 0);
  objc_storeStrong((id *)&self->_bufferToLabelLUT, 0);
}

@end
