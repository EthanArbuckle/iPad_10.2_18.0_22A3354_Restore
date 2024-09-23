@implementation CUTXTDataCreateWithDictionary

void __CUTXTDataCreateWithDictionary_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  size_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  size_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  unsigned __int8 v48;
  objc_class *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  unsigned __int8 v59;

  v7 = a2;
  v8 = a3;
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v10 + 40);
  v11 = (id *)(v10 + 40);
  v12 = v13;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v59 = 0;
  objc_msgSend(v16, "appendBytes:length:", &v59, 1);
  v23 = objc_msgSend(v16, "length");
  if (!v23)
  {
    NSErrorWithOSStatusF(4294960568, (uint64_t)"Append TXT item header failed", v17, v18, v19, v20, v21, v22, v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v12 = v57;
    goto LABEL_12;
  }
  v24 = (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
  v25 = strlen(v24);
  v32 = v25;
  if (v25 > (v59 ^ 0xFFuLL))
  {
    NSErrorWithOSStatusF(4294960553, (uint64_t)"Append TXT key exceeds max len: (%d - %u) < %zu", v26, v27, v28, v29, v30, v31, 255);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_msgSend(v16, "appendBytes:length:", v24, v25);
  v59 += v32;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v59 == 255)
    {
      NSErrorWithOSStatusF(4294960553, (uint64_t)"Append TXT value '=' exceeds max len: (%d - %u) < 1", v33, v34, v35, v36, v37, v38, 255);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v16, "appendBytes:length:", "=", 1);
      ++v59;
      v39 = (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      v40 = strlen(v39);
      v47 = v40;
      if (v40 <= (v59 ^ 0xFFuLL))
      {
        objc_msgSend(v16, "appendBytes:length:", v39, v40);
        v48 = v59 + v47;
        v59 = v48;
LABEL_10:
        *(_BYTE *)(objc_msgSend(objc_retainAutorelease(v16), "mutableBytes") + v23 - 1) = v48;
        goto LABEL_12;
      }
      NSErrorWithOSStatusF(4294960553, (uint64_t)"Append TXT value exceeds max len: (%d - %u) < %zu", v41, v42, v43, v44, v45, v46, 255);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v15, "BOOLValue"))
  {
    v48 = v59;
    goto LABEL_10;
  }
  v49 = (objc_class *)objc_opt_class();
  NSStringFromClass(v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  NSErrorWithOSStatusF(4294960540, (uint64_t)"Append TXT value with unsupported type (%@)", v51, v52, v53, v54, v55, v56, (uint64_t)v50);
  v12 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
  objc_storeStrong(v11, v12);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;

}

@end
