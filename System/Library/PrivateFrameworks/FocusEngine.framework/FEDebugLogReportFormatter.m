@implementation FEDebugLogReportFormatter

void __52___FEDebugLogReportFormatter__componentsFromReport___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a2;
  if (!objc_msgSend(v5, "type"))
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v16 = 0;
    v16 = objc_msgSend(v5, "indentLevel");
    objc_msgSend(*(id *)(a1 + 32), "_statements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __52___FEDebugLogReportFormatter__componentsFromReport___block_invoke_2;
    v14[3] = &unk_250D3A150;
    v14[4] = v15;
    v14[5] = &v17;
    objc_msgSend(v7, "enumerateObjectsAtIndexes:options:usingBlock:", v6, 2, v14);

    if (v18[3])
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%*s"), v18[3], " ");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = &stru_250D3AA90;
    }
    v9 = (void *)MEMORY[0x24BDD16A8];
    objc_msgSend(v5, "prefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@%@"), v8, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), v13, 0, 0, objc_msgSend(v12, "length"));

    objc_msgSend(*(id *)(a1 + 40), "appendString:", v12);
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v17, 8);

  }
  if (*(_QWORD *)(a1 + 48) - 1 > a3)
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\n"));

}

void __52___FEDebugLogReportFormatter__componentsFromReport___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v6 = v3;
  if (v4 > objc_msgSend(v3, "indentLevel"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "indentLevel");
    objc_msgSend(v6, "prefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v5, "length");

  }
}

@end
