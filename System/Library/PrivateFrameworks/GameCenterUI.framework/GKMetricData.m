@implementation GKMetricData

- (GKMetricData)init
{
  GKMetricData *v2;
  GKMetricData *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKMetricData;
  v2 = -[GKMetricData init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentMaxVisibleItemCount = -1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMetricData setHeaderPinnableAttributes:](v3, "setHeaderPinnableAttributes:", v4);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMetricData setFooterPinnableAttributes:](v3, "setFooterPinnableAttributes:", v5);

  }
  return v3;
}

- (id)localDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  GKGridLayoutMetrics *metrics;
  unint64_t currentMaxVisibleItemCount;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)GKMetricData;
  -[GKMetricData description](&v14, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_metrics)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[GKMetricData layoutKey](self, "layoutKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR(" layoutKey:'%@'"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    metrics = self->_metrics;
    currentMaxVisibleItemCount = self->_currentMaxVisibleItemCount;
    if (metrics)
    {
      -[GKGridLayoutMetrics localDescription](metrics, "localDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@: maxVis:%ld %@"), v5, v8, currentMaxVisibleItemCount, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@: maxVis:%ld %@"), v5, v8, self->_currentMaxVisibleItemCount, &stru_1E59EB978);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@: maxVis:%ld %@"), v4, &stru_1E59EB978, self->_currentMaxVisibleItemCount, &stru_1E59EB978);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)description
{
  return -[GKMetricData _gkDescriptionWithChildren:](self, "_gkDescriptionWithChildren:", 0);
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GKGridLayoutMetrics *metrics;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  _gkTabStringForTabLevel();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)GKMetricData;
  -[GKMetricData description](&v18, sel_description);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (self->_metrics)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[GKMetricData layoutKey](self, "layoutKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR(" layoutKey:'%@'"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("%@%@: maxVis:%ld {"), v8, v11, self->_currentMaxVisibleItemCount);

  }
  else
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("%@%@: maxVis:%ld {"), v7, &stru_1E59EB978, self->_currentMaxVisibleItemCount);
  }

  metrics = self->_metrics;
  if (metrics)
  {
    -[GKGridLayoutMetrics _gkDescriptionWithChildren:](metrics, "_gkDescriptionWithChildren:", a3 + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "appendFormat:", CFSTR("\n%@    sectionMetrics: %@"), v5, v15);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@}\n"), v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v16);

  return v6;
}

- (void)setMetrics:(id)a3
{
  GKGridLayoutMetrics *v5;
  unint64_t v6;
  GKGridLayoutMetrics *v7;

  v5 = (GKGridLayoutMetrics *)a3;
  if (self->_metrics != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->_currentMaxVisibleItemCount != -1)
      {
LABEL_7:
        objc_storeStrong((id *)&self->_metrics, a3);
        v5 = v7;
        goto LABEL_8;
      }
      v6 = -[GKGridLayoutMetrics maximumVisibleItemCount](v7, "maximumVisibleItemCount");
    }
    else
    {
      v6 = -1;
    }
    self->_currentMaxVisibleItemCount = v6;
    goto LABEL_7;
  }
LABEL_8:

}

- (GKSectionMetrics)sectionMetrics
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutPrivate.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ ([_metrics isKindOfClass:[GKSectionMetrics class]])\n[%s (%s:%d)]"), v4, "-[GKMetricData sectionMetrics]", objc_msgSend(v6, "UTF8String"), 81);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  }
  return (GKSectionMetrics *)self->_metrics;
}

- (NSString)layoutKey
{
  GKGridLayoutMetrics *metrics;
  __CFString *v3;

  metrics = self->_metrics;
  if (metrics)
  {
    -[GKGridLayoutMetrics layoutKey](metrics, "layoutKey");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E59EB978;
  }
  return (NSString *)v3;
}

- (void)addAttributes:(id)a3 forLocation:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a3;
  if (!a4)
  {
    v7 = 32;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v7 = 40;
LABEL_5:
    v8 = v6;
    objc_msgSend(*(id *)((char *)&self->super.isa + v7), "addObjectsFromArray:", v6);
    v6 = v8;
  }

}

- (GKGridLayoutMetrics)metrics
{
  return self->_metrics;
}

- (unint64_t)currentMaxVisibleItemCount
{
  return self->_currentMaxVisibleItemCount;
}

- (void)setCurrentMaxVisibleItemCount:(unint64_t)a3
{
  self->_currentMaxVisibleItemCount = a3;
}

- (unint64_t)filteredTotalItemCount
{
  return self->_filteredTotalItemCount;
}

- (void)setFilteredTotalItemCount:(unint64_t)a3
{
  self->_filteredTotalItemCount = a3;
}

- (NSMutableArray)headerPinnableAttributes
{
  return self->_headerPinnableAttributes;
}

- (void)setHeaderPinnableAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_headerPinnableAttributes, a3);
}

- (NSMutableArray)footerPinnableAttributes
{
  return self->_footerPinnableAttributes;
}

- (void)setFooterPinnableAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_footerPinnableAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerPinnableAttributes, 0);
  objc_storeStrong((id *)&self->_headerPinnableAttributes, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
