@implementation UIView(AmbientUI)

- (uint64_t)amui_applyRedModeFilterAnimated:()AmbientUI withCompletion:
{
  return objc_msgSend(a1, "amui_applyRedModeFilterAnimated:withCoordinatedAnimationBlock:completion:", a3, 0, a4);
}

- (void)amui_applyRedModeFilterAnimated:()AmbientUI withCoordinatedAnimationBlock:completion:
{
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD);
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _BYTE v33[76];
  int v34;

  v28 = a4;
  v7 = a5;
  v26 = a1;
  objc_msgSend(a1, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKeyPath:", CFSTR("filters.colorMatrix"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (_QWORD *)MEMORY[0x24BDE5AD8];
  if (v9
    && (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqual:", v9),
        v11,
        !v12))
  {
    v15 = v10;
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A00]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE5B08]);
    memset(v33, 0, 60);
    *(_OWORD *)&v33[60] = xmmword_236061A70;
    v34 = 0;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCAColorMatrix:", v33);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    objc_msgSend(v13, "setValue:forKey:", v14, *v10);

  }
  objc_msgSend(v8, "valueForKeyPath:", CFSTR("filters.vibrantColorMatrix"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16
    && (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "isEqual:", v16),
        v17,
        !v18))
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5C30]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)v33 = 0uLL;
    *(_DWORD *)&v33[16] = 1065353216;
    memset(&v33[20], 0, 56);
    v34 = 1065353216;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCAColorMatrix:", v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setValue:forKey:", v20, *v15);

  }
  v21 = (void (**)(_QWORD, _QWORD))v7;
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = v22;
  if (v13)
    objc_msgSend(v22, "addObject:", v13);
  if (v19)
    objc_msgSend(v23, "addObject:", v19);
  if (objc_msgSend(v23, "count"))
  {
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __94__UIView_AmbientUI__amui_applyRedModeFilterAnimated_withCoordinatedAnimationBlock_completion___block_invoke;
    v29[3] = &unk_250778D90;
    v30 = v8;
    v31 = v23;
    v32 = v28;
    v24 = MEMORY[0x23B7EAB68](v29);
    v25 = (void *)v24;
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDF6F90], "transitionWithView:duration:options:animations:completion:", v26, 5242882, v24, v21, 1.2);
    }
    else
    {
      (*(void (**)(uint64_t))(v24 + 16))(v24);
      if (v21)
        v21[2](v21, 1);
    }

  }
}

- (uint64_t)amui_clearRedModeFilterAnimated:()AmbientUI withCompletion:
{
  return objc_msgSend(a1, "amui_clearRedModeFilterAnimated:withCoordinatedAnimationBlock:completion:", a3, 0, a4);
}

- (void)amui_clearRedModeFilterAnimated:()AmbientUI withCoordinatedAnimationBlock:completion:
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  char v29;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKeyPath:", CFSTR("filters.colorMatrix"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", v11) ^ 1;

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v10, "valueForKeyPath:", CFSTR("filters.vibrantColorMatrix"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", v14) ^ 1;

  }
  else
  {
    v16 = 0;
  }
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __94__UIView_AmbientUI__amui_clearRedModeFilterAnimated_withCoordinatedAnimationBlock_completion___block_invoke;
  v23[3] = &unk_250778DB8;
  v28 = v13;
  v17 = v10;
  v24 = v17;
  v18 = v11;
  v25 = v18;
  v29 = v16;
  v19 = v14;
  v26 = v19;
  v20 = v8;
  v27 = v20;
  v21 = MEMORY[0x23B7EAB68](v23);
  v22 = (void *)v21;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDF6F90], "transitionWithView:duration:options:animations:completion:", a1, 5242882, v21, v9, 1.2);
  }
  else
  {
    (*(void (**)(uint64_t))(v21 + 16))(v21);
    if (v9)
      v9[2](v9, 1);
  }

}

@end
