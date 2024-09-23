@implementation IMSticker

void __82__IMSticker_CKUtils__stickerViewForStickerChatItem_snapshotEffectView_completion___block_invoke(uint64_t a1, void *a2)
{
  CKBalloonImageView *v3;
  CKBalloonImageView *v4;
  CKBalloonImageView *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = [CKBalloonImageView alloc];
  v4 = -[CKBalloonImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v7)
  {
    -[CKBalloonImageView setImage:](v4, "setImage:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonImageView setImage:](v5, "setImage:", v6);

  }
  -[CKBalloonImageView setContentMode:](v5, "setContentMode:", 1);
  -[CKBalloonImageView sizeToFit](v5, "sizeToFit");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __77__IMSticker_CKUtils__stickerEffectViewSnapshotForStickerChatItem_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  if (v5)
    v6 = 0;
  else
    v6 = a2;
  v7 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__IMSticker_CKUtils__stickerEffectViewSnapshotForStickerChatItem_completion___block_invoke_2;
  v11[3] = &unk_1E274DA38;
  v8 = *(id *)(a1 + 32);
  v12 = v7;
  v13 = v8;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v11);
  if (v5)
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __77__IMSticker_CKUtils__stickerEffectViewSnapshotForStickerChatItem_completion___block_invoke_cold_1(v5, v10);

  }
}

uint64_t __77__IMSticker_CKUtils__stickerEffectViewSnapshotForStickerChatItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __77__IMSticker_CKUtils__stickerEffectViewSnapshotForStickerChatItem_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, a2, v4, "Could not snapshot effectView, ecountered error: %@", (uint8_t *)&v5);

}

@end
