@implementation PHQueryPersonContext

- (PHQueryPersonContext)initWithFetchOptions:(id)a3
{
  id v5;
  PHQueryPersonContext *v6;
  PHQueryPersonContext *v7;
  PHQueryPersonContext *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHQueryPersonContext;
  v6 = -[PHQueryPersonContext init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fetchOptions, a3);
    v8 = v7;
  }

  return v7;
}

- (id)subpredicates
{
  int64_t v3;
  void *v4;
  void *v5;
  void **v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PHFetchOptions personContext](self->_fetchOptions, "personContext");
  v4 = (void *)MEMORY[0x1E0C9AA60];
  switch(v3)
  {
    case 0:
      -[PHQueryPersonContext personContextNonePredicates](self, "personContextNonePredicates");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v5;
      v6 = (void **)v14;
      goto LABEL_9;
    case 1:
      -[PHQueryPersonContext personContextPeopleHomePredicate](self, "personContextPeopleHomePredicate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v5;
      v6 = &v13;
      goto LABEL_9;
    case 2:
      -[PHQueryPersonContext personContextAdditionalPredicate](self, "personContextAdditionalPredicate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v5;
      v6 = &v12;
      goto LABEL_9;
    case 3:
      -[PHQueryPersonContext personContextDetailPredicate](self, "personContextDetailPredicate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v5;
      v6 = &v11;
      goto LABEL_9;
    case 4:
      -[PHQueryPersonContext personContextOneUpPredicate](self, "personContextOneUpPredicate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v5;
      v6 = &v10;
      goto LABEL_9;
    case 6:
      -[PHQueryPersonContext personContextUnverifiedPredicate](self, "personContextUnverifiedPredicate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v5;
      v6 = &v9;
      goto LABEL_9;
    case 7:
      -[PHQueryPersonContext personContextNoTombstonePredicate](self, "personContextNoTombstonePredicate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v5;
      v6 = &v8;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1, v8, v9, v10, v11, v12, v13, v14[0]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v4;
  }
  return v4;
}

- (id)_verifiedPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("verifiedType"), 0);
}

- (id)_verifiedVisiblePredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("verifiedType"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("verifiedType"), 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_notVerifiedPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(noindex:(%K) == %d)"), CFSTR("verifiedType"), 0);
}

- (id)_faceCountPredicateWithMinimum:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %d"), CFSTR("faceCount"), a3);
}

- (id)_notHiddenTypePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(noindex:(%K) > %d)"), CFSTR("type"), -1);
}

- (id)personContextNoTombstonePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("verifiedType"), -2);
}

- (id)personContextNonePredicates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  -[PHQueryPersonContext _verifiedPredicate](self, "_verifiedPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  -[PHQueryPersonContext _faceCountPredicateWithMinimum:](self, "_faceCountPredicateWithMinimum:", -[PHFetchOptions minimumVerifiedFaceCount](self->_fetchOptions, "minimumVerifiedFaceCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3528];
  -[PHQueryPersonContext _notVerifiedPredicate](self, "_notVerifiedPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  -[PHQueryPersonContext _faceCountPredicateWithMinimum:](self, "_faceCountPredicateWithMinimum:", -[PHFetchOptions minimumUnverifiedFaceCount](self->_fetchOptions, "minimumUnverifiedFaceCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3528];
  v17[0] = v7;
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "orPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)personContextPeopleHomePredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  -[PHQueryPersonContext _verifiedVisiblePredicate](self, "_verifiedVisiblePredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHQueryPersonContext _notHiddenTypePredicate](self, "_notHiddenTypePredicate", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  -[PHQueryPersonContext _faceCountPredicateWithMinimum:](self, "_faceCountPredicateWithMinimum:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)personContextAdditionalPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(noindex:(%K) != %d)"), CFSTR("type"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K >= 1)"), CFSTR("faceCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)personContextDetailPredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  -[PHQueryPersonContext _notVerifiedPredicate](self, "_notVerifiedPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  -[PHQueryPersonContext _faceCountPredicateWithMinimum:](self, "_faceCountPredicateWithMinimum:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3528];
  -[PHQueryPersonContext _verifiedVisiblePredicate](self, "_verifiedVisiblePredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  -[PHQueryPersonContext _faceCountPredicateWithMinimum:](self, "_faceCountPredicateWithMinimum:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(noindex:(%K) != %d)"), CFSTR("type"), -1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3528];
  v18[0] = v7;
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "orPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)personContextOneUpPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K >= 1)"), CFSTR("faceCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3528];
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0D71940], "predicateForVisibleKeyFace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)personContextUnverifiedPredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  -[PHQueryPersonContext _notVerifiedPredicate](self, "_notVerifiedPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  -[PHQueryPersonContext _faceCountPredicateWithMinimum:](self, "_faceCountPredicateWithMinimum:", -[PHFetchOptions minimumUnverifiedFaceCount](self->_fetchOptions, "minimumUnverifiedFaceCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchOptions, 0);
}

+ (id)subpredicatesForFetchOptions:(id)a3
{
  id v3;
  PHQueryPersonContext *v4;
  void *v5;

  v3 = a3;
  if (!v3)
    v3 = (id)objc_opt_new();
  v4 = -[PHQueryPersonContext initWithFetchOptions:]([PHQueryPersonContext alloc], "initWithFetchOptions:", v3);
  -[PHQueryPersonContext subpredicates](v4, "subpredicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
