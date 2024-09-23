@implementation PKExpressPassInformation

void __84__PKExpressPassInformation_NanoPassKit__npk_hasImmediateAutomaticSelectionCriterion__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "type", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("generic_immediate.type_a"));

        if (v12)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __69__PKExpressPassInformation_NanoPassKit__npk_expressAppletIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = 0;
  objc_msgSend(MEMORY[0x24BE6EAF0], "extractApplicationIdentifier:subcredentialIdentifier:fromIdentifiers:", &v3, 0, a2);
  objc_msgSend(*(id *)(a1 + 32), "pk_safelyAddObject:", v3);

}

@end
