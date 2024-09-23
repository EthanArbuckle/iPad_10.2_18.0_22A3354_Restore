@implementation MLChapterDataAddImportChapter

uint64_t __MLChapterDataAddImportChapter_block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v1 = result;
    result = ChapterData_NewChapter();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __MLChapterDataAddImportChapter_block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  __CFString *v7;
  __CFString *v8;
  void (**v9)(id, id);
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (-[__CFString length](v7, "length") || -[__CFString length](v8, "length"))
  {
    if (-[__CFString length](v7, "length"))
      v10 = v7;
    else
      v10 = &stru_1E5B66908;
    v11 = v10;

    if (-[__CFString length](v8, "length"))
      v12 = v8;
    else
      v12 = &stru_1E5B66908;
    v13 = v12;

    if ((-[__CFString isEqual:](v11, "isEqual:", v13) & 1) == 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v9[2](v9, v11);
    }
    v14 = 1;
    v7 = v11;
    v8 = v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __MLChapterDataAddImportChapter_block_invoke_3(uint64_t a1, void *a2)
{
  MLChapterDataSetUTF16Value(*(_QWORD *)(a1 + 32), a2);
}

void __MLChapterDataAddImportChapter_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  MLChapterDataSetASCIIValue(*(_QWORD *)(a1 + 40), a2);
  objc_msgSend(*(id *)(a1 + 32), "URLTitle");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E5B66908;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  MLChapterDataSetUTF16Value(*(_QWORD *)(a1 + 40), v6);
}

@end
