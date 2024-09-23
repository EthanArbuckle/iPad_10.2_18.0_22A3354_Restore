@implementation CMISubjectRelightingANSTSkinToneLevelFilter

- (CMISubjectRelightingANSTSkinToneLevelFilter)initWithFilterType:(int)a3 maxAgeFrames:(int)a4 maxFaceHistory:(int)a5
{
  CMISubjectRelightingANSTSkinToneLevelFilter *v8;
  uint64_t v9;
  NSMutableDictionary *historyPerGroupId;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMISubjectRelightingANSTSkinToneLevelFilter;
  v8 = -[CMISubjectRelightingANSTSkinToneLevelFilter init](&v12, sel_init);
  v9 = objc_opt_new();
  historyPerGroupId = v8->_historyPerGroupId;
  v8->_historyPerGroupId = (NSMutableDictionary *)v9;

  v8->_filterType = a3;
  v8->_maxAgeFrames = a4;
  v8->_maxFaceHistory = a5;
  v8->_frameCount = 0;
  return v8;
}

- (BOOL)useHumanFaceObject:(id)a3 minFaceSize:(float)a4
{
  id v5;
  float v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = a3;
  objc_msgSend(v5, "SkinToneLevelMapped");
  if (v6 == 0.0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "Rect");
    v9 = v8;
    objc_msgSend(v5, "Rect");
    if (v9 >= v10)
      v11 = v9;
    else
      v11 = v10;
    v7 = v11 >= a4;
  }

  return v7;
}

- (id)filterSkinToneLevels:(id)a3 minFaceSize:(float)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  CMISRLHumanFace *v9;
  void *v10;
  CMISRLHumanFace *v11;
  double v12;
  NSMutableDictionary *historyPerGroupId;
  void *v14;
  CMISRLHumanFaceHistory *v15;
  NSMutableDictionary *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = *MEMORY[0x1E0D064D0];
  v35 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_opt_new();
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    do
    {
      v9 = [CMISRLHumanFace alloc];
      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CMISRLHumanFace initWithFaceObject:](v9, "initWithFaceObject:", v10);

      *(float *)&v12 = a4;
      if (-[CMISubjectRelightingANSTSkinToneLevelFilter useHumanFaceObject:minFaceSize:](self, "useHumanFaceObject:minFaceSize:", v11, v12))
      {
        historyPerGroupId = self->_historyPerGroupId;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CMISRLHumanFace FaceID](v11, "FaceID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](historyPerGroupId, "objectForKeyedSubscript:", v14);
        v15 = (CMISRLHumanFaceHistory *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v15 = -[CMISRLHumanFaceHistory initWithFilterType:maxFaceHistory:]([CMISRLHumanFaceHistory alloc], "initWithFilterType:maxFaceHistory:", self->_filterType, self->_maxFaceHistory);
          v16 = self->_historyPerGroupId;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CMISRLHumanFace FaceID](v11, "FaceID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, v17);

        }
        v18 = self->_historyPerGroupId;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CMISRLHumanFace FaceID](v11, "FaceID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addFaceAndFilter:frameId:", v11, self->_frameCount);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "addObject:", v21);
      }

      ++v8;
    }
    while (v8 < objc_msgSend(v7, "count"));
  }
  v22 = (void *)objc_opt_new();
  v23 = self->_historyPerGroupId;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __80__CMISubjectRelightingANSTSkinToneLevelFilter_filterSkinToneLevels_minFaceSize___block_invoke;
  v41[3] = &unk_1E94EB4D0;
  v41[4] = self;
  v24 = v22;
  v42 = v24;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v23, "enumerateKeysAndObjectsUsingBlock:", v41);
  -[NSMutableDictionary removeObjectsForKeys:](self->_historyPerGroupId, "removeObjectsForKeys:", v24);
  objc_msgSend(v36, "sortUsingComparator:", &__block_literal_global_10);
  v25 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v26 = v36;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v38;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v30), "asDictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v31);

        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v28);
  }

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v35);
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v25, v34);
  ++self->_frameCount;

  return v32;
}

void __80__CMISubjectRelightingANSTSkinToneLevelFilter_filterSkinToneLevels_minFaceSize___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((unint64_t)(objc_msgSend(a3, "lastUpdatedFrameId") + *(int *)(*(_QWORD *)(a1 + 32) + 20)) < *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  *a4 = 0;

}

uint64_t __80__CMISubjectRelightingANSTSkinToneLevelFilter_filterSkinToneLevels_minFaceSize___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "RectLargestSide");
  v7 = v6;
  objc_msgSend(v5, "RectLargestSide");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "RectLargestSide");
    v11 = v10;
    objc_msgSend(v5, "RectLargestSide");
    if (v11 <= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyPerGroupId, 0);
}

@end
