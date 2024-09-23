@implementation MOClusterMetadata

- (MOClusterMetadata)initWithIdentifier:(id)a3 phenoType:(id)a4
{
  return -[MOClusterMetadata initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:](self, "initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:", a3, 0, a4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0,
           0);
}

- (MOClusterMetadata)initWithIdentifier:(id)a3 isFiltered:(BOOL)a4 phenoType:(id)a5 topLevelActivityHistogram:(id)a6 secondLevelActivityHistogram:(id)a7 activityTypeFromPhotoTraitsHistogram:(id)a8 timeTagHistogram:(id)a9 dayOfWeekHistogram:(id)a10 timeContextFromPhotoTraitsHistogram:(id)a11 placeNameHistogram:(id)a12 combinedPlaceTypeHistogram:(id)a13 enclosingPlaceNameHistogram:(id)a14 placeTypeFromPhotoTraitsHistogram:(id)a15 contactNamesHistogram:(id)a16 personRelationshipHistogram:(id)a17 socialEventFromPhotoTraitsHistogram:(id)a18 otherSubjectFromPhotoTraitsHistogram:(id)a19 subBundleGoodnessScores:(id)a20
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  MOClusterMetadata *v31;
  MOClusterMetadata *v32;
  id v36;
  id v37;
  id v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;

  v49 = a3;
  v36 = a5;
  v48 = a5;
  v37 = a6;
  v47 = a6;
  v38 = a7;
  v46 = a7;
  v45 = a8;
  v44 = a9;
  v43 = a10;
  v42 = a11;
  v41 = a12;
  v40 = a13;
  v24 = a14;
  v25 = a15;
  v26 = a16;
  v27 = a17;
  v28 = a18;
  v29 = a19;
  v30 = a20;
  v50.receiver = self;
  v50.super_class = (Class)MOClusterMetadata;
  v31 = -[MOClusterMetadata init](&v50, sel_init);
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_identifier, a3);
    v32->_isFiltered = a4;
    objc_storeStrong((id *)&v32->_phenotype, v36);
    objc_storeStrong((id *)&v32->_topLevelActivityHistogram, v37);
    objc_storeStrong((id *)&v32->_secondLevelActivityHistogram, v38);
    objc_storeStrong((id *)&v32->_activityTypeFromPhotoTraitsHistogram, a8);
    objc_storeStrong((id *)&v32->_timeTagHistogram, a9);
    objc_storeStrong((id *)&v32->_dayOfWeekHistogram, a10);
    objc_storeStrong((id *)&v32->_timeContextFromPhotoTraitsHistogram, a11);
    objc_storeStrong((id *)&v32->_placeNameHistogram, a12);
    objc_storeStrong((id *)&v32->_combinedPlaceTypeHistogram, a13);
    objc_storeStrong((id *)&v32->_enclosingPlaceNameHistogram, a14);
    objc_storeStrong((id *)&v32->_placeTypeFromPhotoTraitsHistogram, a15);
    objc_storeStrong((id *)&v32->_contactNamesHistogram, a16);
    objc_storeStrong((id *)&v32->_personRelationshipHistogram, a17);
    objc_storeStrong((id *)&v32->_socialEventFromPhotoTraitsHistogram, a18);
    objc_storeStrong((id *)&v32->_otherSubjectFromPhotoTraitsHistogram, a19);
    objc_storeStrong((id *)&v32->_subBundleGoodnessScores, a20);
  }

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  identifier = self->_identifier;
  v20 = a3;
  objc_msgSend(v20, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v20, "encodeBool:forKey:", self->_isFiltered, CFSTR("isFiltered"));
  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_phenotype);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v5, CFSTR("phenotype"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_topLevelActivityHistogram);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v6, CFSTR("topLevelActivityTypeHistogram"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_secondLevelActivityHistogram);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v7, CFSTR("secondLevelActivityTypeHistogram"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_activityTypeFromPhotoTraitsHistogram);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v8, CFSTR("activityTypeFromPhotoTraitsHistogram"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_timeTagHistogram);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v9, CFSTR("timeTagHistogram"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_dayOfWeekHistogram);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v10, CFSTR("dayOfWeekHistogram"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_timeContextFromPhotoTraitsHistogram);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v11, CFSTR("timeContextFromPhotoTraitsHistogram"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_placeNameHistogram);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v12, CFSTR("placeNameHistogram"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_combinedPlaceTypeHistogram);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v13, CFSTR("combinedPlaceTypeHistogram"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_enclosingPlaceNameHistogram);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v14, CFSTR("enclosingPlaceNameHistogram"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_placeTypeFromPhotoTraitsHistogram);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v15, CFSTR("placeTypeFromPhotoTraitsHistogram"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_contactNamesHistogram);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v16, CFSTR("contactNamesHistogram"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_personRelationshipHistogram);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v17, CFSTR("personRelationshipHistogram"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_socialEventFromPhotoTraitsHistogram);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v18, CFSTR("socialEventFromPhotoTraitsHistogram"));

  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_otherSubjectFromPhotoTraitsHistogram);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v19, CFSTR("otherSubjectFromPhotoTraitsHistogram"));

  objc_msgSend(v20, "encodeObject:forKey:", self->_subBundleGoodnessScores, CFSTR("subBundleGoodnessScores"));
}

- (MOClusterMetadata)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  MOClusterMetadata *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isFiltered"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phenotype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topLevelActivityTypeHistogram"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondLevelActivityTypeHistogram"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityTypeFromPhotoTraitsHistogram"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v7);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeTagHistogram"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dayOfWeekHistogram"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeContextFromPhotoTraitsHistogram"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeNameHistogram"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("combinedPlaceTypeHistogram"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v12);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enclosingPlaceNameHistogram"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v13);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeTypeFromPhotoTraitsHistogram"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactNamesHistogram"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v15);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personRelationshipHistogram"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("socialEventFromPhotoTraitsHistogram"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherSubjectFromPhotoTraitsHistogram"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99E60];
  v23 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v24, CFSTR("subBundleGoodnessScores"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = -[MOClusterMetadata initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:](self, "initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:", v42, v35, v41, v40, v34, v33, v32, v31, v30, v29, v39, v38, v28,
          v27,
          v17,
          v19,
          v21,
          v25);

  return v37;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)isFiltered
{
  return self->_isFiltered;
}

- (void)setIsFiltered:(BOOL)a3
{
  self->_isFiltered = a3;
}

- (NSDictionary)phenotype
{
  return self->_phenotype;
}

- (void)setPhenotype:(id)a3
{
  objc_storeStrong((id *)&self->_phenotype, a3);
}

- (NSDictionary)topLevelActivityHistogram
{
  return self->_topLevelActivityHistogram;
}

- (void)setTopLevelActivityHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelActivityHistogram, a3);
}

- (NSDictionary)secondLevelActivityHistogram
{
  return self->_secondLevelActivityHistogram;
}

- (void)setSecondLevelActivityHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_secondLevelActivityHistogram, a3);
}

- (NSDictionary)activityTypeFromPhotoTraitsHistogram
{
  return self->_activityTypeFromPhotoTraitsHistogram;
}

- (void)setActivityTypeFromPhotoTraitsHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_activityTypeFromPhotoTraitsHistogram, a3);
}

- (NSDictionary)timeTagHistogram
{
  return self->_timeTagHistogram;
}

- (void)setTimeTagHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_timeTagHistogram, a3);
}

- (NSDictionary)dayOfWeekHistogram
{
  return self->_dayOfWeekHistogram;
}

- (void)setDayOfWeekHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_dayOfWeekHistogram, a3);
}

- (NSDictionary)timeContextFromPhotoTraitsHistogram
{
  return self->_timeContextFromPhotoTraitsHistogram;
}

- (void)setTimeContextFromPhotoTraitsHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_timeContextFromPhotoTraitsHistogram, a3);
}

- (NSDictionary)placeNameHistogram
{
  return self->_placeNameHistogram;
}

- (void)setPlaceNameHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_placeNameHistogram, a3);
}

- (NSDictionary)combinedPlaceTypeHistogram
{
  return self->_combinedPlaceTypeHistogram;
}

- (void)setCombinedPlaceTypeHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_combinedPlaceTypeHistogram, a3);
}

- (NSDictionary)enclosingPlaceNameHistogram
{
  return self->_enclosingPlaceNameHistogram;
}

- (void)setEnclosingPlaceNameHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_enclosingPlaceNameHistogram, a3);
}

- (NSDictionary)placeTypeFromPhotoTraitsHistogram
{
  return self->_placeTypeFromPhotoTraitsHistogram;
}

- (void)setPlaceTypeFromPhotoTraitsHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_placeTypeFromPhotoTraitsHistogram, a3);
}

- (NSDictionary)contactNamesHistogram
{
  return self->_contactNamesHistogram;
}

- (void)setContactNamesHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_contactNamesHistogram, a3);
}

- (NSDictionary)personRelationshipHistogram
{
  return self->_personRelationshipHistogram;
}

- (void)setPersonRelationshipHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_personRelationshipHistogram, a3);
}

- (NSDictionary)socialEventFromPhotoTraitsHistogram
{
  return self->_socialEventFromPhotoTraitsHistogram;
}

- (void)setSocialEventFromPhotoTraitsHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_socialEventFromPhotoTraitsHistogram, a3);
}

- (NSDictionary)otherSubjectFromPhotoTraitsHistogram
{
  return self->_otherSubjectFromPhotoTraitsHistogram;
}

- (void)setOtherSubjectFromPhotoTraitsHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_otherSubjectFromPhotoTraitsHistogram, a3);
}

- (NSArray)subBundleGoodnessScores
{
  return self->_subBundleGoodnessScores;
}

- (void)setSubBundleGoodnessScores:(id)a3
{
  objc_storeStrong((id *)&self->_subBundleGoodnessScores, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subBundleGoodnessScores, 0);
  objc_storeStrong((id *)&self->_otherSubjectFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_socialEventFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_personRelationshipHistogram, 0);
  objc_storeStrong((id *)&self->_contactNamesHistogram, 0);
  objc_storeStrong((id *)&self->_placeTypeFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_enclosingPlaceNameHistogram, 0);
  objc_storeStrong((id *)&self->_combinedPlaceTypeHistogram, 0);
  objc_storeStrong((id *)&self->_placeNameHistogram, 0);
  objc_storeStrong((id *)&self->_timeContextFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_dayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_timeTagHistogram, 0);
  objc_storeStrong((id *)&self->_activityTypeFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_secondLevelActivityHistogram, 0);
  objc_storeStrong((id *)&self->_topLevelActivityHistogram, 0);
  objc_storeStrong((id *)&self->_phenotype, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
