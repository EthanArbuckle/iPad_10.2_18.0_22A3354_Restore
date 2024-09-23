@implementation IOSurfaceDebugDescription

+ (id)surfaceDescriptions
{
  mach_port_t v2;
  CFTypeRef v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  CFStringRef errorString;
  size_t v19;
  const char *outputStruct;
  uint64_t input;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  outputStruct = 0;
  input = 1;
  v19 = -3;
  v2 = _ioSurfaceConnect();
  if (IOConnectCallMethod(v2, 0x1Eu, &input, 1u, 0, 0, 0, 0, &outputStruct, &v19))
    return 0;
  errorString = 0;
  v4 = IOCFUnserializeBinary(outputStruct, v19, 0, 0, &errorString);
  if (!v4)
  {
    if (errorString)
    {
      NSLog(CFSTR("Failed to unserialize data from kernel: %@"), errorString);
      CFRelease(errorString);
    }
    else
    {
      NSLog(CFSTR("Failed to unserialize data from kernel."));
    }
    mach_vm_deallocate(*MEMORY[0x1E0C83DA0], (mach_vm_address_t)outputStruct, v19);
    return 0;
  }
  v5 = (void *)v4;
  mach_vm_deallocate(*MEMORY[0x1E0C83DA0], (mach_vm_address_t)outputStruct, v19);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("Kernel Surfaces"));
  if (v7)
  {
    v8 = _copyDescriptions(v7);
    objc_msgSend(v6, "setObject:forKey:", v8, &unk_1E4DEACE8);

  }
  v9 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("User Clients"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "objectForKey:", CFSTR("pid"));
        if (v15)
        {
          v16 = v15;
          v17 = _copyDescriptions((void *)objc_msgSend(v14, "objectForKey:", CFSTR("Client Surfaces")));
          objc_msgSend(v6, "setObject:forKey:", v17, v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    }
    while (v11);
  }

  return v6;
}

@end
