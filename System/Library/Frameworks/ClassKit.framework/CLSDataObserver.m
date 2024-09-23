@implementation CLSDataObserver

- (CLSDataObserver)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v8, (uint64_t)CFSTR("The method -[%@ %@] is not available."), v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (CLSDataObserver)initWithQuerySpecification:(id)a3 error:(id *)a4
{
  id v7;
  CLSDataObserver *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  BOOL v19;
  void *v20;
  CLSDataObserver *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSString *observerID;
  uint64_t v27;
  NSMutableSet *entitiesMatchingPredicate;
  uint64_t v29;
  NSMutableSet *entitiesChangedAddedIDs;
  uint64_t v31;
  NSMutableSet *entitiesChangedUpdatedIDs;
  uint64_t v33;
  NSMutableSet *entitiesChangedDeletedIDs;
  uint64_t v35;
  NSMutableSet *entitiesChangedUpdatedMatchingPredicateIDs;
  uint64_t v37;
  NSMutableSet *entitiesChangedUpdatedNotMatchingPredicateIDs;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  id v44;
  objc_super v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CLSDataObserver;
  v8 = -[CLSDataObserver init](&v45, sel_init);
  objc_msgSend_predicate(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_predicate(v7, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend_cls_normalizedPredicate_error_(v14, v15, (uint64_t)v8, &v44);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v44;

    if (v16)
      v19 = v17 == 0;
    else
      v19 = 0;
    if (!v19)
    {
      objc_msgSend_cls_assignError_fromError_(MEMORY[0x1E0CB35C8], v18, (uint64_t)a4, v17);
      if (v17)
      {
        if (qword_1ED0FB9A0 != -1)
          dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
        v20 = (void *)CLSLogDefault;
        if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          v40 = v20;
          objc_msgSend_debugDescription(v17, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v47 = v16;
          v48 = 2112;
          v49 = v43;
          _os_log_error_impl(&dword_1D4054000, v40, OS_LOG_TYPE_ERROR, "initWithQuerySpecification: bad predicate:%@ error:%@", buf, 0x16u);

        }
      }

      v21 = 0;
      goto LABEL_16;
    }
    objc_msgSend_setPredicate_(v7, v18, (uint64_t)v16);

  }
  if (v8)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v12, v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    observerID = v8->_observerID;
    v8->_observerID = (NSString *)v25;

    objc_storeStrong((id *)&v8->_querySpec, a3);
    v8->_changeTag = -1;
    v27 = objc_opt_new();
    entitiesMatchingPredicate = v8->_entitiesMatchingPredicate;
    v8->_entitiesMatchingPredicate = (NSMutableSet *)v27;

    v29 = objc_opt_new();
    entitiesChangedAddedIDs = v8->_entitiesChangedAddedIDs;
    v8->_entitiesChangedAddedIDs = (NSMutableSet *)v29;

    v31 = objc_opt_new();
    entitiesChangedUpdatedIDs = v8->_entitiesChangedUpdatedIDs;
    v8->_entitiesChangedUpdatedIDs = (NSMutableSet *)v31;

    v33 = objc_opt_new();
    entitiesChangedDeletedIDs = v8->_entitiesChangedDeletedIDs;
    v8->_entitiesChangedDeletedIDs = (NSMutableSet *)v33;

    v35 = objc_opt_new();
    entitiesChangedUpdatedMatchingPredicateIDs = v8->_entitiesChangedUpdatedMatchingPredicateIDs;
    v8->_entitiesChangedUpdatedMatchingPredicateIDs = (NSMutableSet *)v35;

    v37 = objc_opt_new();
    entitiesChangedUpdatedNotMatchingPredicateIDs = v8->_entitiesChangedUpdatedNotMatchingPredicateIDs;
    v8->_entitiesChangedUpdatedNotMatchingPredicateIDs = (NSMutableSet *)v37;

  }
  v21 = v8;
LABEL_16:

  return v21;
}

- (CLSDataObserver)initWithObjectType:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  CLSDataObserver *v13;
  uint64_t v15;

  v8 = a5;
  objc_msgSend_querySpecificationWithObjectType_predicate_(CLSQuerySpecification, v9, (uint64_t)a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSortDescriptors_(v10, v11, (uint64_t)v8);

  v15 = 0;
  v13 = (CLSDataObserver *)objc_msgSend_initWithQuerySpecification_error_(self, v12, (uint64_t)v10, &v15);

  return v13;
}

- (CLSDataObserver)initWithObjectType:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 error:(id *)a6
{
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  CLSDataObserver *Specification_error;

  v10 = a5;
  objc_msgSend_querySpecificationWithObjectType_predicate_(CLSQuerySpecification, v11, (uint64_t)a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSortDescriptors_(v12, v13, (uint64_t)v10);

  Specification_error = (CLSDataObserver *)objc_msgSend_initWithQuerySpecification_error_(self, v14, (uint64_t)v12, a6);
  return Specification_error;
}

- (Class)objectType
{
  uint64_t v2;
  NSString *v3;
  void *v4;

  objc_msgSend_entityName(self->_querySpec, a2, v2);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (NSString)className
{
  uint64_t v2;

  return (NSString *)objc_msgSend_entityName(self->_querySpec, a2, v2);
}

- (NSPredicate)predicate
{
  uint64_t v2;

  return (NSPredicate *)objc_msgSend_predicate(self->_querySpec, a2, v2);
}

- (NSArray)sortDescriptors
{
  uint64_t v2;

  return (NSArray *)objc_msgSend_sortDescriptors(self->_querySpec, a2, v2);
}

- (void)setSortDescriptors:(id)a3
{
  const char *v4;
  id v5;

  v5 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  objc_msgSend_setSortDescriptors_(self->_querySpec, v4, (uint64_t)v5);

}

+ (id)predicateForObjectWithObjectID:(id)a3
{
  return (id)objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], a2, (uint64_t)CFSTR("%K == %@"), CFSTR("objectID"), a3);
}

+ (id)predicateForObjectsWithObjectIDs:(id)a3
{
  return (id)objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], a2, (uint64_t)CFSTR("%K IN %@"), CFSTR("objectID"), a3);
}

+ (id)predicateForObjectsWithParentObjectID:(id)a3
{
  return (id)objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], a2, (uint64_t)CFSTR("%K == %@"), CFSTR("parentObjectID"), a3);
}

+ (id)predicateForObjectsWithIdentifier:(id)a3
{
  return (id)objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], a2, (uint64_t)CFSTR("%K == %@"), CFSTR("identifier"), a3);
}

+ (id)predicateForObjectsWithPersonID:(id)a3 andRole:(unint64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend_numberWithUnsignedInteger_(v6, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(v5, v10, (uint64_t)CFSTR("%K == %@ && %K = %@"), CFSTR("personID"), v7, CFSTR("roles"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)predicateForObjectsWithParentObjectID:(id)a3 andRole:(unint64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend_numberWithUnsignedInteger_(v6, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(v5, v10, (uint64_t)CFSTR("%K == %@ && %K = %@"), CFSTR("parentObjectID"), v7, CFSTR("roles"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)predicateForCollaborationStateForObjectWithID:(id)a3 ownerPersonID:(id)a4 domain:(int64_t)a5
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;

  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  v10 = a3;
  objc_msgSend_numberWithInteger_(v8, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(v7, v13, (uint64_t)CFSTR("%K == %@ && %K = %@ && %K == %@"), CFSTR("parentObjectID"), v10, CFSTR("ownerPersonID"), v9, CFSTR("domain"), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)predicateForCollaborationStatesForObjectWithID:(id)a3 ownerPersonID:(id)a4
{
  return (id)objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], a2, (uint64_t)CFSTR("%K == %@ && %K = %@"), CFSTR("parentObjectID"), a3, CFSTR("ownerPersonID"), a4);
}

+ (id)predicateForCollaborationStatesForObjectWithID:(id)a3 domain:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend_numberWithInteger_(v6, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(v5, v10, (uint64_t)CFSTR("%K == %@ && %K == %@"), CFSTR("parentObjectID"), v7, CFSTR("domain"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)predicateForUnexpiredObjects
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  objc_msgSend_date(MEMORY[0x1E0C99D68], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_timeIntervalSinceReferenceDate(v3, v6, v7);
  objc_msgSend_numberWithDouble_(v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(v4, v11, (uint64_t)CFSTR("%K != %@ and %K > %@"), CFSTR("dateExpires"), &unk_1E97674A0, CFSTR("dateExpires"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)reset
{
  MEMORY[0x1E0DE7D20](self, sel_clientRemote_itemChanged_, -1);
}

- (void)clientRemote_invalidate
{
  uint64_t v2;
  const char *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  if ((objc_msgSend_isInvalidated(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_setInvalidated_(self, v4, 1);
    objc_msgSend_dataStore(self, v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deregisterDataObserver_(v8, v7, (uint64_t)self);

  }
}

- (void)clientRemote_itemChanged:(unint64_t)a3
{
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  int v8;
  CLSDataObserver *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend_changeTag(self, a2, a3);
  objc_msgSend_setChangeTag_(self, v6, a3);
  if (self->_dataChanged)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v7 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138412802;
      v9 = self;
      v10 = 2048;
      v11 = v5;
      v12 = 2048;
      v13 = a3;
      _os_log_debug_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEBUG, "Calling dataChanged for CLSDataObserver: %@, old changeTag: %lu, new changeTag: %lu", (uint8_t *)&v8, 0x20u);
    }
    (*((void (**)(void))self->_dataChanged + 2))();
  }
}

- (void)clientRemote_entitiesChangedAdded:(id)a3 updated:(id)a4 deleted:(id)a5
{
  NSMutableSet *entitiesChangedAddedIDs;
  id v9;
  const char *v10;
  const char *v11;
  const char *v12;
  id v13;

  entitiesChangedAddedIDs = self->_entitiesChangedAddedIDs;
  v13 = a5;
  v9 = a4;
  objc_msgSend_unionSet_(entitiesChangedAddedIDs, v10, (uint64_t)a3);
  objc_msgSend_unionSet_(self->_entitiesChangedUpdatedIDs, v11, (uint64_t)v9);

  objc_msgSend_unionSet_(self->_entitiesChangedDeletedIDs, v12, (uint64_t)v13);
}

- (void)clientRemote_entitiesChangedUpdatedMatchingPredicate:(id)a3 updatedNotMatchingPredicate:(id)a4
{
  NSMutableSet *entitiesChangedUpdatedMatchingPredicateIDs;
  const char *v7;
  const char *v8;
  id v9;

  entitiesChangedUpdatedMatchingPredicateIDs = self->_entitiesChangedUpdatedMatchingPredicateIDs;
  v9 = a4;
  objc_msgSend_unionSet_(entitiesChangedUpdatedMatchingPredicateIDs, v7, (uint64_t)a3);
  objc_msgSend_unionSet_(self->_entitiesChangedUpdatedNotMatchingPredicateIDs, v8, (uint64_t)v9);

}

- (void)clientRemote_finishWithEntitiesChangedSince:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  BOOL v39;
  void (**entitiesChanged)(id, id, void *, void *, void *);
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  id v60;

  v60 = a3;
  v6 = (void *)objc_msgSend_mutableCopy(self->_entitiesChangedAddedIDs, v4, v5);
  v9 = (void *)objc_msgSend_mutableCopy(self->_entitiesChangedUpdatedIDs, v7, v8);
  v12 = (void *)objc_msgSend_mutableCopy(self->_entitiesChangedDeletedIDs, v10, v11);
  objc_msgSend_predicate(self->_querySpec, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v18 = (void *)MEMORY[0x1D82573E4]();
    v21 = (void *)objc_msgSend_mutableCopy(self->_entitiesChangedUpdatedMatchingPredicateIDs, v19, v20);
    objc_msgSend_minusSet_(v21, v22, (uint64_t)self->_entitiesMatchingPredicate);
    objc_msgSend_unionSet_(v6, v23, (uint64_t)v21);

    objc_autoreleasePoolPop(v18);
    v24 = (void *)MEMORY[0x1D82573E4]();
    v27 = (void *)objc_msgSend_mutableCopy(self->_entitiesMatchingPredicate, v25, v26);
    objc_msgSend_intersectSet_(v27, v28, (uint64_t)self->_entitiesChangedUpdatedMatchingPredicateIDs);
    objc_msgSend_unionSet_(v9, v29, (uint64_t)v27);

    objc_autoreleasePoolPop(v24);
    v30 = (void *)MEMORY[0x1D82573E4]();
    v33 = (void *)objc_msgSend_mutableCopy(self->_entitiesMatchingPredicate, v31, v32);
    objc_msgSend_intersectSet_(v33, v34, (uint64_t)self->_entitiesChangedUpdatedNotMatchingPredicateIDs);
    objc_msgSend_unionSet_(v12, v35, (uint64_t)v33);

    objc_autoreleasePoolPop(v30);
    objc_msgSend_intersectSet_(v12, v36, (uint64_t)self->_entitiesMatchingPredicate);
  }
  v39 = !objc_msgSend_count(v6, v16, v17) && !objc_msgSend_count(v9, v37, v38) && objc_msgSend_count(v12, v37, v38) == 0;
  entitiesChanged = (void (**)(id, id, void *, void *, void *))self->_entitiesChanged;
  if (entitiesChanged && !v39)
  {
    v41 = (void *)objc_msgSend_copy(v6, v37, v38);
    v44 = (void *)objc_msgSend_copy(v9, v42, v43);
    v47 = (void *)objc_msgSend_copy(v12, v45, v46);
    entitiesChanged[2](entitiesChanged, v60, v41, v44, v47);

  }
  objc_msgSend_predicate(self->_querySpec, v37, v38);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend_minusSet_(self->_entitiesMatchingPredicate, v49, (uint64_t)v12);
    objc_msgSend_unionSet_(self->_entitiesMatchingPredicate, v51, (uint64_t)v6);
  }
  objc_msgSend_removeAllObjects(self->_entitiesChangedAddedIDs, v49, v50);
  objc_msgSend_removeAllObjects(self->_entitiesChangedUpdatedIDs, v52, v53);
  objc_msgSend_removeAllObjects(self->_entitiesChangedDeletedIDs, v54, v55);
  objc_msgSend_removeAllObjects(self->_entitiesChangedUpdatedMatchingPredicateIDs, v56, v57);
  objc_msgSend_removeAllObjects(self->_entitiesChangedUpdatedNotMatchingPredicateIDs, v58, v59);

}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)CLSDataObserver;
  -[CLSDataObserver description](&v46, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendString_(v6, v7, (uint64_t)CFSTR(" (invalidated: "));
  if (objc_msgSend_isInvalidated(self, v8, v9))
    objc_msgSend_appendString_(v6, v10, (uint64_t)CFSTR("YES"));
  else
    objc_msgSend_appendString_(v6, v10, (uint64_t)CFSTR("NO"));
  objc_msgSend_appendString_(v6, v11, (uint64_t)CFSTR(") (observerID: "));
  objc_msgSend_appendString_(v6, v12, (uint64_t)self->_observerID);
  objc_msgSend_appendString_(v6, v13, (uint64_t)CFSTR(") (querySpec.entityName: "));
  objc_msgSend_entityName(self->_querySpec, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v6, v17, (uint64_t)v16);

  objc_msgSend_appendString_(v6, v18, (uint64_t)CFSTR(")"));
  objc_msgSend_predicate(self->_querySpec, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend_appendString_(v6, v22, (uint64_t)CFSTR(") (querySpec.predicate: "));
    objc_msgSend_predicate(self->_querySpec, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_debugDescription(v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v6, v30, (uint64_t)v29);

    objc_msgSend_appendString_(v6, v31, (uint64_t)CFSTR(")"));
  }
  objc_msgSend_sortDescriptors(self->_querySpec, v22, v23);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend_appendString_(v6, v33, (uint64_t)CFSTR(") (querySpec.sortDescriptors: "));
    objc_msgSend_sortDescriptors(self->_querySpec, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_debugDescription(v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v6, v41, (uint64_t)v40);

    objc_msgSend_appendString_(v6, v42, (uint64_t)CFSTR(")"));
  }
  if ((objc_msgSend_observerOptions(self->_querySpec, v33, v34) & 1) != 0)
    objc_msgSend_appendString_(v6, v43, (uint64_t)CFSTR(") (behavior: entitiesChanged"));
  else
    objc_msgSend_appendString_(v6, v43, (uint64_t)CFSTR(") (behavior: dataChanged"));
  objc_msgSend_appendString_(v6, v44, (uint64_t)CFSTR(")"));
  return (NSString *)v6;
}

- (id)normalizeKeyPath:(id)a3 forValue:(id)a4
{
  id v4;
  id v6;
  id v7;
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  int isSearchEnabledProcess;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  char v22;

  v6 = a3;
  v7 = a4;
  if (qword_1ED0FB8F0 != -1)
    dispatch_once(&qword_1ED0FB8F0, &unk_1E9749C50);
  v8 = (id)qword_1ED0FB8E8;
  if ((objc_msgSend_containsObject_(v8, v9, (uint64_t)v6) & 1) != 0)
    goto LABEL_9;
  isSearchEnabledProcess = objc_msgSend_isSearchEnabledProcess(CLSEntitlements, v10, v11);
  if (!isSearchEnabledProcess)
  {
    if (objc_msgSend_isDashboardAppProcess(CLSEntitlements, v12, v13))
      goto LABEL_18;
LABEL_25:
    v20 = 0;
LABEL_26:

    goto LABEL_27;
  }
  if (qword_1ED0FB900 != -1)
    dispatch_once(&qword_1ED0FB900, &unk_1E974C3A8);
  v4 = (id)qword_1ED0FB8F8;
  if (objc_msgSend_containsObject_(v4, v15, (uint64_t)v6))
  {

LABEL_9:
LABEL_10:
    if (qword_1ED0FB920 != -1)
      dispatch_once(&qword_1ED0FB920, &unk_1E974C3E8);
    objc_msgSend_objectForKeyedSubscript_((void *)qword_1ED0FB918, v18, (uint64_t)v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v8 = v19;
      v20 = v8;
    }
    else
    {
      v20 = v6;
      v8 = 0;
    }
    goto LABEL_26;
  }
  if ((objc_msgSend_isDashboardAppProcess(CLSEntitlements, v16, v17) & 1) == 0)
  {

    goto LABEL_25;
  }
LABEL_18:
  if (qword_1ED0FB910 != -1)
    dispatch_once(&qword_1ED0FB910, &unk_1E974C3C8);
  v22 = objc_msgSend_containsObject_((void *)qword_1ED0FB908, v21, (uint64_t)v6);
  if (isSearchEnabledProcess)

  if ((v22 & 1) != 0)
    goto LABEL_10;
  v20 = 0;
LABEL_27:

  return v20;
}

- (id)normalizedValue:(id)a3 forKeyPath:(id)a4
{
  id v5;
  unint64_t v6;
  const char *v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;

  v5 = a3;
  v6 = (unint64_t)a4;
  v8 = v6;
  if ((!(v6 | (unint64_t)CFSTR("personID"))
     || v6
     && CFSTR("personID")
     && objc_msgSend_isEqualToString_((void *)v6, v7, (uint64_t)CFSTR("personID")))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_person(v5, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    if (v11)
      objc_msgSend_objectID(v11, v12, v13);
    else
      objc_msgSend_magicValue(CLSCurrentUser, v12, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = CFSTR("parentObjectID");
      if (!(v8 | (unint64_t)CFSTR("parentObjectID"))
        || v8
        && CFSTR("parentObjectID")
        && objc_msgSend_isEqualToString_((void *)v8, v15, (uint64_t)CFSTR("parentObjectID")))
      {
        objc_msgSend_objectID(v5, v15, (uint64_t)v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v17;
      }
    }
    v5 = v5;
    v18 = v5;
  }

  return v18;
}

- (CLSQuerySpecification)querySpec
{
  return self->_querySpec;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSString)observerID
{
  return self->_observerID;
}

- (id)dataChanged
{
  return self->_dataChanged;
}

- (void)setDataChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)entitiesChanged
{
  return self->_entitiesChanged;
}

- (void)setEntitiesChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableSet)entitiesMatchingPredicate
{
  return self->_entitiesMatchingPredicate;
}

- (void)setEntitiesMatchingPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_entitiesMatchingPredicate, a3);
}

- (NSMutableSet)entitiesChangedAddedIDs
{
  return self->_entitiesChangedAddedIDs;
}

- (void)setEntitiesChangedAddedIDs:(id)a3
{
  objc_storeStrong((id *)&self->_entitiesChangedAddedIDs, a3);
}

- (NSMutableSet)entitiesChangedUpdatedIDs
{
  return self->_entitiesChangedUpdatedIDs;
}

- (void)setEntitiesChangedUpdatedIDs:(id)a3
{
  objc_storeStrong((id *)&self->_entitiesChangedUpdatedIDs, a3);
}

- (NSMutableSet)entitiesChangedDeletedIDs
{
  return self->_entitiesChangedDeletedIDs;
}

- (void)setEntitiesChangedDeletedIDs:(id)a3
{
  objc_storeStrong((id *)&self->_entitiesChangedDeletedIDs, a3);
}

- (NSMutableSet)entitiesChangedUpdatedMatchingPredicateIDs
{
  return self->_entitiesChangedUpdatedMatchingPredicateIDs;
}

- (void)setEntitiesChangedUpdatedMatchingPredicateIDs:(id)a3
{
  objc_storeStrong((id *)&self->_entitiesChangedUpdatedMatchingPredicateIDs, a3);
}

- (NSMutableSet)entitiesChangedUpdatedNotMatchingPredicateIDs
{
  return self->_entitiesChangedUpdatedNotMatchingPredicateIDs;
}

- (void)setEntitiesChangedUpdatedNotMatchingPredicateIDs:(id)a3
{
  objc_storeStrong((id *)&self->_entitiesChangedUpdatedNotMatchingPredicateIDs, a3);
}

- (CLSDataStore)dataStore
{
  return (CLSDataStore *)objc_loadWeakRetained((id *)&self->_dataStore);
}

- (void)setDataStore:(id)a3
{
  objc_storeWeak((id *)&self->_dataStore, a3);
}

- (unint64_t)changeTag
{
  return self->_changeTag;
}

- (void)setChangeTag:(unint64_t)a3
{
  self->_changeTag = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataStore);
  objc_storeStrong((id *)&self->_entitiesChangedUpdatedNotMatchingPredicateIDs, 0);
  objc_storeStrong((id *)&self->_entitiesChangedUpdatedMatchingPredicateIDs, 0);
  objc_storeStrong((id *)&self->_entitiesChangedDeletedIDs, 0);
  objc_storeStrong((id *)&self->_entitiesChangedUpdatedIDs, 0);
  objc_storeStrong((id *)&self->_entitiesChangedAddedIDs, 0);
  objc_storeStrong((id *)&self->_entitiesMatchingPredicate, 0);
  objc_storeStrong(&self->_entitiesChanged, 0);
  objc_storeStrong(&self->_dataChanged, 0);
  objc_storeStrong((id *)&self->_observerID, 0);
  objc_storeStrong((id *)&self->_querySpec, 0);
}

@end
