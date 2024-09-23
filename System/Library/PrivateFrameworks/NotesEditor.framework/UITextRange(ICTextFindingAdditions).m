@implementation UITextRange(ICTextFindingAdditions)

- (id)_ic_textFindingResult
{
  return objc_getAssociatedObject(a1, &ICTextFindingResultIdentifier);
}

- (void)_ic_setTextFindingResult:()ICTextFindingAdditions
{
  objc_setAssociatedObject(a1, &ICTextFindingResultIdentifier, a3, (void *)1);
}

- (uint64_t)ic_compare:()ICTextFindingAdditions inTextView:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_ic_textFindingResult");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        objc_msgSend(v6, "_ic_textFindingResult"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    objc_msgSend(a1, "_ic_textFindingResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_ic_textFindingResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "compare:", v12);

  }
  else
  {
    objc_msgSend(a1, "_ic_textFindingResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(a1, "_ic_textFindingResult");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "range");
      v18 = v17;

    }
    else
    {
      v16 = objc_msgSend(v7, "ic_characterRangeFromTextRange:", a1);
      v18 = v19;
    }

    objc_msgSend(v6, "_ic_textFindingResult");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v6, "_ic_textFindingResult");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "range");
      v24 = v23;

    }
    else
    {
      v22 = objc_msgSend(v7, "ic_characterRangeFromTextRange:", v6);
      v24 = v25;
    }

    if (v16 >= v22)
    {
      if (v16 != v22)
      {
        v13 = 1;
        goto LABEL_16;
      }
      if (v18 >= v24)
      {
        v13 = v18 != v24;
        goto LABEL_16;
      }
    }
    v13 = -1;
  }
LABEL_16:

  return v13;
}

@end
