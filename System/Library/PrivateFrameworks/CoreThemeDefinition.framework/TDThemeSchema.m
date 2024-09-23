@implementation TDThemeSchema

- (TDThemeSchema)initWithThemeDocument:(id)a3
{
  TDThemeSchema *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TDThemeSchema;
  v4 = -[TDThemeSchema init](&v6, sel_init);
  if (v4)
    v4->_doc = (CoreThemeDocument *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TDThemeSchema;
  -[TDThemeSchema dealloc](&v3, sel_dealloc);
}

- (void)_sanityCheckObjectsWithEntityName:(id)a3 globalDescriptor:(void *)a4 matchIdentifierOnly:(BOOL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  void *v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  id obj;
  id obja;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("identifier"), 1);
  v101 = a3;
  obj = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", a3, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:"));
  v94 = a4;
  v7 = +[CoreThemeConstantEnumerator enumeratorForGlobalListAtAddress:](CoreThemeConstantEnumerator, "enumeratorForGlobalListAtAddress:", a4);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = objc_msgSend(v7, "nextConstantHelper");
  v96 = v8;
  if (!v9)
    goto LABEL_26;
  v10 = (void *)v9;
  v95 = v7;
  do
  {
    if (!objc_msgSend((id)objc_msgSend(v10, "displayName"), "length"))
      break;
    if ((objc_msgSend((id)objc_msgSend(v10, "label"), "hasPrefix:", CFSTR("obsolete")) & 1) != 0)
      goto LABEL_25;
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v104 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v120, 16);
    if (!v104)
      goto LABEL_24;
    v11 = 0;
    v102 = *(_QWORD *)v115;
    do
    {
      for (i = 0; i != v104; ++i)
      {
        if (*(_QWORD *)v115 != v102)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
        v14 = objc_msgSend((id)objc_msgSend(v13, "valueForKey:", CFSTR("identifier")), "integerValue");
        v15 = (void *)objc_msgSend(v13, "valueForKey:", CFSTR("constantName"));
        v16 = (void *)objc_msgSend(v13, "valueForKey:", CFSTR("displayName"));
        v17 = objc_msgSend(v10, "identifier");
        v18 = objc_msgSend(v10, "label");
        v19 = objc_msgSend(v10, "displayName");
        if (v14 != v17)
        {
          if (a5
            || (objc_msgSend(v15, "isEqualToString:", v18) & 1) == 0
            && !objc_msgSend(v16, "isEqualToString:", v19))
          {
            continue;
          }
          v91 = v17;
          TDSchemaLog(CFSTR("Updating \"identifier\" attribute of %@ to %ld"), v20, v21, v22, v23, v24, v25, v26, v18);
          objc_msgSend(v13, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17), CFSTR("identifier"));
        }
        if ((objc_msgSend(v15, "isEqualToString:", v18) & 1) == 0)
        {
          v91 = (uint64_t)v15;
          v92 = v18;
          TDSchemaLog(CFSTR("Updating \"constantName\" attribute of %@ from %@ --> %@"), v27, v28, v29, v30, v31, v32, v33, v18);
          objc_msgSend(v13, "setValue:forKey:", v18, CFSTR("constantName"));
        }
        ++v11;
        if ((objc_msgSend(v16, "isEqualToString:", v19) & 1) == 0)
        {
          v91 = (uint64_t)v16;
          v92 = v19;
          TDSchemaLog(CFSTR("Updating \"displayName\" attribute of %@ from %@ --> %@"), v34, v35, v36, v37, v38, v39, v40, v18);
          objc_msgSend(v13, "setValue:forKey:", v19, CFSTR("displayName"));
        }
      }
      v104 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v120, 16);
    }
    while (v104);
    if (v11 >= 2)
    {
      NSLog(CFSTR("WARNING: Document has duplicate constant records for %@"), objc_msgSend(v10, "valueForKey:", CFSTR("label")));
      v7 = v95;
      v8 = v96;
      goto LABEL_25;
    }
    v7 = v95;
    v8 = v96;
    if (!v11)
LABEL_24:
      objc_msgSend(v8, "addObject:", v10);
LABEL_25:
    v10 = (void *)objc_msgSend(v7, "nextConstantHelper");
  }
  while (v10);
LABEL_26:
  if (objc_msgSend(v8, "count"))
  {
    v91 = objc_msgSend(v8, "valueForKey:", CFSTR("label"));
    TDSchemaLog(CFSTR("Entity %@ has missing constants. Adding these constants: %@"), v41, v42, v43, v44, v45, v46, v47, (char)v101);
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v48 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v111;
      do
      {
        for (j = 0; j != v49; ++j)
        {
          if (*(_QWORD *)v111 != v50)
            objc_enumerationMutation(v96);
          v52 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * j);
          v53 = -[CoreThemeDocument newObjectForEntity:](self->_doc, "newObjectForEntity:", v101);
          objc_msgSend(v53, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v52, "identifier")), CFSTR("identifier"));
          objc_msgSend(v53, "setValue:forKey:", objc_msgSend(v52, "label"), CFSTR("constantName"));
          objc_msgSend(v53, "setValue:forKey:", objc_msgSend(v52, "displayName"), CFSTR("displayName"));

        }
        v8 = v96;
        v49 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
      }
      while (v49);
    }
    objc_msgSend(-[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext"), "processPendingChanges");
  }

  v54 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", v101, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v93));
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
  obja = +[CoreThemeConstantEnumerator enumeratorForGlobalListAtAddress:](CoreThemeConstantEnumerator, "enumeratorForGlobalListAtAddress:", v94);
  v56 = objc_msgSend(obja, "nextConstantHelper");
  if (v56)
  {
    v57 = (void *)v56;
    v58 = 0;
    do
    {
      if (!objc_msgSend((id)objc_msgSend(v57, "displayName"), "length"))
        break;
      v59 = objc_msgSend(v57, "identifier");
      v60 = v59;
      if (v59 > v58)
        v58 = v59;
      v103 = v58;
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      v61 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
      if (v61)
      {
        v62 = v61;
        v63 = 0;
        v64 = *(_QWORD *)v107;
        do
        {
          for (k = 0; k != v62; ++k)
          {
            if (*(_QWORD *)v107 != v64)
              objc_enumerationMutation(v54);
            v66 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * k);
            if (v60 == objc_msgSend((id)objc_msgSend(v66, "valueForKey:", CFSTR("identifier")), "integerValue"))
            {
              if (v63 < 1)
              {
                ++v63;
              }
              else
              {
                v105 = v63 + 1;
                v67 = objc_msgSend(v66, "valueForKey:", CFSTR("constantName"));
                TDSchemaLog(CFSTR("Found extra theme constant %@ for %@. Removing from document."), v68, v69, v70, v71, v72, v73, v74, v67);
                v75 = objc_msgSend(v54, "objectAtIndex:", objc_msgSend(v54, "indexOfObject:", v66) - 1);
                v76 = v64;
                v77 = v60;
                v78 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("RenditionKeySpec")), "relationshipsWithDestinationEntity:", objc_msgSend(v66, "entity")), "objectAtIndex:", 0);
                v79 = (void *)MEMORY[0x24BDD1758];
                v90 = objc_msgSend(v78, "name");
                v80 = v79;
                v60 = v77;
                v64 = v76;
                if ((int64_t)-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("RenditionKeySpec"), objc_msgSend(v80, "predicateWithFormat:", CFSTR("%K = %@"), v90, v75)) <= 0)v81 = (void *)v75;
                else
                  v81 = v66;
                objc_msgSend(v55, "addObject:", v81);
                v63 = v105;
              }
            }
          }
          v62 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
        }
        while (v62);
      }
      v57 = (void *)objc_msgSend(obja, "nextConstantHelper");
      v58 = v103;
    }
    while (v57);
  }
  else
  {
    v58 = 0;
  }
  v82 = (void *)objc_msgSend(v54, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("identifier > %d"), v58, v91, v92));
  if (objc_msgSend(v82, "count")
    && (objc_msgSend(v101, "isEqualToString:", CFSTR("EffectType")) & 1) == 0
    && (objc_msgSend(v101, "isEqualToString:", CFSTR("EffectParameterType")) & 1) == 0)
  {
    objc_msgSend(v82, "valueForKey:", CFSTR("constantName"));
    TDSchemaLog(CFSTR("Removing extra theme constants for %@: %@"), v83, v84, v85, v86, v87, v88, v89, (char)v101);
    objc_msgSend(v55, "addObjectsFromArray:", v82);
  }
  if (objc_msgSend(v55, "count"))
  {
    -[CoreThemeDocument deleteObjects:](self->_doc, "deleteObjects:", v55);
    objc_msgSend(-[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext"), "processPendingChanges");
  }

}

- (void)_sanityCheckMetafontSizeSelectorsAndUpdateIfNecessary
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  id v50;
  id v51;
  void *v52;
  TDThemeSchema *v53;
  id obj;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("controlSize.identifier"), 1);
  v53 = self;
  obj = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", CFSTR("MetafontSizeSelector"), objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v3));

  v4 = +[CoreThemeConstantEnumerator enumeratorForGlobalListAtAddress:](CoreThemeConstantEnumerator, "enumeratorForGlobalListAtAddress:", MEMORY[0x24BE28CF0]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v52 = v4;
  v6 = objc_msgSend(v4, "nextConstantHelper");
  if (v6)
  {
    v7 = (void *)v6;
    v51 = v5;
    while (1)
    {
      if (!objc_msgSend((id)objc_msgSend(v7, "displayName"), "length"))
        goto LABEL_27;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      if (!v56)
        break;
      v57 = 0;
      v55 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v63 != v55)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          v10 = objc_msgSend((id)objc_msgSend(v9, "identifier"), "intValue");
          v11 = objc_msgSend((id)objc_msgSend(v9, "controlSize"), "identifier");
          v12 = (void *)objc_msgSend(v9, "selectorName");
          v13 = (void *)objc_msgSend(v9, "displayName");
          v14 = objc_msgSend(v7, "identifier");
          v15 = objc_msgSend(v7, "label");
          v16 = objc_msgSend(v7, "displayName");
          if (v14 == v10
            || (objc_msgSend(v12, "isEqualToString:", v15) & 1) != 0
            || objc_msgSend(v13, "isEqualToString:", v16))
          {
            if (objc_msgSend((id)objc_msgSend(v9, "identifier"), "integerValue") != v14)
            {
              TDSchemaLog(CFSTR("Updating \"identifier\" attribute of %@ to %ld"), v17, v18, v19, v20, v21, v22, v23, (char)v9);
              objc_msgSend(v9, "setIdentifier:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14));
            }
            if (v14 != v11)
            {
              TDSchemaLog(CFSTR("Updating \"controlSize\" attribute of %@ to %ld"), v17, v18, v19, v20, v21, v22, v23, (char)v9);
              objc_msgSend(v9, "setControlSize:", -[CoreThemeDocument sizeWithIdentifier:](v53->_doc, "sizeWithIdentifier:", v14));
            }
            if ((objc_msgSend(v12, "isEqualToString:", v15) & 1) == 0)
            {
              TDSchemaLog(CFSTR("Updating \"selectorName\" attribute of %@ to %@"), v24, v25, v26, v27, v28, v29, v30, (char)v9);
              objc_msgSend(v9, "setSelectorName:", v15);
            }
            ++v57;
            if ((objc_msgSend(v13, "isEqualToString:", v16) & 1) == 0)
            {
              TDSchemaLog(CFSTR("Updating \"displayName\" attribute of %@ to %@"), v31, v32, v33, v34, v35, v36, v37, (char)v9);
              objc_msgSend(v9, "setDisplayName:", v16);
            }
          }
        }
        v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      }
      while (v56);
      if (v57 < 2)
      {
        v5 = v51;
        if (!v57)
          break;
      }
      else
      {
        NSLog(CFSTR("WARNING: Document has duplicate constant records for %@"), v7);
        v5 = v51;
      }
LABEL_26:
      v7 = (void *)objc_msgSend(v52, "nextConstantHelper");
      if (!v7)
        goto LABEL_27;
    }
    objc_msgSend(v5, "addObject:", v7);
    goto LABEL_26;
  }
LABEL_27:
  if (objc_msgSend(v5, "count"))
  {
    TDSchemaLog(CFSTR("Entity MetafontSizeSelector has missing constants. Adding these constants: %@"), v38, v39, v40, v41, v42, v43, v44, (char)v5);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v45 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v59 != v47)
            objc_enumerationMutation(v5);
          v49 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          v50 = -[CoreThemeDocument newObjectForEntity:](v53->_doc, "newObjectForEntity:", CFSTR("MetafontSizeSelector"));
          objc_msgSend(v50, "setControlSize:", -[CoreThemeDocument sizeWithIdentifier:](v53->_doc, "sizeWithIdentifier:", objc_msgSend(v49, "identifier")));
          objc_msgSend(v50, "setSelectorName:", objc_msgSend(v49, "label"));
          objc_msgSend(v50, "setDisplayName:", objc_msgSend(v49, "displayName"));

        }
        v46 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      }
      while (v46);
    }
    objc_msgSend(-[TDPersistentDocument managedObjectContext](v53->_doc, "managedObjectContext"), "processPendingChanges");
  }

}

- (void)_sanityCheckColorNamesAndUpdateIfNecessary
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  TDThemeSchema *v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", CFSTR("ColorName"), 0);
  v4 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v5 = MEMORY[0x24BE28CD0];
  if (*(_QWORD *)(MEMORY[0x24BE28CD0] + 16))
  {
    v6 = 0;
    do
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (!v8)
        goto LABEL_11;
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v3);
          v10 += objc_msgSend(v7, "isEqualToString:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "valueForKey:", CFSTR("displayName")));
        }
        v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
      v5 = MEMORY[0x24BE28CD0];
      if (!v10)
LABEL_11:
        objc_msgSend(v4, "addIndex:", v6);
      ++v6;
    }
    while (*(_QWORD *)(v5 + 40 * v6 + 16));
  }
  if (objc_msgSend(v4, "count"))
  {
    v13 = objc_msgSend(v4, "firstIndex");
    v14 = self;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (j = v13; j != 0x7FFFFFFFFFFFFFFFLL; j = objc_msgSend(v4, "indexGreaterThanIndex:", j))
      {
        v16 = -[CoreThemeDocument newObjectForEntity:](v14->_doc, "newObjectForEntity:", CFSTR("ColorName"));
        v17 = MEMORY[0x24BE28CD0] + 40 * j;
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(v17 + 16)), CFSTR("displayName"));
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(v17 + 24)), CFSTR("selector"));

      }
    }
    objc_msgSend(-[TDPersistentDocument managedObjectContext](v14->_doc, "managedObjectContext"), "processPendingChanges");
  }

}

- (void)_sanityCheckSchemaPartDefinitionsForStandardElement:(id *)a3 withElement:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  TDThemeSchema *v10;
  void *v11;
  size_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  _QWORD *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  void *v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  char *v86;
  unint64_t v87;
  id obj;
  id v89;
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
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("name"), 1);
  v89 = a4;
  v8 = (void *)objc_msgSend(a4, "parts");
  v85 = (void *)v7;
  v9 = (void *)objc_msgSend(v8, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v7));
  v10 = self;
  v11 = (void *)objc_msgSend(MEMORY[0x24BE28C80], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform"));
  v12 = objc_msgSend(v11, "partDefinitionCountForElementDefinition:", a3);
  v13 = (char *)malloc_type_malloc(440 * v12, 0x5867F01AuLL);
  memcpy(v13, a3->var4, 440 * v12);
  qsort_b(v13, v12, 0x1B8uLL, &__block_literal_global_5);
  v87 = v12;
  obj = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v86 = v13;
  if (v12)
  {
    v14 = 0;
    do
    {
      v15 = &v13[440 * v14];
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", *(_QWORD *)v15);
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      v105 = 0u;
      v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v103;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v103 != v19)
              objc_enumerationMutation(v9);
            v21 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
            if (objc_msgSend(v16, "isEqualToString:", objc_msgSend(v21, "name")))
            {
              v22 = (void *)objc_msgSend(v11, "widgetNameForPartDefinition:", v15);
              v13 = v86;
              if ((objc_msgSend(v22, "isEqualToString:", objc_msgSend(v21, "widgetID")) & 1) == 0)
              {
                v23 = objc_msgSend(v89, "name");
                objc_msgSend(v21, "name");
                objc_msgSend(v21, "widgetID");
                TDSchemaLog(CFSTR("Updating widgetID for (%@,%@) from %@ => %@"), v24, v25, v26, v27, v28, v29, v30, v23);
                objc_msgSend(v21, "setWidgetID:", v22);
              }
              goto LABEL_16;
            }
            if (objc_msgSend(v16, "compare:", objc_msgSend(v21, "name")) == -1)
            {
              objc_msgSend(obj, "addObject:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v15, 8, 0));
              v13 = v86;
              goto LABEL_16;
            }
          }
          v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
          v13 = v86;
          if (v18)
            continue;
          break;
        }
      }
      objc_msgSend(obj, "addObject:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v15, 8, 0));
LABEL_16:

      ++v14;
    }
    while (v14 != v87);
  }
  if (objc_msgSend(obj, "count"))
  {
    v31 = objc_msgSend(v89, "name");
    TDSchemaLog(CFSTR("Element \"%@\" was missing parts present in theme schema.  Adding them in."), v32, v33, v34, v35, v36, v37, v38, v31);
  }
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v99;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v99 != v41)
          objc_enumerationMutation(obj);
        v43 = (_QWORD *)objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * j), "bytes");
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", *v43);
        v45 = objc_msgSend(v11, "widgetNameForPartDefinition:", v43);
        TDSchemaLog(CFSTR("Adding part:\t\t%@"), v46, v47, v48, v49, v50, v51, v52, (char)v44);
        v53 = -[CoreThemeDocument newObjectForEntity:](v10->_doc, "newObjectForEntity:", CFSTR("SchemaPartDefinition"));
        objc_msgSend(v53, "setName:", v44);
        objc_msgSend(v53, "setWidgetID:", v45);
        objc_msgSend(v53, "setElement:", v89);
        objc_msgSend(v53, "updateDerivedRenditionData");

      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
    }
    while (v40);
  }
  v54 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v55 = (void *)objc_msgSend(v89, "parts");
  v56 = (void *)objc_msgSend(v55, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v85));

  if (objc_msgSend(v56, "count") > v87)
  {
    v57 = objc_msgSend(v89, "name");
    TDSchemaLog(CFSTR("Document contains part definitions for element \"%@\" that have been removed from the standard schema."), v58, v59, v60, v61, v62, v63, v64, v57);
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v65 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
    if (v65)
    {
      v66 = v65;
      v67 = 0;
      v68 = *(_QWORD *)v95;
LABEL_29:
      v69 = 0;
      while (1)
      {
        if (*(_QWORD *)v95 != v68)
          objc_enumerationMutation(v56);
        if (v67 > v87)
          break;
        v70 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v69);
        v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", *(_QWORD *)&v86[440 * v67]);
        if (objc_msgSend(v71, "isEqualToString:", objc_msgSend(v70, "name")))
          ++v67;
        else
          objc_msgSend(v54, "addObject:", v70);

        if (v66 == ++v69)
        {
          v66 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
          if (v66)
            goto LABEL_29;
          break;
        }
      }
    }
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v72 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v90, v106, 16);
    if (v72)
    {
      v73 = v72;
      v74 = *(_QWORD *)v91;
      do
      {
        for (k = 0; k != v73; ++k)
        {
          if (*(_QWORD *)v91 != v74)
            objc_enumerationMutation(v54);
          v76 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * k);
          v77 = objc_msgSend(v76, "name");
          TDSchemaLog(CFSTR("Deleting Part:\t\"%@\"), v78, v79, v80, v81, v82, v83, v84, v77);
          objc_msgSend(v89, "removePartsObject:", v76);
          -[CoreThemeDocument deleteObject:](v10->_doc, "deleteObject:", v76);
        }
        v73 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v90, v106, 16);
      }
      while (v73);
    }
  }
  if (v86)
    free(v86);
}

uint64_t __81__TDThemeSchema__sanityCheckSchemaPartDefinitionsForStandardElement_withElement___block_invoke(uint64_t a1, const char **a2, const char **a3)
{
  return strncmp(*a2, *a3, 0x64uLL);
}

- (void)_addSchemaPartDefinitionsForStandardElement:(id *)a3 withElement:(id)a4
{
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  int64_t var3;

  v7 = objc_msgSend(MEMORY[0x24BE28C80], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform"));
  if (a3->var4[0].var3)
  {
    v8 = (void *)v7;
    do
    {
      if (a3->var4[0].var0)
      {
        v9 = -[CoreThemeDocument newObjectForEntity:](self->_doc, "newObjectForEntity:", CFSTR("SchemaPartDefinition"));
        v10 = objc_msgSend(v8, "widgetNameForPartDefinition:", a3->var4);
        objc_msgSend(v9, "setName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a3->var4[0].var0, 4));
        objc_msgSend(v9, "setElement:", a4);
        objc_msgSend(v9, "setWidgetID:", v10);
        objc_msgSend(v9, "updateDerivedRenditionData");

      }
      var3 = a3->var4[1].var3;
      a3 = (const $A3BFAB32BE8B8144AB428F242CA2D26A *)((char *)a3 + 440);
    }
    while (var3);
  }
}

- (void)_sanityCheckSchemaCategoriesAndUpdateIfNecessary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unsigned int *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  unsigned int *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  TDThemeSchema *v61;
  id obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  TDSchemaLog(CFSTR("Synchronizing Schema Category Definitions"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v60);
  v9 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", CFSTR("SchemaCategory"), 0);
  v61 = self;
  v10 = (void *)objc_msgSend(MEMORY[0x24BE28C80], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform"));
  v11 = objc_msgSend(v10, "elementCategoryCount");
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v9;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v68;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v68 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v15);
        if (v11)
        {
          v17 = 0;
          while (1)
          {
            v18 = (unsigned int *)objc_msgSend(v10, "elementCategoryAtIndex:", v17);
            if (objc_msgSend((id)objc_msgSend(v16, "constantName"), "isEqualToString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)v18 + 1))))break;
            if (v11 == ++v17)
              goto LABEL_10;
          }
          if (*(_QWORD *)v18 != objc_msgSend(v16, "identifier"))
          {
            v35 = objc_msgSend(v16, "constantName");
            TDSchemaLog(CFSTR("Updating identifier for Category %@ from %d -> %ld"), v36, v37, v38, v39, v40, v41, v42, v35);
            objc_msgSend(v16, "setIdentifier:", *v18);
          }
        }
        else
        {
LABEL_10:
          v19 = objc_msgSend(v16, "displayName");
          TDSchemaLog(CFSTR("Removing relationship between %@ category and its elements"), v20, v21, v22, v23, v24, v25, v26, v19);
          objc_msgSend(v16, "removeElements:", objc_msgSend(v16, "elements"));
          v27 = objc_msgSend(v16, "displayName");
          TDSchemaLog(CFSTR("Deleting %@ category"), v28, v29, v30, v31, v32, v33, v34, v27);
          -[CoreThemeDocument deleteObject:](self->_doc, "deleteObject:", v16);
        }
        ++v15;
      }
      while (v15 != v13);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      v13 = v43;
    }
    while (v43);
  }
  if (v11)
  {
    for (i = 0; i != v11; ++i)
    {
      v45 = (unsigned int *)objc_msgSend(v10, "elementCategoryAtIndex:", i);
      v46 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)v45 + 1));
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v64;
LABEL_20:
        v50 = 0;
        while (1)
        {
          if (*(_QWORD *)v64 != v49)
            objc_enumerationMutation(obj);
          if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v50), "constantName"), "isEqualToString:", v46) & 1) != 0)break;
          if (v48 == ++v50)
          {
            v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
            if (v48)
              goto LABEL_20;
            goto LABEL_26;
          }
        }
      }
      else
      {
LABEL_26:
        v51 = -[CoreThemeDocument newObjectForEntity:](v61->_doc, "newObjectForEntity:", CFSTR("SchemaCategory"));
        objc_msgSend(v51, "setIdentifier:", *v45);
        objc_msgSend(v51, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)v45 + 2)));
        objc_msgSend(v51, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)v45 + 1)));
        v52 = objc_msgSend(v51, "displayName");
        TDSchemaLog(CFSTR("Added missing category: %@"), v53, v54, v55, v56, v57, v58, v59, v52);

      }
    }
  }
  objc_msgSend(-[TDPersistentDocument managedObjectContext](v61->_doc, "managedObjectContext"), "processPendingChanges");
  -[CoreThemeDocument recacheThemeConstant:](v61->_doc, "recacheThemeConstant:", CFSTR("SchemaCategory"));
}

- (void)_sanityCheckSchemaDefinitionsAndUpdateIfNecessary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  _QWORD *v22;
  id v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  uint64_t v50;
  id v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t m;
  void *v76;
  _QWORD *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t n;
  void *v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  const __CFString *v93;
  id obj;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  Class v101;
  uint64_t v102;
  unint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x24BDAC8D0];
  TDSchemaLog(CFSTR("Synchronizing Schema Element Definitions"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v92);
  v93 = CFSTR("SchemaEffectDefinition");
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("SchemaElementDefinition"));
  v10 = objc_msgSend(MEMORY[0x24BE28C80], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform"));
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  obj = v9;
  v96 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v120, v128, 16);
  if (v96)
  {
    v95 = *(_QWORD *)v121;
    v100 = (void *)v10;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v121 != v95)
          objc_enumerationMutation(obj);
        v98 = v11;
        v12 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * v11);
        v97 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("name"), 1);
        v13 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", v12, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:"));
        v14 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v101 = NSClassFromString((NSString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", v12), "managedObjectClassName"));
        v103 = -[objc_class elementDefinitionCountWithSchema:](v101, "elementDefinitionCountWithSchema:", v10);
        if (v103)
        {
          for (i = 0; i != v103; ++i)
          {
            v102 = -[objc_class sortedElementDefinitionAtIndex:withSchema:](v101, "sortedElementDefinitionAtIndex:withSchema:", i, v10);
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", *(_QWORD *)v102);
            v116 = 0u;
            v117 = 0u;
            v118 = 0u;
            v119 = 0u;
            v17 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v116, v127, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v117;
              while (2)
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v117 != v19)
                    objc_enumerationMutation(v13);
                  v21 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * j);
                  if (objc_msgSend(v16, "isEqualToString:", objc_msgSend(v21, "name")))
                  {
                    -[TDThemeSchema _sanityCheckSchemaPartDefinitionsForStandardElement:withElement:](self, "_sanityCheckSchemaPartDefinitionsForStandardElement:withElement:", v102, v21);
                    v10 = (uint64_t)v100;
                    v22 = (_QWORD *)objc_msgSend(v100, "categoryForElementDefinition:", v102);
                    v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v22[1]);
                    if ((objc_msgSend(v99, "isEqualToString:", objc_msgSend((id)objc_msgSend(v21, "category"), "constantName")) & 1) == 0)
                    {
                      v23 = -[CoreThemeDocument schemaCategoryWithIdentifier:](self->_doc, "schemaCategoryWithIdentifier:", *v22);
                      v24 = objc_msgSend(v21, "name");
                      objc_msgSend((id)objc_msgSend(v21, "category"), "constantName");
                      TDSchemaLog(CFSTR("Updating category for schema element \"%@\" from %@ => %@"), v25, v26, v27, v28, v29, v30, v31, v24);
                      objc_msgSend(v21, "setCategory:", v23);
                    }

                    if (*(unsigned __int8 *)(v102 + 16) != objc_msgSend(v21, "published"))
                    {
                      objc_msgSend(v21, "published");
                      TDSchemaLog(CFSTR("Updating published status for schema element \"%@\" from %d => %d"), v32, v33, v34, v35, v36, v37, v38, (char)v21);
                      objc_msgSend(v21, "setPublished:", *(unsigned __int8 *)(v102 + 16));
                    }
                    goto LABEL_23;
                  }
                  if (objc_msgSend(v16, "compare:", objc_msgSend(v21, "name")) == -1)
                  {
                    objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v102, 8, 0));
                    v10 = (uint64_t)v100;
                    goto LABEL_23;
                  }
                }
                v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v116, v127, 16);
                v10 = (uint64_t)v100;
                if (v18)
                  continue;
                break;
              }
            }
            objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v102, 8, 0));
LABEL_23:

          }
        }
        if (objc_msgSend(v14, "count"))
          TDSchemaLog(CFSTR("Document is missing some standard schema elements:"), v39, v40, v41, v42, v43, v44, v45, (char)v93);
        v114 = 0u;
        v115 = 0u;
        v112 = 0u;
        v113 = 0u;
        v46 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v112, v126, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v113;
          do
          {
            for (k = 0; k != v47; ++k)
            {
              if (*(_QWORD *)v113 != v48)
                objc_enumerationMutation(v14);
              v50 = objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * k), "bytes");
              v51 = -[CoreThemeDocument schemaCategoryWithIdentifier:](self->_doc, "schemaCategoryWithIdentifier:", *(_QWORD *)(v50 + 24));
              v52 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)v50);
              v53 = objc_msgSend(v51, "constantName");
              TDSchemaLog(CFSTR("\t[%@,\t\t%@]"), v54, v55, v56, v57, v58, v59, v60, v53);
              v61 = -[CoreThemeDocument newObjectForEntity:](self->_doc, "newObjectForEntity:", v12);
              objc_msgSend(v61, "setName:", v52);
              objc_msgSend(v61, "setPublished:", *(unsigned __int8 *)(v50 + 16));
              objc_msgSend(v61, "setCategory:", v51);
              -[TDThemeSchema _addSchemaPartDefinitionsForStandardElement:withElement:](self, "_addSchemaPartDefinitionsForStandardElement:withElement:", v50, v61);

            }
            v47 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v112, v126, 16);
          }
          while (v47);
        }
        v62 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", v12, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v97));

        v10 = (uint64_t)v100;
        if (objc_msgSend(v62, "count") > v103)
        {
          TDSchemaLog(CFSTR("Document contains schema element definitions that have been removed from the standard schema. Deleting those elements."), v63, v64, v65, v66, v67, v68, v69, (char)v93);
          v70 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v108 = 0u;
          v109 = 0u;
          v110 = 0u;
          v111 = 0u;
          v71 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
          if (v71)
          {
            v72 = v71;
            v73 = 0;
            v74 = *(_QWORD *)v109;
            do
            {
              for (m = 0; m != v72; ++m)
              {
                if (*(_QWORD *)v109 != v74)
                  objc_enumerationMutation(v62);
                v76 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * m);
                if (v73 >= v103)
                {
                  objc_msgSend(v70, "addObject:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * m));
                }
                else
                {
                  v77 = (_QWORD *)objc_msgSend(v100, "sortedElementDefinitionAtIndex:", v73);
                  if (*v77)
                  {
                    v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", *v77);
                    if (objc_msgSend(v78, "isEqualToString:", objc_msgSend(v76, "name")))
                      ++v73;
                    else
                      objc_msgSend(v70, "addObject:", v76);

                  }
                }
              }
              v72 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
            }
            while (v72);
          }
          v106 = 0u;
          v107 = 0u;
          v104 = 0u;
          v105 = 0u;
          v79 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v104, v124, 16);
          if (v79)
          {
            v80 = v79;
            v81 = *(_QWORD *)v105;
            do
            {
              for (n = 0; n != v80; ++n)
              {
                if (*(_QWORD *)v105 != v81)
                  objc_enumerationMutation(v70);
                v83 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * n);
                v84 = objc_msgSend(v83, "name");
                TDSchemaLog(CFSTR("Deleting element %@"), v85, v86, v87, v88, v89, v90, v91, v84);
                -[CoreThemeDocument deleteObject:](self->_doc, "deleteObject:", v83);
              }
              v80 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v104, v124, 16);
            }
            while (v80);
          }
        }
        v11 = v98 + 1;
      }
      while (v98 + 1 != v96);
      v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v128, 16);
    }
    while (v96);
  }
}

- (void)_sanityCheckEffectRenditionsAndUpdateIfNecessary
{
  unint64_t v3;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform");
  if (v3 <= 5 && ((1 << v3) & 0x3A) != 0)
  {
    v5 = -[CoreThemeDocument metadatumForKey:](self->_doc, "metadatumForKey:", CFSTR("PreviousCoreThemeDefinitionDataModelKey"));
    if (v5)
    {
      if ((int)objc_msgSend(v5, "intValue") <= 43)
      {
        v6 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", CFSTR("EffectRenditionSpec"), 0);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v14;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v14 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
              objc_msgSend((id)objc_msgSend(v11, "effectScale"), "floatValue");
              if (*(float *)&v12 < 2.0)
              {
                LODWORD(v12) = 2.0;
                objc_msgSend(v11, "setEffectScale:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12));
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          }
          while (v8);
        }
      }
    }
  }
}

- (void)_sanityCheckMicaRenditionsAndUpdateIfNecessary
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", CFSTR("MicaElementProduction"), 0);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v9, "asset"), "scaleFactor") >= 2)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  -[CoreThemeDocument deleteProductions:shouldDeleteAssetFiles:](self->_doc, "deleteProductions:shouldDeleteAssetFiles:", v3, 1);
}

- (BOOL)_renditionKey:(const _renditionkeytoken *)a3 isEqualToKeyIgnoringLook:(const _renditionkeytoken *)a4
{
  CUISystemThemeRenditionKeyFormat();
  return CUIEqualRenditionKeys();
}

- (void)_sanityCheckSchemaAssets
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  id v26;
  char v27;
  void *v28;
  void *v29;
  __CFString *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
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
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v3 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", CFSTR("SchemaElementProduction"), 0);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v3;
  v42 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
  if (v42)
  {
    v41 = *(_QWORD *)v65;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v65 != v41)
          objc_enumerationMutation(obj);
        v43 = v4;
        v5 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v4);
        v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "renditions"), "anyObject"), "asset"), "source"), "name");
        v47 = (void *)objc_msgSend(v5, "partDefinition");
        v7 = (void *)objc_msgSend(v47, "renditionGroups");
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v61;
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v61 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
              if (-[TDThemeSchema _renditionKey:isEqualToKeyIgnoringLook:](self, "_renditionKey:isEqualToKeyIgnoringLook:", objc_msgSend((id)objc_msgSend(v12, "baseKey"), "keyList"), objc_msgSend((id)objc_msgSend(v5, "baseKeySpec"), "key")))
              {
                v46 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                v13 = -[CoreThemeDocument defaultPathComponentsForPartDefinition:](self->_doc, "defaultPathComponentsForPartDefinition:", v47);
                v14 = -[CoreThemeDocument folderNameFromRenditionKey:forPartDefinition:](self->_doc, "folderNameFromRenditionKey:forPartDefinition:", objc_msgSend(v12, "baseKey"), v47);
                v45 = objc_msgSend(v13, "stringByAppendingPathComponent:", v14);
                if ((objc_msgSend((id)objc_msgSend(v5, "folderName"), "isEqualToString:", v14) & 1) == 0)
                  objc_msgSend(v5, "setFolderName:", v14);
                v50 = v12;
                v15 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", -[CoreThemeDocument rootPathForProductionData](self->_doc, "rootPathForProductionData")), "URLByAppendingPathComponent:", v6), "URLByAppendingPathComponent:", v45);
                if (!objc_msgSend((id)objc_msgSend(v15, "path"), "length"))
                  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDThemeSchema.m"), 1156, CFSTR("Something is wacky with the locationURL %@"), v15);
                v48 = v15;
                if ((objc_msgSend(v46, "fileExistsAtPath:", objc_msgSend(v15, "path")) & 1) != 0
                  || objc_msgSend(v46, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, 0))
                {
                  v58 = 0u;
                  v59 = 0u;
                  v56 = 0u;
                  v57 = 0u;
                  v44 = (id)objc_msgSend(v5, "renditions");
                  v16 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
                  if (v16)
                  {
                    v17 = v16;
                    v49 = *(_QWORD *)v57;
                    while (1)
                    {
                      for (j = 0; j != v17; ++j)
                      {
                        if (*(_QWORD *)v57 != v49)
                          objc_enumerationMutation(v44);
                        v19 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
                        v52 = 0u;
                        v53 = 0u;
                        v54 = 0u;
                        v55 = 0u;
                        v20 = (void *)objc_msgSend(v50, "renditions");
                        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
                        if (!v21)
                          continue;
                        v22 = v21;
                        v23 = *(_QWORD *)v53;
                        while (2)
                        {
                          for (k = 0; k != v22; ++k)
                          {
                            if (*(_QWORD *)v53 != v23)
                              objc_enumerationMutation(v20);
                            v25 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
                            if (-[TDThemeSchema _renditionKey:isEqualToKeyIgnoringLook:](self, "_renditionKey:isEqualToKeyIgnoringLook:", objc_msgSend(v25, "key"), objc_msgSend((id)objc_msgSend(v19, "keySpec"), "key")))
                            {
                              v26 = -[CoreThemeDocument defaultPNGFileNameForSchemaRendition:withPartDefinition:](self->_doc, "defaultPNGFileNameForSchemaRendition:withPartDefinition:", v25, v47);
                              v27 = objc_msgSend(v46, "fileExistsAtPath:", objc_msgSend((id)objc_msgSend(v48, "path"), "stringByAppendingPathComponent:", v26));
                              v28 = (void *)objc_msgSend(v19, "asset");
                              if ((v27 & 1) != 0)
                              {
                                if ((objc_msgSend((id)objc_msgSend(v28, "category"), "isEqualToString:", v45) & 1) != 0)
                                  goto LABEL_48;
LABEL_47:
                                objc_msgSend((id)objc_msgSend(v19, "asset"), "setCategory:", v45);
                                objc_msgSend((id)objc_msgSend(v19, "asset"), "setName:", v26);
                                goto LABEL_48;
                              }
                              v29 = (void *)objc_msgSend(v28, "fileURLWithDocument:", self->_doc);
                              if (objc_msgSend(v29, "isEqual:", objc_msgSend(v48, "URLByAppendingPathComponent:", v26)))
                              {
                                NSLog(CFSTR("MISSING ASSET: %@"), objc_msgSend(v29, "path"));
                                goto LABEL_48;
                              }
                              v51 = 0uLL;
                              if (objc_msgSend(v46, "fileExistsAtPath:", objc_msgSend(v29, "path")))
                              {
                                objc_msgSend(v46, "copyItemAtURL:toURL:error:", v29, objc_msgSend(v48, "URLByAppendingPathComponent:", v26), (char *)&v51 + 8);
                                if (!*((_QWORD *)&v51 + 1))
                                {
                                  v30 = CFSTR("copied existing file to %@");
                                  goto LABEL_45;
                                }
                              }
                              else
                              {
                                -[CoreThemeDocument createReferencePNGForSchemaRendition:withPartDefinition:atLocation:error:](self->_doc, "createReferencePNGForSchemaRendition:withPartDefinition:atLocation:error:", v25, v47, v48, &v51);
                                if (!(_QWORD)v51)
                                {
                                  v30 = CFSTR("wrote new reference file to %@");
LABEL_45:
                                  v31 = objc_msgSend((id)objc_msgSend(v48, "URLByAppendingPathComponent:", v26), "path");
                                  TDSchemaLog(&v30->isa, v32, v33, v34, v35, v36, v37, v38, v31);
                                }
                              }
                              if (v51 != 0)
                                goto LABEL_48;
                              goto LABEL_47;
                            }
                          }
                          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
                          if (v22)
                            continue;
                          break;
                        }
LABEL_48:
                        ;
                      }
                      v17 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
                      if (!v17)
                        goto LABEL_50;
                    }
                  }
                }
                goto LABEL_50;
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
            if (v9)
              continue;
            break;
          }
        }
LABEL_50:
        v4 = v43 + 1;
      }
      while (v43 + 1 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    }
    while (v42);
  }
}

- (void)sanityCheckAndUpdateDocumentIfNecessary
{
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemeElement"), MEMORY[0x24BE28D38], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemePart"), MEMORY[0x24BE28D58], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemeSize"), MEMORY[0x24BE28D68], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemeDirection"), MEMORY[0x24BE28D18], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemeValue"), MEMORY[0x24BE28DA0], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemeState"), MEMORY[0x24BE28D70], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemePresentationState"), MEMORY[0x24BE28D60], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemeIdiom"), MEMORY[0x24BE28D50], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemeDisplayGamut"), MEMORY[0x24BE28D20], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemeDeploymentTarget"), MEMORY[0x24BE28D10], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("TexturePixelFormat"), MEMORY[0x24BE28D90], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("TextureFace"), MEMORY[0x24BE28D80], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("TextureInterpretation"), MEMORY[0x24BE28D88], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemeCompressionType"), MEMORY[0x24BE28D08], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemeGraphicsFeatureSetClass"), MEMORY[0x24BE28D40], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemeUISizeClass"), MEMORY[0x24BE28D98], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("RenderingMode"), MEMORY[0x24BE28D78], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("IterationType"), gThemeIterationTypes, 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("RenditionType"), MEMORY[0x24BE28D00], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("RenditionSubtype"), MEMORY[0x24BE28CF8], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ColorStatus"), MEMORY[0x24BE28CC8], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("MetafontSelector"), MEMORY[0x24BE28CE8], 0);
  -[TDThemeSchema _sanityCheckMetafontSizeSelectorsAndUpdateIfNecessary](self, "_sanityCheckMetafontSizeSelectorsAndUpdateIfNecessary");
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("EffectType"), MEMORY[0x24BE28CE0], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("EffectParameterType"), MEMORY[0x24BE28CD8], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemeGlyphSize"), MEMORY[0x24BE28DB0], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("ThemeGlyphWeight"), MEMORY[0x24BE28DB8], 0);
  -[TDThemeSchema _sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:](self, "_sanityCheckObjectsWithEntityName:globalDescriptor:matchIdentifierOnly:", CFSTR("VectorGlyphRenderingMode"), MEMORY[0x24BE28DA8], 0);
  -[TDThemeSchema _sanityCheckSchemaCategoriesAndUpdateIfNecessary](self, "_sanityCheckSchemaCategoriesAndUpdateIfNecessary");
  -[TDThemeSchema _sanityCheckSchemaDefinitionsAndUpdateIfNecessary](self, "_sanityCheckSchemaDefinitionsAndUpdateIfNecessary");
  -[TDThemeSchema _sanityCheckSchemaAssets](self, "_sanityCheckSchemaAssets");
  -[TDThemeSchema _sanityCheckColorNamesAndUpdateIfNecessary](self, "_sanityCheckColorNamesAndUpdateIfNecessary");
  -[TDThemeSchema _sanityCheckEffectRenditionsAndUpdateIfNecessary](self, "_sanityCheckEffectRenditionsAndUpdateIfNecessary");
  -[TDThemeSchema _sanityCheckMicaRenditionsAndUpdateIfNecessary](self, "_sanityCheckMicaRenditionsAndUpdateIfNecessary");
  -[CoreThemeDocument checkVersionsAndUpdateIfNecessary](self->_doc, "checkVersionsAndUpdateIfNecessary");
}

- (void)loadThemeSizes
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemeSize *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemeSize"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D68] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D68];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemeSize initWithEntity:insertIntoManagedObjectContext:]([TDThemeSize alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeValues
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemeValue *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemeValue"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28DA0] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28DA0];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemeValue initWithEntity:insertIntoManagedObjectContext:]([TDThemeValue alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeElements
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  size_t v9;
  TDThemeElement *v10;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemeElement"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D38] + 48);
  if (v5)
  {
    v6 = v4;
    v7 = MEMORY[0x24BE28D38] + 40;
    do
    {
      v8 = *(const char **)v7;
      if (!*(_QWORD *)v7)
        break;
      v9 = strlen((const char *)kObsoletePrefix);
      if (strncmp((const char *)kObsoletePrefix, v8, v9))
      {
        v10 = -[TDThemeElement initWithEntity:insertIntoManagedObjectContext:]([TDThemeElement alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
        -[TDThemeConstant setIdentifier:](v10, "setIdentifier:", *(unsigned int *)(v7 - 8));
        -[TDThemeConstant setDisplayName:](v10, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
        -[TDThemeConstant setConstantName:](v10, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      }
      v5 = *(_QWORD *)(v7 + 40);
      v7 += 32;
    }
    while (v5);
  }
}

- (void)loadThemeParts
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  const char *v8;
  size_t v9;
  TDThemePart *v10;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemePart"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D58] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D58];
    do
    {
      v8 = (const char *)*((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = strlen((const char *)kObsoletePrefix);
      if (strncmp((const char *)kObsoletePrefix, v8, v9))
      {
        v10 = -[TDThemePart initWithEntity:insertIntoManagedObjectContext:]([TDThemePart alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
        -[TDThemeConstant setIdentifier:](v10, "setIdentifier:", *v7);
        -[TDThemeConstant setDisplayName:](v10, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
        -[TDThemeConstant setConstantName:](v10, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      }
      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadBasicThemePart
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  TDThemePart *v8;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemePart"));
  v5 = *MEMORY[0x24BE28D58];
  v6 = *(_QWORD *)(MEMORY[0x24BE28D58] + 8);
  v7 = *(_QWORD *)(MEMORY[0x24BE28D58] + 16);
  v8 = -[TDThemePart initWithEntity:insertIntoManagedObjectContext:]([TDThemePart alloc], "initWithEntity:insertIntoManagedObjectContext:", v4, v3);
  -[TDThemeConstant setIdentifier:](v8, "setIdentifier:", v5);
  -[TDThemeConstant setDisplayName:](v8, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 1));
  -[TDThemeConstant setConstantName:](v8, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v6, 1));

}

- (void)loadThemeStates
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemeState *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemeState"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D70] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D70];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemeState initWithEntity:insertIntoManagedObjectContext:]([TDThemeState alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

+ (BOOL)loadThemeConstantsForEntity:(id)a3 inContext:(id)a4
{
  uint64_t v6;
  _QWORD *v7;
  TDThemeConstant *v8;
  uint64_t v9;

  if (loadThemeConstantsForEntity_inContext__onceToken != -1)
    dispatch_once(&loadThemeConstantsForEntity_inContext__onceToken, &__block_literal_global_221);
  v6 = objc_msgSend((id)objc_msgSend((id)loadThemeConstantsForEntity_inContext__constantMappings, "objectForKey:", objc_msgSend(a3, "name")), "pointerValue");
  if (*(_QWORD *)(v6 + 16))
  {
    v7 = (_QWORD *)v6;
    do
    {
      if (!v7[1])
        break;
      v8 = -[TDThemeConstant initWithEntity:insertIntoManagedObjectContext:]([TDThemeConstant alloc], "initWithEntity:insertIntoManagedObjectContext:", a3, a4);
      -[TDThemeConstant setValue:forKey:](v8, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *v7), CFSTR("identifier"));
      -[TDThemeConstant setDisplayName:](v8, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7[2], 1));
      -[TDThemeConstant setConstantName:](v8, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7[1], 1));

      v9 = v7[5];
      v7 += 3;
    }
    while (v9);
  }
  return 1;
}

uint64_t __55__TDThemeSchema_loadThemeConstantsForEntity_inContext___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", MEMORY[0x24BE28D60]), CFSTR("ThemePresentationState"), 0);
  loadThemeConstantsForEntity_inContext__constantMappings = result;
  return result;
}

- (void)loadThemePresentationStates
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemePresentationState *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemePresentationState"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D60] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D60];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemePresentationState initWithEntity:insertIntoManagedObjectContext:]([TDThemePresentationState alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeDirections
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemeDirection *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemeDirection"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D18] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D18];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemeDirection initWithEntity:insertIntoManagedObjectContext:]([TDThemeDirection alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeDrawingLayers
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemeDrawingLayer *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemeDrawingLayer"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D28] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D28];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemeDrawingLayer initWithEntity:insertIntoManagedObjectContext:]([TDThemeDrawingLayer alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeIdioms
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemeIdiom *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemeIdiom"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D50] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D50];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemeIdiom initWithEntity:insertIntoManagedObjectContext:]([TDThemeIdiom alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeDisplayGamuts
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemeDisplayGamut *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemeDisplayGamut"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D20] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D20];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemeDisplayGamut initWithEntity:insertIntoManagedObjectContext:]([TDThemeDisplayGamut alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeDeploymentTargets
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemeDeploymentTarget *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemeDeploymentTarget"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D10] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D10];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemeDeploymentTarget initWithEntity:insertIntoManagedObjectContext:]([TDThemeDeploymentTarget alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeCompressionTypes
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemeCompressionType *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemeCompressionType"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D08] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D08];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemeCompressionType initWithEntity:insertIntoManagedObjectContext:]([TDThemeCompressionType alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadTexturePixelFormats
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDTexturePixelFormat *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("TexturePixelFormat"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D90] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D90];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDTexturePixelFormat initWithEntity:insertIntoManagedObjectContext:]([TDTexturePixelFormat alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeTextureFaces
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemeDisplayGamut *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("TextureFace"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D80] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D80];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemeDisplayGamut initWithEntity:insertIntoManagedObjectContext:]([TDThemeDisplayGamut alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeTextureInterpretations
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDTextureInterpretation *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("TextureInterpretation"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D88] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D88];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDTextureInterpretation initWithEntity:insertIntoManagedObjectContext:]([TDTextureInterpretation alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeGraphicsFeatureSetClasses
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemeGraphicsFeatureSetClass *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemeGraphicsFeatureSetClass"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D40] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D40];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemeGraphicsFeatureSetClass initWithEntity:insertIntoManagedObjectContext:]([TDThemeGraphicsFeatureSetClass alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeUISizeClasses
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemeUISizeClass *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ThemeUISizeClass"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D98] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D98];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemeUISizeClass initWithEntity:insertIntoManagedObjectContext:]([TDThemeUISizeClass alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadIterationTypes
{
  id v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  TDIterationType *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("IterationType"));
  v5 = "Iterate Values";
  if ("Iterate Values")
  {
    v6 = v4;
    v7 = gThemeIterationTypes;
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDIterationType initWithEntity:insertIntoManagedObjectContext:]([TDIterationType alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = (const char *)*((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadRenditionTypes
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  TDRenditionType *v8;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("RenditionType"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D00] + 8);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D00];
    do
    {
      v8 = -[TDRenditionType initWithEntity:insertIntoManagedObjectContext:]([TDRenditionType alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v8, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v8, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)v7 + 2)));
      -[TDThemeConstant setConstantName:](v8, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));

      v5 = *((_QWORD *)v7 + 4);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadRenditionSubtypes
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  TDRenditionSubtype *v8;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("RenditionSubtype"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28CF8] + 8);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28CF8];
    do
    {
      v8 = -[TDRenditionSubtype initWithEntity:insertIntoManagedObjectContext:]([TDRenditionSubtype alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v8, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v8, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)v7 + 2)));
      -[TDThemeConstant setConstantName:](v8, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));

      v5 = *((_QWORD *)v7 + 4);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadColorNames
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  TDColorName *v8;
  uint64_t v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ColorName"));
  if (*(_QWORD *)(MEMORY[0x24BE28CD0] + 8))
  {
    v5 = v4;
    v6 = (_QWORD *)(MEMORY[0x24BE28CD0] + 24);
    do
    {
      v7 = *(v6 - 1);
      if (!v7)
        break;
      v8 = -[TDColorName initWithEntity:insertIntoManagedObjectContext:]([TDColorName alloc], "initWithEntity:insertIntoManagedObjectContext:", v5, v3);
      -[TDColorName setDisplayName:](v8, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 1));
      -[TDColorName setSelector:](v8, "setSelector:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *v6, 1));

      v9 = v6[3];
      v6 += 5;
    }
    while (v9);
  }
}

- (void)loadColorStatuses
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  TDThemeConstant *v9;
  uint64_t v10;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("ColorStatus"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28CC8] + 8);
  if (v5)
  {
    v6 = v4;
    v7 = (uint64_t *)(MEMORY[0x24BE28CC8] + 32);
    do
    {
      v8 = *(v7 - 2);
      if (!v8)
        break;
      v9 = -[TDThemeConstant initWithEntity:insertIntoManagedObjectContext:]([TDThemeConstant alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setValue:forKey:](v9, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(v7 - 4)), CFSTR("identifier"));
      -[TDThemeConstant setValue:forKey:](v9, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1), CFSTR("displayName"));
      -[TDThemeConstant setValue:forKey:](v9, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1), CFSTR("constantName"));

      v10 = *v7;
      v7 += 3;
      v5 = v10;
    }
    while (v10);
  }
}

- (void)loadMetafontSelectors
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemeConstant *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("MetafontSelector"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28CE8] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28CE8];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemeConstant initWithEntity:insertIntoManagedObjectContext:]([TDThemeConstant alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadMetafontSizes
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  TDMetafontSizeSelector *v11;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("MetafontSizeSelector"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28CF0] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (uint64_t *)MEMORY[0x24BE28CF0];
    do
    {
      v8 = v7[1];
      if (!v8)
        break;
      v9 = *v7;
      v10 = -[CoreThemeDocument sizeWithIdentifier:](self->_doc, "sizeWithIdentifier:", *v7);
      v11 = -[TDMetafontSizeSelector initWithEntity:insertIntoManagedObjectContext:]([TDMetafontSizeSelector alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDMetafontSizeSelector setIdentifier:](v11, "setIdentifier:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9));
      -[TDMetafontSizeSelector setControlSize:](v11, "setControlSize:", v10);
      -[TDMetafontSizeSelector setSelectorName:](v11, "setSelectorName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));
      -[TDMetafontSizeSelector setDisplayName:](v11, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));

      v5 = v7[5];
      v7 += 3;
    }
    while (v5);
  }
}

- (void)loadEffectConstants
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDThemeConstant *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  TDThemeConstant *v15;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("EffectType"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28CE0] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28CE0];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDThemeConstant initWithEntity:insertIntoManagedObjectContext:]([TDThemeConstant alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
  v10 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("EffectParameterType"));
  v11 = *(_QWORD *)(MEMORY[0x24BE28CD8] + 16);
  if (v11)
  {
    v12 = v10;
    v13 = (unsigned int *)MEMORY[0x24BE28CD8];
    do
    {
      v14 = *((_QWORD *)v13 + 1);
      if (!v14)
        break;
      v15 = -[TDThemeConstant initWithEntity:insertIntoManagedObjectContext:]([TDThemeConstant alloc], "initWithEntity:insertIntoManagedObjectContext:", v12, v3);
      -[TDThemeConstant setIdentifier:](v15, "setIdentifier:", *v13);
      -[TDThemeConstant setDisplayName:](v15, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 1));
      -[TDThemeConstant setConstantName:](v15, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 1));

      v11 = *((_QWORD *)v13 + 5);
      v13 += 6;
    }
    while (v11);
  }
}

- (void)_loadConstantForEntity:(id)a3 withDescriptor:(const _themeconstant *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char *var2;

  v7 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v8 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", a3);
  if (a4->var2)
  {
    v9 = (void *)v8;
    do
    {
      if (!a4->var1)
        break;
      v10 = (void *)objc_msgSend(objc_alloc(NSClassFromString((NSString *)objc_msgSend(v9, "managedObjectClassName"))), "initWithEntity:insertIntoManagedObjectContext:", v9, v7);
      objc_msgSend(v10, "setIdentifier:", LODWORD(a4->var0));
      objc_msgSend(v10, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a4->var2, 1));
      objc_msgSend(v10, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a4->var1, 1));

      var2 = a4[1].var2;
      ++a4;
    }
    while (var2);
  }
}

- (void)loadGlyphSizeConstants
{
  -[TDThemeSchema _loadConstantForEntity:withDescriptor:](self, "_loadConstantForEntity:withDescriptor:", CFSTR("ThemeGlyphSize"), MEMORY[0x24BE28DB0]);
}

- (void)loadGlyphWeightConstants
{
  -[TDThemeSchema _loadConstantForEntity:withDescriptor:](self, "_loadConstantForEntity:withDescriptor:", CFSTR("ThemeGlyphWeight"), MEMORY[0x24BE28DB8]);
}

- (void)loadVectorGlyphRenderingModeConstants
{
  -[TDThemeSchema _loadConstantForEntity:withDescriptor:](self, "_loadConstantForEntity:withDescriptor:", CFSTR("VectorGlyphRenderingMode"), MEMORY[0x24BE28DA8]);
}

- (void)loadTemplateRenderingModeConstants
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  TDTemplateRenderingMode *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("RenderingMode"));
  v5 = *(_QWORD *)(MEMORY[0x24BE28D78] + 16);
  if (v5)
  {
    v6 = v4;
    v7 = (unsigned int *)MEMORY[0x24BE28D78];
    do
    {
      v8 = *((_QWORD *)v7 + 1);
      if (!v8)
        break;
      v9 = -[TDTemplateRenderingMode initWithEntity:insertIntoManagedObjectContext:]([TDTemplateRenderingMode alloc], "initWithEntity:insertIntoManagedObjectContext:", v6, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v7);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 1));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 1));

      v5 = *((_QWORD *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadStandardEffectDefinitions
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", CFSTR("SchemaEffectDefinition"), 0);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v22 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v6 = (void *)objc_msgSend(v5, "parts");
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v24 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              -[CoreThemeDocument createEffectStyleProductionForPartDefinition:](self->_doc, "createEffectStyleProductionForPartDefinition:", v11);
              v12 = objc_msgSend(v5, "name");
              objc_msgSend(v11, "name");
              TDSchemaLog(CFSTR("Creating custom effect production from schema definition: [ %@ - %@ ]"), v13, v14, v15, v16, v17, v18, v19, v12);
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v8);
        }
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);
  }
}

- (void)loadSchemaCategories
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  unsigned int *v8;
  TDSchemaCategory *v9;

  v3 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("SchemaCategory"));
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BE28C80], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform")), "elementCategoryCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v8 = (unsigned int *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE28C80], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform")), "elementCategoryAtIndex:", i);
      v9 = -[TDSchemaCategory initWithEntity:insertIntoManagedObjectContext:]([TDSchemaCategory alloc], "initWithEntity:insertIntoManagedObjectContext:", v4, v3);
      -[TDThemeConstant setIdentifier:](v9, "setIdentifier:", *v8);
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *((_QWORD *)v8 + 2), 4));
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *((_QWORD *)v8 + 1), 4));

    }
  }
}

- (void)loadSchemaDefinitions
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  _QWORD *v10;
  TDSchemaElementDefinition *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  _QWORD *v16;
  _QWORD *v17;
  TDSchemaEffectDefinition *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  _QWORD *v23;
  _QWORD *v24;
  TDSchemaMaterialDefinition *v25;
  void *context;

  context = (void *)MEMORY[0x2276A576C](self, a2);
  v3 = (void *)objc_msgSend(MEMORY[0x24BE28C80], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform"));
  v4 = -[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext");
  v5 = objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", CFSTR("SchemaElementDefinition"), v4);
  v6 = objc_msgSend(v3, "elementDefinitionCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      v9 = (_QWORD *)objc_msgSend(v3, "elementDefinitionAtIndex:", i);
      if (*v9)
      {
        v10 = v9;
        v11 = -[TDSchemaElementDefinition initWithEntity:insertIntoManagedObjectContext:]([TDSchemaElementDefinition alloc], "initWithEntity:insertIntoManagedObjectContext:", v5, v4);
        -[TDSchemaElementDefinition setName:](v11, "setName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *v10, 4));
        -[TDSchemaElementDefinition setPublished:](v11, "setPublished:", *((unsigned __int8 *)v10 + 16));
        -[TDSchemaElementDefinition setCategory:](v11, "setCategory:", -[CoreThemeDocument schemaCategoryWithIdentifier:](self->_doc, "schemaCategoryWithIdentifier:", v10[3]));
        -[TDThemeSchema _addSchemaPartDefinitionsForStandardElement:withElement:](self, "_addSchemaPartDefinitionsForStandardElement:withElement:", v10, v11);

      }
    }
  }
  v12 = objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", CFSTR("SchemaEffectDefinition"), v4);
  v13 = objc_msgSend(v3, "effectDefinitionCount");
  if (v13)
  {
    v14 = v13;
    for (j = 0; j != v14; ++j)
    {
      v16 = (_QWORD *)objc_msgSend(v3, "effectDefinitionAtIndex:", j);
      if (*v16)
      {
        v17 = v16;
        v18 = -[TDSchemaEffectDefinition initWithEntity:insertIntoManagedObjectContext:]([TDSchemaEffectDefinition alloc], "initWithEntity:insertIntoManagedObjectContext:", v12, v4);
        -[TDSchemaEffectDefinition setName:](v18, "setName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *v17, 4));
        -[TDSchemaEffectDefinition setPublished:](v18, "setPublished:", *((unsigned __int8 *)v17 + 16));
        -[TDSchemaEffectDefinition setCategory:](v18, "setCategory:", -[CoreThemeDocument schemaCategoryWithIdentifier:](self->_doc, "schemaCategoryWithIdentifier:", v17[3]));
        -[TDThemeSchema _addSchemaPartDefinitionsForStandardElement:withElement:](self, "_addSchemaPartDefinitionsForStandardElement:withElement:", v17, v18);

      }
    }
  }
  v19 = objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", CFSTR("SchemaMaterialDefinition"), v4);
  v20 = objc_msgSend(v3, "materialDefinitionCount");
  if (v20)
  {
    v21 = v20;
    for (k = 0; k != v21; ++k)
    {
      v23 = (_QWORD *)objc_msgSend(v3, "materialDefinitionAtIndex:", k);
      if (*v23)
      {
        v24 = v23;
        v25 = -[TDSchemaMaterialDefinition initWithEntity:insertIntoManagedObjectContext:]([TDSchemaMaterialDefinition alloc], "initWithEntity:insertIntoManagedObjectContext:", v19, v4);
        -[TDSchemaMaterialDefinition setName:](v25, "setName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *v24, 4));
        -[TDSchemaMaterialDefinition setPublished:](v25, "setPublished:", *((unsigned __int8 *)v24 + 16));
        -[TDSchemaMaterialDefinition setCategory:](v25, "setCategory:", -[CoreThemeDocument schemaCategoryWithIdentifier:](self->_doc, "schemaCategoryWithIdentifier:", v24[3]));
        -[TDThemeSchema _addSchemaPartDefinitionsForStandardElement:withElement:](self, "_addSchemaPartDefinitionsForStandardElement:withElement:", v24, v25);

      }
    }
  }
  objc_autoreleasePoolPop(context);
}

- (void)resetThemeConstants
{
  void *v3;

  v3 = (void *)MEMORY[0x2276A576C](self, a2);
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemeSize"), 0))-[TDThemeSchema loadThemeSizes](self, "loadThemeSizes");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemeValue"), 0))-[TDThemeSchema loadThemeValues](self, "loadThemeValues");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemeElement"), 0))-[TDThemeSchema loadThemeElements](self, "loadThemeElements");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemePart"), 0))-[TDThemeSchema loadThemeParts](self, "loadThemeParts");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemeState"), 0))-[TDThemeSchema loadThemeStates](self, "loadThemeStates");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemePresentationState"), 0))-[TDThemeSchema loadThemePresentationStates](self, "loadThemePresentationStates");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemeDirection"), 0))-[TDThemeSchema loadThemeDirections](self, "loadThemeDirections");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemeDrawingLayer"), 0))-[TDThemeSchema loadThemeDrawingLayers](self, "loadThemeDrawingLayers");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemeIdiom"), 0))-[TDThemeSchema loadThemeIdioms](self, "loadThemeIdioms");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemeDisplayGamut"), 0))-[TDThemeSchema loadThemeDisplayGamuts](self, "loadThemeDisplayGamuts");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemeDeploymentTarget"), 0))-[TDThemeSchema loadThemeDeploymentTargets](self, "loadThemeDeploymentTargets");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemeCompressionType"), 0))-[TDThemeSchema loadThemeCompressionTypes](self, "loadThemeCompressionTypes");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("TexturePixelFormat"), 0))-[TDThemeSchema loadTexturePixelFormats](self, "loadTexturePixelFormats");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("TextureFace"), 0))-[TDThemeSchema loadThemeTextureFaces](self, "loadThemeTextureFaces");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("TextureInterpretation"), 0))-[TDThemeSchema loadThemeTextureInterpretations](self, "loadThemeTextureInterpretations");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemeGraphicsFeatureSetClass"), 0))-[TDThemeSchema loadThemeGraphicsFeatureSetClasses](self, "loadThemeGraphicsFeatureSetClasses");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemeUISizeClass"), 0))-[TDThemeSchema loadThemeUISizeClasses](self, "loadThemeUISizeClasses");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("IterationType"), 0))-[TDThemeSchema loadIterationTypes](self, "loadIterationTypes");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("RenditionType"), 0))-[TDThemeSchema loadRenditionTypes](self, "loadRenditionTypes");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("RenditionSubtype"), 0))-[TDThemeSchema loadRenditionSubtypes](self, "loadRenditionSubtypes");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ColorStatus"), 0))-[TDThemeSchema loadColorStatuses](self, "loadColorStatuses");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("MetafontSelector"), 0))-[TDThemeSchema loadMetafontSelectors](self, "loadMetafontSelectors");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("MetafontSizeSelector"), 0))-[TDThemeSchema loadMetafontSizes](self, "loadMetafontSizes");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ColorName"), 0))-[TDThemeSchema loadColorNames](self, "loadColorNames");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("SchemaCategory"), 0))-[TDThemeSchema loadSchemaCategories](self, "loadSchemaCategories");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("SchemaElementDefinition"), 0))-[TDThemeSchema loadSchemaDefinitions](self, "loadSchemaDefinitions");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("EffectType"), 0))-[TDThemeSchema loadEffectConstants](self, "loadEffectConstants");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("RenderingMode"), 0))-[TDThemeSchema loadTemplateRenderingModeConstants](self, "loadTemplateRenderingModeConstants");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemeGlyphSize"), 0))-[TDThemeSchema loadGlyphSizeConstants](self, "loadGlyphSizeConstants");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("ThemeGlyphWeight"), 0))-[TDThemeSchema loadGlyphWeightConstants](self, "loadGlyphWeightConstants");
  if (!-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", CFSTR("VectorGlyphRenderingMode"), 0))-[TDThemeSchema loadVectorGlyphRenderingModeConstants](self, "loadVectorGlyphRenderingModeConstants");
  objc_autoreleasePoolPop(v3);
}

@end
