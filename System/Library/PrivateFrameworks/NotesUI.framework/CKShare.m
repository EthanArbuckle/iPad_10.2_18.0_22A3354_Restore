@implementation CKShare

void __35__CKShare_UI__ic_fallbackThumbnail__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "ic_applicationIconImageWithSize:", 128.0, 128.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ic_fallbackThumbnail_thumbnail;
  ic_fallbackThumbnail_thumbnail = v0;

}

void __61__CKShare_UI__ic_updateThumbnailsForObject_share_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "image");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__CKShare_UI__ic_updateThumbnailsForObject_share_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "image");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __61__CKShare_UI__ic_updateThumbnailsForObject_share_completion___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t result;

  v2 = (void *)a1[4];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "ic_PNGData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v3, *MEMORY[0x1E0D638C0], 0);

  v4 = (void *)a1[4];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "ic_PNGData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v5, *MEMORY[0x1E0D638B8], 0);

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
