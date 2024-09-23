@implementation VSKAsset(MediaAnalysis)

+ (const)mad_stringIdentifierPostfixForEmbeddingType:()MediaAnalysis
{
  int v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    return CFSTR("_1");
  v3 = a3;
  if (a3 == 2)
    return CFSTR("_2");
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VSKAsset+MediaAnalysis] Unexpected embedding type %u", (uint8_t *)v5, 8u);
  }
  return CFSTR("_0");
}

+ (id)mad_stringIdentifierFromLocalIdentifier:()MediaAnalysis embeddingType:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "mad_stringIdentifierPostfixForEmbeddingType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)mad_localIdentifierFromStringIdentifier:()MediaAnalysis
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mad_photosLocalIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "stringIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mad_localIdentifierFromStringIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)mad_hasImageEmbedding
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "stringIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "mad_stringIdentifierPostfixForEmbeddingType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "hasSuffix:", v2);

  return v3;
}

- (uint64_t)mad_hasVideoEmbedding
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "stringIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "mad_stringIdentifierPostfixForEmbeddingType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "hasSuffix:", v2);

  return v3;
}

+ (id)mad_stringIdentifiersFromLocalIdentifiers:()MediaAnalysis
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend((id)objc_opt_class(), "mad_stringIdentifierFromLocalIdentifier:embeddingType:", v10, 1, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        objc_msgSend((id)objc_opt_class(), "mad_stringIdentifierFromLocalIdentifier:embeddingType:", v10, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)mad_attributesWithEmbeddingVersion:()MediaAnalysis
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC6858], "mad_embeddingVersionAttribute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v5 = objc_alloc(MEMORY[0x1E0DC6878]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIntegerValue:", v6);
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)mad_assetsWithLocalIdentifier:()MediaAnalysis mediaAnalysisResults:
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CD1398], "uuidFromLocalIdentifier:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = +[VCPVideoTransformerBackbone embeddingVersion](VCPVideoTransformerBackbone, "embeddingVersion");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vcp_results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ImageEmbeddingResults"));
  v10 = objc_claimAutoreleasedReturnValue();

  VCPSignPostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  VCPSignPostLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v5;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "VSKAsset_preferredImageEmbeddingsForAssetUUID", "_%@", buf, 0xCu);
  }

  v46 = 0;
  +[MADEmbeddingStore preferredImageEmbeddingsForAssetUUID:fromImageEmbeddingResults:error:](MADEmbeddingStore, "preferredImageEmbeddingsForAssetUUID:fromImageEmbeddingResults:error:", v7, v10, &v46);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v46;
  VCPSignPostLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v5;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v18, OS_SIGNPOST_INTERVAL_END, v12, "VSKAsset_preferredImageEmbeddingsForAssetUUID", "_%@", buf, 0xCu);
  }
  v42 = (void *)v10;

  v41 = v15;
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC6850], "mad_stringIdentifierFromLocalIdentifier:embeddingType:", v5, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC6850], "mad_attributesWithEmbeddingVersion:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6850]), "initWithStringIdentifier:vectors:attributes:payload:", v19, v15, v20, 0);
    if (v21)
    {
      objc_msgSend(v44, "addObject:", v21);
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v48 = v5;
      v49 = 2112;
      v50 = v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to create VSKAsset with image embeddings %@", buf, 0x16u);
    }

  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v48 = v5;
    v49 = 2112;
    v50 = v16;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] No valid image embedding data (%@)", buf, 0x16u);
  }
  objc_msgSend(v6, "vcp_results", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("VideoEmbeddingResults"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "vcp_results");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AudioFusedVideoEmbeddingResults"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "vcp_results");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("SummarizedEmbeddingResults"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  VCPSignPostLog();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = os_signpost_id_generate(v28);

  VCPSignPostLog();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v5;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "VSKAsset_preferredVideoEmbeddingsForAssetUUID", "_%@", buf, 0xCu);
  }

  v45 = v16;
  v43 = (void *)v7;
  +[MADEmbeddingStore preferredVideoEmbeddingsForAssetUUID:fromVideoEmbeddingResults:audioFusedVideoEmbeddingResults:summarizedVideoEmbeddingResults:error:](MADEmbeddingStore, "preferredVideoEmbeddingsForAssetUUID:fromVideoEmbeddingResults:audioFusedVideoEmbeddingResults:summarizedVideoEmbeddingResults:error:", v7, v23, v25, v27, &v45);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v45;

  VCPSignPostLog();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v5;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v35, OS_SIGNPOST_INTERVAL_END, v29, "VSKAsset_preferredVideoEmbeddingsForAssetUUID", "_%@", buf, 0xCu);
  }

  if (objc_msgSend(v32, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC6850], "mad_stringIdentifierFromLocalIdentifier:embeddingType:", v5, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC6850], "mad_attributesWithEmbeddingVersion:", v40);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6850]), "initWithStringIdentifier:vectors:attributes:payload:", v36, v32, v37, 0);
    if (v38)
    {
      objc_msgSend(v44, "addObject:", v38);
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v48 = v5;
      v49 = 2112;
      v50 = v32;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to create VSKAsset with video embeddings %@", buf, 0x16u);
    }

  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v48 = v5;
    v49 = 2112;
    v50 = v33;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] No valid video embedding data (%@)", buf, 0x16u);
  }

  return v44;
}

@end
