@implementation ATXGlobalSmartSuppression

- (ATXGlobalSmartSuppression)init
{
  ATXGlobalSmartSuppression *v2;
  uint64_t v3;
  _PASCFBurstTrie *associationScoresTrie;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXGlobalSmartSuppression;
  v2 = -[ATXGlobalSmartSuppression init](&v6, sel_init);
  if (v2)
  {
    +[ATXGlobalAppScoresUtil initializeTrieAtPath:](ATXGlobalAppScoresUtil, "initializeTrieAtPath:", CFSTR("ATXGlobalAssociationScores"));
    v3 = objc_claimAutoreleasedReturnValue();
    associationScoresTrie = v2->_associationScoresTrie;
    v2->_associationScoresTrie = (_PASCFBurstTrie *)v3;

  }
  return v2;
}

- (id)fetchContextualAssociationScoresForBundleId:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[_PASCFBurstTrie payloadForString:](self->_associationScoresTrie, "payloadForString:", a3);
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[ATXGlobalSmartSuppression decodeAssociationScoreForContext:forEncodedScore:](ATXGlobalSmartSuppression, "decodeAssociationScoreForContext:forEncodedScore:", 1, v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("LOIType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[ATXGlobalSmartSuppression decodeAssociationScoreForContext:forEncodedScore:](ATXGlobalSmartSuppression, "decodeAssociationScoreForContext:forEncodedScore:", 2, v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("PartOfWeek"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[ATXGlobalSmartSuppression decodeAssociationScoreForContext:forEncodedScore:](ATXGlobalSmartSuppression, "decodeAssociationScoreForContext:forEncodedScore:", 3, v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("CoarseTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[ATXGlobalSmartSuppression decodeGeoAssociationScoreAtGeoHashResolution:forEncodedScore:](ATXGlobalSmartSuppression, "decodeGeoAssociationScoreAtGeoHashResolution:forEncodedScore:", 2, v3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("GeohashZoom7"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[ATXGlobalSmartSuppression decodeGeoAssociationScoreAtGeoHashResolution:forEncodedScore:](ATXGlobalSmartSuppression, "decodeGeoAssociationScoreAtGeoHashResolution:forEncodedScore:", 1, v3));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("GeohashCoarse"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[ATXGlobalSmartSuppression decodeGeoAssociationScoreAtGeoHashResolution:forEncodedScore:](ATXGlobalSmartSuppression, "decodeGeoAssociationScoreAtGeoHashResolution:forEncodedScore:", 0, v3));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("GeohashSpecific"));

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

+ (int)decodeAssociationScoreForContext:(unint64_t)a3 forEncodedScore:(int)a4
{
  NSObject *v4;
  int result;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  switch(a3)
  {
    case 0uLL:
      __atxlog_handle_app_prediction();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        +[ATXGlobalSmartSuppression decodeAssociationScoreForContext:forEncodedScore:].cold.1(v4);

      result = 0;
      break;
    case 1uLL:
      result = ((__int16)((33555 * (a4 % 10000)) >> 16) >> 9)
             + (((a4 % 10000 + ((-31981 * (a4 % 10000)) >> 16)) & 0x8000) >> 15);
      break;
    case 2uLL:
      v6 = 1759218605 * (a4 % 100000);
      v7 = (unint64_t)v6 >> 63;
      v8 = v6 >> 44;
      goto LABEL_9;
    case 3uLL:
      v9 = 351843721 * (a4 % 1000000);
      v7 = (unint64_t)v9 >> 63;
      v8 = v9 >> 45;
LABEL_9:
      result = v8 + v7;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (int)decodeGeoAssociationScoreAtGeoHashResolution:(unint64_t)a3 forEncodedScore:(int)a4
{
  int v4;
  int v6;

  switch(a3)
  {
    case 0uLL:
      return a4 % 10;
    case 1uLL:
      v6 = 103 * (char)(a4 - 100 * (((unint64_t)(1374389535 * a4) >> 37) + (1374389535 * a4 < 0)));
      return ((v6 >> 15) & 1) + (v6 >> 10);
    case 2uLL:
      v4 = 5243
         * (__int16)(a4
                   - 1000
                   * (((unint64_t)(274877907 * a4) >> 38) + ((unint64_t)(274877907 * a4) >> 63)));
      return (v4 >> 19) + (v4 >> 31);
    default:
      return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associationScoresTrie, 0);
}

+ (void)decodeAssociationScoreForContext:(os_log_t)log forEncodedScore:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Invalid argument: _ATXAssociationScoreContextGeoHash. To fectch geo association scores for this context, use fetchGeoAssociationScoreForBundleId.", v1, 2u);
}

@end
