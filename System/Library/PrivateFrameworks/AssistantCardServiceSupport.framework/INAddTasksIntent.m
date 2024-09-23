@implementation INAddTasksIntent

void __57__INAddTasksIntent_ACSCardRequesting__requestCard_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "spokenPhrase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE84E08], "acs_uniquelyIdentifiedCardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BE84F78]);
  v10 = objc_alloc_init(MEMORY[0x24BE84E50]);
  objc_msgSend(v10, "setIsBold:", 1);
  objc_msgSend(v10, "setText:", v7);
  objc_msgSend(v10, "setTextColor:", 0);
  v18[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFormattedTextPieces:", v11);

  objc_msgSend(v8, "setTitle:", v9);
  if (objc_msgSend(v5, "taskType") == 2)
  {
    v12 = objc_alloc_init(MEMORY[0x24BE84D68]);
    v13 = objc_msgSend(v5, "status");
    if (v13 <= 2)
      objc_msgSend(v12, "setIsSelected:", (v13 & 7) == 2);
    objc_msgSend(v8, "setButton:", v12);

  }
  NSStringFromSelector(sel_addedTasks);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD9EF8], "parameterForClass:keyPath:", objc_opt_class(), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIndex:forSubKeyPath:", a3, v14);
  v17 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "acs_setParameters:", v16);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
}

@end
