@implementation _UIDiffableDataSourceUpdate

- (_UIDiffableDataSourceUpdate)initWithIdentifiers:(id)a3 sectionIdentifiers:(id)a4 action:(int64_t)a5 desinationIdentifier:(id)a6 relativePosition:(int64_t)a7 destinationIsSection:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  _UIDiffableDataSourceUpdate *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSOrderedSet *identifiers;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  id v37;
  void *v38;
  id v39;
  int64_t v40;
  id v41;
  id v42;
  int64_t v43;
  BOOL v44;
  SEL v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  if (v15 && v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = v17;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceUpdate.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!(itemIdentifiers && sectionIdentifiers)"));

    v17 = v37;
  }
  v50.receiver = self;
  v50.super_class = (Class)_UIDiffableDataSourceUpdate;
  v18 = -[_UIDiffableDataSourceUpdate init](&v50, sel_init);
  if (v18)
  {
    v45 = a2;
    if (v15)
      v19 = v15;
    else
      v19 = v16;
    v20 = v19;
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    identifiers = v18->_identifiers;
    v18->_identifiers = (NSOrderedSet *)v21;

    v23 = -[NSOrderedSet count](v18->_identifiers, "count");
    if (v23 != objc_msgSend(v20, "count"))
    {
      v39 = v17;
      v40 = a5;
      v41 = a6;
      v42 = v16;
      v43 = a7;
      v44 = a8;
      v24 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v25 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v26 = v20;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v47 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
            if (objc_msgSend(v24, "containsObject:", v31))
              v32 = v25;
            else
              v32 = v24;
            objc_msgSend(v32, "addObject:", v31);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        }
        while (v28);
      }

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      v35 = CFSTR("section");
      if (v15)
        v35 = CFSTR("item");
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", v45, v18, CFSTR("_UIDiffableDataSourceUpdate.m"), 81, CFSTR("Fatal: supplied %@ identifiers are not unique. Duplicate identifiers: %@"), v35, v25);

      a8 = v44;
      v16 = v42;
      a7 = v43;
      a5 = v40;
      a6 = v41;
      v17 = v39;
    }
    v18->_action = a5;
    v18->_isSectionOperation = v16 != 0;
    objc_storeStrong(&v18->_destinationIdentifier, a6);
    v18->_relativePosition = a7;
    v18->_destinationIdentifierIsSectionIdentifier = a8;
    -[_UIDiffableDataSourceUpdate _throwIfInvalid](v18, "_throwIfInvalid");

  }
  return v18;
}

- (_UIDiffableDataSourceUpdate)initWithItemIdentifiers:(id)a3 action:(int64_t)a4
{
  return -[_UIDiffableDataSourceUpdate initWithIdentifiers:sectionIdentifiers:action:desinationIdentifier:relativePosition:destinationIsSection:](self, "initWithIdentifiers:sectionIdentifiers:action:desinationIdentifier:relativePosition:destinationIsSection:", a3, 0, a4, 0, 2, 0);
}

- (_UIDiffableDataSourceUpdate)initWithItemIdentifiers:(id)a3 action:(int64_t)a4 destinationIdentifier:(id)a5 relativePosition:(int64_t)a6
{
  return -[_UIDiffableDataSourceUpdate initWithIdentifiers:sectionIdentifiers:action:desinationIdentifier:relativePosition:destinationIsSection:](self, "initWithIdentifiers:sectionIdentifiers:action:desinationIdentifier:relativePosition:destinationIsSection:", a3, 0, a4, a5, a6, 0);
}

- (_UIDiffableDataSourceUpdate)initWithReconfiguredItemIdentifiers:(id)a3
{
  _UIDiffableDataSourceUpdate *v3;
  _UIDiffableDataSourceUpdate *v4;

  v3 = -[_UIDiffableDataSourceUpdate initWithItemIdentifiers:action:](self, "initWithItemIdentifiers:action:", a3, 2);
  v4 = v3;
  if (v3)
    v3->_shouldReconfigure = 1;

  return v4;
}

- (_UIDiffableDataSourceUpdate)initWithSectionIdentifiers:(id)a3 action:(int64_t)a4
{
  id v7;
  _UIDiffableDataSourceUpdate *v8;
  void *v10;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceUpdate.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifiers"));

  }
  v8 = -[_UIDiffableDataSourceUpdate initWithIdentifiers:sectionIdentifiers:action:desinationIdentifier:relativePosition:destinationIsSection:](self, "initWithIdentifiers:sectionIdentifiers:action:desinationIdentifier:relativePosition:destinationIsSection:", 0, v7, a4, 0, 2, 0);

  return v8;
}

- (_UIDiffableDataSourceUpdate)initWithSectionIdentifiers:(id)a3 action:(int64_t)a4 destinationIdentifier:(id)a5 relativePosition:(int64_t)a6
{
  id v11;
  id v12;
  _UIDiffableDataSourceUpdate *v13;
  void *v15;

  v11 = a3;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceUpdate.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifiers"));

  }
  v13 = -[_UIDiffableDataSourceUpdate initWithIdentifiers:sectionIdentifiers:action:desinationIdentifier:relativePosition:destinationIsSection:](self, "initWithIdentifiers:sectionIdentifiers:action:desinationIdentifier:relativePosition:destinationIsSection:", 0, v11, a4, v12, a6, 0);

  return v13;
}

- (_UIDiffableDataSourceUpdate)initWithItemIdentifiers:(id)a3 appendingToDestinationSectionIdentifier:(id)a4
{
  id v7;
  id v8;
  _UIDiffableDataSourceUpdate *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceUpdate.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifiers"));

  }
  v9 = -[_UIDiffableDataSourceUpdate initWithIdentifiers:sectionIdentifiers:action:desinationIdentifier:relativePosition:destinationIsSection:](self, "initWithIdentifiers:sectionIdentifiers:action:desinationIdentifier:relativePosition:destinationIsSection:", v7, 0, 0, v8, 1, 1);

  return v9;
}

- (_UIDiffableDataSourceUpdate)initWithSectionIdentifiers:(id)a3 appendingToDestinationSectionIdentifier:(id)a4
{
  id v7;
  id v8;
  _UIDiffableDataSourceUpdate *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceUpdate.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifiers"));

  }
  v9 = -[_UIDiffableDataSourceUpdate initWithIdentifiers:sectionIdentifiers:action:desinationIdentifier:relativePosition:destinationIsSection:](self, "initWithIdentifiers:sectionIdentifiers:action:desinationIdentifier:relativePosition:destinationIsSection:", 0, v7, 0, v8, 1, 1);

  return v9;
}

+ (id)updateDeleteAll
{
  _BYTE *v2;

  v2 = (_BYTE *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifiers:sectionIdentifiers:action:desinationIdentifier:relativePosition:destinationIsSection:", 0, 0, 1, 0, 2, 1);
  v2[11] = 1;
  return v2;
}

- (id)description
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id destinationIdentifier;
  void *v11;
  void *v12;

  switch(self->_action)
  {
    case 0:
      v3 = CFSTR("INS");
      break;
    case 1:
      v3 = CFSTR("DEL");
      break;
    case 2:
      if (self->_shouldReconfigure)
        v4 = CFSTR("REC");
      else
        v4 = CFSTR("REL");
      v3 = v4;
      break;
    case 3:
      v3 = CFSTR("MOV");
      break;
    case 4:
      v3 = CFSTR("NOOP");
      break;
    default:
      v3 = CFSTR("<unknown>");
      break;
  }
  -[NSOrderedSet array](self->_identifiers, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  destinationIdentifier = self->_destinationIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_destinationIdentifierIsSectionIdentifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@ %p - action: %@; destinationIdentifier:%@; destIsSection: %@; identifiers: [%@]>"),
    v9,
    self,
    v3,
    destinationIdentifier,
    v11,
    v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_throwIfInvalid
{
  int64_t action;
  id destinationIdentifier;
  _BOOL4 isSectionOperation;
  _BOOL4 v7;
  id v8;

  action = self->_action;
  if (action == 3)
  {
    isSectionOperation = self->_isSectionOperation;
    v7 = -[NSOrderedSet containsObject:](self->_identifiers, "containsObject:", self->_destinationIdentifier);
    if (isSectionOperation)
    {
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceUpdate.m"), 174, CFSTR("Invalid update: destination for section move is the same as the source [%@] for update: %@."), self->_destinationIdentifier, self);
        goto LABEL_17;
      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceUpdate.m"), 176, CFSTR("Invalid update: destination for item move is the same as the source [%@] for update: %@."), self->_destinationIdentifier, self);
      goto LABEL_17;
    }
  }
  else if (!action)
  {
    destinationIdentifier = self->_destinationIdentifier;
    if (self->_isSectionOperation)
    {
      if (destinationIdentifier && -[NSOrderedSet containsObject:](self->_identifiers, "containsObject:"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceUpdate.m"), 165, CFSTR("Invalid update: destination for section operation [%@] is in the inserted section list for update: %@"), self->_destinationIdentifier, self);
LABEL_17:

      }
    }
    else if (destinationIdentifier
           && !self->_destinationIdentifierIsSectionIdentifier
           && -[NSOrderedSet containsObject:](self->_identifiers, "containsObject:"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceUpdate.m"), 169, CFSTR("Invalid update: destination for insertion operation [%@] is in the insertion identifier list for update: %@."), self->_destinationIdentifier, self);
      goto LABEL_17;
    }
  }
}

- (BOOL)isSectionOperation
{
  return self->_isSectionOperation;
}

- (NSOrderedSet)identifiers
{
  return self->_identifiers;
}

- (int64_t)action
{
  return self->_action;
}

- (BOOL)shouldReconfigure
{
  return self->_shouldReconfigure;
}

- (BOOL)isDeleteAll
{
  return self->_isDeleteAll;
}

- (int64_t)relativePosition
{
  return self->_relativePosition;
}

- (id)destinationIdentifier
{
  return self->_destinationIdentifier;
}

- (BOOL)destinationIdentifierIsSectionIdentifier
{
  return self->_destinationIdentifierIsSectionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_destinationIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
