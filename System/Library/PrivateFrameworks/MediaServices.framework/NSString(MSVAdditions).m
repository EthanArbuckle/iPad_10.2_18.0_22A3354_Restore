@implementation NSString(MSVAdditions)

- (id)msv_stringByResolvingRealPath
{
  void *v2;
  char *v3;
  char *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char *v13;
  char *v14;
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v2 = (void *)objc_msgSend(a1, "copy");
  v3 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), 0);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    free(v4);
    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v2, "copy");
    v9 = v8;
    while (objc_msgSend(v8, "length"))
    {
      v10 = v9;
      objc_msgSend(v9, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByDeletingLastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "addObject:", v11);
      if (objc_msgSend(v9, "length"))
      {
        v12 = objc_retainAutorelease(v9);
        v13 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(v12, "fileSystemRepresentation"), 0);
        if (v13)
        {
          v14 = v13;
          v17 = 0;
          v18 = &v17;
          v19 = 0x3032000000;
          v20 = __Block_byref_object_copy__3331;
          v21 = __Block_byref_object_dispose__3332;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __55__NSString_MSVAdditions__msv_stringByResolvingRealPath__block_invoke;
          v16[3] = &unk_1E43E9548;
          v16[4] = &v17;
          objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v16);
          v15 = (id)v18[5];

          free(v14);
          _Block_object_dispose(&v17, 8);

          v9 = v12;
          v2 = v15;
          break;
        }
      }

      v8 = v9;
    }

    return v2;
  }
}

- (unint64_t)msv_unsignedLongLongValue
{
  return strtoull((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), 0, 0);
}

@end
