@implementation MOInteraction

- (MOInteraction)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 mechanism:(int64_t)a6 direction:(int64_t)a7 bundleId:(id)a8 groupName:(id)a9 sender:(id)a10 recipients:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  MOInteraction *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  MOInteraction *v40;
  MOInteraction *v41;
  id v43;
  id v44;
  id v45;
  id v46;
  id v48;
  id v49;
  id v52;
  void *v53;
  id v54;
  objc_super v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v48 = a4;
  v17 = a4;
  v49 = a5;
  v18 = a5;
  v52 = a8;
  v19 = a8;
  v54 = a9;
  v20 = a10;
  v21 = a11;
  v53 = v21;
  if (v16)
  {
    v22 = v21;
    v46 = v16;
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v20)
    {
      objc_msgSend(v20, "personId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v20, "personId");
        v25 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v29 = (void *)v25;
        objc_msgSend(v23, "addObject:", v25);

        goto LABEL_11;
      }
      objc_msgSend(v20, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v20, "identifier");
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
LABEL_11:
    v43 = v19;
    v44 = v18;
    v45 = v17;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v30 = v22;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (!v31)
      goto LABEL_23;
    v32 = v31;
    v33 = *(_QWORD *)v57;
    while (1)
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v57 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v35, "personId");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(v35, "personId");
          v37 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v35, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v38)
            continue;
          objc_msgSend(v35, "identifier");
          v37 = objc_claimAutoreleasedReturnValue();
        }
        v39 = (void *)v37;
        objc_msgSend(v23, "addObject:", v37);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (!v32)
      {
LABEL_23:

        v55.receiver = self;
        v55.super_class = (Class)MOInteraction;
        v40 = -[MOGenericInteraction initWithParticipants:](&v55, sel_initWithParticipants_, v23);
        v41 = v40;
        v16 = v46;
        v19 = v43;
        if (v40)
        {
          objc_storeStrong((id *)&v40->_identifier, a3);
          objc_storeStrong((id *)&v41->_startDate, v48);
          objc_storeStrong((id *)&v41->_endDate, v49);
          v41->_mechanism = a6;
          v41->_direction = a7;
          objc_storeStrong((id *)&v41->_bundleId, v52);
          objc_storeStrong((id *)&v41->_groupName, a9);
          objc_storeStrong((id *)&v41->_sender, a10);
          objc_storeStrong((id *)&v41->_recipients, a11);
        }
        self = v41;
        v27 = self;
        v18 = v44;
        v17 = v45;
        goto LABEL_26;
      }
    }
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[MOInteraction initWithIdentifier:startDate:endDate:mechanism:direction:bundleId:groupName:sender:recipients:].cold.1(v26);

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOInteraction.m"), 34, CFSTR("Invalid parameter not satisfying: identifier"));
  v27 = 0;
LABEL_26:

  return v27;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[MOInteraction sender](self, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[MOInteraction recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(";"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB3940];
  -[MOInteraction identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOInteraction startDate](self, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOInteraction endDate](self, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MOInteraction mechanism](self, "mechanism");
  v16 = -[MOInteraction direction](self, "direction");
  -[MOInteraction bundleId](self, "bundleId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOInteraction groupName](self, "groupName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("identifier, %@, startDate, %@, endDate, %@, mechanism, %lu, direction, %lu, bundleId, %@, group name, %@, sender, <%@>, receipts, <%@>"), v12, v13, v14, v15, v16, v17, v18, v22, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mechanism, CFSTR("mechanism"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_direction, CFSTR("direction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleId, CFSTR("bundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupName, CFSTR("groupName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sender, CFSTR("sender"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipients, CFSTR("recipients"));

}

- (MOInteraction)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MOInteraction *v14;
  uint64_t v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("mechanism"));
  v6 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("direction"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sender"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("recipients"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[MOInteraction initWithIdentifier:startDate:endDate:mechanism:direction:bundleId:groupName:sender:recipients:](self, "initWithIdentifier:startDate:endDate:mechanism:direction:bundleId:groupName:sender:recipients:", v17, v4, v5, v16, v6, v7, v8, v9, v13);
  return v14;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (int64_t)mechanism
{
  return self->_mechanism;
}

- (int64_t)direction
{
  return self->_direction;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (MOContact)sender
{
  return self->_sender;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log startDate:endDate:mechanism:direction:bundleId:groupName:sender:recipients:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CAE42000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", v1, 2u);
}

@end
