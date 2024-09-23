@implementation GKPlayerActivityRelationshipAchievement

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__GKPlayerActivityRelationshipAchievement_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_394 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_394, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_393;
}

void __66__GKPlayerActivityRelationshipAchievement_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKPlayerActivityRelationshipAchievement;
  objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v6[0] = CFSTR("achDescription");
  v7[0] = objc_opt_class();
  v6[1] = CFSTR("timeStamp");
  v7[1] = objc_opt_class();
  v6[2] = CFSTR("progress");
  v7[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_393;
  secureCodedPropertyKeys_sSecureCodedKeys_393 = (uint64_t)v2;

}

- (GKPlayerActivityRelationshipAchievement)initWithDictionary:(id)a3
{
  id v4;
  GKPlayerActivityRelationshipAchievement *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKPlayerActivityRelationshipAchievement;
  v5 = -[GKPlayerActivityRelationshipBase initWithDictionary:](&v14, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("description"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityRelationshipAchievement setAchDescription:](v5, "setAchDescription:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v7, "doubleValue");
    v10 = (void *)objc_msgSend(v8, "initWithTimeIntervalSince1970:", v9 / 1000.0);
    -[GKPlayerActivityRelationshipAchievement setTimeStamp:](v5, "setTimeStamp:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("progress"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("progress"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayerActivityRelationshipAchievement setProgress:](v5, "setProgress:", objc_msgSend(v12, "integerValue"));

    }
    else
    {
      -[GKPlayerActivityRelationshipAchievement setProgress:](v5, "setProgress:", 100);
    }

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)GKPlayerActivityRelationshipAchievement;
  -[GKPlayerActivityRelationshipBase description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationshipAchievement achDescription](self, "achDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationshipAchievement timeStamp](self, "timeStamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKPlayerActivityRelationshipAchievement progress](self, "progress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \ndescription: %@, \ntimeStamp: %@, \nprogress: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)achDescription
{
  return self->_achDescription;
}

- (void)setAchDescription:(id)a3
{
  objc_storeStrong((id *)&self->_achDescription, a3);
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
  objc_storeStrong((id *)&self->_timeStamp, a3);
}

- (int64_t)progress
{
  return self->_progress;
}

- (void)setProgress:(int64_t)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_achDescription, 0);
}

@end
