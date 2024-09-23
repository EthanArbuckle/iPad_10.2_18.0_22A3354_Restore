@implementation _LTDisambiguableResult

- (_LTDisambiguableResult)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _LTDisambiguationNode *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  char isKindOfClass;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  _LTDisambiguationLinkConfiguration *v67;
  uint64_t v68;
  _LTDisambiguableSentence *v69;
  _LTDisambiguableResult *v70;
  _LTDisambiguableResult *v71;
  _LTDisambiguableResult *v72;
  void *v74;
  uint64_t v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  id obj;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _LTDisambiguationNode *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  char v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _LTDisambiguableSentence *v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("alternative_descriptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (v8 = 0x24BDBC000uLL, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("engine_input"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("n_best_translated_phrases"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = v10;
        if (objc_msgSend(v10, "count"))
        {
          v12 = 0;
          while (1)
          {
            v109 = v12;
            objc_msgSend(v10, "objectAtIndexedSubscript:", v12, v74);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v72 = 0;
              goto LABEL_137;
            }
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("translated_tokens"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              v72 = 0;
              goto LABEL_132;
            }
            objc_opt_class();
            v110 = v14;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v72 = 0;
              goto LABEL_132;
            }
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("meta_info_data"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = v13;
            if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("romanization"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                objc_opt_class();
                v17 = (objc_opt_isKindOfClass() & 1) != 0 ? v16 : 0;
              }
              else
              {
                v17 = 0;
              }
              v106 = v17;

              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("selection_spans"));
              v19 = objc_claimAutoreleasedReturnValue();
              v105 = (void *)v19;
              if (v19)
              {
                v20 = (void *)v19;
                v101 = v11;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v94 = v15;
                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v120 = 0u;
                  v121 = 0u;
                  v122 = 0u;
                  v123 = 0u;
                  v22 = v20;
                  v98 = -[_LTDisambiguationNode countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v120, v127, 16);
                  if (!v98)
                    goto LABEL_118;
                  v99 = *(_QWORD *)v121;
                  v100 = v22;
                  v103 = v21;
LABEL_30:
                  v23 = 0;
LABEL_31:
                  if (*(_QWORD *)v121 != v99)
                  {
                    v24 = v23;
                    objc_enumerationMutation(v22);
                    v23 = v24;
                  }
                  v102 = v23;
                  v25 = *(id *)(*((_QWORD *)&v120 + 1) + 8 * v23);
                  if (v25)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v119 = 0;
                      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("source"));
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      v27 = rangeFromDictionary(v26, &v119);
                      v29 = v28;

                      if (v119)
                        goto LABEL_124;
                      v104 = v25;
                      v30 = objc_msgSend(v9, "lt_codeUnitsRangeFromCodePointsRange:", v27, v29);
                      v96 = v31;
                      v97 = v30;
                      v21 = v103;
                      if (v30 == 0x7FFFFFFFFFFFFFFFLL)
                      {
LABEL_39:
                        v22 = v100;
                        goto LABEL_40;
                      }
                      v25 = v104;
                      objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("projection"));
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v33 = rangeFromDictionary(v32, &v119);
                      v35 = v34;

                      if (v119)
                      {
LABEL_124:
                        v22 = v100;
                        goto LABEL_125;
                      }
                      v36 = objc_msgSend(v110, "lt_codeUnitsRangeFromCodePointsRange:", v33, v35);
                      v21 = v103;
                      if (v36 == 0x7FFFFFFFFFFFFFFFLL)
                        goto LABEL_39;
                      v90 = v37;
                      v91 = v36;
                      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("alternatives"));
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      v22 = v100;
                      if (!v38 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
LABEL_123:

                        v25 = v104;
                        goto LABEL_125;
                      }
                      v117 = 0u;
                      v118 = 0u;
                      v115 = 0u;
                      v116 = 0u;
                      obj = v38;
                      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
                      if (!v39)
                        goto LABEL_116;
                      v40 = *(_QWORD *)v116;
                      v87 = v38;
                      v85 = *(_QWORD *)v116;
                      while (1)
                      {
                        v84 = v39;
                        v41 = 0;
                        do
                        {
                          if (*(_QWORD *)v116 != v40)
                          {
                            v42 = v41;
                            objc_enumerationMutation(obj);
                            v41 = v42;
                          }
                          v89 = v41;
                          v95 = *(id *)(*((_QWORD *)&v115 + 1) + 8 * v41);
                          if (!v95)
                            goto LABEL_121;
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_121;
                          v113 = 0u;
                          v114 = 0u;
                          v111 = 0u;
                          v112 = 0u;
                          v43 = objc_msgSend(&unk_2506A4150, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
                          if (v43)
                          {
                            v44 = v43;
                            v45 = *(_QWORD *)v112;
LABEL_53:
                            v46 = 0;
                            while (1)
                            {
                              if (*(_QWORD *)v112 != v45)
                                objc_enumerationMutation(&unk_2506A4150);
                              v47 = *(id *)(*((_QWORD *)&v111 + 1) + 8 * v46);
                              if (v47)
                              {
                                objc_opt_class();
                                v48 = (objc_opt_isKindOfClass() & 1) != 0 ? v47 : 0;
                              }
                              else
                              {
                                v48 = 0;
                              }

                              if (!v48)
                                break;
                              if (v44 == ++v46)
                              {
                                v44 = objc_msgSend(&unk_2506A4150, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
                                if (v44)
                                  goto LABEL_53;
                                goto LABEL_64;
                              }
                            }
LABEL_121:

                            v8 = 0x24BDBC000;
                            v22 = v100;
LABEL_122:

                            v38 = v87;
                            goto LABEL_123;
                          }
LABEL_64:
                          objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("alternative_description_index"), v74);
                          v49 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v49)
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                              v50 = v49;
                            else
                              v50 = 0;
                          }
                          else
                          {
                            v50 = 0;
                          }
                          v88 = v50;

                          objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("translation_phrase_index"));
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          v8 = 0x24BDBC000;
                          v21 = v103;
                          v22 = v100;
                          if (v51)
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                              v52 = v51;
                            else
                              v52 = 0;
                          }
                          else
                          {
                            v52 = 0;
                          }
                          v86 = v52;

                          objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("selection_span_index"));
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v53)
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                              v54 = v53;
                            else
                              v54 = 0;
                          }
                          else
                          {
                            v54 = 0;
                          }
                          v83 = v54;

                          v55 = 1;
                          if (!v88 || !v86)
                            goto LABEL_109;
                          v56 = v83;
                          if (!v83)
                            goto LABEL_110;
                          v81 = objc_msgSend(v88, "unsignedIntegerValue");
                          v80 = objc_msgSend(v86, "unsignedIntegerValue");
                          v79 = objc_msgSend(v83, "unsignedIntegerValue");
                          objc_msgSend(v7, "objectAtIndexedSubscript:", v81);
                          v57 = objc_claimAutoreleasedReturnValue();
                          v82 = (void *)v57;
                          if (v57)
                          {
                            v58 = (void *)v57;
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              genderPayloadValueForDescription(v58, CFSTR("gender"));
                              v78 = (void *)objc_claimAutoreleasedReturnValue();
                              genderPayloadValueForDescription(v58, CFSTR("default_gender"));
                              v59 = (void *)objc_claimAutoreleasedReturnValue();
                              v77 = v59;
                              if (v78 && v59)
                              {
                                +[_LTUnvalidatedEdgeInfo genderEdgeInfoWithTargetPhraseIndex:targetLinkIndex:gender:defaultGender:](_LTUnvalidatedEdgeInfo, "genderEdgeInfoWithTargetPhraseIndex:targetLinkIndex:gender:defaultGender:", v80, v79, objc_msgSend(v78, "unsignedIntegerValue"), objc_msgSend(v59, "unsignedIntegerValue"));
                                v60 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v92, "addObject:", v60);
                                goto LABEL_106;
                              }
                              v76 = v58;
                              objc_opt_class();
                              isKindOfClass = objc_opt_isKindOfClass();
                              v62 = v76;
                              if ((isKindOfClass & 1) == 0)
                                v62 = 0;
                              v63 = v62;
                              v74 = v63;
                              if (v63)
                              {
                                objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("type"));
                                v64 = (void *)objc_claimAutoreleasedReturnValue();
                                if (!v64)
                                {
                                  v65 = 0;
                                  goto LABEL_100;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  v75 = 0;
                                  v65 = v64;
                                  v64 = 0;
                                  goto LABEL_102;
                                }
                                if (objc_msgSend(v64, "isEqualToString:", CFSTR("meaning")))
                                {
                                  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("payload"));
                                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (v65)
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("definition"));
                                      v75 = objc_claimAutoreleasedReturnValue();
                                      goto LABEL_102;
                                    }
                                  }
LABEL_100:
                                  v75 = 0;
LABEL_102:

                                }
                                else
                                {
                                  v75 = 0;
                                }

                                v21 = v103;
                                v22 = v100;
                              }
                              else
                              {
                                v75 = 0;
                              }

                              if (v75)
                              {
                                +[_LTUnvalidatedEdgeInfo meaningEdgeInfoWithTargetPhraseIndex:targetLinkIndex:meaningDescription:](_LTUnvalidatedEdgeInfo, "meaningEdgeInfoWithTargetPhraseIndex:targetLinkIndex:meaningDescription:", v80, v79);
                                v66 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v92, "addObject:", v66);

                                v60 = (void *)v75;
LABEL_106:

                                v55 = 0;
                              }
                              else
                              {
                                v55 = 1;
                              }

                              goto LABEL_108;
                            }
                          }
                          v55 = 1;
LABEL_108:

LABEL_109:
                          v56 = v83;
LABEL_110:

                          if (v55)
                            goto LABEL_122;
                          v41 = v89 + 1;
                          v40 = v85;
                        }
                        while (v89 + 1 != v84);
                        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
                        v40 = v85;
                        if (!v39)
                        {
LABEL_116:

                          v67 = -[_LTDisambiguationLinkConfiguration initWithSourceRange:targetRange:unvalidatedAdjacencyList:]([_LTDisambiguationLinkConfiguration alloc], "initWithSourceRange:targetRange:unvalidatedAdjacencyList:", v97, v96, v91, v90, v92);
                          objc_msgSend(v21, "addObject:", v67);

LABEL_40:
                          v23 = v102 + 1;
                          if (v102 + 1 == v98)
                          {
                            v68 = -[_LTDisambiguationNode countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v120, v127, 16);
                            v98 = v68;
                            if (!v68)
                            {
LABEL_118:

                              v22 = -[_LTDisambiguationNode initWithText:links:romanization:]([_LTDisambiguationNode alloc], "initWithText:links:romanization:", v110, v21, v106);
                              objc_msgSend(v101, "addObject:", v22);
                              v18 = 0;
                              goto LABEL_126;
                            }
                            goto LABEL_30;
                          }
                          goto LABEL_31;
                        }
                      }
                    }
                  }
LABEL_125:

                  v18 = 1;
                  v21 = v103;
LABEL_126:

                  v15 = v94;
                }
                else
                {
                  v18 = 1;
                }
                v11 = v101;
              }
              else
              {
                v18 = 1;
              }

            }
            else
            {
              v18 = 1;
            }

            if (v18)
              break;
            v12 = v109 + 1;
            v10 = v107;
            if (v109 + 1 >= (unint64_t)objc_msgSend(v107, "count"))
              goto LABEL_131;
          }
          v72 = 0;
          v10 = v107;
        }
        else
        {
LABEL_131:
          v69 = -[_LTDisambiguableSentence initWithSourceText:targetPhrases:selectedPhraseIndex:]([_LTDisambiguableSentence alloc], "initWithSourceText:targetPhrases:selectedPhraseIndex:", v9, v11, 0);
          v70 = [_LTDisambiguableResult alloc];
          v124 = v69;
          objc_msgSend(*(id *)(v8 + 3632), "arrayWithObjects:count:", &v124, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v70;
          v13 = v69;
          v72 = -[_LTDisambiguableResult initWithSentences:](v71, "initWithSentences:", v14);
LABEL_132:

          v10 = v107;
LABEL_137:

        }
      }
      else
      {

        v72 = 0;
      }

    }
    else
    {

      v72 = 0;
    }

  }
  else
  {

    v72 = 0;
  }

  return v72;
}

- (_LTDisambiguableResult)initWithSentences:(id)a3
{
  id v4;
  _LTDisambiguableResult *v5;
  uint64_t v6;
  NSArray *sentences;
  _LTDisambiguableResult *v8;
  NSObject *v9;
  uint8_t v11[16];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LTDisambiguableResult;
  v5 = -[_LTDisambiguableResult init](&v12, sel_init);
  if (!v5)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "count"))
  {
    v9 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_235438000, v9, OS_LOG_TYPE_INFO, "Not creating disambiguable result because there's no sentences to create it with", v11, 2u);
    }
    goto LABEL_6;
  }
  v6 = objc_msgSend(v4, "copy");
  sentences = v5->_sentences;
  v5->_sentences = (NSArray *)v6;

  -[_LTDisambiguableResult _commonInit](v5, "_commonInit");
  v8 = v5;
LABEL_7:

  return v8;
}

- (_LTDisambiguableResult)initWithSentences:(id)a3 joinedWithString:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _LTDisambiguableResult *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t);
  void *v17;
  id v18;
  id v19;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDBCEB8];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithCapacity:", objc_msgSend(v8, "count"));
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __61___LTDisambiguableResult_initWithSentences_joinedWithString___block_invoke;
  v17 = &unk_2506932E0;
  v18 = v6;
  v19 = v9;
  v10 = v9;
  v11 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v14);

  v12 = -[_LTDisambiguableResult initWithSentences:](self, "initWithSentences:", v10, v14, v15, v16, v17);
  return v12;
}

+ (id)combineResults:(id)a3 joinedWithString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t);
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __58___LTDisambiguableResult_combineResults_joinedWithString___block_invoke;
  v21 = &unk_250693308;
  v22 = v7;
  v9 = v8;
  v23 = v9;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v18);
  v11 = objc_alloc((Class)a1);
  v12 = (void *)objc_msgSend(v11, "initWithSentences:", v9, v18, v19, v20, v21);
  v13 = _LTOSLogDisambiguation();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = v13;
    v16 = objc_msgSend(v6, "count");
    v17 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134218498;
    v25 = v16;
    v26 = 2048;
    v27 = v17;
    v28 = 2114;
    v29 = v12;
    _os_log_debug_impl(&dword_235438000, v15, OS_LOG_TYPE_DEBUG, "Combined %zu disambiguationResults with total of %zu sentences into combined disambiguationResult: %{public}@", buf, 0x20u);

  }
  return v12;
}

+ (id)combinedDisambiguableResultFromTranslationResults:(id)a3 joinedWithString:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  objc_msgSend(v4, "_ltCompactMap:", &__block_literal_global_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 == objc_msgSend(v4, "count"))
  {
    +[_LTDisambiguableResult combineResults:joinedWithString:](_LTDisambiguableResult, "combineResults:joinedWithString:", v5, CFSTR(" "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasDisambiguations");
    v9 = _LTOSLogDisambiguation();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        +[_LTDisambiguableResult combinedDisambiguableResultFromTranslationResults:joinedWithString:].cold.1((uint64_t)v7, v10, v4);
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_235438000, v10, OS_LOG_TYPE_INFO, "Combined paragraph disambiguableResult has no disambiguations, but returning it anyway since it may be later combined with other disambiguable results", v13, 2u);
    }
  }
  else
  {
    v11 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[_LTDisambiguableResult combinedDisambiguableResultFromTranslationResults:joinedWithString:].cold.2(v11, v5, v4);
    v7 = 0;
  }

  return v7;
}

- (id)sentenceWithUUID:(id)a3
{
  id v4;
  void *v5;
  NSArray *sentences;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    sentences = self->_sentences;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __43___LTDisambiguableResult_sentenceWithUUID___block_invoke;
    v9[3] = &unk_250693330;
    v10 = v4;
    -[NSArray lt_firstObjectPassingTest:](sentences, "lt_firstObjectPassingTest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)targetText
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_sentences;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "targetText", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSString *)v10;
}

- (NSString)sourceText
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_sentences;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "sourceText", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSString *)v10;
}

- (NSString)romanization
{
  void *v3;
  NSUInteger v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSUInteger v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  NSUInteger v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[NSArray _ltCompactMap:](self->_sentences, "_ltCompactMap:", &__block_literal_global_8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSArray count](self->_sentences, "count");
  if (v4 == objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", &stru_250695360);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = _LTOSLogRomanization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = objc_msgSend(v3, "count");
      v9 = -[NSArray count](self->_sentences, "count");
      v11 = 134218240;
      v12 = v8;
      v13 = 2048;
      v14 = v9;
      _os_log_impl(&dword_235438000, v7, OS_LOG_TYPE_INFO, "Not returning romanization for disambiguable result since only %zu out of %zu sentences had romanization", (uint8_t *)&v11, 0x16u);

    }
    v5 = 0;
  }

  return (NSString *)v5;
}

- (id)generateAttributedStringForLocation:(unint64_t)a3 withGlobalAttributes:(id)a4 attributeProvider:(id)a5
{
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v20 = WeakRetained;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "excludedTypesForResult:", self, WeakRetained);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_alloc_init(MEMORY[0x24BDD1688]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[_LTDisambiguableResult sentences](self, "sentences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "_generateAttributedStringForLocation:result:excludedTypes:globalAttributes:attributeProvider:", a3, self, v10, v21, v8, v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendAttributedString:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  v18 = (void *)objc_msgSend(v11, "copy");
  return v18;
}

- (BOOL)hasDisambiguations
{
  return -[NSArray lt_hasObjectPassingTest:](self->_sentences, "lt_hasObjectPassingTest:", &__block_literal_global_14);
}

- (BOOL)hasDisambiguationsOfType:(unint64_t)a3
{
  NSArray *sentences;
  _QWORD v5[5];

  sentences = self->_sentences;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51___LTDisambiguableResult_hasDisambiguationsOfType___block_invoke;
  v5[3] = &__block_descriptor_40_e34_B16__0___LTDisambiguableSentence_8l;
  v5[4] = a3;
  return -[NSArray lt_hasObjectPassingTest:](sentences, "lt_hasObjectPassingTest:", v5);
}

+ (BOOL)isGenderDisambiguationEnabled
{
  if (isGenderDisambiguationEnabled_onceToken != -1)
    dispatch_once(&isGenderDisambiguationEnabled_onceToken, &__block_literal_global_16);
  return isGenderDisambiguationEnabled_isGenderDisambiguationEnabled;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (NSArray)observers
{
  void *v2;
  void *v3;

  -[NSHashTable allObjects](self->_observers, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUInteger v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSArray count](self->_sentences, "count");
  -[_LTDisambiguableResult hasDisambiguations](self, "hasDisambiguations");
  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; number of sentences: %zu; hasDisambiguations: %@>"),
    v5,
    self,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)_insertPrefix:(id)a3
{
  NSArray *sentences;
  id v4;
  id v5;

  sentences = self->_sentences;
  v4 = a3;
  -[NSArray firstObject](sentences, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_insertPrefix:", v4);

}

- (void)disambiguableSentence:(id)a3 didSelectNode:(id)a4 atIndex:(unint64_t)a5 withSelection:(id)a6
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "disambiguableResult:didChangeResultForSentence:withSelection:", self, v8, v9);

  }
  v18 = v8;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "disambiguableResultDidUpdate:", self);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

}

- (id)excludedTypesForDisambiguableSentence:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "excludedTypesForResult:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_sentences, CFSTR("sentences"));
}

- (_LTDisambiguableResult)initWithCoder:(id)a3
{
  id v4;
  _LTDisambiguableResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *sentences;
  _LTDisambiguableResult *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTDisambiguableResult;
  v5 = -[_LTDisambiguableResult init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sentences"));
    v9 = objc_claimAutoreleasedReturnValue();
    sentences = v5->_sentences;
    v5->_sentences = (NSArray *)v9;

    -[_LTDisambiguableResult _commonInit](v5, "_commonInit");
    v11 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "allocWithZone:"), "initWithArray:copyItems:", self->_sentences, 1);
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSentences:", v4);

  return v5;
}

- (void)_commonInit
{
  NSHashTable *v3;
  NSHashTable *observers;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
  v3 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  observers = self->_observers;
  self->_observers = v3;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_sentences;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setDelegate:", self, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSArray)sentences
{
  return self->_sentences;
}

- (_LTDisambiguableResultDelegate)delegate
{
  return (_LTDisambiguableResultDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sentences, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (void)combinedDisambiguableResultFromTranslationResults:(void *)a3 joinedWithString:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_msgSend(a3, "count");
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_235438000, v4, OS_LOG_TYPE_DEBUG, "Created combined disambiguation result: %{public}@; from %zu individual translation results",
    v5,
    0x16u);

  OUTLINED_FUNCTION_0_0();
}

+ (void)combinedDisambiguableResultFromTranslationResults:(void *)a3 joinedWithString:.cold.2(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "count");
  objc_msgSend(a3, "count");
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_235438000, v5, OS_LOG_TYPE_ERROR, "Unable to create combined paragraph disambiguableResult from array of translationResults because only %zu out of %zu translationResults had disambiguableResults set", v6, 0x16u);

  OUTLINED_FUNCTION_0_0();
}

@end
