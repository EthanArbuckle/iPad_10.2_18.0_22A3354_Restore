@implementation LTDisambiguableSentence

BOOL __46___LTDisambiguableSentence_hasDisambiguations__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "links");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

uint64_t __53___LTDisambiguableSentence_hasDisambiguationsOfType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  objc_msgSend(a2, "links");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53___LTDisambiguableSentence_hasDisambiguationsOfType___block_invoke_2;
  v6[3] = &__block_descriptor_40_e44_B16__0___LTDisambiguationLinkConfiguration_8l;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "lt_hasObjectPassingTest:", v6);

  return v4;
}

uint64_t __53___LTDisambiguableSentence_hasDisambiguationsOfType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "edgeTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

void __59___LTDisambiguableSentence_menuConfigurationsForLinkIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (objc_msgSend(v5, "count") == 1)
      objc_msgSend(v5, "firstObject");
    else
      objc_msgSend(WeakRetained, "_preferredEdgeFromEdgesWithDuplicateMeaning:forLinkIndex:inPhrase:", v5, *(_QWORD *)(a1 + 48), objc_msgSend(WeakRetained, "selectedPhraseIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  }
}

id __59___LTDisambiguableSentence_menuConfigurationsForLinkIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "menuDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v3)
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

BOOL __74___LTDisambiguableSentence_meaningDescriptionForLinkIndex_inTargetPhrase___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = objc_msgSend(v3, "targetPhraseIndex") == *(_QWORD *)(a1 + 32) && objc_msgSend(v3, "type") == 0;

  return v4;
}

double __44___LTDisambiguableSentence__restoreChanges___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  int v24;
  double v25;
  double v26;
  double v27;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sourceTextSnippetForLinkIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "genderNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "gender");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11)
    {
      if (v12
        && (objc_msgSend(v7, "gender"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v10, "genderNumber"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v15,
            v14,
            v13,
            v14 == v15))
      {
        LODWORD(v13) = 1;
        v16 = 1.0;
      }
      else
      {
        objc_msgSend(v7, "gender");

        LODWORD(v13) = 0;
        v16 = 0.0;
      }
    }
    else
    {
      v16 = 0.0;
      if (v12)
      {
        objc_msgSend(v7, "defaultGender");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          objc_msgSend(v7, "gender");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "defaultGender");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v19 == v20;

          LODWORD(v13) = 0;
          if (v21)
            v16 = 0.25;
          else
            v16 = 0.0;
        }
        else
        {

          LODWORD(v13) = 0;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "meaningDescriptionForLinkIndex:inTargetPhrase:", a3, a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "meaningDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqualToString:", v23);
    v25 = v16 + 1.0;
    if (v24)
      v26 = v16 + 1.0;
    else
      v26 = v16;
    v27 = v26 + 0.5;
    if ((_DWORD)v13)
      v25 = v27;
    if (v24)
      v16 = v25;

  }
  else
  {
    v16 = 0.0;
  }

  return v16;
}

void __44___LTDisambiguableSentence__restoreChanges___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(v5, "links");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44___LTDisambiguableSentence__restoreChanges___block_invoke_3;
  v8[3] = &unk_250693510;
  v10 = &v12;
  v9 = *(id *)(a1 + 40);
  v11 = a3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13[3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);

  _Block_object_dispose(&v12, 8);
}

double __44___LTDisambiguableSentence__restoreChanges___block_invoke_3(uint64_t a1)
{
  double v2;
  uint64_t v3;
  double result;

  v2 = (*(double (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = v2 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

uint64_t __44___LTDisambiguableSentence__restoreChanges___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  double v6;
  uint64_t v7;

  result = objc_msgSend(a2, "doubleValue");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v6 > *(double *)(v7 + 24))
  {
    *(double *)(v7 + 24) = v6;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

void __60___LTDisambiguableSentence__userSelectionFromIndex_toIndex___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id obj;
  _QWORD v10[5];

  objc_msgSend(a2, "adjacencyList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60___LTDisambiguableSentence__userSelectionFromIndex_toIndex___block_invoke_2;
  v10[3] = &__block_descriptor_40_e25_B16__0___LTDirectedEdge_8l;
  v10[4] = a1[6];
  objc_msgSend(v7, "lt_firstObjectPassingTest:", v10);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v8 = obj;
  if (obj)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), obj);
    v8 = obj;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
    *a4 = 1;
  }

}

BOOL __60___LTDisambiguableSentence__userSelectionFromIndex_toIndex___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "targetPhraseIndex") == *(_QWORD *)(a1 + 32);
}

BOOL __96___LTDisambiguableSentence__preferredGenderFromEdgesWithDuplicateMeaning_forLinkIndex_inPhrase___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  return v2 == objc_msgSend(a2, "targetPhraseIndex");
}

BOOL __94___LTDisambiguableSentence__preferredEdgeFromEdgesWithDuplicateMeaning_forLinkIndex_inPhrase___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "targetGender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntegerValue") == *(_QWORD *)(a1 + 32);
  else
    v5 = 0;

  return v5;
}

void __121___LTDisambiguableSentence__generateAttributedStringForLocation_result_excludedTypes_globalAttributes_attributeProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v13 = v3;
  objc_msgSend(v3, "edgeTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "intersectsSet:", v5);

  if ((_DWORD)v4)
  {
    if (*(_QWORD *)(a1 + 80))
      v6 = objc_msgSend(v13, "targetRange");
    else
      v6 = objc_msgSend(v13, "sourceRange");
    v8 = v6;
    v9 = v7;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 72);
    if (v11)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id, _QWORD))(v11 + 16))(v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v13, *(_QWORD *)(a1 + 80));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addEntriesFromDictionary:", v12);

    }
    objc_msgSend(*(id *)(a1 + 64), "addAttributes:range:", v10, v8, v9);

  }
}

void __53___LTDisambiguableSentence__validateAndPopulateEdges__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  __int128 v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  __int128 v32;
  id v33;
  void *v36;
  void *v37;
  id obj;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v33 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v33, "links");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v45;
    *(_QWORD *)&v4 = 134217984;
    v32 = v4;
    while (2)
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v45 != v40)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v6, "unvalidatedAdjacencyList", v32);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "adjacencyList");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "count") && objc_msgSend(v8, "count"))
        {
          v31 = _LTOSLogDisambiguation();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            __53___LTDisambiguableSentence__validateAndPopulateEdges__block_invoke_cold_2(v31);

LABEL_24:
          goto LABEL_25;
        }
        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = __53___LTDisambiguableSentence__validateAndPopulateEdges__block_invoke_32;
        v42[3] = &unk_2506935D8;
        objc_copyWeak(&v43, (id *)(a1 + 48));
        objc_msgSend(v7, "_ltCompactMap:", v42);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");
        v11 = objc_msgSend(v7, "count");
        if (v10 == v11)
        {
          v12 = (void *)MEMORY[0x24BDD1968];
          v13 = objc_msgSend(v6, "sourceRange");
          objc_msgSend(v12, "valueWithRange:", v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v15);

          v16 = (void *)MEMORY[0x24BDD1968];
          v17 = objc_msgSend(v6, "targetRange");
          objc_msgSend(v16, "valueWithRange:", v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v19);

          objc_msgSend(v6, "_unvalidatedEdgeFromAdjacencyListMatchingTargetNodeIndex:", a3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "targetGender");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "defaultGender");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "_validateWithAdjacencyList:gender:defaultGender:", v9, v21, v22);

        }
        else
        {
          v23 = _LTOSLogDisambiguation();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v32;
            v49 = a3;
            _os_log_error_impl(&dword_235438000, v23, OS_LOG_TYPE_ERROR, "Failed to validate sentence; node %zu has some invalid edges",
              buf,
              0xCu);
          }
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
        }

        objc_destroyWeak(&v43);
        if (v10 != v11)
          goto LABEL_24;
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (v41)
        continue;
      break;
    }
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "_hasOverlapInRangeArray:", v37) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "_hasOverlapInRangeArray:", v36))
  {
    v24 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __53___LTDisambiguableSentence__validateAndPopulateEdges__block_invoke_cold_1(a3, v24, v25, v26, v27, v28, v29, v30);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_25:

}

id __53___LTDisambiguableSentence__validateAndPopulateEdges__block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_directedEdgeFromUnvalidatedEdge:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __52___LTDisambiguableSentence__hasOverlapInRangeArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(a2, "rangeValue");
  v6 = objc_msgSend(v4, "rangeValue");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  return v9;
}

void __53___LTDisambiguableSentence__validateAndPopulateEdges__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_235438000, a2, a3, "Failed to validate sentence; node %zu has some overlapping ranges",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1();
}

void __53___LTDisambiguableSentence__validateAndPopulateEdges__block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_235438000, log, OS_LOG_TYPE_DEBUG, "Skipping validation of link because it appears to already be validated", v1, 2u);
}

@end
