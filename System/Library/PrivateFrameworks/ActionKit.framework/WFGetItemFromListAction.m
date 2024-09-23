@implementation WFGetItemFromListAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int64_t v36;
  int64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void **v43;
  uint64_t *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  _QWORD v67[2];

  v67[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(v6, "numberOfItems");
  if (v7)
  {
    v8 = v7;
    -[WFGetItemFromListAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFItemSpecifier"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("First Item")))
    {
      -[WFGetItemFromListAction output](self, "output");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "items");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v13 = (void *)v12;
      objc_msgSend(v10, "addItem:", v12);

      goto LABEL_9;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("Last Item")))
    {
      -[WFGetItemFromListAction output](self, "output");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "items");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastObject");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("Random Item")))
    {
      -[WFGetItemFromListAction output](self, "output");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "items");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", arc4random_uniform(v8));
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("Item At Index")))
    {
      -[WFGetItemFromListAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFItemIndex"), objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");
      v16 = v15;
      if (v14 && v15 > 0)
      {
        if (v15 <= v8)
        {
          -[WFGetItemFromListAction output](self, "output");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "items");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectAtIndex:", v16 - 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addItem:", v33);

        }
        else
        {
          v17 = (void *)MEMORY[0x24BDD1540];
          v18 = *MEMORY[0x24BDD1128];
          v64 = *MEMORY[0x24BDD0FC8];
          v19 = (void *)MEMORY[0x24BDD17C8];
          WFLocalizedString(CFSTR("The index you specified was outside of the possible range (you asked for item %1$d, and the list has only %2$d)."));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "localizedStringWithFormat:", v20, v16, v8);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v21;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 33, v22);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v25 = (void *)MEMORY[0x24BDD1540];
        v26 = *MEMORY[0x24BDD1128];
        v66 = *MEMORY[0x24BDD0FC8];
        v27 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("You asked for item %d, but the first item is at index 1."));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringWithFormat:", v28, v16);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v29;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 33, v30);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_9;
    }
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("Items in Range")))
    {
LABEL_9:

      goto LABEL_10;
    }
    -[WFGetItemFromListAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFItemRangeStart"), objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v23;
    if (v23)
      v24 = objc_msgSend(v23, "integerValue");
    else
      v24 = 1;
    -[WFGetItemFromListAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFItemRangeEnd"), objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
      v36 = objc_msgSend(v34, "integerValue");
    else
      v36 = objc_msgSend(v6, "numberOfItems");
    v37 = v36;
    if (v24 <= 0)
    {
      v55 = (void *)MEMORY[0x24BDD1540];
      v38 = *MEMORY[0x24BDD1128];
      v62 = *MEMORY[0x24BDD0FC8];
      v45 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("The range you specified was outside of the possible range (you asked for items %1$d through %2$d, but the first item is at index 1)."));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringWithFormat:", v40, v24, v37);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v41;
      v42 = (void *)MEMORY[0x24BDBCE70];
      v43 = &v63;
      v44 = &v62;
    }
    else
    {
      if (v36 >= v24)
      {
        if (v36 <= v8)
        {
          v50 = v24 - 1;
          if (v24 - 1 < (unint64_t)v36)
          {
            do
            {
              -[WFGetItemFromListAction output](self, "output");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "items");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "objectAtIndex:", v50);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "addItem:", v53);

              ++v50;
            }
            while (v37 != v50);
          }
          goto LABEL_32;
        }
        v56 = (void *)MEMORY[0x24BDD1540];
        v54 = *MEMORY[0x24BDD1128];
        v58 = *MEMORY[0x24BDD0FC8];
        v49 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("The range you specified was outside of the possible range (you asked for items %1$d through %2$d, and the list has only %3$d)."));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringWithFormat:", v40, v24, v37, v8);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v41;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v54;
        v47 = v56;
LABEL_31:
        objc_msgSend(v47, "errorWithDomain:code:userInfo:", v48, 33, v46);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
        goto LABEL_9;
      }
      v55 = (void *)MEMORY[0x24BDD1540];
      v38 = *MEMORY[0x24BDD1128];
      v60 = *MEMORY[0x24BDD0FC8];
      v39 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("The range you specified was invalid (you asked for items %1$d through %2$d)."));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", v40, v24, v37);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v41;
      v42 = (void *)MEMORY[0x24BDBCE70];
      v43 = &v61;
      v44 = &v60;
    }
    objc_msgSend(v42, "dictionaryWithObjects:forKeys:count:", v43, v44, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v55;
    v48 = v38;
    goto LABEL_31;
  }
LABEL_10:

}

@end
