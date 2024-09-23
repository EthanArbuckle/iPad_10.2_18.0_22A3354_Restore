@implementation HKAnnotationColumnLayout

double __82___HKAnnotationColumnLayout__layoutColumnsWithWidth_columnSeparation_currentSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double result;

  v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = a2;
  objc_msgSend(v6, "frame");
  v8 = v7;
  objc_msgSend(v6, "frame");
  v10 = v9;
  objc_msgSend(v6, "frame");
  objc_msgSend(v6, "setFrame:", v5, v8, v10);
  objc_msgSend(v6, "frame");
  v12 = v11;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v12
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
  if (a3 && objc_msgSend(*(id *)(a1 + 32), "includeSeparators"))
  {
    objc_msgSend(*(id *)(a1 + 32), "separatorViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", a3 - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + *(double *)(a1 + 48);
    objc_msgSend(v14, "frame");
    v17 = v16;
    objc_msgSend(v14, "frame");
    v19 = v18;
    objc_msgSend(v14, "frame");
    objc_msgSend(v14, "setFrame:", v15, v17, v19);

  }
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)(a1 + 56) + *(double *)(v20 + 24);
  *(double *)(v20 + 24) = result;
  return result;
}

void __82___HKAnnotationColumnLayout__layoutColumnsWithWidth_columnSeparation_currentSize___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "frame");
  v6 = *(double *)(a1 + 40) + v5;
  objc_msgSend(v19, "frame");
  v8 = v7;
  objc_msgSend(v19, "frame");
  v10 = v9;
  objc_msgSend(v19, "frame");
  objc_msgSend(v19, "setFrame:", v6, v8, v10);
  if (a3 && objc_msgSend(*(id *)(a1 + 32), "includeSeparators"))
  {
    objc_msgSend(*(id *)(a1 + 32), "separatorViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3 - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "frame");
    v14 = v13 - *(double *)(a1 + 48);
    objc_msgSend(v12, "frame");
    v16 = v15;
    objc_msgSend(v12, "frame");
    v18 = v17;
    objc_msgSend(v12, "frame");
    objc_msgSend(v12, "setFrame:", v14, v16, v18);

  }
}

@end
