@implementation NSArray(CUByteCodable)

- (uint64_t)encodedBytesAndReturnLength:()CUByteCodable error:
{
  if (a4)
    *a4 = 0;
  return 0;
}

- (CFMutableDataRef)encodedDataAndReturnError:()CUByteCodable
{
  CFMutableDataRef DataMutable;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFMutableDataRef v11;
  __CFData *v12;
  uint64_t v13;
  uint64_t v15;
  unsigned int v16;

  v16 = 0;
  DataMutable = OPACKEncoderCreateDataMutable(a1, 8, (int *)&v16);
  v11 = DataMutable;
  if (DataMutable)
  {
    v12 = DataMutable;
  }
  else if (a3)
  {
    if (v16)
      v13 = v16;
    else
      v13 = 4294960534;
    NSErrorWithOSStatusF(v13, (uint64_t)"OPACK encode failed", v5, v6, v7, v8, v9, v10, v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (__CFString)createWithBytesNoCopy:()CUByteCodable length:error:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  unsigned int v25;

  v25 = 0;
  v13 = (__CFString *)_OPACKDecodeBytes(0, a3, a4, 8u, &v25);
  if (!v13)
  {
    if (a5)
    {
      if (v25)
        v21 = v25;
      else
        v21 = 4294960534;
      NSErrorWithOSStatusF(v21, (uint64_t)"OPACK decode failed", v7, v8, v9, v10, v11, v12, v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_12:
    v20 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      NSErrorWithOSStatusF(4294960540, (uint64_t)"OPACK decode non-dictionary", v14, v15, v16, v17, v18, v19, v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      v20 = 0;
      *a5 = v22;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  free(a3);
  v20 = v13;
LABEL_13:

  return v20;
}

@end
