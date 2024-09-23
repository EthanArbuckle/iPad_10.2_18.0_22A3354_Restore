@implementation CSTopHitResult

- (CSTopHitResult)initWithRankingItem:(id)a3 resultItem:(id)a4
{
  id v7;
  CSTopHitResult *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char isKindOfClass;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)CSTopHitResult;
  v8 = -[TopHitResult initWithRankingItem:](&v24, sel_initWithRankingItem_, a3);
  if (v8)
  {
    objc_msgSend(v7, "attributeSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributeDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("kMDQueryResultNewMatchedExtraQueriesField"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v11, "length") == 16)
    {
      v12 = (uint64_t *)objc_msgSend(objc_retainAutorelease(v11), "bytes");
      v13 = *v12;
      v14 = v12[1];
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
    -[TopHitResult setScore:](v8, "setScore:", v13, v14);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMDQueryResultScoreL1"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    LODWORD(v17) = 0;
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v15, "floatValue", v17);
    -[TopHitResult setScoreL1:](v8, "setScoreL1:", v17);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_kMDItemBundleID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TopHitResult setBundleID:](v8, "setBundleID:", v18);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_kMDItemExternalID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TopHitResult setIdentifier:](v8, "setIdentifier:", v19);

    objc_msgSend(v7, "protection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TopHitResult setDataclass:](v8, "setDataclass:", v20);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMDItemContentCreationDate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TopHitResult setInterestingDate:](v8, "setInterestingDate:", v21);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMDItemEmailConversationID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TopHitResult setThreadId:](v8, "setThreadId:", v22);

    objc_storeStrong((id *)&v8->_resultItem, a4);
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  float v15;
  void *v16;
  objc_super v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v18.receiver = self;
  v18.super_class = (Class)CSTopHitResult;
  -[CSTopHitResult description](&v18, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TopHitResult bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TopHitResult identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByPaddingToLength:withString:startingAtIndex:", 10, CFSTR(" "), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSTopHitResult resultItem](self, "resultItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributeDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_kMDItemExternalID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TopHitResult scoreL1](self, "scoreL1");
  v13 = v12;
  -[TopHitResult rankingItem](self, "rankingItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "l2Score");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ bid = %@ uid = %@ resultItem-uid = %@ L1 = %.04f, L2 = %.04f"), v4, v5, v7, v11, *(_QWORD *)&v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (CSSearchableItem)resultItem
{
  return self->_resultItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultItem, 0);
}

@end
