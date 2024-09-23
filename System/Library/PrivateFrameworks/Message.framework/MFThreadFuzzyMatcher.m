@implementation MFThreadFuzzyMatcher

- (id)matchMessageReferenceContext:(id)a3 withCandidateMessageReferenceContexts:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__MFThreadFuzzyMatcher_matchMessageReferenceContext_withCandidateMessageReferenceContexts___block_invoke;
  v18[3] = &unk_1E4E8EAC0;
  v7 = v5;
  v19 = v7;
  objc_msgSend(a4, "ef_filter:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v14 = 3221225472;
  v15 = __91__MFThreadFuzzyMatcher_matchMessageReferenceContext_withCandidateMessageReferenceContexts___block_invoke_2;
  v16 = &unk_1E4E8EAE8;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v8, "sortedArrayUsingComparator:", &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __91__MFThreadFuzzyMatcher_matchMessageReferenceContext_withCandidateMessageReferenceContexts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "subject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToSubjectIgnoringPrefix:", v5);

  objc_msgSend(v3, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v7, "intersectsSet:", v8);

  return v6 & a1;
}

uint64_t __91__MFThreadFuzzyMatcher_matchMessageReferenceContext_withCandidateMessageReferenceContexts___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(*(id *)(a1 + 32), "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "participants");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intersectSet:", v10);

  v11 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(*(id *)(a1 + 32), "participants");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "participants");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "intersectSet:", v14);

  v15 = objc_msgSend(v9, "count");
  if (v15 <= objc_msgSend(v13, "count"))
  {
    v17 = objc_msgSend(v9, "count");
    if (v17 >= objc_msgSend(v13, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "dateSentInterval");
      v19 = v18;
      objc_msgSend(v5, "dateSentInterval");
      v21 = v20;
      objc_msgSend(*(id *)(a1 + 32), "dateSentInterval");
      v23 = v22;
      objc_msgSend(v6, "dateSentInterval");
      v24 = vabdd_f64(v19, v21);
      v26 = vabdd_f64(v23, v25);
      v27 = vabdd_f64(v24, v26);
      v28 = -1;
      if (v24 >= v26)
        v28 = 1;
      if (v27 >= 0.01)
        v16 = v28;
      else
        v16 = 0;
    }
    else
    {
      v16 = 1;
    }
  }
  else
  {
    v16 = -1;
  }

  return v16;
}

@end
