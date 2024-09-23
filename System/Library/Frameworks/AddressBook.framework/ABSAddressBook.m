@implementation ABSAddressBook

+ (void)initialize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ABSAddressBook;
  objc_msgSendSuper2(&v3, sel_initialize);
  if ((id)objc_opt_class() == a1)
    ABSPersonConstantsInitialize();
}

- (ABSAddressBook)init
{
  ABSAddressBookSettings *v3;
  ABSAddressBook *v4;

  v3 = objc_alloc_init(ABSAddressBookSettings);
  v4 = -[ABSAddressBook initWithSettings:error:](self, "initWithSettings:error:", v3, 0);

  return v4;
}

- (ABSAddressBook)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  ABSAddressBookSettings *v7;
  ABSAddressBook *v8;

  v6 = a3;
  v7 = -[ABSAddressBookSettings initWithOptions:]([ABSAddressBookSettings alloc], "initWithOptions:", v6);

  v8 = -[ABSAddressBook initWithSettings:error:](self, "initWithSettings:error:", v7, a4);
  return v8;
}

- (ABSAddressBook)initWithOptions:(id)a3 policy:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  ABSAddressBookSettings *v9;
  ABSAddressBook *v10;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = -[ABSAddressBookSettings initWithOptions:policy:]([ABSAddressBookSettings alloc], "initWithOptions:policy:", v8, v6);

  v10 = -[ABSAddressBook initWithSettings:error:](self, "initWithSettings:error:", v9, a5);
  return v10;
}

- (ABSAddressBook)initWithSettings:(id)a3 error:(id *)a4
{
  id v6;
  ABSAddressBook *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  ABSAddressBookContextStorage *contacts;
  uint64_t v12;
  ABSAddressBookContextStorage *groups;
  uint64_t v14;
  ABSAddressBookContextStorage *sources;
  ABSChangeCallbacks *v16;
  ABSChangeCallbacks *changeCallbacks;
  uint64_t v18;
  CNFuture *storeFuture;
  uint64_t v20;
  ABSBulkFaultHandler *faultHandler;
  void *v22;
  ABSAddressBook *v23;
  ABSAddressBook *v24;
  _QWORD v26[4];
  ABSAddressBook *v27;
  objc_super v28;

  v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ABSAddressBook;
  v7 = -[ABSAddressBook init](&v28, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE19228], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "authorizationStatus");

    if (v9 == 1 && !objc_msgSend(v6, "policy"))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ABAddressBookErrorDomain"), 1, 0);
      v24 = (ABSAddressBook *)objc_claimAutoreleasedReturnValue();
      v23 = v24;
      if (a4)
        *a4 = objc_retainAutorelease(v24);

      v7 = 0;
      goto LABEL_10;
    }
    v10 = objc_opt_new();
    contacts = v7->_contacts;
    v7->_contacts = (ABSAddressBookContextStorage *)v10;

    v12 = objc_opt_new();
    groups = v7->_groups;
    v7->_groups = (ABSAddressBookContextStorage *)v12;

    v14 = objc_opt_new();
    sources = v7->_sources;
    v7->_sources = (ABSAddressBookContextStorage *)v14;

    v16 = -[ABSChangeCallbacks initWithAddressBook:]([ABSChangeCallbacks alloc], "initWithAddressBook:", v7);
    changeCallbacks = v7->_changeCallbacks;
    v7->_changeCallbacks = v16;

    objc_msgSend(v6, "contactStoreFuture");
    v18 = objc_claimAutoreleasedReturnValue();
    storeFuture = v7->_storeFuture;
    v7->_storeFuture = (CNFuture *)v18;

    v20 = objc_msgSend(v6, "newFaultHandlerWithStorage:", v7->_contacts);
    faultHandler = v7->_faultHandler;
    v7->_faultHandler = (ABSBulkFaultHandler *)v20;

    if (!v9 && objc_msgSend(v6, "policy") == 1)
    {
      objc_msgSend(MEMORY[0x24BE19228], "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __41__ABSAddressBook_initWithSettings_error___block_invoke;
      v26[3] = &unk_24C2F4CA8;
      v7 = v7;
      v27 = v7;
      objc_msgSend(v22, "requestAuthorization:completionHandler:", 1, v26);

      v23 = v27;
LABEL_10:

    }
  }

  return v7;
}

uint64_t __41__ABSAddressBook_initWithSettings_error___block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BE19228], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isAccessGranted");

  return objc_msgSend((id)objc_opt_class(), "callLocalChangeCallbacks:", v1);
}

+ (BOOL)eraseAllDataAtLocationName:(id)a3 error:(id *)a4
{
  return objc_msgSend(MEMORY[0x24BDBACF8], "eraseAllDataAtLocationWithName:error:", a3, a4);
}

- (CNContactStore)store
{
  void *v2;
  void *v3;

  -[ABSAddressBook storeFuture](self, "storeFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "result:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContactStore *)v3;
}

- (id)_storageForRecordClass:(Class)a3
{
  void *v5;

  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    -[ABSAddressBook contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    -[ABSAddressBook groups](self, "groups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    -[ABSAddressBook sources](self, "sources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)addRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  if (+[ABSAddressBook authorizationStatus](ABSAddressBook, "authorizationStatus") != 3)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ABAddressBookErrorDomain"), 1, 0);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (!v6)
    goto LABEL_7;
  objc_msgSend(v6, "addressBook");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_7;
  -[ABSAddressBook _storageForRecordClass:](self, "_storageForRecordClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAddressBook:", self);
  objc_msgSend(v8, "addRecord:", v6);

  v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)recordUpdated:(id)a3
{
  id v4;
  void *v5;
  ABSAddressBook *v6;
  char v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "addressBook"),
        v6 = (ABSAddressBook *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == self))
  {
    -[ABSAddressBook _storageForRecordClass:](self, "_storageForRecordClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "recordUpdated:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)removeRecord:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  void *v8;

  v6 = a3;
  v7 = +[ABSAddressBook authorizationStatus](ABSAddressBook, "authorizationStatus");
  if (v7 == 3)
  {
    -[ABSAddressBook _storageForRecordClass:](self, "_storageForRecordClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteRecord:", v6);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ABAddressBookErrorDomain"), 1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 == 3;
}

- (BOOL)save:(id *)a3
{
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t ii;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t jj;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t kk;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t mm;
  void *v75;
  uint64_t nn;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i1;
  void *v83;
  void *v84;
  void *v85;
  uint64_t i2;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i3;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  int v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  id *v120;
  void *v121;
  void *v122;
  ABSAddressBook *v123;
  id obj;
  id obja;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  uint64_t v183;
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  uint64_t v197;

  v197 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE19228], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAccessGranted");

  if ((v6 & 1) != 0)
  {
    v120 = a3;
    v7 = objc_alloc_init(MEMORY[0x24BDBADA8]);
    -[ABSAddressBook sources](self, "sources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABSAddressBook contacts](self, "contacts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = self;
    -[ABSAddressBook groups](self, "groups");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = 0u;
    v180 = 0u;
    v181 = 0u;
    v182 = 0u;
    objc_msgSend(v8, "insertedRecords");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v179, v196, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v180;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v180 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v179 + 1) + 8 * i), "cnImpl", v120);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addContainer:toAccountWithIdentifier:", v15, 0);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v179, v196, 16);
      }
      while (v12);
    }

    v177 = 0u;
    v178 = 0u;
    v175 = 0u;
    v176 = 0u;
    objc_msgSend(v8, "updatedRecords");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v175, v195, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v176;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v176 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v175 + 1) + 8 * j), "cnImpl", v120);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "updateContainer:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v175, v195, 16);
      }
      while (v19);
    }

    v173 = 0u;
    v174 = 0u;
    v171 = 0u;
    v172 = 0u;
    objc_msgSend(v8, "deletedRecords");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v171, v194, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v172;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v172 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v171 + 1) + 8 * k), "cnImpl", v120);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "deleteContainer:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v171, v194, 16);
      }
      while (v26);
    }

    v169 = 0u;
    v170 = 0u;
    v167 = 0u;
    v168 = 0u;
    objc_msgSend(v9, "insertedRecords");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v167, v193, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v168;
      do
      {
        for (m = 0; m != v32; ++m)
        {
          if (*(_QWORD *)v168 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * m);
          objc_msgSend(v35, "source", v120);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "cnImpl");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "CNIdentifierString");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addContact:toContainerWithIdentifier:", v37, v38);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v167, v193, 16);
      }
      while (v32);
    }

    v165 = 0u;
    v166 = 0u;
    v163 = 0u;
    v164 = 0u;
    objc_msgSend(v9, "deletedRecords");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "allValues");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v163, v192, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v164;
      do
      {
        for (n = 0; n != v42; ++n)
        {
          if (*(_QWORD *)v164 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v163 + 1) + 8 * n), "cnImpl", v120);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "deleteContact:", v45);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v163, v192, 16);
      }
      while (v42);
    }

    v161 = 0u;
    v162 = 0u;
    v159 = 0u;
    v160 = 0u;
    objc_msgSend(v9, "updatedRecords");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "allValues");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v159, v191, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v160;
      do
      {
        for (ii = 0; ii != v49; ++ii)
        {
          if (*(_QWORD *)v160 != v50)
            objc_enumerationMutation(v47);
          objc_msgSend(*(id *)(*((_QWORD *)&v159 + 1) + 8 * ii), "cnImpl", v120);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "updateContact:", v52);

        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v159, v191, 16);
      }
      while (v49);
    }

    v157 = 0u;
    v158 = 0u;
    v155 = 0u;
    v156 = 0u;
    objc_msgSend(v130, "insertedRecords");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v155, v190, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v156;
      do
      {
        for (jj = 0; jj != v55; ++jj)
        {
          if (*(_QWORD *)v156 != v56)
            objc_enumerationMutation(v53);
          v58 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * jj);
          objc_msgSend(v58, "source", v120);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "cnImpl");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "CNIdentifierString");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addGroup:toContainerWithIdentifier:", v60, v61);

        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v155, v190, 16);
      }
      while (v55);
    }

    v153 = 0u;
    v154 = 0u;
    v151 = 0u;
    v152 = 0u;
    objc_msgSend(v130, "deletedRecords");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "allValues");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v151, v189, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v152;
      do
      {
        for (kk = 0; kk != v65; ++kk)
        {
          if (*(_QWORD *)v152 != v66)
            objc_enumerationMutation(v63);
          objc_msgSend(*(id *)(*((_QWORD *)&v151 + 1) + 8 * kk), "cnImpl", v120);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "deleteGroup:", v68);

        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v151, v189, 16);
      }
      while (v65);
    }

    v149 = 0u;
    v150 = 0u;
    v147 = 0u;
    v148 = 0u;
    objc_msgSend(v130, "updatedRecords");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "allValues");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v147, v188, 16);
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v148;
      do
      {
        for (mm = 0; mm != v72; ++mm)
        {
          if (*(_QWORD *)v148 != v73)
            objc_enumerationMutation(v70);
          objc_msgSend(*(id *)(*((_QWORD *)&v147 + 1) + 8 * mm), "cnImpl", v120);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "updateGroup:", v75);

        }
        v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v147, v188, 16);
      }
      while (v72);
    }
    v121 = v9;
    v122 = v8;

    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    objc_msgSend(v130, "recordsWithPendingMembershipAdditions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v187, 16);
    if (v128)
    {
      v126 = *(_QWORD *)v144;
      do
      {
        for (nn = 0; nn != v128; ++nn)
        {
          if (*(_QWORD *)v144 != v126)
            objc_enumerationMutation(obj);
          v77 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * nn);
          objc_msgSend(v130, "addedMembersForRecord:", v77, v120);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v139 = 0u;
          v140 = 0u;
          v141 = 0u;
          v142 = 0u;
          v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v139, v186, 16);
          if (v79)
          {
            v80 = v79;
            v81 = *(_QWORD *)v140;
            do
            {
              for (i1 = 0; i1 != v80; ++i1)
              {
                if (*(_QWORD *)v140 != v81)
                  objc_enumerationMutation(v78);
                v83 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * i1);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v83, "cnImpl");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "cnImpl");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "addMember:toGroup:", v84, v85);

                }
              }
              v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v139, v186, 16);
            }
            while (v80);
          }

        }
        v128 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v187, 16);
      }
      while (v128);
    }

    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    objc_msgSend(v130, "recordsWithPendingMembershipDeletions");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v135, v185, 16);
    if (v129)
    {
      v127 = *(_QWORD *)v136;
      do
      {
        for (i2 = 0; i2 != v129; ++i2)
        {
          if (*(_QWORD *)v136 != v127)
            objc_enumerationMutation(obja);
          v87 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i2);
          objc_msgSend(v130, "removedMembersForRecord:", v87, v120);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = 0u;
          v132 = 0u;
          v133 = 0u;
          v134 = 0u;
          v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v131, v184, 16);
          if (v89)
          {
            v90 = v89;
            v91 = *(_QWORD *)v132;
            do
            {
              for (i3 = 0; i3 != v90; ++i3)
              {
                if (*(_QWORD *)v132 != v91)
                  objc_enumerationMutation(v88);
                v93 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i3);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v93, "cnImpl");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v87, "cnImpl");
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "removeMember:fromGroup:", v94, v95);

                }
              }
              v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v131, v184, 16);
            }
            while (v90);
          }

        }
        v129 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v135, v185, 16);
      }
      while (v129);
    }

    -[ABSAddressBook store](v123, "store");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "executeSaveRequest:error:", v7, v120);

    if (v120)
    {
      if (*v120)
      {
        objc_msgSend(*v120, "domain");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = objc_msgSend(v98, "isEqualToString:", *MEMORY[0x24BDBA420]);

        if (v99)
        {
          if (objc_msgSend(*v120, "code") == 100)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ABAddressBookErrorDomain"), 1, 0);
            *v120 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
    if (v97)
    {
      -[ABSAddressBook contacts](v123, "contacts");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "insertedRecords");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend(v101, "count");

      if (v102)
      {
        -[ABSAddressBook contacts](v123, "contacts");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "insertedRecords");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v183 = *MEMORY[0x24BDBA2D8];
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v183, 1);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        -[ABSAddressBook updatePeople:refetchingProperties:](v123, "updatePeople:refetchingProperties:", v104, v105);

      }
      -[ABSAddressBook contacts](v123, "contacts", v120);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "commitPendingChanges");

      -[ABSAddressBook groups](v123, "groups");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "insertedRecords");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = objc_msgSend(v108, "count");

      if (v109)
      {
        -[ABSAddressBook groups](v123, "groups");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "insertedRecords");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        -[ABSAddressBook updateFetchingAllPropertiesForGroups:](v123, "updateFetchingAllPropertiesForGroups:", v111);

      }
      -[ABSAddressBook groups](v123, "groups");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "commitPendingChanges");

      -[ABSAddressBook sources](v123, "sources");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "insertedRecords");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = objc_msgSend(v114, "count");

      if (v115)
      {
        -[ABSAddressBook sources](v123, "sources");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "insertedRecords");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        -[ABSAddressBook updateFetchingAllPropertiesForSources:](v123, "updateFetchingAllPropertiesForSources:", v117);

      }
      -[ABSAddressBook sources](v123, "sources");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "commitPendingChanges");

    }
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ABAddressBookErrorDomain"), 1, 0);
    LOBYTE(v97) = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v97) = 0;
  }
  return v97;
}

- (BOOL)hasUnsavedChanges
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[ABSAddressBook groups](self, "groups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasUnsavedChanges") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[ABSAddressBook contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasUnsavedChanges") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[ABSAddressBook sources](self, "sources");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "hasUnsavedChanges");

    }
  }

  return v4;
}

- (void)revert
{
  void *v3;
  void *v4;
  id v5;

  -[ABSAddressBook groups](self, "groups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "revert");

  -[ABSAddressBook contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "revert");

  -[ABSAddressBook sources](self, "sources");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "revert");

}

- (void)registerExternalChangeCallback:(void *)a3 context:(void *)a4
{
  void *v6;
  id v7;

  -[ABSAddressBook changeCallbacks](self, "changeCallbacks");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addExternalCallback:onThread:withContext:", a3, v6, a4);

}

- (void)unregisterExternalChangeCallback:(void *)a3 context:(void *)a4
{
  id v6;

  -[ABSAddressBook changeCallbacks](self, "changeCallbacks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeExternalCallback:withContext:", a3, a4);

}

+ (id)localizedLabelForLabel:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, v4, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)personCount
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  int64_t v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  uint64_t *v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = -1;
  objc_msgSend(MEMORY[0x24BE19228], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAccessGranted");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDBACB8]);
    v30[0] = *MEMORY[0x24BDBA2E0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithKeysToFetch:", v6);

    v8 = (void *)MEMORY[0x24BDBCF20];
    -[ABSAddressBook contacts](self, "contacts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deletedRecords");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_cn_map:", &__block_literal_global_11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setUnifyResults:", 0);
    v27[3] = 0;
    -[ABSAddressBook store](self, "store");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __29__ABSAddressBook_personCount__block_invoke_2;
    v22 = &unk_24C2F4CF0;
    v15 = v13;
    v23 = v15;
    v24 = &v26;
    LOBYTE(v10) = objc_msgSend(v14, "enumerateContactsWithFetchRequest:error:usingBlock:", v7, &v25, &v19);
    v16 = v25;

    if ((v10 & 1) == 0)
      NSLog(CFSTR("Error fetching: %@"), v16, v19, v20, v21, v22);

  }
  v17 = v27[3];
  _Block_object_dispose(&v26, 8);
  return v17;
}

id __29__ABSAddressBook_personCount__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  objc_msgSend(v2, "cnImpl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __29__ABSAddressBook_personCount__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "containsObject:", v4);

  if ((v3 & 1) == 0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (id)allPeople
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
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBACB8]);
  +[ABSPerson defaultKeysToFetch](ABSPerson, "defaultKeysToFetch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithKeysToFetch:", v4);

  objc_msgSend(v5, "setUnifyResults:", 0);
  objc_msgSend(v5, "setMutableObjects:", 1);
  v6 = (void *)MEMORY[0x24BDBCEF0];
  -[ABSAddressBook contacts](self, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "records");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cn_map:", &__block_literal_global_27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ABSAddressBook contacts](self, "contacts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deletedRecords");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_cn_map:", &__block_literal_global_27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v15);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook store](self, "store");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __27__ABSAddressBook_allPeople__block_invoke_2;
  v36[3] = &unk_24C2F4D18;
  v18 = v11;
  v37 = v18;
  v19 = v16;
  v38 = v19;
  objc_msgSend(v17, "enumerateContactsWithFetchRequest:error:usingBlock:", v5, 0, v36);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v24);
        -[ABSAddressBook contacts](self, "contacts", (_QWORD)v32);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "cnImplFetched:creationBlock:", v25, &__block_literal_global_31);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "setAddressBook:", self);
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v22);
  }

  -[ABSAddressBook contacts](self, "contacts");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "records");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "allValues");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

id __27__ABSAddressBook_allPeople__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "cnImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __27__ABSAddressBook_allPeople__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8 = v3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
  {
    v6 = *(void **)(a1 + 40);
    v7 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v6, "addObject:", v7);

  }
}

ABSPerson *__27__ABSAddressBook_allPeople__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  ABSPerson *v3;

  v2 = a2;
  v3 = -[ABSPerson initWithMutableContact:]([ABSPerson alloc], "initWithMutableContact:", v2);

  return v3;
}

- (id)peopleWithCNIdentifiers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v3;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v67;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v67 != v47)
          objc_enumerationMutation(obj);
        v49 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v4);
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        -[ABSAddressBook contacts](self, "contacts");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "records");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allValues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v12 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v63 != v12)
                objc_enumerationMutation(v8);
              v14 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
              objc_msgSend(v14, "cnImpl");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqual:", v5);

              if (v17)
              {
                objc_msgSend(v51, "addObject:", v14);
                v11 = 1;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
          }
          while (v10);

          if ((v11 & 1) != 0)
            goto LABEL_29;
        }
        else
        {

        }
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        -[ABSAddressBook contacts](self, "contacts");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "deletedRecords");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "allValues");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
        if (!v21)
        {

LABEL_28:
          objc_msgSend(v45, "addObject:", v5);
          goto LABEL_29;
        }
        v22 = v21;
        v23 = 0;
        v24 = *(_QWORD *)v59;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v59 != v24)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "cnImpl");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqual:", v5);

            v23 |= v28;
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
        }
        while (v22);

        if ((v23 & 1) == 0)
          goto LABEL_28;
LABEL_29:
        v4 = v49 + 1;
      }
      while (v49 + 1 != v48);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v48);
  }

  v29 = objc_alloc(MEMORY[0x24BDBACB8]);
  +[ABSPerson defaultKeysToFetch](ABSPerson, "defaultKeysToFetch");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithKeysToFetch:", v30);

  objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsWithIdentifiers:", v45);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setPredicate:", v32);

  objc_msgSend(v31, "setUnifyResults:", 0);
  objc_msgSend(v31, "setMutableObjects:", 1);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook store](self, "store");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __42__ABSAddressBook_peopleWithCNIdentifiers___block_invoke;
  v56[3] = &unk_24C2F4D80;
  v35 = v33;
  v57 = v35;
  objc_msgSend(v34, "enumerateContactsWithFetchRequest:error:usingBlock:", v31, 0, v56);

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v36 = v35;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v53;
    do
    {
      for (k = 0; k != v38; ++k)
      {
        if (*(_QWORD *)v53 != v39)
          objc_enumerationMutation(v36);
        v41 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * k);
        -[ABSAddressBook contacts](self, "contacts");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "cnImplFetched:creationBlock:", v41, &__block_literal_global_32);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v43, "setAddressBook:", self);
        objc_msgSend(v51, "addObject:", v43);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
    }
    while (v38);
  }

  return v51;
}

uint64_t __42__ABSAddressBook_peopleWithCNIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

ABSPerson *__42__ABSAddressBook_peopleWithCNIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  ABSPerson *v3;

  v2 = a2;
  v3 = -[ABSPerson initWithMutableContact:]([ABSPerson alloc], "initWithMutableContact:", v2);

  return v3;
}

- (id)personWithRecordID:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[4];
  id v25;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook contacts](self, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "records");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[ABSAddressBook contacts](self, "contacts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deletedRecords");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v8 = 0;
    }
    else
    {
      v12 = objc_alloc(MEMORY[0x24BDBACB8]);
      +[ABSPerson defaultKeysToFetch](ABSPerson, "defaultKeysToFetch");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithKeysToFetch:", v13);

      objc_msgSend(MEMORY[0x24BDBACA0], "predicateForLegacyIdentifier:", v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPredicate:", v15);

      objc_msgSend(v14, "setUnifyResults:", 0);
      objc_msgSend(v14, "setMutableObjects:", 1);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ABSAddressBook store](self, "store");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __37__ABSAddressBook_personWithRecordID___block_invoke;
      v24[3] = &unk_24C2F4D80;
      v18 = v16;
      v25 = v18;
      objc_msgSend(v17, "enumerateContactsWithFetchRequest:error:usingBlock:", v14, 0, v24);

      objc_msgSend(v18, "lastObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)v19;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = objc_msgSend(v20, "mutableCopy");

          v20 = (void *)v21;
        }
        -[ABSAddressBook contacts](self, "contacts");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "cnImplFetched:creationBlock:", v20, &__block_literal_global_35);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "setAddressBook:", self);
      }
      else
      {
        v8 = 0;
      }

    }
  }

  return v8;
}

uint64_t __37__ABSAddressBook_personWithRecordID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

ABSPerson *__37__ABSAddressBook_personWithRecordID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  ABSPerson *v3;

  v2 = a2;
  v3 = -[ABSPerson initWithMutableContact:]([ABSPerson alloc], "initWithMutableContact:", v2);

  return v3;
}

- (id)findPersonMatchingURL:(id)a3
{
  void *v4;
  ABSPersonFetchRequest *v5;
  ABSPersonFetchRequest *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactMatchingURLString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [ABSPersonFetchRequest alloc];
  v6 = -[ABSPersonFetchRequest initWithPredicate:additionalKeysToFetch:sortOrder:](v5, "initWithPredicate:additionalKeysToFetch:sortOrder:", v4, MEMORY[0x24BDBD1A8], 0);
  -[ABSAddressBook _peoplePreferringExistingRecordsForFetchRequest:](self, "_peoplePreferringExistingRecordsForFetchRequest:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)findPersonMatchingEmailAddress:(id)a3
{
  void *v4;
  ABSPersonFetchRequest *v5;
  ABSPersonFetchRequest *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingEmailAddress:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [ABSPersonFetchRequest alloc];
  v6 = -[ABSPersonFetchRequest initWithPredicate:additionalKeysToFetch:sortOrder:](v5, "initWithPredicate:additionalKeysToFetch:sortOrder:", v4, MEMORY[0x24BDBD1A8], 0);
  -[ABSAddressBook _peoplePreferringExistingRecordsForFetchRequest:](self, "_peoplePreferringExistingRecordsForFetchRequest:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)findPersonMatchingPhoneNumber:(id)a3 country:(id)a4
{
  void *v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  ABSPersonFetchRequest *v12;
  void *v13;
  ABSPersonFetchRequest *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDBACA0];
  v7 = (objc_class *)MEMORY[0x24BDBAD88];
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithStringValue:countryCode:", v9, v8);

  objc_msgSend(v6, "predicateForContactsMatchingPhoneNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [ABSPersonFetchRequest alloc];
  v18[0] = *MEMORY[0x24BDBA348];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ABSPersonFetchRequest initWithPredicate:additionalKeysToFetch:sortOrder:](v12, "initWithPredicate:additionalKeysToFetch:sortOrder:", v11, v13, 0);

  -[ABSAddressBook _peoplePreferringExistingRecordsForFetchRequest:](self, "_peoplePreferringExistingRecordsForFetchRequest:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)contactsWithIdentifiers:(id)a3 keysToFetch:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = (objc_class *)MEMORY[0x24BDBACB8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithKeysToFetch:", v7);

  objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsWithIdentifiers:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(v9, "setUnifyResults:", 0);
  objc_msgSend(v9, "setMutableObjects:", 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook store](self, "store");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __54__ABSAddressBook_contactsWithIdentifiers_keysToFetch___block_invoke;
  v16[3] = &unk_24C2F4D80;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, 0, v16);

  v14 = (void *)objc_msgSend(v13, "copy");
  return v14;
}

uint64_t __54__ABSAddressBook_contactsWithIdentifiers_keysToFetch___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)updatePeople:(id)a3 refetchingProperties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_cn_map:", &__block_literal_global_38);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v7;
  -[ABSAddressBook contactsWithIdentifiers:keysToFetch:](self, "contactsWithIdentifiers:keysToFetch:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v15, v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v12);
  }
  v27 = v10;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v22, "cnImpl");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v29, "_cn_map:", &__block_literal_global_41);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __52__ABSAddressBook_updatePeople_refetchingProperties___block_invoke_45;
          v30[3] = &unk_24C2F4E08;
          v31 = v25;
          v32 = v22;
          objc_msgSend(v26, "_cn_each:", v30);

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v19);
  }

}

id __52__ABSAddressBook_updatePeople_refetchingProperties___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "cnImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __52__ABSAddressBook_updatePeople_refetchingProperties___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v2 = a2;
  objc_msgSend(MEMORY[0x24BDBAC70], "contactPropertiesByKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4 == v5))
  {
    +[ABSLog log](ABSLog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__ABSAddressBook_updatePeople_refetchingProperties___block_invoke_2_cold_1();

  }
  return v4;
}

void __52__ABSAddressBook_updatePeople_refetchingProperties___block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "CNValueForContact:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "cnImpl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCNValue:onContact:", v6, v5);

}

- (void)completePerson:(id)a3 withKeysToFetch:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ABSAddressBook faultHandler](self, "faultHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completePerson:withKeysToFetch:", v7, v6);

}

- (id)_resultRecordsFromFetchedCNImpls:(id)a3 mergedWithStorage:(id)a4 creationBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  __int128 v24;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v26 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v29;
    *(_QWORD *)&v11 = 138543362;
    v24 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v15, "iOSLegacyIdentifier", v24));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "records");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v9, "addObject:", v18);
        }
        else
        {
          objc_msgSend(v8, "deletedRecords");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKey:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
          {
            objc_msgSend(v8, "cnImplFetched:creationBlock:", v15, v26);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              objc_msgSend(v9, "addObject:", v21);
              objc_msgSend(v21, "setAddressBook:", self);
            }
            else
            {
              +[ABSLog log](ABSLog, "log");
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v24;
                v33 = v15;
                _os_log_error_impl(&dword_20A301000, v22, OS_LOG_TYPE_ERROR, "Could not create new AB object from %{public}@", buf, 0xCu);
              }

            }
          }
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)_peoplePreferringExistingRecordsForFetchRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  +[ABSPerson defaultKeysToFetch](ABSPerson, "defaultKeysToFetch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE191C0];
  objc_msgSend(v4, "additionalKeysToFetch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "additionalKeysToFetch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBACB8]), "initWithKeysToFetch:", v5);
  objc_msgSend(v4, "predicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  objc_msgSend(v10, "setUnifyResults:", 0);
  objc_msgSend(v10, "setMutableObjects:", 1);
  if (objc_msgSend(v4, "sortOrder"))
  {
    if (objc_msgSend(v4, "sortOrder") == 1)
      v12 = 3;
    else
      v12 = 1;
  }
  else
  {
    v12 = 2;
  }
  objc_msgSend(v10, "setSortOrder:", v12);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook store](self, "store");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __66__ABSAddressBook__peoplePreferringExistingRecordsForFetchRequest___block_invoke;
  v19[3] = &unk_24C2F4D80;
  v20 = v13;
  v15 = v13;
  objc_msgSend(v14, "enumerateContactsWithFetchRequest:error:usingBlock:", v10, 0, v19);

  -[ABSAddressBook contacts](self, "contacts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook _resultRecordsFromFetchedCNImpls:mergedWithStorage:creationBlock:](self, "_resultRecordsFromFetchedCNImpls:mergedWithStorage:creationBlock:", v15, v16, &__block_literal_global_47);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __66__ABSAddressBook__peoplePreferringExistingRecordsForFetchRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

ABSPerson *__66__ABSAddressBook__peoplePreferringExistingRecordsForFetchRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  ABSPerson *v3;
  void *v4;
  ABSPerson *v5;

  v2 = a2;
  v3 = [ABSPerson alloc];
  v4 = (void *)objc_msgSend(v2, "mutableCopy");

  v5 = -[ABSPerson initWithMutableContact:](v3, "initWithMutableContact:", v4);
  return v5;
}

- (id)peopleInSource:(id)a3 sortOrder:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ABSPersonFetchRequest *v10;
  ABSPersonFetchRequest *v11;
  void *v12;

  v4 = *(_QWORD *)&a4;
  if (a3)
  {
    v6 = (void *)MEMORY[0x24BDBACA0];
    objc_msgSend(a3, "cnImpl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateForContactsInContainerWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = [ABSPersonFetchRequest alloc];
  v11 = -[ABSPersonFetchRequest initWithPredicate:additionalKeysToFetch:sortOrder:](v10, "initWithPredicate:additionalKeysToFetch:sortOrder:", v9, MEMORY[0x24BDBD1A8], v4);
  -[ABSAddressBook _peoplePreferringExistingRecordsForFetchRequest:](self, "_peoplePreferringExistingRecordsForFetchRequest:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)peopleInGroup:(id)a3 sortOrder:(unsigned int)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  ABSPersonFetchRequest *v19;
  ABSPersonFetchRequest *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];

  v4 = *(_QWORD *)&a4;
  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BDBACB8];
  v7 = a3;
  v8 = [v6 alloc];
  v25[0] = *MEMORY[0x24BDBA2E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKeysToFetch:", v9);

  v11 = (void *)MEMORY[0x24BDBACA0];
  objc_msgSend(v7, "cnImpl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForContactsInGroupWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v14);

  objc_msgSend(v10, "setUnifyResults:", 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook store](self, "store");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __42__ABSAddressBook_peopleInGroup_sortOrder___block_invoke;
  v23[3] = &unk_24C2F4D80;
  v17 = v15;
  v24 = v17;
  objc_msgSend(v16, "enumerateContactsWithFetchRequest:error:usingBlock:", v10, 0, v23);

  objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsWithIdentifiers:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [ABSPersonFetchRequest alloc];
  v20 = -[ABSPersonFetchRequest initWithPredicate:additionalKeysToFetch:sortOrder:](v19, "initWithPredicate:additionalKeysToFetch:sortOrder:", v18, MEMORY[0x24BDBD1A8], v4);
  -[ABSAddressBook _peoplePreferringExistingRecordsForFetchRequest:](self, "_peoplePreferringExistingRecordsForFetchRequest:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "count"))
  {

    v21 = 0;
  }

  return v21;
}

void __42__ABSAddressBook_peopleInGroup_sortOrder___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)peopleMatchingNameString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v4 = (objc_class *)MEMORY[0x24BDBACB8];
  v5 = a3;
  v6 = [v4 alloc];
  +[ABSPerson defaultKeysToFetch](ABSPerson, "defaultKeysToFetch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithKeysToFetch:", v7);

  objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingName:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPredicate:", v9);
  objc_msgSend(v8, "setUnifyResults:", 0);
  objc_msgSend(v8, "setMutableObjects:", 1);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook store](self, "store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __43__ABSAddressBook_peopleMatchingNameString___block_invoke;
  v16[3] = &unk_24C2F4D80;
  v17 = v10;
  v12 = v10;
  objc_msgSend(v11, "enumerateContactsWithFetchRequest:error:usingBlock:", v8, 0, v16);

  -[ABSAddressBook contacts](self, "contacts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook _resultRecordsFromFetchedCNImpls:mergedWithStorage:creationBlock:](self, "_resultRecordsFromFetchedCNImpls:mergedWithStorage:creationBlock:", v12, v13, &__block_literal_global_48);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __43__ABSAddressBook_peopleMatchingNameString___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

ABSPerson *__43__ABSAddressBook_peopleMatchingNameString___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  ABSPerson *v3;

  v2 = a2;
  v3 = -[ABSPerson initWithMutableContact:]([ABSPerson alloc], "initWithMutableContact:", v2);

  return v3;
}

- (id)mePerson
{
  void *v3;
  ABSPersonFetchRequest *v4;
  ABSPersonFetchRequest *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBACA0], "predicateForMeContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [ABSPersonFetchRequest alloc];
  v5 = -[ABSPersonFetchRequest initWithPredicate:additionalKeysToFetch:sortOrder:](v4, "initWithPredicate:additionalKeysToFetch:sortOrder:", v3, MEMORY[0x24BDBD1A8], 0);
  -[ABSAddressBook _peoplePreferringExistingRecordsForFetchRequest:](self, "_peoplePreferringExistingRecordsForFetchRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)peopleLinkedToPerson:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  ABSPersonFetchRequest *v7;
  void *v8;
  ABSPersonFetchRequest *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBACA0];
  objc_msgSend(a3, "cnImpl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForContactsLinkedToContact:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [ABSPersonFetchRequest alloc];
  v12[0] = *MEMORY[0x24BDBA308];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ABSPersonFetchRequest initWithPredicate:additionalKeysToFetch:sortOrder:](v7, "initWithPredicate:additionalKeysToFetch:sortOrder:", v6, v8, +[ABSPerson sortOrdering](ABSPerson, "sortOrdering"));

  -[ABSAddressBook _peoplePreferringExistingRecordsForFetchRequest:](self, "_peoplePreferringExistingRecordsForFetchRequest:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)linkPerson:(id)a3 toPerson:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  id v17;

  v6 = (objc_class *)MEMORY[0x24BDBADA8];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v8, "cnImpl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cnImpl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "linkContact:toContact:", v10, v11);
  -[ABSAddressBook store](self, "store");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v13 = objc_msgSend(v12, "executeSaveRequest:error:", v9, &v17);
  v14 = v17;

  if ((v13 & 1) == 0)
  {
    +[ABSLog log](ABSLog, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ABSAddressBook linkPerson:toPerson:].cold.1();

  }
  return v13;
}

- (BOOL)unlinkPerson:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v13;

  v4 = (objc_class *)MEMORY[0x24BDBADA8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "cnImpl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "unlinkContact:", v7);
  -[ABSAddressBook store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = objc_msgSend(v8, "executeSaveRequest:error:", v6, &v13);
  v10 = v13;

  if ((v9 & 1) == 0)
  {
    +[ABSLog log](ABSLog, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ABSAddressBook unlinkPerson:].cold.1();

  }
  return v9;
}

- (id)_sourcesPreferringExistingRecordsFetchedWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ABSAddressBook store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containersMatchingPredicate:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ABSAddressBook sources](self, "sources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook _resultRecordsFromFetchedCNImpls:mergedWithStorage:creationBlock:](self, "_resultRecordsFromFetchedCNImpls:mergedWithStorage:creationBlock:", v6, v7, &__block_literal_global_50);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

ABSSource *__72__ABSAddressBook__sourcesPreferringExistingRecordsFetchedWithPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ABSSource *v3;
  void *v4;
  ABSSource *v5;

  v2 = a2;
  v3 = [ABSSource alloc];
  v4 = (void *)objc_msgSend(v2, "mutableCopy");

  v5 = -[ABSSource initWithMutableContainer:](v3, "initWithMutableContainer:", v4);
  return v5;
}

- (id)sourceWithRecordID:(int)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBAD18], "predicateForiOSLegacyIdentifier:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook _sourcesPreferringExistingRecordsFetchedWithPredicate:](self, "_sourcesPreferringExistingRecordsFetchedWithPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allSources
{
  return -[ABSAddressBook _sourcesPreferringExistingRecordsFetchedWithPredicate:](self, "_sourcesPreferringExistingRecordsFetchedWithPredicate:", 0);
}

- (id)defaultSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[ABSAddressBook store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultContainerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBAD18];
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateForContainersWithIdentifiers:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABSAddressBook _sourcesPreferringExistingRecordsFetchedWithPredicate:](self, "_sourcesPreferringExistingRecordsFetchedWithPredicate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)localSource
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBAD18], "predicateForLocalContainerIncludingDisabled:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook _sourcesPreferringExistingRecordsFetchedWithPredicate:](self, "_sourcesPreferringExistingRecordsFetchedWithPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sourceForRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDBAD18];
    objc_msgSend(v4, "cnImpl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateForContainerOfContactWithIdentifier:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      v10 = 0;
      v12 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_7;
      goto LABEL_6;
    }
    v9 = (void *)MEMORY[0x24BDBAD18];
    objc_msgSend(v4, "cnImpl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateForContainerOfGroupWithIdentifier:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;

LABEL_6:
  -[ABSAddressBook _sourcesPreferringExistingRecordsFetchedWithPredicate:](self, "_sourcesPreferringExistingRecordsFetchedWithPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v12;
}

- (void)updateFetchingAllPropertiesForSources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_53_0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_cn_map:", &__block_literal_global_55_0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBAD18], "predicateForContainersWithIdentifiers:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containersMatchingPredicate:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_cn_indexBy:", &__block_literal_global_57);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "CNIdentifierString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "updateAllValuesWithValuesFromContainer:", v16);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

uint64_t __56__ABSAddressBook_updateFetchingAllPropertiesForSources___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cnImpl");
}

uint64_t __56__ABSAddressBook_updateFetchingAllPropertiesForSources___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __56__ABSAddressBook_updateFetchingAllPropertiesForSources___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (BOOL)addMember:(id)a3 toGroup:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char isKindOfClass;
  char v11;
  ABSAddressBook *v12;
  ABSAddressBook *v13;
  char v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();
  objc_msgSend(v8, "addressBook");
  v12 = (ABSAddressBook *)objc_claimAutoreleasedReturnValue();
  if (v12 == self)
  {
    objc_msgSend(v9, "addressBook");
    v13 = (ABSAddressBook *)objc_claimAutoreleasedReturnValue();

    if (v13 == self)
    {
      v14 = v11 & isKindOfClass;
      goto LABEL_5;
    }
  }
  else
  {

  }
  v14 = 0;
LABEL_5:
  v15 = objc_msgSend(v9, "id");
  objc_msgSend(v8, "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 == v17 && v15 != -1 && (v14 & 1) != 0)
  {
    -[ABSAddressBook groups](self, "groups");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "addMemberRecord:toRecord:", v8, v9);

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ABAddressBookErrorDomain"), 0, 0);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)removeMember:(id)a3 fromGroup:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  unsigned __int8 isKindOfClass;
  unsigned __int8 v10;
  ABSAddressBook *v11;
  ABSAddressBook *v12;
  char v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();
  objc_msgSend(v7, "addressBook");
  v11 = (ABSAddressBook *)objc_claimAutoreleasedReturnValue();
  if (v11 != self)
  {

LABEL_4:
    objc_msgSend(v8, "id");
    goto LABEL_5;
  }
  objc_msgSend(v8, "addressBook");
  v12 = (ABSAddressBook *)objc_claimAutoreleasedReturnValue();

  if (v12 != self)
    goto LABEL_4;
  if (((objc_msgSend(v8, "id") != -1) & v10 & isKindOfClass) == 1)
  {
    -[ABSAddressBook groups](self, "groups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "removeMemberRecord:fromRecord:", v7, v8);

    goto LABEL_6;
  }
LABEL_5:
  v13 = 0;
LABEL_6:

  return v13;
}

- (id)allGroups
{
  void *v3;
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEF0];
  -[ABSAddressBook groups](self, "groups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_map:", &__block_literal_global_59);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ABSAddressBook groups](self, "groups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deletedRecords");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cn_map:", &__block_literal_global_59);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v12);

  -[ABSAddressBook store](self, "store");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "groupsMatchingPredicate:error:", 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v20, "identifier", (_QWORD)v31);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v8, "containsObject:", v21);

        if ((v22 & 1) == 0)
        {
          -[ABSAddressBook groups](self, "groups");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "cnImplFetched:creationBlock:", v20, &__block_literal_global_61);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "setAddressBook:", self);
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v17);
  }

  -[ABSAddressBook groups](self, "groups");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "records");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "allValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v27, "count"))
    v28 = v27;
  else
    v28 = 0;
  v29 = v28;

  return v29;
}

id __27__ABSAddressBook_allGroups__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "cnImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

ABSGroup *__27__ABSAddressBook_allGroups__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  ABSGroup *v3;
  void *v4;
  ABSGroup *v5;

  v2 = a2;
  v3 = [ABSGroup alloc];
  v4 = (void *)objc_msgSend(v2, "mutableCopy");

  v5 = -[ABSGroup initWithMutableGroup:](v3, "initWithMutableGroup:", v4);
  return v5;
}

- (int64_t)groupCount
{
  void *v3;
  int v4;
  void *v5;
  int64_t v6;

  objc_msgSend(MEMORY[0x24BE19228], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAccessGranted");

  if (!v4)
    return -1;
  -[ABSAddressBook allGroups](self, "allGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)groupWithRecordID:(int)a3
{
  uint64_t v3;
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

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook groups](self, "groups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "records");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[ABSAddressBook groups](self, "groups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deletedRecords");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBAD30], "predicateForiOSLegacyIdentifier:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ABSAddressBook store](self, "store");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "groupsMatchingPredicate:error:", v12, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[ABSAddressBook groups](self, "groups");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "cnImplFetched:creationBlock:", v15, &__block_literal_global_63);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "setAddressBook:", self);
      }
      else
      {
        v8 = 0;
      }

    }
  }

  return v8;
}

ABSGroup *__36__ABSAddressBook_groupWithRecordID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ABSGroup *v3;
  void *v4;
  ABSGroup *v5;

  v2 = a2;
  v3 = [ABSGroup alloc];
  v4 = (void *)objc_msgSend(v2, "mutableCopy");

  v5 = -[ABSGroup initWithMutableGroup:](v3, "initWithMutableGroup:", v4);
  return v5;
}

- (void)updateFetchingAllPropertiesForGroups:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_65);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_cn_map:", &__block_literal_global_67);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBAD30], "predicateForGroupsWithIdentifiers:");
  v5 = objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v5;
  objc_msgSend(v6, "groupsMatchingPredicate:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v14, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v11);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = v4;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(v21, "cnImpl");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          objc_msgSend(v21, "updateAllValuesWithValuesFromGroup:", v24);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v18);
  }

}

uint64_t __55__ABSAddressBook_updateFetchingAllPropertiesForGroups___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cnImpl");
}

uint64_t __55__ABSAddressBook_updateFetchingAllPropertiesForGroups___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (id)groupsInSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDBAD30];
    objc_msgSend(a3, "cnImpl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateForGroupsInContainerWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[ABSAddressBook store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupsMatchingPredicate:error:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ABSAddressBook groups](self, "groups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSAddressBook _resultRecordsFromFetchedCNImpls:mergedWithStorage:creationBlock:](self, "_resultRecordsFromFetchedCNImpls:mergedWithStorage:creationBlock:", v9, v10, &__block_literal_global_68);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

ABSGroup *__33__ABSAddressBook_groupsInSource___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ABSGroup *v3;
  void *v4;
  ABSGroup *v5;

  v2 = a2;
  v3 = [ABSGroup alloc];
  v4 = (void *)objc_msgSend(v2, "mutableCopy");

  v5 = -[ABSGroup initWithMutableGroup:](v3, "initWithMutableGroup:", v4);
  return v5;
}

+ (int64_t)authorizationStatus
{
  int64_t result;

  result = objc_msgSend(MEMORY[0x24BDBACF8], "authorizationStatusForEntityType:", 0);
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

+ (void)requestAccessWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE19228], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__ABSAddressBook_requestAccessWithCompletion___block_invoke;
  v7[3] = &unk_24C2F5050;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(v5, "requestAuthorization:completionHandler:", 1, v7);

}

uint64_t __46__ABSAddressBook_requestAccessWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BE19228], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAccessGranted");

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, v3, 0);
  return objc_msgSend(*(id *)(a1 + 40), "callLocalChangeCallbacks:", v3);
}

+ (void)callLocalChangeCallbacks:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id obj;

  v3 = a3;
  obj = a1;
  objc_sync_enter(obj);
  if (!CNLinkedOnOrAfter() && v3 && (_calledLocalChangeCallbacks & 1) == 0)
  {
    _calledLocalChangeCallbacks = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("ABSInvokeAllLocalCallbacksNotification"), obj);

  }
  objc_sync_exit(obj);

}

- (id)uniqueDatabaseVersionIdentifier
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  -[ABSAddressBook store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "identifierWithError:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;

  if (!v3)
  {
    +[ABSLog log](ABSLog, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ABSAddressBook uniqueDatabaseVersionIdentifier].cold.1();

  }
  return v3;
}

- (int)saveSequenceCount
{
  void *v2;
  int v3;

  -[ABSAddressBook store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "saveSequenceCount");

  return v3;
}

- (ABSAddressBookContextStorage)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (ABSChangeCallbacks)changeCallbacks
{
  return (ABSChangeCallbacks *)objc_getProperty(self, a2, 16, 1);
}

- (CNFuture)storeFuture
{
  return self->_storeFuture;
}

- (ABSBulkFaultHandler)faultHandler
{
  return self->_faultHandler;
}

- (ABSAddressBookContextStorage)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_storeStrong((id *)&self->_groups, a3);
}

- (ABSAddressBookContextStorage)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
  objc_storeStrong((id *)&self->_sources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_faultHandler, 0);
  objc_storeStrong((id *)&self->_storeFuture, 0);
  objc_storeStrong((id *)&self->_changeCallbacks, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

void __52__ABSAddressBook_updatePeople_refetchingProperties___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20A301000, v0, v1, "No description available for property %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)linkPerson:toPerson:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20A301000, v0, v1, "Couldn't link contacts with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)unlinkPerson:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20A301000, v0, v1, "Couldn't unlink contact with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)uniqueDatabaseVersionIdentifier
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20A301000, v0, v1, "Could not obtain database version identifier: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
