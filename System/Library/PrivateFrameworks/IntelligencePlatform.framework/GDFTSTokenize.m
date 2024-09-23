@implementation GDFTSTokenize

+ (id)ftsTokenize:(id)a3
{
  id v3;
  uint64_t v4;
  const void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  CFCharacterSetRef v12;
  uint64_t Count;
  id v14;
  const char *v15;
  void *v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  const void *v30;

  v3 = a3;
  v4 = ITSTokenListCreate();
  v5 = (const void *)v4;
  if (v3 && v4)
  {
    if (qword_1EEE11C08 != -1)
      dispatch_once(&qword_1EEE11C08, &unk_1E5DD93C0);
    v6 = (id)qword_1EEE11C00;
    objc_msgSend_result(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1AE8ED5E0;
    v27[3] = &unk_1E5DD9428;
    v28 = v3;
    v29 = v3;
    v30 = v5;
    v10 = v3;
    objc_msgSend_runWithLockAcquired_(v9, v11, (uint64_t)v27);

  }
  else
  {

    if (!v5)
    {
      v16 = 0;
      goto LABEL_15;
    }
  }
  v12 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("()\"));
  Count = ITSTokenListGetCount();
  v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v16 = (void *)objc_msgSend_initWithCapacity_(v14, v15, Count);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      v18 = (void *)MEMORY[0x1AF45451C]();
      v19 = ITSTokenListCopyEscapedTokenAtIndex();
      if (v19)
      {
        v20 = (void *)v19;
        _PASRemoveCharacterSet();
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend_isEqualToString_(CFSTR("##&"), v22, (uint64_t)v21) & 1) == 0)
          objc_msgSend_addObject_(v16, v23, (uint64_t)v21);
      }
      else
      {
        v21 = 0;
      }

      objc_autoreleasePoolPop(v18);
    }
  }
  CFRelease(v5);
  CFRelease(v12);
LABEL_15:
  if (v16)
    v24 = v16;
  else
    v24 = (void *)MEMORY[0x1E0C9AA60];
  v25 = v24;

  return v25;
}

@end
