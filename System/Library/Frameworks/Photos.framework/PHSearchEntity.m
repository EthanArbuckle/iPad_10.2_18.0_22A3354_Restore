@implementation PHSearchEntity

- (PHSearchEntity)initWithNodeContainer:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PHSearchEntity *v12;
  uint64_t v13;
  NSString *label;
  uint64_t v15;
  NSString *searchEntityIdentifier;
  double v17;
  uint64_t v18;
  NSArray *synonyms;
  objc_super v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23[0] = MEMORY[0x1E0C9AAA0];
  v22[0] = CFSTR("deleted");
  v22[1] = CFSTR("uuid");
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  v22[2] = CFSTR("objectID");
  objc_msgSend(v6, "sourceNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21.receiver = self;
  v21.super_class = (Class)PHSearchEntity;
  v12 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v21, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v11, 2, v7);

  if (v12)
  {
    objc_msgSend(v6, "label");
    v13 = objc_claimAutoreleasedReturnValue();
    label = v12->_label;
    v12->_label = (NSString *)v13;

    objc_msgSend(v6, "identifier");
    v15 = objc_claimAutoreleasedReturnValue();
    searchEntityIdentifier = v12->_searchEntityIdentifier;
    v12->_searchEntityIdentifier = (NSString *)v15;

    v12->_type = objc_msgSend(v6, "type");
    objc_msgSend(v6, "rankingScore");
    v12->_rankingScore = v17;
    objc_msgSend(v6, "synonyms");
    v18 = objc_claimAutoreleasedReturnValue();
    synonyms = v12->_synonyms;
    v12->_synonyms = (NSArray *)v18;

  }
  return v12;
}

- (double)confidenceForMoment:(id)a3
{
  return 0.0;
}

- (id)dateIntervalForMoment:(id)a3
{
  return 0;
}

- (NSArray)synonyms
{
  return -[NSString componentsSeparatedByString:](self->_synonymsString, "componentsSeparatedByString:", CFSTR("|"));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nlabel: %@\ntype: %lld\nidentifier: %@\nrankingScore: %g\nsynonyms: %@"), self->_label, self->_type, self->_searchEntityIdentifier, *(_QWORD *)&self->_rankingScore, self->_synonymsString);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)searchEntityIdentifier
{
  return self->_searchEntityIdentifier;
}

- (void)setSearchEntityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (void)setRankingScore:(double)a3
{
  self->_rankingScore = a3;
}

- (void)setSynonyms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_searchEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_synonymsString, 0);
}

+ (id)fetchSearchEntitiesWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_4432);
}

+ (id)managedEntityName
{
  return (id)objc_msgSend(MEMORY[0x1E0D71788], "entityName");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHSearchEntity");
  return CFSTR("PHSearchEntity");
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (BOOL)managedObjectSupportsSharingComposition
{
  return 0;
}

+ (id)identifierCode
{
  return CFSTR("250");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_4425;
}

void __30__PHSearchEntity_entityKeyMap__block_invoke()
{
  PHEntityKeyMap *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v0 = [PHEntityKeyMap alloc];
  v7 = CFSTR("uuid");
  v8[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("objectID");
  v9[0] = v1;
  v6 = CFSTR("objectID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v0, "initWithPropertyKeysByEntityKey:", v3);
  v5 = (void *)entityKeyMap_pl_once_object_15_4425;
  entityKeyMap_pl_once_object_15_4425 = v4;

}

PHFetchResult *__49__PHSearchEntity_fetchSearchEntitiesWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  PHFetchResult *v4;
  PHFetchResult *v5;

  +[PHGraphQuery queryForSearchEntitiesWithOptions:](PHGraphQuery, "queryForSearchEntitiesWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "executeQuery");
    v4 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(PHFetchResult);
  }
  v5 = v4;

  return v5;
}

@end
