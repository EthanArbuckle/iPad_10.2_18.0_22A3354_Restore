@implementation FigVideoCaptureSourceCopyUnderlyingSourceFormatForFormatAndPortType

uint64_t __FigVideoCaptureSourceCopyUnderlyingSourceFormatForFormatAndPortType_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x1E0D05A40]))
  {
    if (objc_msgSend(*(id *)(a2 + 96), "count") == 1)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)objc_msgSend(*(id *)(a2 + 96), "firstObject");
      return 0;
    }
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    v14 = CFSTR("Only one stream format is currently supported on the IR camera.");
LABEL_25:
    objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0));
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_msgSend(*(id *)(a2 + 96), "reverseObjectEnumerator");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v5)
    goto LABEL_21;
  v6 = v5;
  v7 = *(_QWORD *)v18;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      if (objc_msgSend(v9, "cinematicFramingFormat")
        && objc_msgSend(*(id *)(a1 + 32), "isValidDerivedSourceFormatForUnderlyingFormat:", objc_msgSend(v9, "cinematicFramingFormat")))
      {
        v10 = objc_msgSend(v9, "cinematicFramingFormat");
LABEL_19:
        v9 = (void *)v10;
LABEL_20:
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v9;
        goto LABEL_21;
      }
      if (objc_msgSend(v9, "geometricDistortionCorrectionFormat")
        && objc_msgSend(*(id *)(a1 + 32), "isValidDerivedSourceFormatForUnderlyingFormat:", objc_msgSend(v9, "geometricDistortionCorrectionFormat")))
      {
        v10 = objc_msgSend(v9, "geometricDistortionCorrectionFormat");
        goto LABEL_19;
      }
      if ((objc_msgSend(*(id *)(a1 + 32), "isValidDerivedSourceFormatForUnderlyingFormat:", v9) & 1) != 0)
        goto LABEL_20;
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
      continue;
    break;
  }
LABEL_21:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    v14 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not find the underlying capture source format for %@ on %@"), objc_msgSend(*(id *)(a1 + 32), "uniqueID"), *(_QWORD *)(a1 + 48));
    v12 = v15;
    v13 = v16;
    goto LABEL_25;
  }
  return 0;
}

@end
