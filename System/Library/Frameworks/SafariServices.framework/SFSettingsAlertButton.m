@implementation SFSettingsAlertButton

void __43___SFSettingsAlertButton_updateConstraints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  id v37;

  v37 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v37, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintGreaterThanOrEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v37, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v12);

  v13 = *(void **)(a1 + 32);
  objc_msgSend(v37, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v16);

  v17 = *(void **)(a1 + 32);
  objc_msgSend(v37, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v20);

  if (a3)
  {
    v21 = *(void **)(a1 + 32);
    objc_msgSend(v37, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a3 - 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:constant:", v24, 16.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v25);

  }
  v26 = *(_QWORD **)(a1 + 56);
  v27 = v37;
  if ((id)v26[78] == v37 || (id)v26[65] == v37)
    v27 = (void *)v26[66];
  objc_msgSend(v27, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v31 = (float)(unint64_t)(*(_QWORD *)(a1 + 64) - a3) + 50.0;
  objc_msgSend(v30, "setPriority:", v31);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v30);
  if (*(_QWORD *)(a1 + 64) == 1)
  {
    objc_msgSend(v37, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "centerXAnchor");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      objc_msgSend(v37, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "trailingAnchor");
    }
    else
    {
      objc_msgSend(v37, "leadingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "leadingAnchor");
    }
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v33;
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v36) = 1112276992;
  objc_msgSend(v35, "setPriority:", v36);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v35);

}

_QWORD *__43___SFSettingsAlertButton__arrangedSubviews__block_invoke(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1;
  switch(a2)
  {
    case 0:
      v3 = 624;
      objc_msgSend(*(id *)(a1[4] + 624), "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
        v3 = 520;
      v2 = *(id *)(v2[4] + v3);

      return v2;
    case 1:
      v5 = a1[4];
      v6 = 600;
      goto LABEL_8;
    case 2:
      v5 = a1[4];
      v6 = 608;
      goto LABEL_8;
    case 3:
      v5 = a1[4];
      v6 = 616;
LABEL_8:
      v2 = *(id *)(v5 + v6);
      break;
    default:
      return v2;
  }
  return v2;
}

id __43___SFSettingsAlertButton__arrangedSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "integerValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

@end
