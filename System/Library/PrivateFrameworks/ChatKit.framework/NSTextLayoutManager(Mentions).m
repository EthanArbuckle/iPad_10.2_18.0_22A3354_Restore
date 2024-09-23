@implementation NSTextLayoutManager(Mentions)

- (uint64_t)ck_animatingMentionsGlyphCount
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend(a1, "documentRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__NSTextLayoutManager_Mentions__ck_animatingMentionsGlyphCount__block_invoke;
  v7[3] = &unk_1E274BA18;
  v7[4] = &v8;
  v4 = (id)objc_msgSend(a1, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v3, 4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

@end
