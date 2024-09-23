@implementation CMISRLHumanFaceHistory

- (CMISRLHumanFaceHistory)initWithFilterType:(int)a3 maxFaceHistory:(int)a4
{
  CMISRLHumanFaceHistory *v6;
  uint64_t v7;
  NSMutableArray *faceHistory;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMISRLHumanFaceHistory;
  v6 = -[CMISRLHumanFaceHistory init](&v10, sel_init);
  v7 = objc_opt_new();
  faceHistory = v6->_faceHistory;
  v6->_faceHistory = (NSMutableArray *)v7;

  v6->_filterType = a3;
  v6->_maxFaceHistory = a4;
  return v6;
}

- (id)addFaceAndFilter:(id)a3 frameId:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  NSMutableArray *faceHistory;
  void *v11;

  v6 = a3;
  -[NSMutableArray lastObject](self->_faceHistory, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "areSkinToneLevelsEqualTo:", v6);

  v9 = -[NSMutableArray count](self->_faceHistory, "count");
  faceHistory = self->_faceHistory;
  if (v9 && (v8 & 1) != 0)
  {
    -[NSMutableArray lastObject](faceHistory, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilteredSkinToneLevels:", objc_msgSend(v11, "FilteredSkinToneLevels"));

  }
  else
  {
    -[NSMutableArray addObject:](faceHistory, "addObject:", v6);
    if (-[NSMutableArray count](self->_faceHistory, "count") > (unint64_t)self->_maxFaceHistory)
      -[NSMutableArray removeObjectAtIndex:](self->_faceHistory, "removeObjectAtIndex:", 0);
    if (self->_filterType == 1)
      -[CMISRLHumanFaceHistory filterSkinToneLevels](self, "filterSkinToneLevels");
    else
      objc_msgSend(v6, "setFilteredSkinToneLevels:", objc_msgSend(v6, "SkinToneLevels"));
  }
  self->_lastUpdatedFrameId = a4;
  return v6;
}

- (void)filterSkinToneLevelsMedian
{
  void *v3;
  void *v4;
  id v5;

  if (-[NSMutableArray count](self->_faceHistory, "count"))
  {
    -[NSMutableArray sortedArrayUsingComparator:](self->_faceHistory, "sortedArrayUsingComparator:", &__block_literal_global_23);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", (unint64_t)(objc_msgSend(v5, "count") - 1) >> 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray lastObject](self->_faceHistory, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilteredSkinToneLevels:", objc_msgSend(v3, "SkinToneLevels"));

  }
}

uint64_t __52__CMISRLHumanFaceHistory_filterSkinToneLevelsMedian__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;

  v4 = a3;
  objc_msgSend(a2, "SkinToneLevelMapped");
  v6 = v5;
  objc_msgSend(v4, "SkinToneLevelMapped");
  v8 = v7;

  if (v6 >= v8)
    return 1;
  else
    return -1;
}

- (void)filterSkinToneLevels
{
  void *v3;
  id v4;

  if (-[NSMutableArray count](self->_faceHistory, "count") == 1)
  {
    -[NSMutableArray lastObject](self->_faceHistory, "lastObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray lastObject](self->_faceHistory, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilteredSkinToneLevels:", objc_msgSend(v3, "SkinToneLevels"));

  }
  else if (self->_filterType == 1)
  {
    -[CMISRLHumanFaceHistory filterSkinToneLevelsMedian](self, "filterSkinToneLevelsMedian");
  }
}

- (NSMutableArray)faceHistory
{
  return self->_faceHistory;
}

- (void)setFaceHistory:(id)a3
{
  objc_storeStrong((id *)&self->_faceHistory, a3);
}

- (unint64_t)lastUpdatedFrameId
{
  return self->_lastUpdatedFrameId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceHistory, 0);
}

@end
