@implementation NTKFontLoader

+ (id)fontDescriptorForSectName:(id)a3
{
  return (id)objc_msgSend(a1, "fontDescriptorForSectName:fromMachO:", a3, &dword_1B72A3000);
}

+ (id)fontDescriptorForSectName:(id)a3 fromMachO:(const mach_header_64 *)a4
{
  return (id)objc_msgSend(a1, "fontDescriptorForSectName:uniqueCacheIdentifier:fromMachO:", a3, CFSTR("FontLoader"), a4);
}

+ (id)fontDescriptorForSectName:(id)a3 uniqueCacheIdentifier:(id)a4 fromMachO:(const mach_header_64 *)a5
{
  id v7;
  id v8;
  void *v9;
  void *FontDescriptorFromData;
  uint8_t *v11;
  const __CFData *v12;
  unint64_t size;

  v7 = a3;
  v8 = a4;
  if (fontDescriptorForSectName_uniqueCacheIdentifier_fromMachO__onceToken != -1)
    dispatch_once(&fontDescriptorForSectName_uniqueCacheIdentifier_fromMachO__onceToken, &__block_literal_global_31);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)fontDescriptorForSectName_uniqueCacheIdentifier_fromMachO____fontDescriptorCache, "objectForKey:", v9);
  FontDescriptorFromData = (void *)objc_claimAutoreleasedReturnValue();
  if (!FontDescriptorFromData)
  {
    size = 0;
    v11 = getsectiondata(a5, "__FONT_DATA", (const char *)objc_msgSend(objc_retainAutorelease(v7), "cStringUsingEncoding:", 4), &size);
    if (v11)
    {
      v12 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11, size, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
      FontDescriptorFromData = CTFontManagerCreateFontDescriptorFromData(v12);
      objc_msgSend((id)fontDescriptorForSectName_uniqueCacheIdentifier_fromMachO____fontDescriptorCache, "setObject:forKey:", FontDescriptorFromData, v9);
      CFRelease(v12);
    }
    else
    {
      FontDescriptorFromData = 0;
    }
  }

  return FontDescriptorFromData;
}

void __75__NTKFontLoader_fontDescriptorForSectName_uniqueCacheIdentifier_fromMachO___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)fontDescriptorForSectName_uniqueCacheIdentifier_fromMachO____fontDescriptorCache;
  fontDescriptorForSectName_uniqueCacheIdentifier_fromMachO____fontDescriptorCache = (uint64_t)v0;

}

+ (id)registerFontDescriptorsForSectName:(id)a3 fromMachO:(const mach_header_64 *)a4
{
  id v5;
  id v6;
  uint8_t *v7;
  const __CFData *v8;
  CFArrayRef FontDescriptorsFromData;
  id v10;
  _QWORD v12[5];
  unint64_t size;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = (id)objc_opt_new();
  size = 0;
  v6 = objc_retainAutorelease(v5);
  v7 = getsectiondata(a4, "__FONT_DATA", (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4), &size);
  if (v7)
  {
    v8 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7, size, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    FontDescriptorsFromData = CTFontManagerCreateFontDescriptorsFromData(v8);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__NTKFontLoader_registerFontDescriptorsForSectName_fromMachO___block_invoke;
    v12[3] = &unk_1E6BD0478;
    v12[4] = &v14;
    -[__CFArray enumerateObjectsUsingBlock:](FontDescriptorsFromData, "enumerateObjectsUsingBlock:", v12);
    CFRelease(v8);

  }
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __62__NTKFontLoader_registerFontDescriptorsForSectName_fromMachO___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  +[NTKFontLoader _registerFontDescriptor:](NTKFontLoader, "_registerFontDescriptor:", v3);
  objc_msgSend(v3, "fontAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC1388]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKey:", v3, v5);
  }
  else
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __62__NTKFontLoader_registerFontDescriptorsForSectName_fromMachO___block_invoke_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

  }
}

+ (void)_registerFontDescriptor:(id)a3
{
  const __CTFont *v3;
  CGFont *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFErrorRef error;

  v3 = CTFontCreateWithFontDescriptor((CTFontDescriptorRef)a3, 12.0, 0);
  v4 = CTFontCopyGraphicsFont(v3, 0);
  error = 0;
  CTFontManagerRegisterGraphicsFont(v4, &error);
  CGFontRelease(v4);
  CFRelease(v3);
  if (error)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[NTKFontLoader _registerFontDescriptor:].cold.1((uint64_t)&error, v5, v6, v7, v8, v9, v10, v11);

    CFRelease(error);
  }
}

void __62__NTKFontLoader_registerFontDescriptorsForSectName_fromMachO___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "Got unnamed font descriptor %@", a5, a6, a7, a8, 2u);
}

+ (void)_registerFontDescriptor:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "Got error registering font descriptor %@", a5, a6, a7, a8, 2u);
}

@end
