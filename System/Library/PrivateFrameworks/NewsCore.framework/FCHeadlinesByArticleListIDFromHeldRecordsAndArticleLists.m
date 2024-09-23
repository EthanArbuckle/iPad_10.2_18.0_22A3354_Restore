@implementation FCHeadlinesByArticleListIDFromHeldRecordsAndArticleLists

void __FCHeadlinesByArticleListIDFromHeldRecordsAndArticleLists_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  FCHeadlineExperimentalTitleProvider *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  FCHeadlineExperimentalTitleProvider *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id obj;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  FCHeadlineExperimentalTitleProvider *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[FCHeadlineExperimentalTitleProvider initWithShouldShowAlternateHeadlines:]([FCHeadlineExperimentalTitleProvider alloc], "initWithShouldShowAlternateHeadlines:", objc_msgSend(*(id *)(a1 + 32), "shouldShowAlternateHeadlines"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = *(id *)(a1 + 40);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      v25 = v6;
      do
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v9);
        objc_msgSend(v10, "articleIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v8;
        v27[1] = 3221225472;
        v27[2] = __FCHeadlinesByArticleListIDFromHeldRecordsAndArticleLists_block_invoke_2;
        v27[3] = &unk_1E46444B0;
        v28 = *(id *)(a1 + 32);
        v29 = *(id *)(a1 + 48);
        v30 = *(id *)(a1 + 56);
        v12 = *(id *)(a1 + 64);
        v14 = *(void **)(a1 + 72);
        v13 = *(_QWORD *)(a1 + 80);
        v31 = v12;
        v34 = v13;
        v32 = v14;
        v33 = v4;
        objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", v27);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "type") == 1)
        {
          objc_msgSend(v10, "editorialMetadata");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v10, "editorialMetadata");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "articleMetadata");
            v18 = v7;
            v19 = v4;
            v20 = v3;
            v21 = v8;
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            FCAssignHeadlineMetadata(v15, v22, *(void **)(a1 + 32));
            v23 = objc_claimAutoreleasedReturnValue();

            v8 = v21;
            v3 = v20;
            v4 = v19;
            v7 = v18;
            v6 = v25;
            v15 = (void *)v23;
          }
        }
        objc_msgSend(v10, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v24);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v6);
  }

}

FCArticleHeadline *__FCHeadlinesByArticleListIDFromHeldRecordsAndArticleLists_block_invoke_2(uint64_t a1, void *a2)
{
  return FCHeadlineWithHeldRecords(*(void **)(a1 + 32), *(void **)(a1 + 40), a2, *(void **)(a1 + 48), *(void **)(a1 + 56), *(_QWORD *)(a1 + 80) != 0, *(void **)(a1 + 64), *(void **)(a1 + 72));
}

@end
