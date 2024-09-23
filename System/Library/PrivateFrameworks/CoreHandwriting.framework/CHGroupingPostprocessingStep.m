@implementation CHGroupingPostprocessingStep

- (id)process:(id)a3 options:(id)a4
{
  return a3;
}

+ (id)remappedStrokeIndexes:(id)a3 originalStrokeIdentifiersOrdering:(id)a4 newStrokeIdentifiersOrdering:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1BE80411C;
  v30[3] = &unk_1E77F4450;
  v16 = v8;
  v31 = v16;
  v17 = v9;
  v32 = v17;
  v18 = v15;
  v33 = v18;
  objc_msgSend_enumerateIndexesUsingBlock_(v7, v19, (uint64_t)v30, v20, v21, v22);
  v28 = (void *)objc_msgSend_copy(v18, v23, v24, v25, v26, v27);

  return v28;
}

- (BOOL)saveInputDrawings
{
  return self->_saveInputDrawings;
}

- (void)setSaveInputDrawings:(BOOL)a3
{
  self->_saveInputDrawings = a3;
}

- (CHStrokeGroupingManager)groupingManager
{
  return self->_groupingManager;
}

- (void)setGroupingManager:(id)a3
{
  objc_storeStrong((id *)&self->_groupingManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingManager, 0);
}

@end
