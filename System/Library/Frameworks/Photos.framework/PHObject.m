@implementation PHObject

- (PHObject)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  PHObject *v10;
  void *v11;
  uint64_t v12;
  NSManagedObjectID *objectID;
  void *v14;
  uint64_t v15;
  NSString *uuid;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PHObject;
  v10 = -[PHObject init](&v18, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("objectID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHPhotoLibrary uniquedOID:](PHPhotoLibrary, "uniquedOID:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    objectID = v10->_objectID;
    v10->_objectID = (NSManagedObjectID *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("deleted"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_deleted = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("uuid"));
    v15 = objc_claimAutoreleasedReturnValue();
    uuid = v10->_uuid;
    v10->_uuid = (NSString *)v15;

    objc_storeStrong((id *)&v10->_photoLibrary, a5);
    v10->_propertyHintLock_propertyHint = a4;
    v10->_propertyHintLock._os_unfair_lock_opaque = 0;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PHObject *v4;
  PHObject *v5;
  void *v6;
  void *v7;
  char IsEqual;

  v4 = (PHObject *)a3;
  if (self == v4)
  {
    IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PHObject identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHObject identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      IsEqual = PLObjectIsEqual();
    }
    else
    {
      IsEqual = 0;
    }
  }

  return IsEqual;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PHObject identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)identifier
{
  NSManagedObjectID *objectID;
  NSManagedObjectID *v3;
  void *v7;

  objectID = self->_objectID;
  if (objectID)
  {
    v3 = objectID;
  }
  else
  {
    -[PHObject uuid](self, "uuid");
    v3 = (NSManagedObjectID *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHObject.m"), 434, CFSTR("Must have a uuid if no _objectID"));

      v3 = 0;
    }
  }
  return v3;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_getProperty(self, a2, 48, 1);
}

+ (id)authorizationAwareFetchResultWithOptions:(id)a3 fetchBlock:(id)a4
{
  id v5;
  void (**v6)(id, id);
  PHUnauthorizedFetchResult *v7;
  void *v8;
  NSObject *v9;
  PHUnauthorizedFetchResult *v10;
  uint8_t v12[16];

  v5 = a3;
  v6 = (void (**)(id, id))a4;
  if (+[PHPhotoLibrary checkAuthorizationStatusForAPIAccessLevel:](PHPhotoLibrary, "checkAuthorizationStatusForAPIAccessLevel:", 2))
  {
    v6[2](v6, v5);
    v7 = (PHUnauthorizedFetchResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      PLPhotoKitGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_FAULT, "Attempted fetch within change block can trigger deadlock, returning unauthorized fetch result", v12, 2u);
      }

    }
    +[PHPhotoLibrary requestAuthorizationForAccessLevel:handler:](PHPhotoLibrary, "requestAuthorizationForAccessLevel:handler:", 2, &__block_literal_global_66);
    v7 = -[PHUnauthorizedFetchResult initWithOptions:status:fetchBlock:]([PHUnauthorizedFetchResult alloc], "initWithOptions:status:fetchBlock:", v5, +[PHPhotoLibrary authorizationStatusForAccessLevel:](PHPhotoLibrary, "authorizationStatusForAccessLevel:", 2), v6);
  }
  v10 = v7;

  return v10;
}

- (BOOL)isTransient
{
  return self->_objectID == 0;
}

- (NSManagedObjectID)objectID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 40, 1);
}

+ (BOOL)managedObjectSupportsFaceState
{
  return 0;
}

+ (BOOL)managedObjectSupportsPendingState
{
  return 0;
}

+ (BOOL)managedObjectSupportsSavedAssetType
{
  return 0;
}

+ (BOOL)managedObjectSupportsDuplicateVisibilityState
{
  return 0;
}

+ (BOOL)managedObjectSupportsTorsoOnly
{
  return 0;
}

+ (BOOL)managedObjectSupportsRejectedState
{
  return 0;
}

+ (BOOL)managedObjectSupportsPersonFilters
{
  return 0;
}

+ (BOOL)managedObjectSupportsKeyFaces
{
  return 0;
}

+ (BOOL)managedObjectSupportsDetectionType
{
  return 0;
}

+ (BOOL)managedObjectSupportsBodyDetection
{
  return 0;
}

+ (BOOL)managedObjectSupportsVisibilityState
{
  return 0;
}

+ (BOOL)managedObjectSupportsSharingComposition
{
  return 0;
}

+ (BOOL)managedObjectSupportsScreenshot
{
  return 0;
}

+ (BOOL)managedObjectSupportsMontage
{
  return 0;
}

+ (BOOL)managedObjectSupportsHiddenState
{
  return 0;
}

+ (BOOL)managedObjectSupportsContributor
{
  return 0;
}

+ (BOOL)managedObjectSupportsBursts
{
  return 0;
}

+ (BOOL)managedObjectSupportsAllowedForAnalysis
{
  return 0;
}

+ (BOOL)managedObjectSupportsShareTrashedState
{
  return 0;
}

+ (BOOL)managedObjectSupportsShareExpiredState
{
  return 0;
}

+ (BOOL)managedObjectSupportsShareExitingState
{
  return 0;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  _QWORD v51[5];
  _QWORD v52[5];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  char v57;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "leftExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  if (objc_msgSend(v8, "expressionType") == 1 && !objc_msgSend(v9, "expressionType")
    || objc_msgSend(v9, "expressionType") == 1 && !objc_msgSend(v8, "expressionType"))
  {
    v25 = objc_msgSend(v8, "expressionType");
    if (v25 == 1)
      v26 = v9;
    else
      v26 = v8;
    objc_msgSend(v26, "constantValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = 0;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __58__PHObject_fetchPredicateFromComparisonPredicate_options___block_invoke;
    v52[3] = &unk_1E35DC250;
    v52[4] = &v53;
    PHQueryTransformExpressionConstantValue(v12, v52);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v54 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v27);
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = v26;
    }
    v29 = v28;
    if (v25 == 1)
    {
      v30 = objc_alloc(MEMORY[0x1E0CB3518]);
      v31 = objc_msgSend(v6, "comparisonPredicateModifier");
      v32 = objc_msgSend(v6, "predicateOperatorType");
      v33 = objc_msgSend(v6, "options");
      v34 = v8;
      v35 = v29;
    }
    else
    {
      v30 = objc_alloc(MEMORY[0x1E0CB3518]);
      v31 = objc_msgSend(v6, "comparisonPredicateModifier");
      v32 = objc_msgSend(v6, "predicateOperatorType");
      v33 = objc_msgSend(v6, "options");
      v34 = v29;
      v35 = v9;
    }
    v24 = (id)objc_msgSend(v30, "initWithLeftExpression:rightExpression:modifier:type:options:", v34, v35, v31, v32, v33);

    _Block_object_dispose(&v53, 8);
    goto LABEL_52;
  }
  if (objc_msgSend(v8, "expressionType") == 3 && PHIsExpressionMatchingTypeOrAggregateMatchingType(v9, &v57)
    || objc_msgSend(v9, "expressionType") == 3 && PHIsExpressionMatchingTypeOrAggregateMatchingType(v8, &v57))
  {
    v10 = objc_msgSend(v8, "expressionType");
    if (v10 == 3)
      v11 = v8;
    else
      v11 = v9;
    objc_msgSend(v11, "keyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("localIdentifier")) && !v57)
    {
      v50 = v7;
      if (v10 == 3)
        v13 = v9;
      else
        v13 = v8;
      objc_msgSend(v13, "constantValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __58__PHObject_fetchPredicateFromComparisonPredicate_options___block_invoke_2;
      v51[3] = &__block_descriptor_40_e8__16__0_8l;
      v51[4] = a1;
      v48 = v14;
      PHQueryTransformExpressionConstantValue(v14, v51);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "localIdentifierExpressionForFetchRequests");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)v15;
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(MEMORY[0x1E0CB3518]);
      v19 = objc_msgSend(v6, "comparisonPredicateModifier");
      v20 = objc_msgSend(v6, "predicateOperatorType");
      v21 = objc_msgSend(v6, "options");
      if (v10 == 3)
      {
        v22 = v16;
        v23 = v17;
      }
      else
      {
        v22 = v17;
        v23 = v16;
      }
      v24 = (id)objc_msgSend(v18, "initWithLeftExpression:rightExpression:modifier:type:options:", v22, v23, v19, v20, v21);

LABEL_51:
      v7 = v50;
      goto LABEL_52;
    }
    if ((objc_msgSend(a1, "managedObjectSupportsCustomUUIDKey") & 1) != 0
      || !objc_msgSend(v12, "isEqualToString:", CFSTR("uuid"))
      || v57)
    {
      if (v12)
      {
        v50 = v7;
        if (v10 == 3)
          v36 = v9;
        else
          v36 = v8;
        v37 = v36;
        objc_msgSend(a1, "entityKeyForPropertyKey:", v12);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "transformValueExpression:forKeyPath:", v37, v12);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            v49 = objc_alloc(MEMORY[0x1E0CB3518]);
            v47 = objc_msgSend(v6, "comparisonPredicateModifier");
            v41 = objc_msgSend(v6, "predicateOperatorType");
            v42 = objc_msgSend(v6, "options");
            if (v10 == 3)
            {
              v43 = v39;
              v44 = v40;
            }
            else
            {
              v43 = v40;
              v44 = v39;
            }
            v24 = (id)objc_msgSend(v49, "initWithLeftExpression:rightExpression:modifier:type:options:", v43, v44, v47, v41, v42);
          }
          else
          {
            v24 = 0;
          }

        }
        else
        {
          v24 = 0;
        }

        goto LABEL_51;
      }
      v24 = 0;
    }
    else
    {
      v24 = v6;
    }
LABEL_52:

    goto LABEL_53;
  }
  v24 = 0;
LABEL_53:

  return v24;
}

+ (id)entityKeyForPropertyKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "entityKeyMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entityKeyForPropertyKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)extendPropertiesToFetch:(id)a3 withProperties:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v5, "indexOfObject:", v11) == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

+ (id)identifierPropertiesToFetch
{
  pl_dispatch_once();
  return (id)identifierPropertiesToFetch_array_29558;
}

void __39__PHObject_identifierPropertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  v3[1] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)identifierPropertiesToFetch_array_29558;
  identifierPropertiesToFetch_array_29558 = v1;

}

- (BOOL)hasLoadedPropertySet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL result;

  v4 = a3;
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "propertySetClassForPropertySet:", v4);

  result = 0;
  if (v5)
  {
    ph_objc_getAssociatedObject(self, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      return 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  ph_objc_removeAssociatedObjects(self);
  v3.receiver = self;
  v3.super_class = (Class)PHObject;
  -[PHObject dealloc](&v3, sel_dealloc);
}

- (void)addFetchPropertyHint:(unint64_t)a3
{
  os_unfair_lock_s *p_propertyHintLock;

  p_propertyHintLock = &self->_propertyHintLock;
  os_unfair_lock_lock(&self->_propertyHintLock);
  self->_propertyHintLock_propertyHint |= a3;
  os_unfair_lock_unlock(p_propertyHintLock);
}

- (void)fetchPropertySetsIfNeeded
{
  -[PHObject addFetchPropertyHint:](self, "addFetchPropertyHint:", -1);
}

- (void)assertRequiredFetchPropertyHints:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  PHObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = -[PHObject propertyHint](self, "propertyHint");
  if ((a3 & ~v5) != 0)
  {
    v6 = v5;
    objc_msgSend((id)objc_opt_class(), "propertySetsForPropertyFetchHints:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "anyObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ not available unless prefetched (%lx)"), v8, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x19AEBDEDC]())
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v10, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v12);
    }
    PLPhotoKitGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_FAULT, "Missing required fetch property hint: %{public}@ (%@)", buf, 0x16u);
    }

  }
}

- (unint64_t)propertyHint
{
  os_unfair_lock_s *p_propertyHintLock;
  unint64_t propertyHintLock_propertyHint;

  p_propertyHintLock = &self->_propertyHintLock;
  os_unfair_lock_lock(&self->_propertyHintLock);
  propertyHintLock_propertyHint = self->_propertyHintLock_propertyHint;
  os_unfair_lock_unlock(p_propertyHintLock);
  return propertyHintLock_propertyHint;
}

- (NSString)localIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[PHObject uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifierWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)_shortObjectIDURI
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[NSManagedObjectID URIRepresentation](self->_objectID, "URIRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = v4 - 2;
  if (v4 < 2)
  {
    objc_msgSend(v2, "path", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "subarrayWithRange:", v5, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathWithComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (Class)changeRequestClass
{
  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHObject;
  -[PHObject description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject localIdentifier](self, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3
{
  return 2;
}

+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3
{
  return 0;
}

+ (id)propertySetAccessorsByPropertySet
{
  return 0;
}

+ (Class)propertySetClassForPropertySet:(id)a3
{
  return 0;
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  return 0;
}

+ (void)extendPropertiesToFetch:(id)a3 withPropertySetClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  id v23;
  id v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((-[objc_class isToMany](a4, "isToMany") & 1) == 0)
  {
    -[objc_class propertiesToFetch](a4, "propertiesToFetch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class keyPathFromPrimaryObject](a4, "keyPathFromPrimaryObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v8;
    v24 = a1;
    if (v8)
    {
      objc_msgSend(v8, "stringByAppendingString:", CFSTR("."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(CFSTR("."), "stringByAppendingString:", CFSTR("objectID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(obj);
          v15 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (v9)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trying to create a property path '%@' on '%@' with an unexpected property type: %@"), v15, v24, objc_opt_class());
              objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
              v23 = (id)objc_claimAutoreleasedReturnValue();
              objc_exception_throw(v23);
            }
            objc_msgSend(v9, "stringByAppendingString:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v16, "hasSuffix:", v10))
            {
              v15 = v25;

            }
            else
            {
              v15 = v16;
            }
          }
          if (objc_msgSend(v6, "indexOfObject:", v15) == 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v6, "addObject:", v15);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v12);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[objc_class additionalPropertiesToFetchOnPrimaryObject](a4, "additionalPropertiesToFetchOnPrimaryObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v28;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v28 != v20)
              objc_enumerationMutation(v17);
            v22 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * j);
            if (objc_msgSend(v6, "indexOfObject:", v22) == 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v6, "addObject:", v22);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v19);
      }

    }
  }

}

+ (id)managedEntityName
{
  return 0;
}

+ (id)fetchType
{
  return 0;
}

+ (BOOL)managedObjectSupportsCreationType
{
  return 0;
}

+ (BOOL)managedObjectSupportsAssetStacks
{
  return 0;
}

+ (BOOL)managedObjectSupportsCustomUUIDKey
{
  return 0;
}

+ (BOOL)managedObjectSupportsAdjustments
{
  return 0;
}

+ (id)identifierCode
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass((Class)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ has no identifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (PHEntityKeyMap)entityKeyMap
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass((Class)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ has no entityKeyMap"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (id)propertyKeyForEntityKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "entityKeyMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyKeyForEntityKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  return 0;
}

+ (id)internalSortDescriptorForPropertyKey:(id)a3 ascending:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "entityKeyForPropertyKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", v6, v4);
  return v7;
}

+ (id)objectIDsMatchingEntityFromObjectIDs:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  id v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(a1, "managedEntityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeEntityForNameInManagedObjectContext();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__PHObject_objectIDsMatchingEntityFromObjectIDs_context___block_invoke;
      aBlock[3] = &unk_1E35DC200;
      v15 = v9;
      v11 = _Block_copy(aBlock);
      objc_msgSend(v6, "_pl_filter:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (BOOL)isValidCloudIdentifierStringValue:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

+ (id)localIdentifierWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "identifierCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v4, CFSTR("/L0/"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)localIdentifiersWithUUIDs:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__PHObject_localIdentifiersWithUUIDs___block_invoke;
  v4[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v4[4] = a1;
  objc_msgSend(a3, "_pl_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)uuidFromLocalIdentifier:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4 < 0x25)
  {
    if (v4 != 36)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "substringToIndex:", 36);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_7:

  return v6;
}

+ (id)uuidsFromLocalIdentifiers:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__PHObject_uuidsFromLocalIdentifiers___block_invoke;
  v4[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v4[4] = a1;
  objc_msgSend(a3, "_pl_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)identifierCodeFromLocalIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 0x29)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringFromIndex:", 40);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (void)assertAllObjects:(id)a3 forSelector:(SEL)a4 areOfType:(Class)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v13 = (void *)MEMORY[0x1E0C99DA0];
          v14 = *MEMORY[0x1E0C99778];
          v15 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromSelector(a4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromClass(a5);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("Invalid object %@ passed to %@, objects must be of type %@"), v12, v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v18, 0);
          v19 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v19);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

}

+ (id)localIdentifierExpressionForFetchRequests
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("uuid"));
}

+ (id)fetchPredicateForSharingFilter:(unsigned __int16)a3
{
  return 0;
}

id __58__PHObject_fetchPredicateFromComparisonPredicate_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    objc_msgSend(v3, "objectID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

id __58__PHObject_fetchPredicateFromComparisonPredicate_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "uuidFromLocalIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __38__PHObject_uuidsFromLocalIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "uuidFromLocalIdentifier:", a2);
}

uint64_t __38__PHObject_localIdentifiersWithUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "localIdentifierWithUUID:", a2);
}

uint64_t __57__PHObject_objectIDsMatchingEntityFromObjectIDs_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isKindOfEntity:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (PHObjectReference)objectReference
{
  return (PHObjectReference *)+[PHObjectReference referenceForObject:](PHObjectReference, "referenceForObject:", self);
}

@end
