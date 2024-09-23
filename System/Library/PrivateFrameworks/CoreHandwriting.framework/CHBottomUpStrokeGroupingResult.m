@implementation CHBottomUpStrokeGroupingResult

- (CHBottomUpStrokeGroupingResult)initWithStrokeGroups:(id)a3 createdStrokeGroups:(id)a4 deletedStrokeGroups:(id)a5 substrokePlacementsByStrokeIdentifier:(id)a6
{
  id v11;
  CHBottomUpStrokeGroupingResult *v12;
  CHBottomUpStrokeGroupingResult *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CHBottomUpStrokeGroupingResult;
  v12 = -[CHStrokeGroupingResult initWithStrokeGroups:createdStrokeGroups:deletedStrokeGroups:](&v15, sel_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_, a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_substrokePlacementsByStrokeIdentifier, a6);

  return v13;
}

- (id)groupingResultUpdatedWithGroupReplacements:(id)a3
{
  CHBottomUpStrokeGroupingResult *v4;
  CHBottomUpStrokeGroupingResult *v5;
  CHBottomUpStrokeGroupingResult *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  objc_super v34;

  v4 = self;
  v34.receiver = v4;
  v34.super_class = (Class)CHBottomUpStrokeGroupingResult;
  -[CHStrokeGroupingResult groupingResultUpdatedWithGroupReplacements:](&v34, sel_groupingResultUpdatedWithGroupReplacements_, a3);
  v5 = (CHBottomUpStrokeGroupingResult *)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
  {
    v6 = [CHBottomUpStrokeGroupingResult alloc];
    objc_msgSend_strokeGroups(v5, v7, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createdStrokeGroups(v5, v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deletedStrokeGroups(v5, v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substrokePlacementsByStrokeIdentifier(v4, v25, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_substrokePlacementsByStrokeIdentifier_(v6, v31, (uint64_t)v12, (uint64_t)v18, (uint64_t)v24, (uint64_t)v30);

    v4 = (CHBottomUpStrokeGroupingResult *)v32;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;

  v5 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend_substrokePlacementsByStrokeIdentifier(self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_initWithDictionary_copyItems_(v5, v12, (uint64_t)v11, 1, v13, v14);

  v20 = (void *)objc_msgSend_allocWithZone_(CHBottomUpStrokeGroupingResult, v16, (uint64_t)a3, v17, v18, v19);
  objc_msgSend_strokeGroups(self, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createdStrokeGroups(self, v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deletedStrokeGroups(self, v33, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_substrokePlacementsByStrokeIdentifier_(v20, v39, (uint64_t)v26, (uint64_t)v32, (uint64_t)v38, (uint64_t)v15);

  return v40;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  objc_msgSend_strokeGroups(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v16, v10, (uint64_t)v9, (uint64_t)CFSTR("strokeGroups"), v11, v12);

  objc_msgSend_encodeObject_forKey_(v16, v13, (uint64_t)self->_substrokePlacementsByStrokeIdentifier, (uint64_t)CFSTR("substrokePlacementsByStrokeIdentifier"), v14, v15);
}

- (CHBottomUpStrokeGroupingResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  CHBottomUpStrokeGroupingResult *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[4];

  v40[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  v40[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v40, 3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v10, (uint64_t)v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("strokeGroups"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E60];
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)&v36, 4, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v19, v24, (uint64_t)v23, v25, v26, v27, v36, v37, v38);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v28, (uint64_t)CFSTR("substrokePlacementsByStrokeIdentifier"), v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (CHBottomUpStrokeGroupingResult *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_substrokePlacementsByStrokeIdentifier_(self, v33, (uint64_t)v18, (uint64_t)v18, 0, (uint64_t)v32);
  return v34;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)substrokePlacementsByStrokeIdentifier
{
  return self->_substrokePlacementsByStrokeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substrokePlacementsByStrokeIdentifier, 0);
}

@end
