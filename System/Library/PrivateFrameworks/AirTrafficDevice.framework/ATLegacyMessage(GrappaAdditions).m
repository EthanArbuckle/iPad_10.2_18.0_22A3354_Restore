@implementation ATLegacyMessage(GrappaAdditions)

+ (id)signedMessageWithName:()GrappaAdditions parameters:sesssion:
{
  id v7;
  id v8;
  void *v9;
  const __CFData *Data;
  const __CFData *v11;
  const UInt8 *BytePtr;
  CFIndex Length;
  int v14;
  int v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  Data = CFPropertyListCreateData(0, v8, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (!Data)
  {
LABEL_10:
    v17 = v9;
    goto LABEL_11;
  }
  v11 = Data;
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(v11);
  jumT7rcoieclCtxS2rgJ(a5, (uint64_t)BytePtr, Length, (uint64_t)&v22);
  v15 = v14;
  CFRelease(v11);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v22, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSig:", v18);

    X5EvIJWqdcALcjaxX6Pl(v22);
    _ATLogCategoryFramework();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "sig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v20;
      _os_log_impl(&dword_1D1868000, v19, OS_LOG_TYPE_DEFAULT, "Signed message with sig: %{public}@", buf, 0xCu);

    }
    goto LABEL_10;
  }
  _ATLogCategoryFramework();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = v15;
    _os_log_impl(&dword_1D1868000, v16, OS_LOG_TYPE_ERROR, "Grappa message sign fail: %d", buf, 8u);
  }

  if (v15 == -42180)
    exit(-10);
  v17 = 0;
LABEL_11:

  return v17;
}

@end
