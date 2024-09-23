@implementation ExpandTranscription

void __ExpandTranscription_block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;

  v5 = a2;
  objc_msgSend(v5, "alternativeSubstrings");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alternativeConfidences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v16, "mutableCopy");
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v5, "substring");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:atIndex:", v9, 0);

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "confidence");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertObject:atIndex:", v11, 0);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __ExpandTranscription_block_invoke_2;
  v17[3] = &unk_1E64856F8;
  v18 = a1[4];
  v19 = v5;
  v20 = v7;
  v21 = v8;
  v25 = a3;
  v22 = v6;
  v23 = a1[5];
  v24 = a1[6];
  v12 = v6;
  v13 = v8;
  v14 = v7;
  v15 = v5;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v17);

}

void __ExpandTranscription_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  SFTranscriptionSegment *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  SFTranscriptionSegment *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  int v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  SFTranscription *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id *v57;
  void *v58;
  id obj;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "segments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subarrayWithRange:", 0, *(_QWORD *)(a1 + 88));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addObjectsFromArray:", v7);

  v8 = objc_msgSend(*(id *)(a1 + 40), "substringRange");
  v60 = v9;
  v62 = v8;
  v10 = objc_msgSend(v5, "length");
  v11 = a3 + 1;
  objc_msgSend(*(id *)(a1 + 48), "removeObjectAtIndex:", a3 + 1);
  objc_msgSend(*(id *)(a1 + 56), "removeObjectAtIndex:", a3 + 1);
  objc_msgSend(*(id *)(a1 + 64), "objectAtIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [SFTranscriptionSegment alloc];
  objc_msgSend(*(id *)(a1 + 40), "timestamp");
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 40), "duration");
  v17 = v16;
  objc_msgSend(v12, "floatValue");
  v19 = v18;
  v20 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  v21 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
  objc_msgSend(*(id *)(a1 + 40), "phoneSequence");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "ipaPhoneSequence");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = v19;
  v25 = -[SFTranscriptionSegment _initWithSubstring:range:timestamp:duration:confidence:alternativeSubstrings:alternativeConfidences:phoneSequence:ipaPhoneSequence:voiceAnalytics:](v13, "_initWithSubstring:range:timestamp:duration:confidence:alternativeSubstrings:alternativeConfidences:phoneSequence:ipaPhoneSequence:voiceAnalytics:", v5, v62, v10, v20, v21, v22, v15, v17, v24, v23, 0);

  v58 = v5;
  objc_msgSend(*(id *)(a1 + 48), "insertObject:atIndex:", v5, v11);
  v56 = v12;
  objc_msgSend(*(id *)(a1 + 56), "insertObject:atIndex:", v12, v11);
  v55 = (void *)v25;
  objc_msgSend(v64, "addObject:", v25);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v57 = (id *)a1;
  objc_msgSend(*(id *)(a1 + 72), "subarrayWithRange:", *(_QWORD *)(a1 + 88) + 1, objc_msgSend(*(id *)(a1 + 72), "count") + ~*(_QWORD *)(a1 + 88));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v26)
  {
    v27 = v26;
    v63 = v10 - v60;
    v61 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v66 != v61)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        v30 = objc_msgSend(v29, "substringRange");
        v32 = v31;
        v33 = v63 + v30;
        v34 = [SFTranscriptionSegment alloc];
        objc_msgSend(v29, "substring");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timestamp");
        v37 = v36;
        objc_msgSend(v29, "duration");
        v39 = v38;
        objc_msgSend(v29, "confidence");
        v41 = v40;
        objc_msgSend(v29, "alternativeSubstrings");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "alternativeConfidences");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "phoneSequence");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "ipaPhoneSequence");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v46) = v41;
        v47 = -[SFTranscriptionSegment _initWithSubstring:range:timestamp:duration:confidence:alternativeSubstrings:alternativeConfidences:phoneSequence:ipaPhoneSequence:voiceAnalytics:](v34, "_initWithSubstring:range:timestamp:duration:confidence:alternativeSubstrings:alternativeConfidences:phoneSequence:ipaPhoneSequence:voiceAnalytics:", v35, v33, v32, v42, v43, v44, v37, v39, v46, v45, 0);

        objc_msgSend(v64, "addObject:", v47);
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    }
    while (v27);
  }

  objc_msgSend(v57[4], "formattedString");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v57[5], "substringRange");
  objc_msgSend(v48, "stringByReplacingCharactersInRange:withString:", v49, v50, v58);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = [SFTranscription alloc];
  v53 = (void *)objc_msgSend(v64, "copy");
  v54 = -[SFTranscription _initWithSegments:formattedString:speakingRate:averagePauseDuration:](v52, "_initWithSegments:formattedString:speakingRate:averagePauseDuration:", v53, v51, 0.0, 0.0);

  objc_msgSend(v57[10], "addObject:", v54);
}

@end
