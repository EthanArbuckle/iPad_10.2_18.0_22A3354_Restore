@implementation LKClassConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LKClassConfiguration)initWithCoder:(id)a3
{
  id v4;
  LKClassConfiguration *v5;
  uint64_t v6;
  NSString *schoolName;
  uint64_t v8;
  NSData *payloadCertificatePersistentID;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *classes;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *classGroups;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *students;
  uint64_t v25;
  NSArray *instructors;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSMutableDictionary *classesByClassID;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSMutableDictionary *usersWithAppleIDByIdentifier;
  uint64_t v39;
  NSMutableDictionary *usersByUsername;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSMutableDictionary *classesByClassGroupName;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSDictionary *classRosterInformationDictionary;
  objc_super v57;

  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)LKClassConfiguration;
  v5 = -[LKClassConfiguration init](&v57, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("schoolName"));
    v6 = objc_claimAutoreleasedReturnValue();
    schoolName = v5->_schoolName;
    v5->_schoolName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadCertificatePersistentID"));
    v8 = objc_claimAutoreleasedReturnValue();
    payloadCertificatePersistentID = v5->_payloadCertificatePersistentID;
    v5->_payloadCertificatePersistentID = (NSData *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("classes"));
    v13 = objc_claimAutoreleasedReturnValue();
    classes = v5->_classes;
    v5->_classes = (NSArray *)v13;

    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("classGroups"));
    v18 = objc_claimAutoreleasedReturnValue();
    classGroups = v5->_classGroups;
    v5->_classGroups = (NSArray *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("students"));
    v23 = objc_claimAutoreleasedReturnValue();
    students = v5->_students;
    v5->_students = (NSArray *)v23;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("instructors"));
    v25 = objc_claimAutoreleasedReturnValue();
    instructors = v5->_instructors;
    v5->_instructors = (NSArray *)v25;

    v27 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("classesByClassID"));
    v31 = objc_claimAutoreleasedReturnValue();
    classesByClassID = v5->_classesByClassID;
    v5->_classesByClassID = (NSMutableDictionary *)v31;

    v33 = (void *)MEMORY[0x24BDBCF20];
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("usersWithAppleIDByIdentifier"));
    v37 = objc_claimAutoreleasedReturnValue();
    usersWithAppleIDByIdentifier = v5->_usersWithAppleIDByIdentifier;
    v5->_usersWithAppleIDByIdentifier = (NSMutableDictionary *)v37;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("usersByUsername"));
    v39 = objc_claimAutoreleasedReturnValue();
    usersByUsername = v5->_usersByUsername;
    v5->_usersByUsername = (NSMutableDictionary *)v39;

    v41 = (void *)MEMORY[0x24BDBCF20];
    v42 = objc_opt_class();
    v43 = objc_opt_class();
    v44 = objc_opt_class();
    objc_msgSend(v41, "setWithObjects:", v42, v43, v44, objc_opt_class(), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("classesByClassGroupName"));
    v46 = objc_claimAutoreleasedReturnValue();
    classesByClassGroupName = v5->_classesByClassGroupName;
    v5->_classesByClassGroupName = (NSMutableDictionary *)v46;

    v48 = (void *)MEMORY[0x24BDBCF20];
    v49 = objc_opt_class();
    v50 = objc_opt_class();
    v51 = objc_opt_class();
    v52 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, v50, v51, v52, objc_opt_class(), 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v53, CFSTR("classRosterInformationDictionary"));
    v54 = objc_claimAutoreleasedReturnValue();
    classRosterInformationDictionary = v5->_classRosterInformationDictionary;
    v5->_classRosterInformationDictionary = (NSDictionary *)v54;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *schoolName;
  id v5;

  schoolName = self->_schoolName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", schoolName, CFSTR("schoolName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payloadCertificatePersistentID, CFSTR("payloadCertificatePersistentID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_classes, CFSTR("classes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_classGroups, CFSTR("classGroups"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_students, CFSTR("students"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_instructors, CFSTR("instructors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_classesByClassID, CFSTR("classesByClassID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_usersWithAppleIDByIdentifier, CFSTR("usersWithAppleIDByIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_usersByUsername, CFSTR("usersByUsername"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_classesByClassGroupName, CFSTR("classesByClassGroupName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_classRosterInformationDictionary, CFSTR("classRosterInformationDictionary"));

}

- (LKClassConfiguration)initWithDictionary:(id)a3
{
  id v5;
  LKClassConfiguration *v6;
  LKClassConfiguration *v7;
  uint64_t v8;
  NSString *schoolName;
  uint64_t v10;
  NSData *payloadCertificatePersistentID;
  uint64_t v12;
  NSMutableDictionary *classesByClassGroupName;
  uint64_t v14;
  NSMutableDictionary *classesByClassID;
  uint64_t v16;
  NSMutableDictionary *usersWithAppleIDByIdentifier;
  uint64_t v18;
  NSMutableDictionary *usersByUsername;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  LKClass *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSMutableDictionary *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSArray *students;
  uint64_t v51;
  NSArray *instructors;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  LKClassGroup *v57;
  void *v58;
  void *v59;
  LKClassConfiguration *v60;
  NSMutableDictionary *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  LKClassGroup *v75;
  NSArray *classGroups;
  id *p_classes;
  void *v79;
  void *v80;
  id obj;
  id v82;
  uint64_t v83;
  void *v84;
  NSArray *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  objc_super v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[16];
  _BYTE v107[128];
  _BYTE v108[16];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  LKRegisterLoginKitLogging();
  v103.receiver = self;
  v103.super_class = (Class)LKClassConfiguration;
  v6 = -[LKClassConfiguration init](&v103, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_classRosterInformationDictionary, a3);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("OrganizationName"));
    v8 = objc_claimAutoreleasedReturnValue();
    schoolName = v7->_schoolName;
    v7->_schoolName = (NSString *)v8;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PayloadCertificatePersistentID"));
    v10 = objc_claimAutoreleasedReturnValue();
    payloadCertificatePersistentID = v7->_payloadCertificatePersistentID;
    v7->_payloadCertificatePersistentID = (NSData *)v10;

    v12 = objc_opt_new();
    classesByClassGroupName = v7->_classesByClassGroupName;
    v7->_classesByClassGroupName = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    classesByClassID = v7->_classesByClassID;
    v7->_classesByClassID = (NSMutableDictionary *)v14;

    v16 = objc_opt_new();
    usersWithAppleIDByIdentifier = v7->_usersWithAppleIDByIdentifier;
    v7->_usersWithAppleIDByIdentifier = (NSMutableDictionary *)v16;

    v18 = objc_opt_new();
    usersByUsername = v7->_usersByUsername;
    v7->_usersByUsername = (NSMutableDictionary *)v18;

    v86 = (void *)objc_opt_new();
    v84 = (void *)objc_opt_new();
    v80 = (void *)objc_opt_new();
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v79 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Users"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v100;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v100 != v23)
            objc_enumerationMutation(v20);
          +[LKUser userFromDictionary:](LKUser, "userFromDictionary:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v24));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "setObject:forKeyedSubscript:", v25, v26);

          objc_msgSend(v25, "username");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            v28 = v7->_usersByUsername;
            objc_msgSend(v25, "username");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v25, v29);

            objc_msgSend(v25, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              v31 = v7->_usersWithAppleIDByIdentifier;
              objc_msgSend(v25, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v25, v32);

            }
          }
          else
          {
            v33 = (void *)LKLogParsing;
            if (os_log_type_enabled((os_log_t)LKLogParsing, OS_LOG_TYPE_DEBUG))
              -[LKClassConfiguration initWithDictionary:].cold.2((uint64_t)v108, v33);
          }
          objc_msgSend(v84, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
      }
      while (v22);
    }

    obj = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("Groups"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v96;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v96 != v37)
            objc_enumerationMutation(v34);
          v39 = -[LKClass initWithClassDictionary:usersByUserIdentifier:]([LKClass alloc], "initWithClassDictionary:usersByUserIdentifier:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * v38), v86);
          -[LKClass classID](v39, "classID");
          v40 = objc_claimAutoreleasedReturnValue();
          if (v40
            && (v41 = (void *)v40,
                -[LKClass students](v39, "students"),
                v42 = (void *)objc_claimAutoreleasedReturnValue(),
                v43 = objc_msgSend(v42, "count"),
                v42,
                v41,
                v43))
          {
            v44 = v7->_classesByClassID;
            -[LKClass classID](v39, "classID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:", v39, v45);

            objc_msgSend(obj, "addObject:", v39);
            -[LKClass instructors](v39, "instructors");
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            if (v46)
            {
              -[LKClass instructors](v39, "instructors");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "addObjectsFromArray:", v47);

            }
          }
          else
          {
            v48 = (void *)LKLogParsing;
            if (os_log_type_enabled((os_log_t)LKLogParsing, OS_LOG_TYPE_DEBUG))
              -[LKClassConfiguration initWithDictionary:].cold.1((uint64_t)v106, v48);
          }

          ++v38;
        }
        while (v36 != v38);
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
      }
      while (v36);
    }

    -[NSMutableDictionary allValues](v7->_usersWithAppleIDByIdentifier, "allValues");
    v49 = objc_claimAutoreleasedReturnValue();
    students = v7->_students;
    v7->_students = (NSArray *)v49;

    p_classes = (id *)&v7->_classes;
    objc_storeStrong((id *)&v7->_classes, obj);
    objc_msgSend(v80, "allObjects");
    v51 = objc_claimAutoreleasedReturnValue();
    instructors = v7->_instructors;
    v7->_instructors = (NSArray *)v51;

    v53 = (void *)-[NSMutableDictionary mutableCopy](v7->_classesByClassID, "mutableCopy");
    v85 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("Departments"));
    v82 = (id)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
    if (v54)
    {
      v55 = v54;
      v83 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v92 != v83)
            objc_enumerationMutation(v82);
          v57 = -[LKClassGroup initWithClassGroupDictionary:classesDictionaryByClassID:]([LKClassGroup alloc], "initWithClassGroupDictionary:classesDictionaryByClassID:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i), v7->_classesByClassID);
          -[LKClassGroup classGroupName](v57, "classGroupName");
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          if (v58)
          {
            -[LKClassGroup classes](v57, "classes");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = v7;
            v61 = v7->_classesByClassGroupName;
            -[LKClassGroup classGroupName](v57, "classGroupName");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v61, "setObject:forKeyedSubscript:", v59, v62);

            v89 = 0u;
            v90 = 0u;
            v87 = 0u;
            v88 = 0u;
            -[LKClassGroup classes](v57, "classes");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
            if (v64)
            {
              v65 = v64;
              v66 = *(_QWORD *)v88;
              do
              {
                for (j = 0; j != v65; ++j)
                {
                  if (*(_QWORD *)v88 != v66)
                    objc_enumerationMutation(v63);
                  objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * j), "classID");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "removeObjectForKey:", v68);

                }
                v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
              }
              while (v65);
            }

            v7 = v60;
          }
          -[NSArray addObject:](v85, "addObject:", v57);

        }
        v55 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
      }
      while (v55);
    }

    objc_msgSend(v53, "allValues");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v69, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("Other Classes"), &stru_24D59BB58, 0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      v72 = objc_msgSend(v69, "count");
      if (v72 == objc_msgSend(*p_classes, "count"))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("All Classes"), &stru_24D59BB58, 0);
        v74 = objc_claimAutoreleasedReturnValue();

        v71 = (void *)v74;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_classesByClassGroupName, "setObject:forKeyedSubscript:", v69, v71);
      v75 = -[LKClassGroup initWithGroupName:classes:]([LKClassGroup alloc], "initWithGroupName:classes:", v71, v69);
      -[NSArray addObject:](v85, "addObject:", v75);

    }
    classGroups = v7->_classGroups;
    v7->_classGroups = v85;

    v5 = v79;
  }

  return v7;
}

- (id)dictionary
{
  return self->_classRosterInformationDictionary;
}

- (LKClassConfiguration)initWithPropertyList:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  LKClassConfiguration *v10;

  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a3;
  objc_msgSend(v5, "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathForResource:ofType:", v6, CFSTR("plist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    self = -[LKClassConfiguration initWithDictionary:](self, "initWithDictionary:", v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)classInfoForClassID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_classesByClassID, "objectForKeyedSubscript:", a3);
}

- (id)studentForStudentIdentifier:(id)a3 inClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[LKClassConfiguration usersWithAppleIDByIdentifier](self, "usersWithAppleIDByIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v7, "students", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

          if (v16)
          {
            v11 = v9;
            goto LABEL_12;
          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)studentForStudentIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[LKClassConfiguration usersWithAppleIDByIdentifier](self, "usersWithAppleIDByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)studentForUsername:(id)a3 inClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[LKClassConfiguration usersByUsername](self, "usersByUsername");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v7, "students", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "username");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "username");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

          if (v16)
          {
            v11 = v9;
            goto LABEL_12;
          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)studentForUsername:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[LKClassConfiguration usersByUsername](self, "usersByUsername");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)classesByClassGroupNameDictionary
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LKClasses *v11;
  void *v12;
  LKClasses *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary allKeys](self->_classesByClassGroupName, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [LKClasses alloc];
        -[NSMutableDictionary objectForKeyedSubscript:](self->_classesByClassGroupName, "objectForKeyedSubscript:", v10, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[LKClasses initWithClassArray:](v11, "initWithClassArray:", v12);
        objc_msgSend(v4, "setObject:forKey:", v13, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSString)schoolName
{
  return self->_schoolName;
}

- (NSArray)classes
{
  return self->_classes;
}

- (NSArray)students
{
  return self->_students;
}

- (void)setStudents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)payloadCertificatePersistentID
{
  return self->_payloadCertificatePersistentID;
}

- (NSArray)classGroups
{
  return self->_classGroups;
}

- (void)setClassGroups:(id)a3
{
  objc_storeStrong((id *)&self->_classGroups, a3);
}

- (NSArray)instructors
{
  return self->_instructors;
}

- (NSMutableDictionary)classesByClassID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClassesByClassID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)usersWithAppleIDByIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUsersWithAppleIDByIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)usersByUsername
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUsersByUsername:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)classesByClassGroupName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setClassesByClassGroupName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDictionary)classRosterInformationDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setClassRosterInformationDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classRosterInformationDictionary, 0);
  objc_storeStrong((id *)&self->_classesByClassGroupName, 0);
  objc_storeStrong((id *)&self->_usersByUsername, 0);
  objc_storeStrong((id *)&self->_usersWithAppleIDByIdentifier, 0);
  objc_storeStrong((id *)&self->_classesByClassID, 0);
  objc_storeStrong((id *)&self->_instructors, 0);
  objc_storeStrong((id *)&self->_classGroups, 0);
  objc_storeStrong((id *)&self->_payloadCertificatePersistentID, 0);
  objc_storeStrong((id *)&self->_students, 0);
  objc_storeStrong((id *)&self->_classes, 0);
  objc_storeStrong((id *)&self->_schoolName, 0);
}

- (void)initWithDictionary:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_1_1(a1, a2);
  objc_msgSend(v3, "classID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138477827;
  *v2 = v6;
  OUTLINED_FUNCTION_0_1(&dword_2167FC000, v7, v8, "Ignoring the class with ID: %{private}@ Reason: No students in the class");

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithDictionary:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_1_1(a1, a2);
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138477827;
  *v2 = v6;
  OUTLINED_FUNCTION_0_1(&dword_2167FC000, v7, v8, "The user with ID: %{private}@ will not be visible in any class because of no Apple ID");

  OUTLINED_FUNCTION_2_0();
}

@end
