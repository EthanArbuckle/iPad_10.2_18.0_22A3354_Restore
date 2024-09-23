@implementation FCVisitLocallyPrunableHistoryItems

uint64_t __FCVisitLocallyPrunableHistoryItems_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;

  v3 = a2;
  if ((objc_msgSend(v3, "isPruningDisabled") & 1) == 0
    && (objc_msgSend(v3, "hasArticleBeenMarkedOffensive") & 1) == 0
    && !objc_msgSend(v3, "articleLikingStatus"))
  {
    objc_msgSend(v3, "lastVisitedAt");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "lastVisitedAt");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "lastListenedAt");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(v3, "firstSeenAt");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v4 = 1;
          goto LABEL_5;
        }
        objc_msgSend(v3, "firstSeenAt");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (_QWORD *)(a1 + 40);
        goto LABEL_11;
      }
      objc_msgSend(v3, "lastListenedAt");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v7;
    v10 = (_QWORD *)(a1 + 32);
LABEL_11:
    v4 = objc_msgSend(v9, "fc_isEarlierThan:", *v10);

    goto LABEL_5;
  }
  v4 = 0;
LABEL_5:

  return v4;
}

void __FCVisitLocallyPrunableHistoryItems_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
