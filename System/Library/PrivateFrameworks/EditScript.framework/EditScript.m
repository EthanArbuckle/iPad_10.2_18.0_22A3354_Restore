uint64_t IsCharacterAtIndexMemberOfCharacterSet(void *a1, _QWORD *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a1;
  v6 = a3;
  v7 = objc_msgSend(v5, "characterAtIndex:", *a2);
  if (v7 >> 11 == 27 && (v8 = *a2 + 1, v8 < objc_msgSend(v5, "length")))
  {
    ++*a2;
    v9 = objc_msgSend(v6, "longCharacterIsMember:", objc_msgSend(v5, "characterAtIndex:") + ((_DWORD)v7 << 10) - 56613888);
  }
  else
  {
    v9 = objc_msgSend(v6, "characterIsMember:", v7);
  }
  v10 = v9;

  return v10;
}

uint64_t TestEditScriptRanged(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v11 = a1;
  v12 = a2;
  +[ESEditScriptRanged editScriptFromString:toString:chunkSize:orderAtomsAscending:operationPrecedence:options:](ESEditScriptRanged, "editScriptFromString:toString:chunkSize:orderAtomsAscending:operationPrecedence:options:", v11, v12, a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applyToString:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", v12) & 1) == 0
    && (objc_msgSend(v14, "length") || objc_msgSend(v12, "length")))
  {
    if (v11)
      NSPrintLine(v11, v16, v17, v18, v19, v20, v21, v22, v52);
    if (v12)
      NSPrintLine(v12, v16, v17, v18, v19, v20, v21, v22, v52);
    NSPrintLine(CFSTR("OPTIONS: %d, CHUNK-SIZE: %@   ATOM-ORDER: %@"), v16, v17, v18, v19, v20, v21, v22, a6);
    NSPrint(CFSTR("%@"), v23, v24, v25, v26, v27, v28, v29, (uint64_t)v13);
    NSPrintLine(CFSTR("%@"), v30, v31, v32, v33, v34, v35, v36, (uint64_t)v14);
    NSPrintLine(CFSTR("FAILED"), v37, v38, v39, v40, v41, v42, v43, v53);
    NSPrintLine(&stru_24F475E38, v44, v45, v46, v47, v48, v49, v50, v54);
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

void NSPrintLine(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v9 = (objc_class *)MEMORY[0x24BDD17C8];
  v10 = a1;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithFormat:arguments:", v10, &a9);

  NSPrint(CFSTR("%@\n"), v12, v13, v14, v15, v16, v17, v18, (uint64_t)v11);
}

void NSPrint(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  void *v11;
  FILE *v12;
  id v13;

  v9 = (objc_class *)MEMORY[0x24BDD17C8];
  v10 = a1;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithFormat:arguments:", v10, &a9);

  v12 = (FILE *)*MEMORY[0x24BDAC8E8];
  v13 = objc_retainAutorelease(v11);
  fputs((const char *)objc_msgSend(v13, "UTF8String"), v12);

}

uint64_t TestEditScriptSmallestSingleEditRanged(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v3 = a1;
  v4 = a2;
  +[ESEditScriptRanged editScriptForSmallestSingleEditFromString:toString:](ESEditScriptRanged, "editScriptForSmallestSingleEditFromString:toString:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyToString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v4) & 1) == 0 && (objc_msgSend(v6, "length") || objc_msgSend(v4, "length"))
    || (objc_msgSend(v5, "script"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8 >= 2))
  {
    if (v3)
      NSPrintLine(v3, v9, v10, v11, v12, v13, v14, v15, v39);
    if (v4)
      NSPrintLine(v4, v9, v10, v11, v12, v13, v14, v15, v39);
    NSPrint(CFSTR("%@"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v5);
    NSPrintLine(CFSTR("%@"), v17, v18, v19, v20, v21, v22, v23, (uint64_t)v6);
    NSPrintLine(CFSTR("FAILED"), v24, v25, v26, v27, v28, v29, v30, v40);
    NSPrintLine(&stru_24F475E38, v31, v32, v33, v34, v35, v36, v37, v41);
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

BOOL TestEditScriptIndexed(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  BOOL v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v59 = a3;
  +[ESEditScriptIndexed editScriptFromArray:toArray:orderAtomsAscending:operationPrecedence:](ESEditScriptIndexed, "editScriptFromArray:toArray:orderAtomsAscending:operationPrecedence:", v7, v8, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applyToArray:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v10;
  v63 = (objc_msgSend(v10, "isEqual:", v8) & 1) != 0 || !objc_msgSend(v10, "count") && !objc_msgSend(v8, "count");
  v61 = v9;
  v62 = v7;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v9, "script");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v65 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        if (objc_msgSend(v16, "indexInArrayB") != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v16, "indexInArrayB"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "replacementText");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqualToString:", v18);

          if ((v19 & 1) == 0)
          {
            NSLog(CFSTR("IndexInArrayB Failure:%lu"), objc_msgSend(v16, "indexInArrayB"));
            v63 = 0;
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    }
    while (v13);
  }

  if (!v63)
  {
    if (v62)
      NSPrintLine(CFSTR("%@"), v20, v21, v22, v23, v24, v25, v26, (uint64_t)v62);
    if (v8)
      NSPrintLine(CFSTR("%@"), v20, v21, v22, v23, v24, v25, v26, (uint64_t)v8);
    v27 = CFSTR("DESCENDING");
    if (v59)
      v27 = CFSTR("ASCENDING");
    NSPrintLine(CFSTR("ATOM-ORDER: %@"), v20, v21, v22, v23, v24, v25, v26, (uint64_t)v27);
    NSPrint(CFSTR("%@"), v28, v29, v30, v31, v32, v33, v34, (uint64_t)v61);
    NSPrintLine(CFSTR("%@"), v35, v36, v37, v38, v39, v40, v41, (uint64_t)v60);
    NSPrintLine(CFSTR("FAILED"), v42, v43, v44, v45, v46, v47, v48, v57);
    NSPrintLine(&stru_24F475E38, v49, v50, v51, v52, v53, v54, v55, v58);
  }

  return v63;
}

uint64_t TestEditScript(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;

  v3 = a1;
  v4 = a2;
  LODWORD(v5) = TestEditScriptSmallestSingleEditRanged(v3, v4);
  v6 = 1;
  do
  {
    v7 = 0;
    v8 = v6 & 1;
    do
    {
      v9 = TestEditScriptRanged(v3, v4, 0, 0, v7, v8);
      v10 = v9 & TestEditScriptRanged(v3, v4, 1, 0, v7, v8);
      v11 = TestEditScriptRanged(v3, v4, 0, 1, v7, v8);
      v12 = v10 & v11 & TestEditScriptRanged(v3, v4, 1, 1, v7, v8);
      objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(" "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(" "));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v12 & TestEditScriptIndexed(v13, v14, 0, v7);
      v5 = v5 & TestEditScriptIndexed(v13, v14, 1, v7) & v15;

      ++v7;
    }
    while (v7 != 6);
    v6 = 0;
  }
  while ((v8 & 1) != 0);

  return v5;
}

uint64_t TestSmallestEditThinkLikeAHuman(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  unint64_t v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  +[ESEditScriptRanged editScriptForSmallestSingleEditFromString:toString:](ESEditScriptRanged, "editScriptForSmallestSingleEditFromString:toString:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyToString:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v6);
  objc_msgSend(v8, "script");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 < 2)
    v13 = v10;
  else
    v13 = 0;
  objc_msgSend(v8, "script");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v8, "script");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v6;
    v19 = v5;
    v20 = v9;
    v21 = v7;
    v22 = objc_msgSend(v18, "isEqual:", v7);

    v30 = v22 & v13;
    v7 = v21;
    v9 = v20;
    v5 = v19;
    v6 = v57;
    if ((v30 & 1) != 0)
    {
LABEL_6:
      v31 = 1;
      goto LABEL_13;
    }
  }
  else
  {

    if ((v13 & 1) != 0)
      goto LABEL_6;
  }
  if (v5)
    NSPrintLine(v5, v23, v24, v25, v26, v27, v28, v29, v54);
  if (v6)
    NSPrintLine(v6, v23, v24, v25, v26, v27, v28, v29, v54);
  NSPrint(CFSTR("%@"), v23, v24, v25, v26, v27, v28, v29, (uint64_t)v8);
  NSPrintLine(CFSTR("%@"), v32, v33, v34, v35, v36, v37, v38, (uint64_t)v9);
  NSPrintLine(CFSTR("FAILED"), v39, v40, v41, v42, v43, v44, v45, v55);
  NSPrintLine(&stru_24F475E38, v46, v47, v48, v49, v50, v51, v52, v56);
  v31 = 0;
LABEL_13:

  return v31;
}

uint64_t TestEditScriptDataArray(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  +[ESEditScriptDataArray EditScriptDataWithString:chunkSize:](ESEditScriptDataArray, "EditScriptDataWithString:chunkSize:", a1, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v6, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSPrint(CFSTR("actual: %@, expected: %@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);

  }
  return v8;
}

int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  uint64_t v36;

  v3 = (void *)MEMORY[0x22E2DF560](*(_QWORD *)&argc, argv, envp);
  v4 = (void *)MEMORY[0x24BDBD1A8];
  v5 = TestEditScriptDataArray((uint64_t)&stru_24F475E38, 1, MEMORY[0x24BDBD1A8]);
  v6 = v5 & TestEditScriptDataArray(0, 1, v4);
  v7 = TestEditScriptDataArray((uint64_t)&stru_24F475E38, 0, v4);
  v8 = v6 & v7 & TestEditScriptDataArray(0, 0, v4);
  LODWORD(v4) = TestEditScriptDataArray((uint64_t)CFSTR("Test. Test2?"), 1, &unk_24F477B00);
  v9 = v4 & TestEditScriptDataArray((uint64_t)CFSTR("Emoji 🇩🇪?"), 0, &unk_24F477B18);
  v10 = v9 & TestSmallestEditThinkLikeAHuman(CFSTR("A nation"), CFSTR("A nation"), 0);
  +[ESAtomRanged atomWithEditRange:replacementText:](ESAtomRanged, "atomWithEditRange:replacementText:", 1, 0, CFSTR(" new"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 & v10 & TestSmallestEditThinkLikeAHuman(CFSTR("A nation"), CFSTR("A new nation"), v11);

  +[ESAtomRanged atomWithEditRange:replacementText:](ESAtomRanged, "atomWithEditRange:replacementText:", 1, 4, &stru_24F475E38);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = TestSmallestEditThinkLikeAHuman(CFSTR("A new nation"), CFSTR("A nation"), v13);

  +[ESAtomRanged atomWithEditRange:replacementText:](ESAtomRanged, "atomWithEditRange:replacementText:", 18, 0, CFSTR("in Spain "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 & TestSmallestEditThinkLikeAHuman(CFSTR("The rain in Spain falls mainly on the plane"), CFSTR("The rain in Spain in Spain falls mainly on the plane"), v15);

  +[ESAtomRanged atomWithEditRange:replacementText:](ESAtomRanged, "atomWithEditRange:replacementText:", 1, 0, CFSTR(" nat w"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v12 & v16 & TestSmallestEditThinkLikeAHuman(CFSTR("A nation"), CFSTR("A nat w nation"), v17);

  +[ESAtomRanged atomWithEditRange:replacementText:](ESAtomRanged, "atomWithEditRange:replacementText:", 1, 0, CFSTR(" nations"));
  v19 = objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = TestSmallestEditThinkLikeAHuman(CFSTR("A nation"), CFSTR("A nations nation"), (void *)v19);

  LODWORD(v4) = v4 & TestEditScript(CFSTR("alpha beta charlie delta"), CFSTR("alpha charlie delta"));
  LODWORD(v4) = v4 & TestEditScript(CFSTR("The rain in spain falls"), CFSTR("The reign of spain falls"));
  LODWORD(v19) = v18 & v4 & TestEditScript(CFSTR("aa"), CFSTR("aaa"));
  LODWORD(v4) = TestEditScript(CFSTR("Are"), CFSTR("You sure it works?"));
  LODWORD(v4) = v4 & TestEditScript(CFSTR("😀 test"), CFSTR("😁 test"));
  LODWORD(v4) = v4 & TestEditScript(CFSTR("🕦"), CFSTR("🕒"));
  LODWORD(v4) = v4 & TestEditScript(CFSTR("◐"), CFSTR("◓"));
  LODWORD(v4) = v4 & TestEditScript(CFSTR("Behold there🍳 are many are call but you were chosen"), CFSTR("Behold there are many called😃 but few are chosen"));
  LODWORD(v4) = v4 & TestEditScript(CFSTR("Four score and seven years ago our fore fathers brought forth liberty for you"), CFSTR("Four score cortis and seven years ago our forefathers brought faith liberty."));
  LODWORD(v4) = v4 & TestEditScript(CFSTR("Saturday"), CFSTR("Sunday"));
  LODWORD(v4) = v4 & TestEditScript(CFSTR("abe"), CFSTR("abcde"));
  v20 = v19 & v4 & TestEditScript(CFSTR("Equal"), CFSTR("Equal"));
  LODWORD(v19) = TestEditScript(&stru_24F475E38, CFSTR("Testing"));
  LODWORD(v4) = v19 & TestEditScript(CFSTR("Testing"), &stru_24F475E38);
  v21 = v4 & TestEditScript(&stru_24F475E38, &stru_24F475E38);
  v22 = v21 & TestEditScript(CFSTR("Many are cold but few are frozen"), CFSTR("Hence many are called but few are chosen"));
  v23 = v22 & TestEditScript(CFSTR("Fools mock but they shall mourn"), CFSTR("Hence mock but they"));
  v24 = v23 & TestEditScript(CFSTR(" This is a fast"), CFSTR(" This is a blast"));
  v25 = v24 & TestEditScript(CFSTR("The invitations"), CFSTR("Documentation"));
  LODWORD(v4) = v25 & TestEditScript(0, 0);
  LODWORD(v4) = v4 & TestEditScript(0, CFSTR("Test"));
  v26 = v20 & v4 & TestEditScript(CFSTR("Test"), 0);
  if ((v26 & TestEditScript(CFSTR("Directions to san francisco"), CFSTR("Directions to San Francisco"))) != 0)
    v34 = CFSTR("Passed all tests!");
  else
    v34 = CFSTR("Failed at least 1 test.");
  NSPrintLine(v34, v27, v28, v29, v30, v31, v32, v33, v36);
  objc_autoreleasePoolPop(v3);
  return 0;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

