@implementation CAIOSurfaceCodingProxy

- (CAIOSurfaceCodingProxy)initWithObject:(id)a3
{
  CAIOSurfaceCodingProxy *v4;
  CAIOSurfaceCodingProxy *v5;
  CFTypeID v6;
  uint64_t v7;
  mach_port_t v8;
  __IOSurface *v9;
  CFTypeID v10;
  const void *IOSurface;
  CFTypeID v12;
  uint64_t v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)CAIOSurfaceCodingProxy;
  v4 = -[CAIOSurfaceCodingProxy init](&v15, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    v6 = CFGetTypeID(a3);
    v7 = CAMachPortGetTypeID::type;
    if (!CAMachPortGetTypeID::type)
    {
      v7 = _CFRuntimeRegisterClass();
      CAMachPortGetTypeID::type = v7;
    }
    if (v6 != v7)
    {
      v10 = CFGetTypeID(a3);
      if (v10 == CVPixelBufferGetTypeID())
      {
        IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)a3);
        if (!IOSurface)
          return v5;
      }
      else
      {
        v12 = CFGetTypeID(a3);
        v13 = CAImageQueueGetTypeID::type;
        if (!CAImageQueueGetTypeID::type)
        {
          v13 = _CFRuntimeRegisterClass();
          CAImageQueueGetTypeID::type = v13;
        }
        if (v12 == v13)
        {
          v9 = CAImageQueueCopyLastIOSurface((uint64_t)a3);
          goto LABEL_17;
        }
        IOSurface = a3;
      }
      v9 = (__IOSurface *)CFRetain(IOSurface);
      goto LABEL_17;
    }
    v8 = *((_DWORD *)a3 + 4);
    if (v8)
    {
      v9 = IOSurfaceLookupFromMachPort(v8);
LABEL_17:
      v5->_surface = v9;
    }
  }
  return v5;
}

- (id)decodedObject
{
  return self->_surface;
}

- (void)encodeWithCoder:(id)a3
{
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t k;
  const __CFString *v29;
  CFTypeRef v30;
  void *v31;
  void *BaseAddress;
  CFDictionaryRef v33;
  void *context;
  id v35;
  void *v36;
  void *v37;
  size_t PlaneCount;
  uint64_t v39;
  _BYTE v40[128];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (self->_surface)
  {
    if (CADeviceIsVirtualized::once[0] != -1)
      dispatch_once(CADeviceIsVirtualized::once, &__block_literal_global_204);
    if (!CADeviceIsVirtualized::is_virtualized)
    {
      context = (void *)MEMORY[0x186DBE2E4]();
      if (!self->_locked)
      {
        IOSurfaceLock(self->_surface, 1u, 0);
        self->_locked = 1;
      }
      v5 = IOSurfaceCopyAllValues(self->_surface);
      v6 = (void *)-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("CreationProperties"));
      if (iosurface_keys_allow_list(void)::once != -1)
        dispatch_once(&iosurface_keys_allow_list(void)::once, &__block_literal_global_396);
      v7 = (void *)iosurface_keys_allow_list(void)::keys;
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)iosurface_keys_allow_list(void)::keys, "count") + 1);
      v33 = v5;
      v35 = a3;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v52 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
            v13 = objc_msgSend(v6, "objectForKeyedSubscript:", v12);
            if (v13)
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v12);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
        }
        while (v9);
      }
      PlaneCount = IOSurfaceGetPlaneCount(self->_surface);
      if (PlaneCount)
      {
        if (iosurface_plane_keys_allow_list(void)::once != -1)
          dispatch_once(&iosurface_plane_keys_allow_list(void)::once, &__block_literal_global_397);
        v14 = (void *)iosurface_plane_keys_allow_list(void)::keys;
        v36 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IOSurfacePlaneInfo"));
        v37 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", PlaneCount);
        v15 = 0;
        do
        {
          v16 = (void *)objc_msgSend(v36, "objectAtIndexedSubscript:", v15);
          v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
          v39 = v15;
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v47;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v47 != v19)
                  objc_enumerationMutation(v14);
                v21 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
                v22 = objc_msgSend(v16, "objectForKeyedSubscript:", v21);
                if (v22)
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, v21);
              }
              v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
            }
            while (v18);
          }
          objc_msgSend(v37, "addObject:", v17);
          v15 = v39 + 1;
        }
        while (v39 + 1 != PlaneCount);
        objc_msgSend(v8, "setObject:forKey:", v37, *MEMORY[0x1E0CBC158]);
      }

      v23 = v35;
      objc_msgSend(v35, "encodeObject:forKey:", v8, CFSTR("IOSurfaceInfo"));
      if (iosurface_property_names(void)::once[0] != -1)
        dispatch_once(iosurface_property_names(void)::once, &__block_literal_global_398);
      v24 = (void *)iosurface_property_names(void)::names;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v25 = objc_msgSend((id)iosurface_property_names(void)::names, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
      if (v25)
      {
        v26 = 0;
        v27 = *(_QWORD *)v42;
        do
        {
          for (k = 0; k != v25; ++k)
          {
            if (*(_QWORD *)v42 != v27)
              objc_enumerationMutation(v24);
            v29 = *(const __CFString **)(*((_QWORD *)&v41 + 1) + 8 * k);
            v30 = IOSurfaceCopyValue(self->_surface, v29);
            if (v30)
            {
              if (!v26)
                v26 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              objc_msgSend(v26, "setObject:forKey:", v30, v29);
              CFRelease(v30);
            }
          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
        }
        while (v25);
        v23 = v35;
        if (v26)
          objc_msgSend(v35, "encodeObject:forKey:", v26, CFSTR("IOSurfaceProperties"));
      }
      v31 = (void *)MEMORY[0x1E0C99D50];
      BaseAddress = IOSurfaceGetBaseAddress(self->_surface);
      objc_msgSend(v23, "encodeObject:forKey:", objc_msgSend(v31, "dataWithBytesNoCopy:length:freeWhenDone:", BaseAddress, IOSurfaceGetAllocSize(self->_surface), 0), CFSTR("IOSurfaceData"));
      IOSurfaceGetYCbCrMatrix();
      objc_autoreleasePoolPop(context);
    }
  }
}

- (CAIOSurfaceCodingProxy)initWithCoder:(id)a3
{
  CAIOSurfaceCodingProxy *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t j;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  uint64_t v27;
  IOSurfaceRef v28;
  void *v29;
  void *v30;
  size_t v31;
  size_t AllocSize;
  size_t v33;
  void *BaseAddress;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  uint64_t v41;
  id v42;
  CAIOSurfaceCodingProxy *v43;
  void *context;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  objc_super v50;
  _BYTE v51[128];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)CAIOSurfaceCodingProxy;
  v4 = -[CAIOSurfaceCodingProxy init](&v50, sel_init);
  if (v4)
  {
    context = (void *)MEMORY[0x186DBE2E4]();
    if (iosurface_info_classes(void)::once[0] != -1)
      dispatch_once(iosurface_info_classes(void)::once, &__block_literal_global_399);
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", iosurface_info_classes(void)::classes, CFSTR("IOSurfaceInfo"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (iosurface_keys_allow_list(void)::once != -1)
        dispatch_once(&iosurface_keys_allow_list(void)::once, &__block_literal_global_396);
      v6 = (void *)iosurface_keys_allow_list(void)::keys;
      if (iosurface_plane_keys_allow_list(void)::once != -1)
        dispatch_once(&iosurface_plane_keys_allow_list(void)::once, &__block_literal_global_397);
      v7 = (void *)iosurface_plane_keys_allow_list(void)::keys;
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
      v42 = a3;
      v43 = v4;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v73 != v10)
              objc_enumerationMutation(v6);
            v12 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
            v13 = objc_msgSend(v5, "objectForKeyedSubscript:", v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v12);
          }
          v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
        }
        while (v9);
      }
      v41 = *MEMORY[0x1E0CBC158];
      a3 = v42;
      v4 = v43;
      v14 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
        v48 = v8;
        if (!v15)
          goto LABEL_27;
        v16 = *(_QWORD *)v68;
        v17 = 1;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v68 != v16)
              objc_enumerationMutation(v14);
            objc_opt_class();
            v17 &= objc_opt_isKindOfClass();
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
        }
        while (v15);
        v8 = v48;
        if ((v17 & 1) != 0)
        {
LABEL_27:
          v47 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v61, 16);
          if (v19)
          {
            v45 = v14;
            v46 = *(_QWORD *)v63;
            do
            {
              v20 = 0;
              v49 = v19;
              do
              {
                if (*(_QWORD *)v63 != v46)
                  objc_enumerationMutation(v14);
                v21 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v20);
                v22 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
                v59 = 0u;
                v60 = 0u;
                v57 = 0u;
                v58 = 0u;
                v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
                if (v23)
                {
                  v24 = *(_QWORD *)v58;
                  do
                  {
                    for (k = 0; k != v23; ++k)
                    {
                      if (*(_QWORD *)v58 != v24)
                        objc_enumerationMutation(v7);
                      v26 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * k);
                      v27 = objc_msgSend(v21, "objectForKeyedSubscript:", v26);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, v26);
                    }
                    v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
                  }
                  while (v23);
                }
                objc_msgSend(v47, "addObject:", v22);
                v8 = v48;
                v14 = v45;
                ++v20;
              }
              while (v20 != v49);
              v19 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v62, v61, 16);
            }
            while (v19);
          }
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v47, v41);
          a3 = v42;
          v4 = v43;
        }
      }
      v28 = IOSurfaceCreate((CFDictionaryRef)v8);
      v4->_surface = v28;
      if (!v28)
        goto LABEL_70;
    }
    else if (!v4->_surface)
    {
LABEL_70:
      objc_autoreleasePoolPop(context);
      return v4;
    }
    if (IOSurfaceGetCompressionTypeOfPlane() - 1 > 1)
      goto LABEL_74;
    if (CADeviceSupportsUniversalCompression::once[0] != -1)
      dispatch_once(CADeviceSupportsUniversalCompression::once, &__block_literal_global_27);
    if (CADeviceSupportsUniversalCompression::universal)
    {
      CFRelease(v4->_surface);
      v4->_surface = 0;
    }
    else
    {
LABEL_74:
      if (v4->_surface)
      {
        v29 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IOSurfaceData"));
        v30 = v29;
        if (v29)
        {
          v31 = objc_msgSend(v29, "length");
          if (v31 >= IOSurfaceGetAllocSize(v4->_surface))
            AllocSize = IOSurfaceGetAllocSize(v4->_surface);
          else
            AllocSize = objc_msgSend(v30, "length");
          v33 = AllocSize;
          IOSurfaceLock(v4->_surface, 0, 0);
          BaseAddress = IOSurfaceGetBaseAddress(v4->_surface);
          memcpy(BaseAddress, (const void *)objc_msgSend(v30, "bytes"), v33);
          IOSurfaceUnlock(v4->_surface, 0, 0);
        }
        if (iosurface_property_classes(void)::once[0] != -1)
          dispatch_once(iosurface_property_classes(void)::once, &__block_literal_global_400);
        v35 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", iosurface_property_classes(void)::classes, CFSTR("IOSurfaceProperties"));
        v36 = v35;
        if (v35)
        {
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
          if (v37)
          {
            v38 = *(_QWORD *)v53;
            do
            {
              for (m = 0; m != v37; ++m)
              {
                if (*(_QWORD *)v53 != v38)
                  objc_enumerationMutation(v36);
                IOSurfaceSetValue(v4->_surface, *(CFStringRef *)(*((_QWORD *)&v52 + 1) + 8 * m), (CFTypeRef)objc_msgSend(v36, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * m)));
              }
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
            }
            while (v37);
          }
        }
        if (objc_msgSend(a3, "decodeIntForKey:", CFSTR("IOSurfaceYCbCrMatrixInt")))
          IOSurfaceSetYCbCrMatrix();
      }
    }
    goto LABEL_70;
  }
  return v4;
}

- (void)dealloc
{
  __IOSurface *surface;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_locked)
    IOSurfaceUnlock(self->_surface, 1u, 0);
  surface = self->_surface;
  if (surface)
    CFRelease(surface);
  v4.receiver = self;
  v4.super_class = (Class)CAIOSurfaceCodingProxy;
  -[CAIOSurfaceCodingProxy dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
