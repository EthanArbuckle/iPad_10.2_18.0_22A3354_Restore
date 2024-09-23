@implementation NSString(UTAdditions)

- (id)stringByAppendingPathComponent:()UTAdditions conformingToType:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTAdditions.mm"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("partialName != nil"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTAdditions.mm"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentType != nil"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v7, "stringByAppendingPathExtensionForType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)stringByAppendingPathExtensionForType:()UTAdditions
{
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[5];
  __int128 range;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTAdditions.mm"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentType != nil"));

  }
  v6 = (void *)MEMORY[0x19AEBD0C8]();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  range = xmmword_1991E5990;
  _CFGetPathExtensionRangesFromPathComponent();
  v7 = (void *)v17[5];
  if (!v7)
  {
    objc_msgSend((id)v5, "preferredFilenameExtension");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v17[5];
    v17[5] = v8;

    v7 = (void *)v17[5];
    if ((v5 & 0x8000000000000000) == 0 && !v7)
    {
      objc_msgSend((id)v5, "_typeRecord");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __63__NSString_UTAdditions__stringByAppendingPathExtensionForType___block_invoke;
      v14[3] = &unk_1E35CEAC8;
      v14[4] = &v16;
      objc_msgSend(v10, "enumeratePedigreeWithBlock:", v14);

      v7 = (void *)v17[5];
    }
    if (!v7)
      goto LABEL_9;
  }
  if ((objc_msgSend(v7, "isEqual:", 0) & 1) == 0)
  {
    objc_msgSend(a1, "stringByAppendingPathExtension:", v17[5]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  _Block_object_dispose(&v16, 8);
  objc_autoreleasePoolPop(v6);
  if (!v11)
    v11 = (void *)objc_msgSend(a1, "copy");

  return v11;
}

@end
