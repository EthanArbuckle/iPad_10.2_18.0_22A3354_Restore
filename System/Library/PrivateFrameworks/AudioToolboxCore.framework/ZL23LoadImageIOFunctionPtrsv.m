@implementation ZL23LoadImageIOFunctionPtrsv

void *___ZL23LoadImageIOFunctionPtrsv_block_invoke()
{
  void *v0;
  void *v1;
  void *result;
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = dlopen("/System/Library/Frameworks/ImageIO.framework/ImageIO", 1);
  if (!v0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v5 = 136315394;
    v6 = "FLACAudioFile.cpp";
    v7 = 1024;
    v8 = 785;
    v3 = MEMORY[0x1E0C81028];
    v4 = "%25s:%-5d  Couldn't load ImageIO";
    goto LABEL_17;
  }
  v1 = v0;
  sCGImageSourceCreateWithData = (uint64_t (*)(_QWORD, _QWORD))dlsym(v0, "CGImageSourceCreateWithData");
  if (!sCGImageSourceCreateWithData)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v5 = 136315394;
    v6 = "FLACAudioFile.cpp";
    v7 = 1024;
    v8 = 788;
    v3 = MEMORY[0x1E0C81028];
    v4 = "%25s:%-5d  Getting CMAudioFormatDescriptionCreate function pointer not found";
    goto LABEL_17;
  }
  sCGImageSourceGetType = (uint64_t (*)(_QWORD))dlsym(v1, "CGImageSourceGetType");
  if (!sCGImageSourceCreateWithData)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v5 = 136315394;
    v6 = "FLACAudioFile.cpp";
    v7 = 1024;
    v8 = 791;
    v3 = MEMORY[0x1E0C81028];
    v4 = "%25s:%-5d  Getting CGImageSourceGetType function pointer not found";
    goto LABEL_17;
  }
  sCGImageSourceGetCount = (uint64_t (*)(_QWORD))dlsym(v1, "CGImageSourceGetCount");
  if (!sCGImageSourceGetCount)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v5 = 136315394;
    v6 = "FLACAudioFile.cpp";
    v7 = 1024;
    v8 = 794;
    v3 = MEMORY[0x1E0C81028];
    v4 = "%25s:%-5d  Getting CGImageSourceGetCount function pointer not found";
    goto LABEL_17;
  }
  result = dlsym(v1, "CGImageSourceCopyPropertiesAtIndex");
  sCGImageSourceCopyPropertiesAtIndex = (uint64_t (*)(_QWORD, _QWORD, _QWORD))result;
  if (!sCGImageSourceCreateWithData)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v5 = 136315394;
    v6 = "FLACAudioFile.cpp";
    v7 = 1024;
    v8 = 797;
    v3 = MEMORY[0x1E0C81028];
    v4 = "%25s:%-5d  Getting CGImageSourceCopyPropertiesAtIndex function pointer not found";
LABEL_17:
    _os_log_impl(&dword_18EE07000, v3, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v5, 0x12u);
LABEL_18:
    __break(1u);
  }
  return result;
}

@end
