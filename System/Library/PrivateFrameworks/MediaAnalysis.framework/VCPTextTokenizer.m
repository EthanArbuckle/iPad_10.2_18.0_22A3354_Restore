@implementation VCPTextTokenizer

- (VCPTextTokenizer)init
{
  VCPTextTokenizer *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VCPTextTokenizer;
  v2 = -[VCPTextTokenizer init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_cache, "setObject:forKeyedSubscript:", CFSTR("<|startoftext|>"), CFSTR("<|startoftext|>"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_cache, "setObject:forKeyedSubscript:", CFSTR("<|endoftext|>"), CFSTR("<|endoftext|>"));
  }
  return v2;
}

- (id)whitespaceClean:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v12;

  v3 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\s+"), 0, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error creating regex: %@"), v7);

    v8 = v3;
  }
  else
  {
    objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), CFSTR(" "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)textPreProcessing:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[VCPTextTokenizer whitespaceClean:](self, "whitespaceClean:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("<\\|startoftext\\|>|<\\|endoftext\\|>|'s|'t|'re|'ve|'m|'ll|'d|[[:alpha:]]+|[[:digit:]]|[^\\s[:alpha:][:digit:]]+"), 1, &v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v23;
  if (v6)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error creating regex: %@", buf, 0xCu);

    }
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v11);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "range", (_QWORD)v19);
          objc_msgSend(v4, "substringWithRange:", v15, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)bytePairEncoding:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t j;
  void *v19;
  NSDictionary *bpeRanks;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  id v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  unint64_t k;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int16 v63;
  _QWORD v64[2];
  _BYTE v65[128];
  void *v66;
  _QWORD v67[2];
  _QWORD v68[3];

  v68[1] = *MEMORY[0x1E0C80C00];
  v52 = a3;
  -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v52);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v52, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v57 = v7;
  while (v8 < objc_msgSend(v52, "length") - 1)
  {
    v63 = 0;
    v63 = objc_msgSend(v52, "characterAtIndex:", v8);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v63, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

    ++v8;
    v7 = v57;
  }
  v63 = 0;
  v63 = objc_msgSend(v52, "characterAtIndex:", objc_msgSend(v52, "length") - 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v63, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "stringByAppendingString:", CFSTR("</w>"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 1; i < objc_msgSend(v7, "count"); ++i)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", i);
    v11 = objc_claimAutoreleasedReturnValue();
    v67[0] = v53;
    v67[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObject:", v12);

    v53 = (void *)v11;
    v7 = v57;
  }
  if (!v54)
  {
    objc_msgSend(v52, "stringByAppendingString:", CFSTR("</w>"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    goto LABEL_44;
  }
  do
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v54;
    v13 = 0;
    v14 = 0;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v60;
      v17 = INFINITY;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v60 != v16)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
          bpeRanks = self->_bpeRanks;
          objc_msgSend(v19, "componentsJoinedByString:", CFSTR(" "));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKey:](bpeRanks, "objectForKey:", v21);
          v22 = objc_claimAutoreleasedReturnValue();

          if (v22)
            v23 = (void *)v22;
          else
            v23 = &unk_1E6B71E60;
          objc_msgSend(v23, "doubleValue");
          if (v24 < v17)
          {
            objc_msgSend(v23, "doubleValue");
            v17 = v25;
            objc_msgSend(v19, "componentsJoinedByString:", CFSTR(" "));
            v26 = objc_claimAutoreleasedReturnValue();

            v27 = v19;
            v13 = v27;
            v14 = (void *)v26;
          }

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      }
      while (v15);
    }

    -[NSDictionary objectForKey:](self->_bpeRanks, "objectForKey:", v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == 0;

    if (v29)
    {

      v41 = v57;
      v54 = obj;
      break;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v57;
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    while (v31 < objc_msgSend(v30, "count"))
    {
      v32 = objc_msgSend(v57, "indexOfObject:inRange:", v56, v31, objc_msgSend(v30, "count") - v31);
      v33 = v32;
      if (v32 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v57, "subarrayWithRange:", v31, objc_msgSend(v57, "count") - v31);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addObjectsFromArray:", v40);

        v30 = v57;
        break;
      }
      objc_msgSend(v57, "subarrayWithRange:", v31, v32 - v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addObjectsFromArray:", v34);

      objc_msgSend(v57, "objectAtIndexedSubscript:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "isEqualToString:", v56) && v33 < objc_msgSend(v57, "count") - 1)
      {
        objc_msgSend(v57, "objectAtIndexedSubscript:", v33 + 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isEqualToString:", v51);

        if (!v37)
          goto LABEL_31;
        objc_msgSend(v56, "stringByAppendingString:", v51);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addObject:", v38);

        v31 = v33 + 2;
        v30 = v57;
      }
      else
      {

LABEL_31:
        objc_msgSend(v57, "objectAtIndexedSubscript:", v33);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addObject:", v39);

        v31 = v33 + 1;
        v30 = v57;
      }
    }
    v41 = v55;

    v42 = objc_msgSend(v41, "count");
    if (v42 == 1)
    {
      v54 = obj;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      for (k = 1; k < objc_msgSend(v41, "count"); ++k)
      {
        objc_msgSend(v41, "objectAtIndexedSubscript:", k);
        v45 = objc_claimAutoreleasedReturnValue();
        v64[0] = v43;
        v64[1] = v45;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addObject:", v46);

        v43 = (void *)v45;
      }

    }
    v57 = v41;
  }
  while (v42 != 1);
  objc_msgSend(v41, "componentsJoinedByString:", CFSTR(" "));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v47, v52);
  v6 = v41;
  v57 = v6;
LABEL_44:

  v5 = v57;
LABEL_45:

  return v6;
}

- (id)encode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  id v9;
  NSDictionary *encoder;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  id v16;
  NSDictionary *decoder;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSDictionary *v22;
  id v23;
  NSDictionary *bytesToUnicode;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSDictionary *v29;
  id v30;
  NSDictionary *bpeRanks;
  void *v32;
  void *v33;
  void *v34;
  unint64_t i;
  unsigned int v36;
  void *v37;
  id v38;
  uint64_t v39;
  unint64_t j;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSDictionary *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v57;
  id v58;
  void *v59;
  id obj;
  void *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  id v79;
  id v80;
  id v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v58 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceURL");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_encoder)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("encoder.json"), v59);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v81);
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = v81;
    encoder = self->_encoder;
    self->_encoder = v8;

    if (v9 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v86 = v11;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error reading JSON file: %@", buf, 0xCu);

    }
  }
  if (!self->_decoder)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("decoder.json"), v59);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v14, 0, &v80);
    v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v16 = v80;
    decoder = self->_decoder;
    self->_decoder = v15;

    if (v16 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v86 = v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error reading JSON file: %@", buf, 0xCu);

    }
  }
  if (!self->_bytesToUnicode)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("bytes_to_unicode.json"), v59);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v21, 0, &v79);
    v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v23 = v79;
    bytesToUnicode = self->_bytesToUnicode;
    self->_bytesToUnicode = v22;

    if (v23 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v23, "localizedDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v86 = v25;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error reading JSON file: %@", buf, 0xCu);

    }
  }
  if (!self->_bpeRanks)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("bpe_ranks.json"), v59);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v28, 0, &v78);
    v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v30 = v78;
    bpeRanks = self->_bpeRanks;
    self->_bpeRanks = v29;

    if (v30 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v30, "localizedDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v86 = v32;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error reading JSON file: %@", buf, 0xCu);

    }
  }
  -[VCPTextTokenizer textPreProcessing:](self, "textPreProcessing:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (id)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v57;
  v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
  if (v64)
  {
    v62 = *(_QWORD *)v75;
    do
    {
      v65 = 0;
      do
      {
        if (*(_QWORD *)v75 != v62)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v65);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i < objc_msgSend(v33, "length"); ++i)
        {
          v36 = objc_msgSend(v33, "characterAtIndex:", i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "dataUsingEncoding:", 4);
          v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v39 = objc_msgSend(v38, "bytes");
          for (j = 0; j < objc_msgSend(v38, "length"); ++j)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v39 + j));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v41);

          }
        }
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E6B1C190);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v43 = v34;
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
        if (v44)
        {
          v45 = *(_QWORD *)v71;
          do
          {
            v46 = 0;
            do
            {
              if (*(_QWORD *)v71 != v45)
                objc_enumerationMutation(v43);
              v47 = self->_bytesToUnicode;
              objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v46), "stringValue");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary objectForKeyedSubscript:](v47, "objectForKeyedSubscript:", v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "appendString:", v49);

              ++v46;
            }
            while (v44 != v46);
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
          }
          while (v44);
        }

        -[VCPTextTokenizer bytePairEncoding:](self, "bytePairEncoding:", v42);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v51 = v61;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
        if (v52)
        {
          v53 = *(_QWORD *)v67;
          do
          {
            v54 = 0;
            do
            {
              if (*(_QWORD *)v67 != v53)
                objc_enumerationMutation(v51);
              -[NSDictionary objectForKeyedSubscript:](self->_encoder, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v54));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (v55)
                objc_msgSend(v50, "addObject:", v55);

              ++v54;
            }
            while (v52 != v54);
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
          }
          while (v52);
        }

        objc_msgSend(v63, "addObjectsFromArray:", v50);
        ++v65;
      }
      while (v65 != v64);
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    }
    while (v64);
  }

  objc_msgSend(v63, "insertObject:atIndex:", &unk_1E6B726F8, 0);
  objc_msgSend(v63, "addObject:", &unk_1E6B72710);

  return v63;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_bpeRanks, 0);
  objc_storeStrong((id *)&self->_bytesToUnicode, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_encoder, 0);
}

@end
