@implementation ConversationAlbum

id PHQueryForAssetInAlbumKind_ConversationAlbum_block_invoke_34(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetInAlbumKind_ConversationAlbum_block_invoke_34";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", ", (uint8_t *)&v11, 2u);
  }

  return v7;
}

@end
