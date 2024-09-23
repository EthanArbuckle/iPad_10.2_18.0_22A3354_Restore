@implementation HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent

- (HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent *v14;
  HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent *v15;
  uint64_t v16;
  NSNumber *unknownPersonCountTotal;
  objc_super v19;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceCropCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    NSLog(CFSTR("Error: Object for HFAnalyticsFaceRecognitionRecentVisitorsListFaceCropCountKey is nil"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clusteredNoNamePersonCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10)
    NSLog(CFSTR("Error: Object for HFAnalyticsFaceRecognitionRecentVisitorsListClusteredNoNamePersonCountKey is nil"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unknownFaceCropCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (!v13)
    NSLog(CFSTR("Error: Object for HFAnalyticsFaceRecognitionRecentVisitorsListUnknownFaceCropCountKey is nil"));
  v19.receiver = self;
  v19.super_class = (Class)HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent;
  v14 = -[HFAnalyticsEvent initWithEventType:](&v19, sel_initWithEventType_, 7);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_faceCropCount, v6);
    objc_storeStrong((id *)&v15->_clusteredNoNamePersonCount, v9);
    objc_storeStrong((id *)&v15->_unknownFaceCropCount, v12);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "unsignedIntegerValue") + objc_msgSend(v10, "unsignedIntegerValue"));
    v16 = objc_claimAutoreleasedReturnValue();
    unknownPersonCountTotal = v15->_unknownPersonCountTotal;
    v15->_unknownPersonCountTotal = (NSNumber *)v16;

  }
  return v15;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent;
  -[HFAnalyticsEvent payload](&v10, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent faceCropCount](self, "faceCropCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("faceCropCount"));

  -[HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent clusteredNoNamePersonCount](self, "clusteredNoNamePersonCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("clusteredNoNamePersonCount"));

  -[HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent unknownFaceCropCount](self, "unknownFaceCropCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("unknownFaceCropCount"));

  -[HFAnalyticsFaceRecognitionRecentVisitorsListCountEvent unknownPersonCountTotal](self, "unknownPersonCountTotal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, CFSTR("unknownCountIdentityTotal"));

  return v4;
}

- (NSNumber)faceCropCount
{
  return self->_faceCropCount;
}

- (void)setFaceCropCount:(id)a3
{
  objc_storeStrong((id *)&self->_faceCropCount, a3);
}

- (NSNumber)clusteredNoNamePersonCount
{
  return self->_clusteredNoNamePersonCount;
}

- (void)setClusteredNoNamePersonCount:(id)a3
{
  objc_storeStrong((id *)&self->_clusteredNoNamePersonCount, a3);
}

- (NSNumber)unknownFaceCropCount
{
  return self->_unknownFaceCropCount;
}

- (void)setUnknownFaceCropCount:(id)a3
{
  objc_storeStrong((id *)&self->_unknownFaceCropCount, a3);
}

- (NSNumber)unknownPersonCountTotal
{
  return self->_unknownPersonCountTotal;
}

- (void)setUnknownPersonCountTotal:(id)a3
{
  objc_storeStrong((id *)&self->_unknownPersonCountTotal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownPersonCountTotal, 0);
  objc_storeStrong((id *)&self->_unknownFaceCropCount, 0);
  objc_storeStrong((id *)&self->_clusteredNoNamePersonCount, 0);
  objc_storeStrong((id *)&self->_faceCropCount, 0);
}

@end
