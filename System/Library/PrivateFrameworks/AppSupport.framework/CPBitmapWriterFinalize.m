@implementation CPBitmapWriterFinalize

void __CPBitmapWriterFinalize_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  CFErrorRef *v3;
  const __CFString *v4;
  char *v5;
  CFIndex v6;
  const void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  const __CFData *v11;
  unsigned int Length;
  CFErrorRef *v13;
  const __CFData *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const UInt8 *BytePtr;
  int v20;
  const UInt8 *v21;
  off_t v22;
  std::error_code *v23;
  off_t v24;
  uint64_t v25;
  const std::__fs::filesystem::path *v26;
  const std::__fs::filesystem::path *v27;
  int v28;
  int v29;
  CFErrorRef *v30;
  const __CFString *v31;
  CFIndex v32;
  char *v33;
  int v34;
  _BYTE v35[20];
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = a1[5];
  if (*(_BYTE *)(v2 + 64))
  {
    v3 = (CFErrorRef *)a1[6];
    if (!v3)
      return;
    v4 = CFSTR("CPBitmapErrorDomain");
    v5 = "Writer already finalized";
    v6 = 9;
    goto LABEL_4;
  }
  *(_BYTE *)(v2 + 64) = 1;
  v7 = *(const void **)(v2 + 112);
  if (v7)
  {
    _Block_release(v7);
    v2 = a1[5];
    *(_QWORD *)(v2 + 112) = 0;
  }
  if (!*(_QWORD *)(v2 + 88))
  {
    v3 = (CFErrorRef *)a1[6];
    if (!v3)
      return;
    v4 = CFSTR("CPBitmapErrorDomain");
    v5 = "No images provided";
    v6 = 1;
    goto LABEL_4;
  }
  v8 = *(_QWORD *)(v2 + 120);
  if (v8)
  {
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, 1, a1[6]);
    _Block_release(*(const void **)(a1[5] + 120));
    v2 = a1[5];
    *(_QWORD *)(v2 + 120) = 0;
    if (!v9)
      return;
  }
  if (lseek(*(_DWORD *)(v2 + 24), 0, 2) == -1)
  {
    v13 = (CFErrorRef *)a1[6];
    if (!v13)
      return;
    v6 = *__error();
    v4 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
    v5 = "Could not seek to end of file";
    v3 = v13;
LABEL_4:
    __CPBitmapSetErrorIfNecessary(v3, v4, v6, v5);
    return;
  }
  v10 = a1[5];
  v11 = *(const __CFData **)(v10 + 56);
  if (v11)
  {
    Length = CFDataGetLength(v11);
    v10 = a1[5];
  }
  else
  {
    Length = 0;
  }
  v14 = *(const __CFData **)(v10 + 48);
  if (v14)
  {
    v15 = CFDataGetLength(v14);
    v10 = a1[5];
  }
  else
  {
    v15 = 0;
  }
  v16 = *(_QWORD *)(v10 + 88);
  v17 = *(_QWORD *)(v10 + 40);
  if (v16 != v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v34 = 134218240;
    *(_QWORD *)v35 = v16;
    *(_WORD *)&v35[8] = 2048;
    *(_QWORD *)&v35[10] = v17;
    _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "count=%zu does not equal expectedCount=%zu", (uint8_t *)&v34, 0x16u);
    v10 = a1[5];
    v16 = *(_QWORD *)(v10 + 88);
  }
  v34 = Length;
  *(_DWORD *)v35 = v15;
  *(int32x2_t *)&v35[4] = vmovn_s64(*(int64x2_t *)(v10 + 96));
  *(_DWORD *)&v35[12] = *(_DWORD *)(v10 + 28);
  *(_DWORD *)&v35[16] = v16;
  v36 = -592100446;
  if (Length)
  {
    v18 = *(_DWORD *)(v10 + 24);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(v10 + 56));
    if (write(v18, BytePtr, Length) == -1)
    {
      v30 = (CFErrorRef *)a1[6];
      if (!v30)
        return;
      v31 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
      v32 = *__error();
      v33 = "Could not write colorSpace data";
      goto LABEL_49;
    }
    v10 = a1[5];
  }
  if (v15 >= 1)
  {
    v20 = *(_DWORD *)(v10 + 24);
    v21 = CFDataGetBytePtr(*(CFDataRef *)(v10 + 48));
    if (write(v20, v21, v15) == -1)
    {
      v30 = (CFErrorRef *)a1[6];
      if (!v30)
        return;
      v31 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
      v32 = *__error();
      v33 = "Could not write info data";
      goto LABEL_49;
    }
    v10 = a1[5];
  }
  if (write(*(_DWORD *)(v10 + 24), &v34, 0x1CuLL) == -1)
  {
    v30 = (CFErrorRef *)a1[6];
    if (!v30)
      return;
    v31 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
    v32 = *__error();
    v33 = "Could not write trailer";
    goto LABEL_49;
  }
  v22 = lseek(*(_DWORD *)(a1[5] + 24), 0, 2);
  if (v22 == -1)
  {
    v30 = (CFErrorRef *)a1[6];
    if (!v30)
      return;
    v31 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
    v32 = *__error();
    v33 = "Could not seek to end of file after writing";
    goto LABEL_49;
  }
  v24 = v22;
  v25 = a1[5];
  v26 = *(const std::__fs::filesystem::path **)(v25 + 72);
  if (!v26)
    goto LABEL_36;
  v27 = *(const std::__fs::filesystem::path **)(v25 + 80);
  if (!v27)
    goto LABEL_36;
  rename(v26, v27, v23);
  if (v28 != -1)
  {
    v25 = a1[5];
LABEL_36:
    if (*(_BYTE *)(v25 + 65))
    {
      v29 = *(_DWORD *)(v25 + 24);
      if (v29 != -1)
      {
        if (close(v29))
        {
          v30 = (CFErrorRef *)a1[6];
          if (!v30)
            return;
          v31 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
          v32 = *__error();
          v33 = "Could not close the file";
          goto LABEL_49;
        }
        *(_BYTE *)(a1[5] + 65) = 0;
      }
    }
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v24;
    return;
  }
  v30 = (CFErrorRef *)a1[6];
  if (v30)
  {
    v31 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
    v32 = *__error();
    v33 = "Could not rename temp file to dest path";
LABEL_49:
    __CPBitmapSetErrorIfNecessary(v30, v31, v32, v33);
  }
}

@end
