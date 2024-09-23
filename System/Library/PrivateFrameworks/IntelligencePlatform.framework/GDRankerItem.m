@implementation GDRankerItem

- (GDRankerItem)initWithEntityID:(id)a3 score:(double)a4
{
  return (GDRankerItem *)objc_msgSend_initWithEntityID_sourceID_entityClass_features_score_nameScore_contextualScore_entityRelevance_entityRelevanceInferenceEventId_confirmationConfidence_isRelationshipMatch_(self, a2, (uint64_t)a3, 0, 0, 0, &unk_1E5E0CB80, 0, a4, 0.0, 0.0, 0.0, 1.0);
}

- (GDRankerItem)initWithEntityID:(id)a3 sourceID:(id)a4 entityClass:(id)a5 features:(id)a6 score:(double)a7
{
  return (GDRankerItem *)objc_msgSend_initWithEntityID_sourceID_entityClass_features_score_nameScore_contextualScore_entityRelevance_entityRelevanceInferenceEventId_confirmationConfidence_isRelationshipMatch_(self, a2, (uint64_t)a3, a4, a5, a6, &unk_1E5E0CB80, 0, a7, 0.0, 0.0, 0.0, 1.0);
}

- (GDRankerItem)initWithEntityID:(id)a3 sourceID:(id)a4 entityClass:(id)a5 features:(id)a6 score:(double)a7 nameScore:(double)a8 contextualScore:(double)a9 entityRelevance:(double)a10 entityRelevanceInferenceEventId:(id)a11
{
  return (GDRankerItem *)objc_msgSend_initWithEntityID_sourceID_entityClass_features_score_nameScore_contextualScore_entityRelevance_entityRelevanceInferenceEventId_confirmationConfidence_isRelationshipMatch_(self, a2, (uint64_t)a3, a4, a5, a6, a11, 0, a7, a8, a9, a10, 1.0);
}

- (GDRankerItem)initWithEntityID:(id)a3 sourceID:(id)a4 entityClass:(id)a5 features:(id)a6 score:(double)a7 nameScore:(double)a8 contextualScore:(double)a9 entityRelevance:(double)a10 entityRelevanceInferenceEventId:(id)a11 confirmationConfidence:(double)a12
{
  return (GDRankerItem *)objc_msgSend_initWithEntityID_sourceID_entityClass_features_score_nameScore_contextualScore_entityRelevance_entityRelevanceInferenceEventId_confirmationConfidence_isRelationshipMatch_(self, a2, (uint64_t)a3, a4, a5, a6, a11, 0, a7, a8, a9, a10, 0.0);
}

- (GDRankerItem)initWithEntityID:(id)a3 sourceID:(id)a4 entityClass:(id)a5 features:(id)a6 score:(double)a7 nameScore:(double)a8 contextualScore:(double)a9 entityRelevance:(double)a10 entityRelevanceInferenceEventId:(id)a11 confirmationConfidence:(double)a12 isRelationshipMatch:(BOOL)a13
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  const char *v29;
  uint64_t v30;
  GDRankerItem *v31;
  uint64_t v32;
  GDEntityIdentifier *entityID;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  GDEntitySourceID *sourceID;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSString *entityClass;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  GDEntityFeatures *features;
  void *v46;
  objc_super v48;

  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  v28 = a11;
  v48.receiver = self;
  v48.super_class = (Class)GDRankerItem;
  v31 = -[GDRankerItem init](&v48, sel_init);
  if (v31)
  {
    v32 = objc_msgSend_copy(v24, v29, v30);
    entityID = v31->_entityID;
    v31->_entityID = (GDEntityIdentifier *)v32;

    v36 = objc_msgSend_copy(v25, v34, v35);
    sourceID = v31->_sourceID;
    v31->_sourceID = (GDEntitySourceID *)v36;

    v40 = objc_msgSend_copy(v26, v38, v39);
    entityClass = v31->_entityClass;
    v31->_entityClass = (NSString *)v40;

    v44 = objc_msgSend_copy(v27, v42, v43);
    features = v31->_features;
    v31->_features = (GDEntityFeatures *)v44;

    v31->_confidence = a7;
    v31->_score = a7;
    v31->_nameScore = a8;
    v31->_contextualScore = a9;
    v31->_entityRelevance = a10;
    if (v28)
      v46 = v28;
    else
      v46 = &unk_1E5E0CB80;
    objc_storeStrong((id *)&v31->_entityRelevanceInferenceEventId, v46);
    v31->_confirmationConfidence = a12;
    v31->_isRelationshipMatch = a13;
  }

  return v31;
}

- (void)encodeWithCoder:(id)a3
{
  GDEntityIdentifier *entityID;
  id v5;
  void *v6;
  const char *v7;
  GDEntitySourceID *sourceID;
  void *v9;
  const char *v10;
  NSString *entityClass;
  void *v12;
  const char *v13;
  GDEntityFeatures *features;
  void *v15;
  const char *v16;
  double score;
  void *v18;
  const char *v19;
  double nameScore;
  void *v21;
  const char *v22;
  double contextualScore;
  void *v24;
  const char *v25;
  double entityRelevance;
  void *v27;
  const char *v28;
  NSNumber *entityRelevanceInferenceEventId;
  void *v30;
  const char *v31;
  double confirmationConfidence;
  void *v33;
  const char *v34;
  _BOOL8 isRelationshipMatch;
  const char *v36;
  id v37;

  entityID = self->_entityID;
  v5 = a3;
  NSStringFromSelector(sel_entityID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)entityID, v6);

  sourceID = self->_sourceID;
  NSStringFromSelector(sel_sourceID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)sourceID, v9);

  entityClass = self->_entityClass;
  NSStringFromSelector(sel_entityClass);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)entityClass, v12);

  features = self->_features;
  NSStringFromSelector(sel_features);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)features, v15);

  score = self->_score;
  NSStringFromSelector(sel_score);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v19, (uint64_t)v18, score);

  nameScore = self->_nameScore;
  NSStringFromSelector(sel_nameScore);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v22, (uint64_t)v21, nameScore);

  contextualScore = self->_contextualScore;
  NSStringFromSelector(sel_contextualScore);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v25, (uint64_t)v24, contextualScore);

  entityRelevance = self->_entityRelevance;
  NSStringFromSelector(sel_entityRelevance);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v28, (uint64_t)v27, entityRelevance);

  entityRelevanceInferenceEventId = self->_entityRelevanceInferenceEventId;
  NSStringFromSelector(sel_entityRelevanceInferenceEventId);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v31, (uint64_t)entityRelevanceInferenceEventId, v30);

  confirmationConfidence = self->_confirmationConfidence;
  NSStringFromSelector(sel_confirmationConfidence);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v34, (uint64_t)v33, confirmationConfidence);

  isRelationshipMatch = self->_isRelationshipMatch;
  NSStringFromSelector(sel_isRelationshipMatch);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v36, isRelationshipMatch, v37);

}

- (GDRankerItem)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  double v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  double v40;
  void *v41;
  const char *v42;
  double v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  double v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  GDRankerItem *v61;
  void *v62;
  const char *v63;
  void *v64;
  void *v65;
  const char *v66;
  void *v67;
  const char *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v74;
  _QWORD v75[2];

  v75[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_entityID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = objc_opt_class();
    NSStringFromSelector(sel_sourceID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14
      || (objc_msgSend_error(v4, v15, v16), v69 = (void *)objc_claimAutoreleasedReturnValue(), v69, !v69))
    {
      v17 = objc_opt_class();
      NSStringFromSelector(sel_entityClass);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20
        || (objc_msgSend_error(v4, v21, v22), v70 = (void *)objc_claimAutoreleasedReturnValue(), v70, !v70))
      {
        v23 = objc_opt_class();
        NSStringFromSelector(sel_features);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v23, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
        {
          objc_msgSend_error(v4, v27, v28);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          if (v71)
            goto LABEL_16;
        }
        NSStringFromSelector(sel_score);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_decodeDoubleForKey_(v4, v30, (uint64_t)v29);
        v32 = v31;

        NSStringFromSelector(sel_nameScore);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_decodeDoubleForKey_(v4, v34, (uint64_t)v33);
        v36 = v35;

        NSStringFromSelector(sel_contextualScore);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_decodeDoubleForKey_(v4, v38, (uint64_t)v37);
        v40 = v39;

        NSStringFromSelector(sel_entityRelevance);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_decodeDoubleForKey_(v4, v42, (uint64_t)v41);
        v44 = v43;

        NSStringFromSelector(sel_confirmationConfidence);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_decodeDoubleForKey_(v4, v46, (uint64_t)v45);
        v48 = v47;

        NSStringFromSelector(sel_isRelationshipMatch);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend_decodeBoolForKey_(v4, v50, (uint64_t)v49);

        objc_msgSend_error(v4, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
LABEL_16:
          v61 = 0;
        }
        else
        {
          v55 = objc_opt_class();
          NSStringFromSelector(sel_entityRelevanceInferenceEventId);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_decodeObjectOfClass_forKey_(v4, v57, v55, v56);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          if (v58
            || (objc_msgSend_error(v4, v59, v60),
                v72 = (void *)objc_claimAutoreleasedReturnValue(),
                v72,
                !v72))
          {
            self = (GDRankerItem *)(id)objc_msgSend_initWithEntityID_sourceID_entityClass_features_score_nameScore_contextualScore_entityRelevance_entityRelevanceInferenceEventId_confirmationConfidence_isRelationshipMatch_(self, v59, (uint64_t)v8, v14, v20, v26, v58, v51, v32, v36, v40, v44, v48);
            v61 = self;
          }
          else
          {
            v61 = 0;
          }

        }
      }
      else
      {
        v61 = 0;
      }

    }
    else
    {
      v61 = 0;
    }

  }
  else
  {
    objc_msgSend_error(v4, v9, v10);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v62)
    {
      v64 = (void *)MEMORY[0x1E0CB35C8];
      v74 = *MEMORY[0x1E0CB2D50];
      v75[0] = CFSTR("GDRankerItem entityID is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v63, (uint64_t)v75, &v74, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v64, v66, (uint64_t)CFSTR("GDErrorDomain"), 9, v65);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v68, (uint64_t)v67);

    }
    v61 = 0;
  }

  return v61;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  return (id)objc_msgSend_initWithEntityID_sourceID_entityClass_features_score_nameScore_contextualScore_entityRelevance_entityRelevanceInferenceEventId_confirmationConfidence_isRelationshipMatch_(v7, v8, (uint64_t)self->_entityID, self->_sourceID, self->_entityClass, self->_features, self->_entityRelevanceInferenceEventId, self->_isRelationshipMatch, self->_score, self->_nameScore, self->_contextualScore, self->_entityRelevance, self->_confirmationConfidence);
}

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  unsigned int isRelationshipMatch;
  const char *v41;
  void *v42;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_entityID(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sourceID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_score(self, v9, v10);
  v12 = v11;
  objc_msgSend_entityClass(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_features(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nameScore(self, v19, v20);
  v22 = v21;
  objc_msgSend_contextualScore(self, v23, v24);
  v26 = v25;
  objc_msgSend_entityRelevance(self, v27, v28);
  v30 = v29;
  objc_msgSend_entityRelevanceInferenceEventId(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_confirmationConfidence(self, v34, v35);
  v37 = v36;
  isRelationshipMatch = objc_msgSend_isRelationshipMatch(self, v38, v39);
  objc_msgSend_stringWithFormat_(v4, v41, (uint64_t)CFSTR("<GDRankerItem: entityID: %@, sourceID: %@, score: %f, entityClass: %@, features: %@, nameScore: %f, contextualScore: %f, entityRelevance: %f, entityRelevanceInferenceEventId: %@, confirmationConfidence: %f, isRelationshipMatch: %d>"), v5, v8, v12, v15, v18, v22, v26, v30, v33, v37, isRelationshipMatch);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (double)confidence
{
  return self->_confidence;
}

- (double)score
{
  return self->_score;
}

- (GDEntityIdentifier)entityID
{
  return self->_entityID;
}

- (GDEntitySourceID)sourceID
{
  return self->_sourceID;
}

- (NSString)entityClass
{
  return self->_entityClass;
}

- (GDEntityFeatures)features
{
  return self->_features;
}

- (double)nameScore
{
  return self->_nameScore;
}

- (double)contextualScore
{
  return self->_contextualScore;
}

- (double)entityRelevance
{
  return self->_entityRelevance;
}

- (NSNumber)entityRelevanceInferenceEventId
{
  return self->_entityRelevanceInferenceEventId;
}

- (double)confirmationConfidence
{
  return self->_confirmationConfidence;
}

- (BOOL)isRelationshipMatch
{
  return self->_isRelationshipMatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityRelevanceInferenceEventId, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_entityClass, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_entityID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
