@implementation NSEntityDescription

- (NSManagedObjectModel)managedObjectModel
{
  return self->_model;
}

- (uint64_t)_hasUniquedProperty:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
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

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    result = objc_msgSend(a2, "_qualifiedName");
    if (result)
    {
      v3 = *(_QWORD *)(v2 + 128);
      if (v3)
      {
        v4 = result;
        v12 = 0u;
        v13 = 0u;
        v10 = 0u;
        v11 = 0u;
        v5 = *(void **)(v3 + 24);
        result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (result)
        {
          v6 = result;
          v7 = *(_QWORD *)v11;
          while (2)
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v11 != v7)
                objc_enumerationMutation(v5);
              v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
              if (objc_msgSend(v9, "count") == 1 && (objc_msgSend(v9, "containsObject:", v4) & 1) != 0)
                return 1;
            }
            v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
            result = 0;
            if (v6)
              continue;
            break;
          }
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (_NSRange)_propertyRangesByType
{
  return self->_propertyRanges;
}

- (id)attributeKeys
{
  uint64_t v3;
  id v5;
  void *v6;

  if (self->_propertyRanges)
  {
    v3 = objc_msgSend(-[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"), "keys");
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3 + 8 * self->_propertyRanges[1].location, self->_propertyRanges[1].length);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NSEntityDescription _propertyKeys:matchingBlock:]((uint64_t)self, v5, (uint64_t)&__block_literal_global_365);
    v6 = (void *)objc_msgSend(v5, "allObjects");

    return v6;
  }
}

- (void)_createCachesAndOptimizeState
{
  NSEntityDescription *superentity;
  NSEntityDescription *i;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  uint64_t v9;
  NSManagedObjectModel *model;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  void *v19;
  __entityDescriptionFlags entityDescriptionFlags;
  int v21;
  BOOL v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  void *v28;
  NSEntityDescription *v29;
  _NSRange *propertyRanges;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t n;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  BOOL v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSEntityDescription *v51;
  uint64_t v52;
  id v53;
  BOOL v54;
  id v55;
  id v56;
  void *v57;
  uint64_t v58;
  _NSRange *v59;
  uint64_t v60;
  _NSRange *v61;
  uint64_t v62;
  uint64_t v63;
  NSUInteger v64;
  _NSRange *v65;
  uint64_t v66;
  uint64_t v67;
  NSUInteger v68;
  _NSRange *v69;
  uint64_t v70;
  NSUInteger v71;
  _NSRange *v72;
  uint64_t v73;
  NSUInteger v74;
  _NSRange *v75;
  NSUInteger v76;
  NSUInteger v77;
  uint64_t v78;
  NSUInteger v79;
  _NSRange *v80;
  uint64_t v81;
  NSUInteger v82;
  _NSRange *v83;
  uint64_t v84;
  NSUInteger v85;
  _NSRange *v86;
  NSUInteger v87;
  NSUInteger location;
  NSUInteger v89;
  uint64_t v90;
  NSUInteger v91;
  _NSRange *v92;
  uint64_t v93;
  _NSRange *v94;
  unint64_t v95;
  _NSRange *v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  size_t v101;
  char *v102;
  uint64_t ii;
  void *v104;
  NSKnownKeysDictionary *v105;
  void *v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  size_t v112;
  char *v113;
  id *v114;
  char *v115;
  unint64_t v116;
  NSKnownKeysDictionary *v117;
  id propertyMapping;
  uint64_t v119;
  size_t v120;
  NSMutableDictionary *properties;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  uint64_t jj;
  void *v126;
  id v127;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
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
  _BYTE v166[128];
  const __CFString *v167;
  uint64_t v168;
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_entityDescriptionFlags & 4) == 0)
  {
    v145 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    self->_rootentity = self;
    superentity = self->_superentity;
    if (superentity)
    {
      if (!-[NSMutableDictionary objectForKey:](superentity->_subentities, "objectForKey:", self->_name))
      {
        v136 = (void *)MEMORY[0x1E0C99DA0];
        v137 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad model.  For entity '%@' superentity '%@' does not think I am a subentity"), self->_name, self->_superentity->_name);
        objc_exception_throw((id)objc_msgSend(v136, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v137, 0));
      }
      -[NSEntityDescription _createCachesAndOptimizeState](self->_superentity, "_createCachesAndOptimizeState");
      if (!(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88
        && !-[NSString isEqualToString:](self->_classNameForEntity, "isEqualToString:", CFSTR("NSManagedObject")))
      {
        NSClassFromString(self->_classNameForEntity);
        objc_opt_self();
      }
      for (i = self->_rootentity; ; self->_rootentity = i)
      {
        i = -[NSEntityDescription superentity](i, "superentity");
        if (!i)
          break;
      }
    }
    if (-[NSMutableDictionary count](self->_subentities, "count"))
    {
      v160 = 0u;
      v161 = 0u;
      v158 = 0u;
      v159 = 0u;
      v5 = (void *)-[NSMutableDictionary allValues](self->_subentities, "allValues");
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v158, v170, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v159;
        do
        {
          for (j = 0; j != v6; ++j)
          {
            if (*(_QWORD *)v159 != v7)
              objc_enumerationMutation(v5);
            v9 = *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * j);
            if (*(NSEntityDescription **)(v9 + 80) != self)
            {
              v130 = (void *)MEMORY[0x1E0C99DA0];
              v131 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad model.  For entity '%@' subentity '%@' does not think I am its superentity"), self->_name, *(_QWORD *)(v9 + 64));
              objc_exception_throw((id)objc_msgSend(v130, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v131, 0));
            }
            model = self->_model;
            v11 = objc_msgSend(*(id *)(*((_QWORD *)&v158 + 1) + 8 * j), "name");
            if (model)
              model = (NSManagedObjectModel *)-[NSMutableDictionary objectForKey:](model->_entities, "objectForKey:", v11);
            if (model != (NSManagedObjectModel *)v9)
            {
              v128 = (void *)MEMORY[0x1E0C99DA0];
              v129 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad model.  For entity '%@' subentity '%@ (%p)' is not registered in NSManagedModelModel.  Model has a reference to %@ (%p)"), self->_name, *(_QWORD *)(v9 + 64), v9, -[NSManagedObjectModel name](model, "name"), model);
              objc_exception_throw((id)objc_msgSend(v128, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v129, 0));
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v158, v170, 16);
        }
        while (v6);
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[NSMutableDictionary allValues](self->_properties, "allValues"));
      objc_msgSend(v12, "sortUsingFunction:context:", _comparePropertiesByName, 0);
      v148 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v149 = v12;
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v156 = 0u;
      v157 = 0u;
      v154 = 0u;
      v155 = 0u;
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v154, v169, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v155;
        do
        {
          for (k = 0; k != v15; ++k)
          {
            if (*(_QWORD *)v155 != v16)
              objc_enumerationMutation(v149);
            v18 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * k);
            v19 = (void *)MEMORY[0x18D76B4E4]();
            objc_msgSend(v18, "_createCachesAndOptimizeState");
            entityDescriptionFlags = self->_entityDescriptionFlags;
            if ((*(_BYTE *)&entityDescriptionFlags & 0x20) != 0)
            {
              v21 = *(_DWORD *)&self->_entityDescriptionFlags & 0x20;
            }
            else
            {
              if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight]((uint64_t)self))
                v21 = 32;
              else
                v21 = 0;
              entityDescriptionFlags = (__entityDescriptionFlags)(*(_DWORD *)&self->_entityDescriptionFlags & 0xFFFFFFDF | v21);
              self->_entityDescriptionFlags = entityDescriptionFlags;
            }
            if (HIBYTE(dword_1ECD8DE20))
              v22 = v21 == 0;
            else
              v22 = 1;
            if (!v22)
            {
              if (!objc_msgSend(v18, "_isSpotlightIndexedAndTransient"))
              {
                v134 = (void *)MEMORY[0x1E0C99DA0];
                v167 = CFSTR("attribute");
                v168 = objc_msgSend(v18, "name");
                v135 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1);
                objc_exception_throw((id)objc_msgSend(v134, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Transient attributes cannot be indexed in Spotlight"), v135));
              }
              entityDescriptionFlags = self->_entityDescriptionFlags;
            }
            if ((*(_BYTE *)&entityDescriptionFlags & 0x40) == 0)
            {
              if (objc_msgSend(v18, "isStoredInExternalRecord"))
                v23 = 64;
              else
                v23 = 0;
              self->_entityDescriptionFlags = (__entityDescriptionFlags)(*(_DWORD *)&self->_entityDescriptionFlags & 0xFFFFFFBF | v23);
            }
            v24 = objc_msgSend(v18, "_propertyType");
            if (v24 == 6)
            {
              if (objc_msgSend((id)objc_msgSend(v18, "derivationExpression"), "expressionType") == 3)
                objc_msgSend(v14, "setObject:forKey:", v18, objc_msgSend((id)objc_msgSend(v18, "derivationExpression"), "keyPath"));
            }
            else if (v24 == 2)
            {
              if (objc_msgSend(v18, "storesBinaryDataExternally")
                && (objc_msgSend(v18, "isFileBackedFuture") & 1) == 0)
              {
                *(_DWORD *)&self->_entityDescriptionFlags |= 0x100u;
              }
              if ((objc_msgSend(v18, "isFileBackedFuture") & 1) != 0
                || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "userInfo"), "valueForKey:", CFSTR("NSIsFileBackedFuture")), "BOOLValue"))
              {
                *(_DWORD *)&self->_entityDescriptionFlags |= 0x8100u;
              }
              if (objc_msgSend(v18, "usesMergeableStorage"))
                objc_msgSend(v13, "addObject:", v18);
            }
            objc_autoreleasePoolPop(v19);
          }
          v15 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v154, v169, 16);
        }
        while (v15);
      }
      if (objc_msgSend(v13, "count"))
      {
        v152 = 0u;
        v153 = 0u;
        v150 = 0u;
        v151 = 0u;
        v25 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v150, v166, 16);
        if (v25)
        {
          v26 = *(_QWORD *)v151;
          do
          {
            for (m = 0; m != v25; ++m)
            {
              if (*(_QWORD *)v151 != v26)
                objc_enumerationMutation(v13);
              v28 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * m);
              if (!objc_msgSend(v14, "valueForKey:", objc_msgSend(v28, "name")))
              {
                v132 = (void *)MEMORY[0x1E0C99DA0];
                v133 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mergeable attribute %@ requires a paired derived attribute with a derivation expression in the form \"%@\"), objc_msgSend(v28, "name"), objc_msgSend(v28, "name"));
                objc_exception_throw((id)objc_msgSend(v132, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v133, 0));
              }
            }
            v25 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v150, v166, 16);
          }
          while (v25);
        }
      }
      objc_msgSend(v148, "drain");
      v139 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v29 = self->_superentity;
      if (v29)
      {
        propertyRanges = v29->_propertyRanges;
        v31 = objc_msgSend((id)-[NSMutableDictionary mapping](v29->_properties, "mapping"), "keys");
        if (propertyRanges[15].length)
          v32 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v31 + 8 * propertyRanges[15].location);
        else
          v32 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v33 = (void *)v32;
        if (propertyRanges[16].length)
          v140 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v31 + 8 * propertyRanges[16].location);
        else
          v140 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        if (propertyRanges[5].length)
          v45 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v31 + 8 * propertyRanges[5].location);
        else
          v45 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v34 = (void *)v45;
        if (propertyRanges[6].length)
          v147 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v31 + 8 * propertyRanges[6].location);
        else
          v147 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        if (propertyRanges[10].length)
          v146 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v31 + 8 * propertyRanges[10].location);
        else
          v146 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        if (propertyRanges[7].length)
          v144 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v31 + 8 * propertyRanges[7].location);
        else
          v144 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        if (propertyRanges[8].length)
          v143 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v31 + 8 * propertyRanges[8].location);
        else
          v143 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        if (propertyRanges[11].length)
          v142 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v31 + 8 * propertyRanges[11].location);
        else
          v142 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        if (propertyRanges[12].length)
          v141 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v31 + 8 * propertyRanges[12].location);
        else
          v141 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        if (propertyRanges[14].length)
          v46 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v31 + 8 * propertyRanges[14].location);
        else
          v46 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v35 = (void *)v46;
        if (propertyRanges[17].length)
          v148 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:count:", v31 + 8 * propertyRanges[17].location);
        else
          v148 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v47 = objc_msgSend(v149, "count");
        if (v47)
        {
          v48 = 0;
          while (1)
          {
            v49 = (void *)objc_msgSend(v149, "objectAtIndex:", v48);
            v50 = objc_msgSend(v49, "name");
            v51 = self->_superentity;
            if (!v51)
              break;
            if ((*(_BYTE *)&v51->_entityDescriptionFlags & 4) != 0)
            {
              if (objc_msgSend(v51->_propertyMapping, "indexForKey:", v50) == 0x7FFFFFFFFFFFFFFFLL)
                break;
            }
            else if (!-[NSDictionary objectForKey:](-[NSEntityDescription propertiesByName](v51, "propertiesByName"), "objectForKey:", v50))
            {
              break;
            }
LABEL_144:
            if (v47 == ++v48)
              goto LABEL_145;
          }
          v52 = objc_msgSend(v49, "_propertyType") - 2;
          v53 = v35;
          switch(v52)
          {
            case 0:
            case 4:
            case 5:
              if (objc_msgSend(v49, "isTransient"))
                v53 = v34;
              else
                v53 = v33;
              break;
            case 1:
              break;
            case 2:
              if (objc_msgSend(v49, "isToMany"))
              {
                if ((objc_msgSend(v49, "isTransient") & 1) != 0)
                {
                  v54 = objc_msgSend(v49, "isOrdered") == 0;
                  v56 = v141;
                  v55 = v142;
                }
                else
                {
                  v54 = objc_msgSend(v49, "isOrdered") == 0;
                  v56 = v143;
                  v55 = v144;
                }
                if (v54)
                  v53 = v55;
                else
                  v53 = v56;
              }
              else if (objc_msgSend(v49, "isTransient"))
              {
                v53 = v146;
              }
              else
              {
                v53 = v147;
              }
              break;
            default:
              v53 = v148;
              break;
          }
          objc_msgSend(v53, "addObject:", v50);
          goto LABEL_144;
        }
      }
      else
      {
        v33 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v140 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v34 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v147 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v146 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v143 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v144 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v141 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v142 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v35 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v148 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v36 = objc_msgSend(v149, "count");
        if (v36)
        {
          for (n = 0; n != v36; ++n)
          {
            v38 = (void *)objc_msgSend(v149, "objectAtIndex:", n);
            v39 = objc_msgSend(v38, "name");
            v40 = objc_msgSend(v38, "_propertyType") - 2;
            v41 = v35;
            switch(v40)
            {
              case 0:
              case 4:
              case 5:
                if (objc_msgSend(v38, "isTransient"))
                  v41 = v34;
                else
                  v41 = v33;
                break;
              case 1:
                break;
              case 2:
                if (objc_msgSend(v38, "isToMany"))
                {
                  if ((objc_msgSend(v38, "isTransient") & 1) != 0)
                  {
                    v42 = objc_msgSend(v38, "isOrdered") == 0;
                    v44 = v141;
                    v43 = v142;
                  }
                  else
                  {
                    v42 = objc_msgSend(v38, "isOrdered") == 0;
                    v44 = v143;
                    v43 = v144;
                  }
                  if (v42)
                    v41 = v43;
                  else
                    v41 = v44;
                }
                else if (objc_msgSend(v38, "isTransient"))
                {
                  v41 = v146;
                }
                else
                {
                  v41 = v147;
                }
                break;
              default:
                v41 = v148;
                break;
            }
            objc_msgSend(v41, "addObject:", v39);
          }
        }
      }
LABEL_145:
      self->_propertyRanges = (_NSRange *)PF_CALLOC_UNSCANNED_BYTES(0x120uLL);
      v57 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_properties, "count"));
      v58 = objc_msgSend(v33, "count");
      objc_msgSend(v57, "addObjectsFromArray:", v33);
      v59 = self->_propertyRanges;
      v59[15].location = 0;
      v59[15].length = v58;
      v60 = objc_msgSend(v140, "count");
      objc_msgSend(v57, "addObjectsFromArray:", v140);
      v61 = self->_propertyRanges;
      v61[16].location = v58;
      v61[16].length = v60;
      v62 = objc_msgSend(v57, "count");
      v61[3].location = 0;
      v61[3].length = v62;
      v63 = objc_msgSend(v34, "count");
      objc_msgSend(v57, "addObjectsFromArray:", v34);
      v64 = v60 + v58;
      v65 = self->_propertyRanges;
      v65[5].location = v64;
      v65[5].length = v63;
      v66 = objc_msgSend(v57, "count");
      v65[1].location = 0;
      v65[1].length = v66;
      v67 = objc_msgSend(v147, "count");
      objc_msgSend(v57, "addObjectsFromArray:", v147);
      v68 = v63 + v64;
      v69 = self->_propertyRanges;
      v69[6].location = v68;
      v69[6].length = v67;
      v70 = objc_msgSend(v144, "count");
      objc_msgSend(v57, "addObjectsFromArray:", v144);
      v71 = v67 + v68;
      v72 = self->_propertyRanges;
      v72[7].location = v71;
      v72[7].length = v70;
      v73 = objc_msgSend(v143, "count");
      objc_msgSend(v57, "addObjectsFromArray:", v143);
      v74 = v70 + v71;
      v75 = self->_propertyRanges;
      v75[8].location = v74;
      v75[8].length = v73;
      v76 = v75[7].length + v73;
      v75[9].location = v75[7].location;
      v75[9].length = v76;
      v77 = v75[6].length + v76;
      v75[4].location = v75[6].location;
      v75[4].length = v77;
      v78 = objc_msgSend(v146, "count");
      objc_msgSend(v57, "addObjectsFromArray:", v146);
      v79 = v73 + v74;
      v80 = self->_propertyRanges;
      v80[10].location = v79;
      v80[10].length = v78;
      v81 = objc_msgSend(v142, "count");
      objc_msgSend(v57, "addObjectsFromArray:", v142);
      v82 = v78 + v79;
      v83 = self->_propertyRanges;
      v83[11].location = v82;
      v83[11].length = v81;
      v84 = objc_msgSend(v141, "count");
      objc_msgSend(v57, "addObjectsFromArray:", v141);
      v85 = v81 + v82;
      v86 = self->_propertyRanges;
      v86[12].location = v85;
      v86[12].length = v84;
      v87 = v86[11].length + v84;
      v86[13].location = v86[11].location;
      v86[13].length = v87;
      location = v86[6].location;
      v89 = objc_msgSend(v57, "count") - self->_propertyRanges[1].length;
      v86[2].location = location;
      v86[2].length = v89;
      v90 = objc_msgSend(v35, "count");
      objc_msgSend(v57, "addObjectsFromArray:", v35);
      v91 = v84 + v85;
      v92 = self->_propertyRanges;
      v92[14].location = v84 + v85;
      v92[14].length = v90;
      v93 = objc_msgSend(v148, "count");
      objc_msgSend(v57, "addObjectsFromArray:", v148);
      v94 = self->_propertyRanges;
      v94[17].location = v91 + 2 * v90;
      v94[17].length = v93;
      v95 = objc_msgSend(v57, "count");
      v96 = self->_propertyRanges;
      v96->location = 0;
      v96->length = v95;
      v97 = MEMORY[0x1E0C80A78]();
      v100 = (char *)&v138 - v99;
      v101 = 8 * v98;
      if (v97 >= 0x201)
      {
        v100 = (char *)NSAllocateScannedUncollectable();
        v102 = (char *)NSAllocateScannedUncollectable();
      }
      else
      {
        bzero((char *)&v138 - v99, 8 * v98);
        MEMORY[0x1E0C80A78]();
        v102 = (char *)&v138 - ((v101 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v102, v101);
      }
      objc_msgSend(v57, "getObjects:range:", v102, 0, v95);
      if (v95)
      {
        for (ii = 0; ii != v95; ++ii)
        {
          v104 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", *(_QWORD *)&v102[8 * ii]);
          *(_QWORD *)&v100[8 * ii] = v104;
          objc_msgSend(v104, "_setEntitysReferenceID:", ii);
        }
      }
      v105 = -[NSKnownKeysDictionary initWithObjects:forKeys:count:]([NSKnownKeysDictionary alloc], "initWithObjects:forKeys:count:", v100, v102, v95);
      if (v95 >= 0x201)
      {
        NSZoneFree(0, v100);
        NSZoneFree(0, v102);
      }
      objc_msgSend(v139, "drain");

      self->_properties = &v105->super;
      self->_propertyMapping = -[NSKnownKeysDictionary mapping](v105, "mapping");
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v106 = (void *)objc_msgSend((id)-[NSMutableDictionary allValues](self->_subentities, "allValues"), "sortedArrayUsingFunction:context:", _compareEntitiesByName, 0);
      v107 = objc_msgSend(v106, "count");
      v108 = MEMORY[0x1E0C80A78]();
      v111 = (char *)&v138 - v110;
      v112 = 8 * v109;
      if (v108 >= 0x201)
      {
        v111 = (char *)NSAllocateScannedUncollectable();
        v113 = (char *)NSAllocateScannedUncollectable();
      }
      else
      {
        bzero((char *)&v138 - v110, 8 * v109);
        MEMORY[0x1E0C80A78]();
        v113 = (char *)&v138 - ((v112 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v113, v112);
      }
      objc_msgSend(v106, "getObjects:range:", v111, 0, v107);
      if (v107)
      {
        v114 = (id *)v111;
        v115 = v113;
        v116 = v107;
        do
        {
          *(_QWORD *)v115 = objc_msgSend(*v114, "name");
          v115 += 8;
          ++v114;
          --v116;
        }
        while (v116);
      }
      v117 = -[NSKnownKeysDictionary initWithObjects:forKeys:count:]([NSKnownKeysDictionary alloc], "initWithObjects:forKeys:count:", v111, v113, v107);
      if (v107 >= 0x201)
      {
        NSZoneFree(0, v111);
        NSZoneFree(0, v113);
      }

      self->_subentities = &v117->super;
    }
    if (!self->_flattenedSubentities)
      self->_flattenedSubentities = -[NSEntityDescription _collectSubentities](self);
    propertyMapping = self->_propertyMapping;
    v119 = objc_msgSend(propertyMapping, "keys");
    v120 = objc_msgSend(propertyMapping, "length");
    self->_kvcPropertyAccessors = (id **)PF_CALLOC_SCANNED_BYTES(0x50uLL);
    *((_QWORD *)self->_kvcPropertyAccessors + 6) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v119, v120);
    *((_QWORD *)self->_kvcPropertyAccessors + 7) = -[NSEntityDescription _newMappingForPropertiesOfRange:](self, "_newMappingForPropertiesOfRange:", 1);
    *((_QWORD *)self->_kvcPropertyAccessors + 8) = -[NSEntityDescription _newMappingForPropertiesOfRange:](self, "_newMappingForPropertiesOfRange:", 2);
    *((_QWORD *)self->_kvcPropertyAccessors + 9) = PF_CALLOC_UNSCANNED_BYTES(v120);
    -[NSEntityDescription _commonCachesAndOptimizedState](self);
    *(_DWORD *)&self->_entityDescriptionFlags |= 4u;
    v162 = 0u;
    v163 = 0u;
    v164 = 0u;
    v165 = 0u;
    properties = self->_properties;
    v122 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v162, v171, 16);
    if (v122)
    {
      v123 = 0;
      v124 = *(_QWORD *)v163;
      do
      {
        for (jj = 0; jj != v122; ++jj)
        {
          if (*(_QWORD *)v163 != v124)
            objc_enumerationMutation(properties);
          v126 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * jj));
          if (objc_msgSend(v126, "_isAttribute") && objc_msgSend(v126, "_namespace"))
          {
            if (!v123)
              v123 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            -[NSEntityDescription _checkAttributeMembership:hashes:](v126, v123);
          }
        }
        v122 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v162, v171, 16);
      }
      while (v122);
    }

    objc_msgSend(v145, "drain");
    v127 = 0;
    if (self)
    {
      if (!self->_extraIvars)
        -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
    }
  }
}

- (uint64_t)_hasPropertiesIndexedBySpotlight
{
  unsigned __int8 *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (unsigned __int8 *)result;
    if ((objc_msgSend((id)result, "_isEditable") & 1) != 0)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v2 = (void *)objc_msgSend(v1, "properties");
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (result)
      {
        v3 = result;
        v4 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v3; ++i)
          {
            if (*(_QWORD *)v17 != v4)
              objc_enumerationMutation(v2);
            v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v6, "_propertyType") == 7)
            {
              v7 = (void *)objc_msgSend(v6, "_flattenedElements");
              v12 = 0u;
              v13 = 0u;
              v14 = 0u;
              v15 = 0u;
              v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
              if (v8)
              {
                v9 = v8;
                v10 = *(_QWORD *)v13;
LABEL_11:
                v11 = 0;
                while (1)
                {
                  if (*(_QWORD *)v13 != v10)
                    objc_enumerationMutation(v7);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11), "isIndexedBySpotlight") & 1) != 0)
                    return 1;
                  if (v9 == ++v11)
                  {
                    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
                    if (v9)
                      goto LABEL_11;
                    break;
                  }
                }
              }
            }
            else if ((objc_msgSend(v6, "isIndexedBySpotlight") & 1) != 0)
            {
              return 1;
            }
          }
          v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
          result = 0;
          if (v3)
            continue;
          break;
        }
      }
    }
    else
    {
      return (v1[120] >> 5) & 1;
    }
  }
  return result;
}

- (unint64_t)_versionHashInStyle:(unint64_t *)result
{
  unint64_t *v3;
  void *v4;
  unint64_t *v5;
  void *v6;

  if (result)
  {
    v3 = result;
    if (a2 == 1)
    {
      v4 = (void *)-[NSEntityDescription _newVersionHashInStyle:]((uint64_t)result, 1);
      return (unint64_t *)v4;
    }
    v5 = result + 4;
    if (!result[4] || objc_msgSend(result, "_isEditable"))
    {
      v6 = (void *)-[NSEntityDescription _newVersionHashInStyle:]((uint64_t)v3, a2);
      if (objc_msgSend(v3, "_isEditable"))
      {
        v4 = v6;
        return (unint64_t *)v4;
      }
      while (!__ldaxr(v5))
      {
        if (!__stlxr((unint64_t)v6, v5))
          return (unint64_t *)*v5;
      }
      __clrex();

    }
    return (unint64_t *)*v5;
  }
  return result;
}

- (BOOL)_isEditable
{
  return (*(_BYTE *)&self->_entityDescriptionFlags & 4) == 0;
}

- (NSArray)properties
{
  return -[NSDictionary allValues](-[NSEntityDescription propertiesByName](self, "propertiesByName"), "allValues");
}

- (id)_newMappingForPropertiesOfRange:(unsigned int)a3
{
  uint64_t v5;
  uint64_t v6;
  _NSRange *v7;

  v5 = objc_msgSend(-[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"), "keys");
  v6 = -[NSDictionary values](-[NSEntityDescription propertiesByName](self, "propertiesByName"), "values");
  v7 = &self->_propertyRanges[a3];
  return -[NSKnownKeysDictionary initWithObjects:forKeys:count:]([NSKnownKeysDictionary alloc], "initWithObjects:forKeys:count:", v6 + 8 * v7->location, v5 + 8 * v7->location, v7->length);
}

- (id)_attributeNamed:(uint64_t)a1
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v11;
  char v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  if (!a1)
    return 0;
  if (*(_QWORD *)(a1 + 112))
  {
    v4 = objc_msgSend((id)objc_msgSend((id)a1, "_propertySearchMapping"), "indexForKey:", a2);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = v4;
      v6 = *(_QWORD *)(a1 + 112);
      v7 = *(_QWORD *)(v6 + 16);
      v8 = *(_QWORD *)(v6 + 24);
      v9 = objc_msgSend((id)objc_msgSend((id)a1, "propertiesByName"), "values");
      if (v5 >= v7 && v5 - v7 < v8)
        return *(id *)(v9 + 8 * v5);
    }
    return 0;
  }
  v11 = (id)objc_msgSend(*(id *)(a1 + 96), "objectForKey:", a2);
  v12 = objc_msgSend(v11, "_isAttribute");
  if (!v11 || (v12 & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 120) & 8) == 0)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x3052000000;
      v18 = __Block_byref_object_copy__10;
      v19 = __Block_byref_object_dispose__10;
      v20 = 0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __59__NSEntityDescription__NSInternalMethods___attributeNamed___block_invoke;
      v14[3] = &unk_1E1EDDD60;
      v14[4] = a2;
      v14[5] = &v15;
      -[NSEntityDescription _propertyKeys:matchingBlock:](a1, 0, (uint64_t)v14);
      v11 = (id)objc_msgSend((id)v16[5], "copy");
      objc_msgSend(v11, "_setEntity:", a1);
      _Block_object_dispose(&v15, 8);
      return v11;
    }
    return 0;
  }
  return v11;
}

- (NSDictionary)propertiesByName
{
  NSEntityDescription *v3;
  NSEntityDescription *v4;
  NSDictionary *v5;
  NSDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[NSEntityDescription superentity](self, "superentity");
  v4 = v3;
  if (self && ((*(_BYTE *)&self->_entityDescriptionFlags >> 3) & 1) != 0 || !v3)
    return &self->_properties->super;
  v5 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = -[NSEntityDescription propertiesByName](v4, "propertiesByName");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(-[NSDictionary objectForKey:](v6, "objectForKey:", v11), "copy");
        objc_msgSend(v12, "_setEntity:", self);
        -[NSDictionary setObject:forKey:](v5, "setObject:forKey:", v12, v11);

      }
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  -[NSDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", self->_properties);
  return v5;
}

- (NSEntityDescription)superentity
{
  return self->_superentity;
}

- (id)_propertySearchMapping
{
  return self->_propertyMapping;
}

- (BOOL)_hasUniqueProperties
{
  if (result)
  {
    if ((*(_DWORD *)(result + 120) & 4) == 0)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Entity wasn't finalized properly before use"), 0));
    return (*(_DWORD *)(result + 120) & 0x1800) != 0;
  }
  return result;
}

- (BOOL)isKindOfEntity:(NSEntityDescription *)entity
{
  return -[NSEntityDescription _subentitiesIncludes:](entity, "_subentitiesIncludes:", self);
}

- (uint64_t)_keypathsForDeletions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  id *v12;
  id v13;

  if (!a1)
    return 0;
  if (a1[14])
  {
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_msgSend((id)objc_msgSend(a1, "propertiesByName"), "values");
    v4 = v3;
    v5 = (_QWORD *)a1[14];
    v6 = v5[12];
    v7 = v5[13];
    if (v6 < v7 + v6)
    {
      v8 = (id *)(v3 + 8 * v6);
      do
      {
        v9 = *v8;
        if (objc_msgSend(*v8, "inverseRelationship"))
          objc_msgSend(v2, "addObject:", objc_msgSend(v9, "name"));
        ++v8;
        --v7;
      }
      while (v7);
      v5 = (_QWORD *)a1[14];
    }
    v10 = v5[18];
    v11 = v5[19];
    if (v10 < v11 + v10)
    {
      v12 = (id *)(v4 + 8 * v10);
      do
      {
        v13 = *v12;
        if (objc_msgSend(*v12, "inverseRelationship"))
          objc_msgSend(v2, "addObject:", objc_msgSend(v13, "name"));
        ++v12;
        --v11;
      }
      while (v11);
    }
    return (uint64_t)v2;
  }
  return objc_msgSend((id)objc_msgSend(a1, "relationshipsByName"), "allKeys");
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)userInfo
{
  if (self->_userInfo)
    return &self->_userInfo->super;
  else
    return (NSDictionary *)NSDictionary_EmptyDictionary;
}

- (void)_sortedSubentities
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    v1 = (void *)objc_msgSend(result, "subentities");
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:selector:", CFSTR("name"), 1, sel_caseInsensitiveCompare_);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v2, 0);
    v4 = objc_msgSend(v1, "sortedArrayUsingDescriptors:", v3);

    return (void *)v4;
  }
  return result;
}

- (NSArray)subentities
{
  NSMutableDictionary *subentities;

  subentities = self->_subentities;
  if (subentities)
    return (NSArray *)-[NSMutableDictionary allValues](subentities, "allValues");
  else
    return (NSArray *)NSArray_EmptyArray;
}

- (id)_propertiesOnlySubsetFromIndexes:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(a2);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (-[NSFetchIndexDescription _isMappedSinglePropertyIndex](v8))
          objc_msgSend(v3, "addObject:", v8);
      }
      v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  return v3;
}

- (NSArray)indexes
{
  _ExtraEntityIVars *extraIvars;
  NSArray *result;

  extraIvars = self->_extraIvars;
  if (!extraIvars)
    return (NSArray *)NSArray_EmptyArray;
  result = (NSArray *)extraIvars->var5;
  if (!result)
    return (NSArray *)NSArray_EmptyArray;
  return result;
}

- (uint64_t)_hasAttributesWithExternalDataReferences
{
  _BYTE *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (_BYTE *)result;
    if ((objc_msgSend((id)result, "_isEditable") & 1) != 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v2 = (void *)objc_msgSend(v1, "properties");
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (result)
      {
        v3 = result;
        v4 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v3; ++i)
          {
            if (*(_QWORD *)v18 != v4)
              objc_enumerationMutation(v2);
            v6 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            if (objc_msgSend(v6, "_propertyType") == 7)
            {
              v7 = (void *)objc_msgSend(v6, "_flattenedElements");
              v13 = 0u;
              v14 = 0u;
              v15 = 0u;
              v16 = 0u;
              v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
              if (v8)
              {
                v9 = v8;
                v10 = *(_QWORD *)v14;
LABEL_11:
                v11 = 0;
                while (1)
                {
                  if (*(_QWORD *)v14 != v10)
                    objc_enumerationMutation(v7);
                  v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
                  if (objc_msgSend(v12, "storesBinaryDataExternally"))
                  {
                    if (!objc_msgSend(v12, "isFileBackedFuture"))
                      return 1;
                  }
                  if (v9 == ++v11)
                  {
                    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
                    if (v9)
                      goto LABEL_11;
                    break;
                  }
                }
              }
            }
            else if (objc_msgSend(v6, "_propertyType") == 2
                   && objc_msgSend(v6, "storesBinaryDataExternally")
                   && !objc_msgSend(v6, "isFileBackedFuture"))
            {
              return 1;
            }
          }
          v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
          result = 0;
          if (v3)
            continue;
          break;
        }
      }
    }
    else
    {
      return v1[121] & 1;
    }
  }
  return result;
}

- (uint64_t)_hasAttributesWithFileBackedFutures
{
  unsigned __int8 *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (unsigned __int8 *)result;
    if ((objc_msgSend((id)result, "_isEditable") & 1) != 0)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v2 = (void *)objc_msgSend(v1, "properties");
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (result)
      {
        v3 = result;
        v4 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v3; ++i)
          {
            if (*(_QWORD *)v17 != v4)
              objc_enumerationMutation(v2);
            v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v6, "_propertyType") == 7)
            {
              v7 = (void *)objc_msgSend(v6, "_flattenedElements");
              v12 = 0u;
              v13 = 0u;
              v14 = 0u;
              v15 = 0u;
              v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
              if (v8)
              {
                v9 = v8;
                v10 = *(_QWORD *)v13;
LABEL_11:
                v11 = 0;
                while (1)
                {
                  if (*(_QWORD *)v13 != v10)
                    objc_enumerationMutation(v7);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11), "isFileBackedFuture") & 1) != 0)
                    return 1;
                  if (v9 == ++v11)
                  {
                    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
                    if (v9)
                      goto LABEL_11;
                    break;
                  }
                }
              }
            }
            else if (objc_msgSend(v6, "_propertyType") == 2 && (objc_msgSend(v6, "isFileBackedFuture") & 1) != 0)
            {
              return 1;
            }
          }
          v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
          result = 0;
          if (v3)
            continue;
          break;
        }
      }
    }
    else
    {
      return v1[121] >> 7;
    }
  }
  return result;
}

- (NSEntityDescription)retain
{
  int *p_cd_rc;
  int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 + 2, (unsigned int *)p_cd_rc));
  if (v3 <= -3)
    __break(1u);
  return self;
}

- (_QWORD)_extensionsOfParentConstraint:(_QWORD *)result
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[3];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    v3 = result[16];
    if (v3 && *(_QWORD *)(v3 + 24))
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      obj = *(id *)(v2[16] + 24);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v20 != v7)
              objc_enumerationMutation(obj);
            v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            v10 = objc_msgSend(v9, "count");
            v11 = objc_msgSend(a2, "count");
            v12 = v10 > v11;
            v13 = v10 - v11;
            if (v12)
            {
              v14 = v11;
              if (v11)
              {
                v15 = 0;
                v16 = 0;
                do
                {
                  v16 += objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v15), "isEqual:", objc_msgSend(a2, "objectAtIndex:", v15));
                  ++v15;
                }
                while (v14 != v15);
              }
              else
              {
                v16 = 0;
              }
              if (v16 == v14)
              {
                v23[0] = v9;
                v23[1] = objc_msgSend(v9, "subarrayWithRange:", 0, v14);
                v23[2] = objc_msgSend(v9, "subarrayWithRange:", v14, v13);
                objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3));
              }
            }
          }
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v6);
      }
      return v17;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (NSEntityDescription)entityForName:(NSString *)entityName inManagedObjectContext:(NSManagedObjectContext *)context
{
  NSPersistentStoreCoordinator *v5;
  NSPersistentStoreCoordinator *v6;
  _PFModelMap *modelMap;
  NSEntityDescription *result;
  _PFModelMap *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  if (!context)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+entityForName: nil is not a legal NSManagedObjectContext parameter searching for entity name '%@'"), entityName);
    goto LABEL_11;
  }
  v5 = -[NSManagedObjectContext persistentStoreCoordinator](context, "persistentStoreCoordinator");
  if (!v5)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+entityForName: nil is not a legal NSPersistentStoreCoordinator for searching for entity name '%@'"), entityName);
    goto LABEL_11;
  }
  v6 = v5;
  if (!-[NSPersistentStoreCoordinator managedObjectModel](v5, "managedObjectModel"))
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+entityForName: could not locate an NSManagedObjectModel for entity name '%@'"), entityName);
LABEL_11:
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0));
  }
  modelMap = v6->_modelMap;
  if (modelMap)
  {
    result = -[NSDictionary objectForKey:](modelMap->_entitiesByPath, "objectForKey:", entityName);
    if (result)
      return result;
    v9 = v6->_modelMap;
  }
  else
  {
    v9 = 0;
  }
  return (NSEntityDescription *)-[_PFModelMap ancillaryEntityWithName:](v9, (uint64_t)entityName);
}

- (__CFSet)_collectSubentities
{
  const __CFAllocator *v2;
  __CFSet *Mutable;
  __CFSet *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v4 = CFSetCreateMutable(v2, 0, 0);
  CFSetAddValue(v4, a1);
  if (CFSetGetCount(v4) >= 1)
  {
    do
    {
      v5 = (void *)-[__CFSet anyObject](v4, "anyObject");
      if (v5)
      {
        v6 = v5;
        CFSetAddValue(Mutable, v5);
        CFSetRemoveValue(v4, v6);
        v7 = (void *)objc_msgSend(v6, "subentitiesByName");
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v15;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v15 != v10)
                objc_enumerationMutation(v7);
              v12 = (const void *)objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
              if (v12)
                CFSetAddValue(v4, v12);
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          }
          while (v9);
        }
      }
    }
    while (CFSetGetCount(v4) > 0);
  }
  CFRelease(v4);
  return Mutable;
}

- (NSDictionary)subentitiesByName
{
  if (self->_subentities)
    return &self->_subentities->super;
  else
    return (NSDictionary *)NSDictionary_EmptyDictionary;
}

- (BOOL)_isDeallocating
{
  int cd_rc;

  cd_rc = self->_cd_rc;
  if (cd_rc == -2)
  {
    LOBYTE(self) = 1;
  }
  else if (cd_rc <= -3)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(self) = cd_rc & 1;
  }
  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_subentitiesIncludes:(id)a3
{
  uint64_t v5;
  NSMutableDictionary *subentities;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *flattenedSubentities;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3 == self)
  {
LABEL_14:
    LOBYTE(v5) = 1;
    return v5;
  }
  v5 = -[NSMutableDictionary count](self->_subentities, "count");
  if (v5)
  {
    if (-[NSEntityDescription _isEditable](self, "_isEditable"))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      subentities = self->_subentities;
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](subentities, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
      {
        v7 = v5;
        v8 = *(_QWORD *)v14;
LABEL_6:
        v9 = 0;
        while (1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(subentities);
          v10 = (id)-[NSMutableDictionary objectForKey:](self->_subentities, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
          if (v10 == a3 || (objc_msgSend(v10, "_subentitiesIncludes:", a3) & 1) != 0)
            goto LABEL_14;
          if (v7 == ++v9)
          {
            v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](subentities, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
            LOBYTE(v5) = 0;
            if (v7)
              goto LABEL_6;
            return v5;
          }
        }
      }
    }
    else
    {
      flattenedSubentities = self->_flattenedSubentities;
      if (!flattenedSubentities)
      {
        flattenedSubentities = -[NSEntityDescription _collectSubentities](self);
        self->_flattenedSubentities = flattenedSubentities;
      }
      LOBYTE(v5) = CFSetContainsValue((CFSetRef)flattenedSubentities, a3) != 0;
    }
  }
  return v5;
}

- (void)_setProperties:(char)a3 preserveIndices:
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "_throwIfNotEditable");
    if ((a3 & 1) == 0)
    {
      if ((*(_BYTE *)(a1 + 120) & 4) != 0)
      {
        v7 = *(_QWORD *)(a1 + 72);
      }
      else
      {
        v6 = (void *)a1;
        do
        {
          v7 = (uint64_t)v6;
          v6 = (void *)objc_msgSend(v6, "superentity");
        }
        while (v6);
      }
      -[NSEntityDescription _dropIndexes](v7);
    }
    if ((+[_PFRoutines _doNameAndTypeCheck:]((uint64_t)_PFRoutines, a2) & 1) == 0)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid property passed to setProperties: property has nil name or is an NSExpressionDescription."), 0));
    v8 = objc_msgSend(*(id *)(a1 + 96), "count");
    v9 = v8;
    if (v8 <= 1)
      v10 = 1;
    else
      v10 = v8;
    if (v8 >= 0x201)
      v11 = 1;
    else
      v11 = v10;
    v12 = (char *)v22 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v8 > 0x200)
      v12 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v22 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v10);
    objc_msgSend(*(id *)(a1 + 96), "getObjects:andKeys:count:", v12, 0, v9);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v12, v9);
    v14 = objc_msgSend(v13, "count");
    if (v14)
    {
      v15 = v14;
      for (i = 0; i != v15; ++i)
      {
        v17 = (void *)objc_msgSend(v13, "objectAtIndex:", i);
        if (objc_msgSend(a2, "indexOfObjectIdenticalTo:", v17) == 0x7FFFFFFFFFFFFFFFLL)
          -[NSEntityDescription _removeProperty:](a1, v17);
      }
    }
    v18 = objc_msgSend(a2, "count");
    if (v18)
    {
      v19 = v18;
      for (j = 0; j != v19; ++j)
      {
        v21 = objc_msgSend(a2, "objectAtIndex:", j);
        if (objc_msgSend(v13, "indexOfObjectIdenticalTo:", v21) == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend((id)a1, "_addProperty:", v21);
      }
    }
    if (v9 >= 0x201)
      NSZoneFree(0, v12);

  }
}

- (void)_flattenProperties
{
  NSEntityDescription *v3;
  NSEntityDescription *v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSManagedObjectModel *model;
  _NSPropertyDescriptionProxy *v21;
  Class Class;
  _NSPropertyDescriptionProxy *v23;
  NSEntityDescription *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!self || (*(_BYTE *)&self->_entityDescriptionFlags & 8) == 0)
  {
    v3 = -[NSEntityDescription superentity](self, "superentity");
    if (!v3)
      goto LABEL_23;
    v4 = v3;
    -[NSEntityDescription _flattenProperties](v3, "_flattenProperties");
    v5 = -[NSEntityDescription propertiesByName](v4, "propertiesByName");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v6)
    {
      v7 = v6;
      v24 = v4;
      v8 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v11 = -[NSDictionary objectForKey:](v5, "objectForKey:", v10);
          v12 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", v10);
          if (v12)
          {
            v13 = v12;
            if ((objc_msgSend(v12, "isEqual:", v11) & 1) == 0)
            {
              if ((objc_msgSend(v13, "_isEqualWithoutIndex:", v11) & 1) == 0)
                objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Property named '%@' in entity '%@' conflicts with property inherited from parent entity '%@'"), objc_msgSend(v13, "name"), -[NSEntityDescription name](self, "name"), -[NSEntityDescription name](v24, "name")), 0));
              _NSCoreDataLog(2, (uint64_t)CFSTR("Subentity has an index on parent property: %@"), v14, v15, v16, v17, v18, v19, v10);
            }
          }
          else
          {
            model = self->_model;
            if (model && (*(_BYTE *)&model->_managedObjectModelFlags & 4) != 0)
            {
              Class = object_getClass(v11);
              if (Class == (Class)objc_opt_class())
                v11 = (id)objc_msgSend(v11, "_underlyingProperty");
              v21 = -[_NSPropertyDescriptionProxy initWithPropertyDescription:]([_NSPropertyDescriptionProxy alloc], "initWithPropertyDescription:", v11);
            }
            else
            {
              v21 = (_NSPropertyDescriptionProxy *)objc_msgSend(v11, "copyWithZone:", 0);
            }
            v23 = v21;
            -[NSEntityDescription _addProperty:](self, "_addProperty:", v21);

          }
        }
        v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v7);
    }
    else
    {
LABEL_23:
      if (!self)
        return;
    }
    -[NSEntityDescription _throwIfNotEditable](self, "_throwIfNotEditable");
    *(_DWORD *)&self->_entityDescriptionFlags |= 8u;
  }
}

- (void)_addProperty:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSEntityDescription *v8;
  NSEntityDescription *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;

  -[NSEntityDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (!a3)
    return;
  v5 = objc_msgSend(a3, "name");
  if (!v5)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = CFSTR("Can't add unnamed property to entity.");
    goto LABEL_13;
  }
  v6 = v5;
  if (-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", v5))
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99768];
    v18 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entity already contains a property named %@."), v6);
    v16 = v19;
    v17 = v20;
    goto LABEL_13;
  }
  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = CFSTR("Can't add NSExpressionDescriptions to NSEntityDescriptions");
LABEL_13:
    objc_exception_throw((id)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v18, 0));
  }
  v8 = (NSEntityDescription *)objc_msgSend(a3, "entity");
  if (v8)
  {
    v9 = v8;
    if (v8 != self)
    {
      objc_msgSend(a3, "name");
      -[NSEntityDescription name](self, "name");
      -[NSEntityDescription name](v9, "name");
      _NSCoreDataLog(1, (uint64_t)CFSTR("tried to add property %p '%@' to entity %p '%@' but it already belongs to entity %p '%@'"), v10, v11, v12, v13, v14, v15, (uint64_t)a3);
      a3 = (id)objc_msgSend(a3, "copy");
    }
  }
  -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", a3, v6);
  objc_msgSend(a3, "_setEntityAndMaintainIndices:", self);
}

- (void)_throwIfNotEditable
{
  if ((*(_BYTE *)&self->_entityDescriptionFlags & 4) != 0)
    -[NSManagedObjectModel _throwIfNotEditable](-[NSEntityDescription managedObjectModel](self, "managedObjectModel"), "_throwIfNotEditable");
}

- (void)_commonCachesAndOptimizedState
{
  void *v2;
  void *v3;
  Class Class;
  Class v5;
  id AssociatedObject;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)objc_msgSend(a1, "managedObjectClassName");
    if (v2)
    {
      v3 = v2;
      if ((objc_msgSend(v2, "isEqualToString:", CFSTR("NSManagedObject")) & 1) == 0)
      {
        Class = objc_getClass((const char *)objc_msgSend(v3, "UTF8String"));
        if (Class)
        {
          v5 = Class;
          AssociatedObject = objc_getAssociatedObject(Class, PFEntityDescriptionAssociationKey);
          if (AssociatedObject)
          {
            v7 = AssociatedObject;
            v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v20 = 0u;
            v21 = 0u;
            v22 = 0u;
            v23 = 0u;
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
            if (v9)
            {
              v10 = v9;
              v11 = *(_QWORD *)v21;
              do
              {
                v12 = 0;
                do
                {
                  if (*(_QWORD *)v21 != v11)
                    objc_enumerationMutation(v7);
                  v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
                  if (v13)
                  {
                    WeakRetained = objc_loadWeakRetained((id *)(v13 + 8));
                    if (WeakRetained)
                    {
                      v15 = WeakRetained;
                      if (WeakRetained != a1)
                        objc_msgSend(v8, "addObject:", v13);

                    }
                  }
                  ++v12;
                }
                while (v10 != v12);
                v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
              }
              while (v10);
            }
            objc_msgSend(v8, "addObject:", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)a1));
          }
          else
          {
            v24 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)a1);
            v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
          }
          objc_setAssociatedObject(v5, PFEntityDescriptionAssociationKey, v8, (void *)0x303);
          v16 = objc_getAssociatedObject(v5, &PFEntityNameAssociationKey);
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", objc_msgSend(a1, "name"));
          if (v16)
          {
            v18 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v16);
            objc_msgSend(v18, "addObject:", v17);
            v19 = (void *)objc_msgSend(v18, "allObjects");
          }
          else
          {
            v19 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v17);
          }
          objc_setAssociatedObject(v5, &PFEntityNameAssociationKey, v19, (void *)0x303);

        }
      }
    }
  }
}

- (NSString)managedObjectClassName
{
  if (self->_classNameForEntity)
    return self->_classNameForEntity;
  else
    return (NSString *)CFSTR("NSManagedObject");
}

- (void)release
{
  int *p_cd_rc;
  int v3;
  unsigned int v4;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 - 2, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    if ((v3 & 0x80000000) == 0)
    {
      while (1)
      {
        v4 = __ldaxr((unsigned int *)p_cd_rc);
        if (v4 != -2)
          break;
        if (!__stlxr(1u, (unsigned int *)p_cd_rc))
        {
          -[NSEntityDescription dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
    }
    __break(1u);
  }
}

- (uint64_t)_dropIndexes
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (result && byte_1ECD8DE1C)
  {
    v1 = (_QWORD *)result;
    v2 = *(_QWORD *)(result + 128);
    if (v2)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v3 = *(void **)(v2 + 40);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v17 != v6)
              objc_enumerationMutation(v3);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "_setEntity:", 0);
          }
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v5);
      }

      *(_QWORD *)(v1[16] + 40) = 0;
    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = (void *)objc_msgSend(v1, "subentities", 0);
    result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    if (result)
    {
      v9 = result;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          -[NSEntityDescription _dropIndexes](*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
        v9 = result;
      }
      while (result);
    }
  }
  return result;
}

- (_QWORD)knownKeysMappingStrategy
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    if (objc_msgSend((id)objc_msgSend(result, "managedObjectModel"), "isEditable"))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Model must be immutable before mapping strategy can be created"), 0));
    return (_QWORD *)v1[13];
  }
  return result;
}

- (_QWORD)_setManagedObjectModel:(_QWORD *)result
{
  _QWORD *v3;
  uint64_t v4;

  if (result)
  {
    v3 = result;
    result = (_QWORD *)objc_msgSend(result, "_throwIfNotEditable");
    v4 = v3[5];
    if (v4 != a2)
    {
      if (a2)
      {
        if (v4)
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't use an entity in two models."), 0));
      }
      v3[5] = a2;
    }
  }
  return result;
}

- (id)_new_implicitlyObservedKeys
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void **v10;
  void *v11;
  void *v12;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)objc_msgSend(a1, "_propertySearchMapping");
    v3 = (void *)objc_msgSend(v1, "propertiesByName");
    v4 = objc_msgSend(v1, "_propertyRangesByType");
    v5 = objc_msgSend(v2, "keys");
    v6 = objc_msgSend(v3, "values");
    v1 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = *(_QWORD *)(v4 + 32);
    v8 = *(_QWORD *)(v4 + 40);
    if (v7 < v8 + v7)
    {
      v9 = (_QWORD *)(v5 + 8 * v7);
      v10 = (void **)(v6 + 8 * v7);
      do
      {
        v11 = *v10;
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", *v9);
        if (objc_msgSend(v11, "inverseRelationship") || (objc_msgSend(v11, "isOrdered") & 1) == 0)
          objc_msgSend(v1, "addObject:", *v9);

        ++v9;
        ++v10;
        --v8;
      }
      while (v8);
    }
  }
  return v1;
}

- (void)_leopardStyleAttributesByName
{
  _QWORD *v3;
  NSMutableDictionary *properties;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __CFString *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = _PF_Leopard_CFDictionaryCreate();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  properties = self->_properties;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(properties);
        v9 = *(__CFString **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", v9);
        if (objc_msgSend(v10, "_isAttribute"))
          _PF_Leopard_CFDictionarySetValue(v3, v9, v10);
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  return v3;
}

- (void)_leopardStyleRelationshipsByName
{
  _QWORD *v3;
  NSMutableDictionary *properties;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __CFString *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = _PF_Leopard_CFDictionaryCreate();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  properties = self->_properties;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(properties);
        v9 = *(__CFString **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", v9);
        if (objc_msgSend(v10, "_propertyType") == 4)
          _PF_Leopard_CFDictionarySetValue(v3, v9, v10);
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  return v3;
}

- (NSEntityDescription)initWithCoder:(id)a3
{
  NSEntityDescription *v5;
  _QWORD *v6;
  const char *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  uint64_t v17;
  void *v18;
  char isKindOfClass;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  _ExtraEntityIVars *extraIvars;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  void *v69;
  const char *v70;
  void *v71;
  void *v72;
  const char *v73;
  void *v74;
  void *v75;
  id obj;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[2];
  void (*v90)(uint64_t, const char *);
  void *v91;
  _QWORD *v92;
  uint64_t v93;
  objc_super v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  objc_opt_class();
  v94.receiver = self;
  v94.super_class = (Class)NSEntityDescription;
  v5 = -[NSEntityDescription init](&v94, sel_init);
  if (v5)
  {
    v6 = +[PFModelDecoderContext retainedContext](PFModelDecoderContext, "retainedContext");
    v8 = v6;
    if (v6)
    {
      v9 = v6[2];
      objc_setProperty_nonatomic(v6, v7, v5, 16);
    }
    else
    {
      v9 = 0;
    }
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v90 = __37__NSEntityDescription_initWithCoder___block_invoke;
    v91 = &unk_1E1EDD430;
    v92 = v8;
    v93 = v9;
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0), CFSTR("NSVersionHashModifier"));
    v5->_versionHashModifier = v12;
    if (v12 && (-[NSString isNSString](v12, "isNSString") & 1) == 0)
    {
      v15 = &unk_1E1F4A480;
    }
    else
    {
      v13 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSManagedObjectModel"));
      v5->_model = (NSManagedObjectModel *)v13;
      if (v8)
        v14 = v8[1];
      else
        v14 = 0;
      if (v13 == v14)
      {
        v16 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSClassNameForEntity"));
        v5->_classNameForEntity = v16;
        if (v16 && !-[NSString isNSString](v16, "isNSString"))
        {
          v15 = &unk_1E1F4A4D0;
        }
        else
        {
          v5->_name = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSEntityName"));
          v17 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSSuperentity"));
          v5->_superentity = (NSEntityDescription *)v17;
          if (!v17)
            goto LABEL_24;
          if (v8)
            v18 = (void *)v8[3];
          else
            v18 = 0;
          objc_msgSend(v18, "addObject:", v17);
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0)
            v20 = 4866;
          else
            v20 = 4864;
          if ((isKindOfClass & 1) != 0)
            v15 = &unk_1E1F4A520;
          else
            v15 = &unk_1E1F4A4F8;
          if (v8 == 0 || (isKindOfClass & 1) == 0)
            goto LABEL_76;
          if (v8[1])
          {
LABEL_24:
            v21 = (void *)MEMORY[0x1E0C99E60];
            v22 = objc_opt_class();
            v23 = objc_opt_class();
            v24 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0), CFSTR("NSSubentities"));
            v25 = v24;
            if (v24 && (objc_msgSend(v24, "isNSDictionary") & 1) == 0)
            {
              objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, &unk_1E1F4A548));

            }
            else
            {
              v5->_subentities = (NSMutableDictionary *)v25;
              v26 = (void *)MEMORY[0x1E0C99E60];
              v27 = objc_opt_class();
              v28 = objc_opt_class();
              v29 = objc_opt_class();
              v30 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v26, "setWithObjects:", v27, v28, v29, objc_opt_class(), 0), CFSTR("NSProperties"));
              if ((objc_msgSend(v30, "isNSDictionary") & 1) != 0)
              {
                v31 = v30;
                v5->_properties = v31;
                v85 = 0u;
                v86 = 0u;
                v87 = 0u;
                v88 = 0u;
                v32 = (void *)-[NSMutableDictionary allKeys](v31, "allKeys");
                v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
                if (v33)
                {
                  v34 = *(_QWORD *)v86;
                  v75 = &unk_1E1F4A598;
                  obj = v32;
                  while (2)
                  {
                    for (i = 0; i != v33; ++i)
                    {
                      if (*(_QWORD *)v86 != v34)
                        objc_enumerationMutation(obj);
                      v36 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
                      v37 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v5->_properties, "objectForKeyedSubscript:", v36);
                      if (!objc_msgSend(v36, "isNSString"))
                        goto LABEL_81;
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                        goto LABEL_81;
                      if ((NSEntityDescription *)objc_msgSend(v37, "entity") != v5)
                      {
                        v75 = &unk_1E1F4A5C0;
LABEL_81:
                        objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, v75));

                        goto LABEL_77;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        v38 = v37;
                      else
                        v38 = 0;
                      v39 = (void *)objc_msgSend(v38, "inverseRelationship");
                      if (v39 && (NSEntityDescription *)objc_msgSend(v39, "entity") != v5 && (!v8 || !v8[1]))
                      {
                        objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4A5E8));

                        goto LABEL_77;
                      }
                    }
                    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
                    if (v33)
                      continue;
                    break;
                  }
                }
                v5->_entityDescriptionFlags = (__entityDescriptionFlags)(*(_DWORD *)&v5->_entityDescriptionFlags & 0xFFFF788A | objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSIsAbstract")));
                v5->_userInfo = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[_PFRoutines plistClassesForSecureCoding](), CFSTR("NSUserInfo"));
                v40 = (void *)MEMORY[0x1E0C99E60];
                v41 = objc_opt_class();
                v42 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0), CFSTR("NSRenamingIdentifier"));
                v43 = v42;
                if (!v42 || (objc_msgSend(v42, "isNSString") & 1) != 0)
                {
                  -[NSEntityDescription setRenamingIdentifier:](v5, "setRenamingIdentifier:", v43);
                  v44 = (void *)MEMORY[0x1E0C99E60];
                  v45 = objc_opt_class();
                  v46 = objc_opt_class();
                  -[NSEntityDescription setCompoundIndexes:](v5, "setCompoundIndexes:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v44, "setWithObjects:", v45, v46, objc_opt_class(), 0), CFSTR("NSCompoundIndexes")));
                  v47 = (void *)MEMORY[0x1E0C99E60];
                  v48 = objc_opt_class();
                  v49 = objc_opt_class();
                  v50 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v47, "setWithObjects:", v48, v49, objc_opt_class(), 0), CFSTR("NSUniqueTuples"));
                  v51 = v50;
                  if (v50)
                  {
                    v83 = 0u;
                    v84 = 0u;
                    v81 = 0u;
                    v82 = 0u;
                    v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
                    if (v52)
                    {
                      v53 = 0;
                      v54 = *(_QWORD *)v82;
                      do
                      {
                        for (j = 0; j != v52; ++j)
                        {
                          if (*(_QWORD *)v82 != v54)
                            objc_enumerationMutation(v51);
                          v53 += objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * j), "count");
                        }
                        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
                      }
                      while (v52);
                      if (v53)
                        -[NSEntityDescription _setUniquenessConstraints:]((uint64_t)v5, v51);
                    }
                  }
                  v56 = (void *)MEMORY[0x1E0C99E60];
                  v57 = objc_opt_class();
                  v58 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0), CFSTR("NSCoreSpotlightDisplayName"));
                  if (v58)
                  {
                    v59 = v58;
                    extraIvars = v5->_extraIvars;
                    if (!extraIvars)
                    {
                      -[NSEntityDescription _initializeExtraIVars]((uint64_t)v5);
                      extraIvars = v5->_extraIvars;
                    }
                    extraIvars->var4 = v59;
                  }
                  v61 = (void *)MEMORY[0x1E0C99E60];
                  v62 = objc_opt_class();
                  v63 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v61, "setWithObjects:", v62, objc_opt_class(), 0), CFSTR("NSFetchIndexDescriptions"));
                  v64 = v63;
                  if (v63)
                  {
                    if ((objc_msgSend(v63, "isNSArray") & 1) == 0)
                    {
                      objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4A638));

                      goto LABEL_77;
                    }
                    v79 = 0u;
                    v80 = 0u;
                    v77 = 0u;
                    v78 = 0u;
                    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
                    if (v65)
                    {
                      v66 = *(_QWORD *)v78;
                      while (2)
                      {
                        for (k = 0; k != v65; ++k)
                        {
                          if (*(_QWORD *)v78 != v66)
                            objc_enumerationMutation(v64);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4A660));

                            goto LABEL_77;
                          }
                        }
                        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
                        if (v65)
                          continue;
                        break;
                      }
                    }
                    -[NSEntityDescription _setIndexes:]((uint64_t)v5, v64);
                  }
                  else
                  {
                    v69 = (void *)-[NSMutableDictionary objectForKey:](v5->_userInfo, "objectForKey:", CFSTR("NSFetchIndexDescriptions"));
                    if (v69)
                    {
                      v70 = (const char *)objc_msgSend(v69, "UTF8String");
                      v71 = (void *)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v70, strlen(v70)), 0, 0);
                      if (v71)
                        -[NSEntityDescription _setIndexesFromJSONObject:supplemental:]((uint64_t)v5, v71, 0);
                    }
                  }
                  v72 = (void *)-[NSMutableDictionary objectForKey:](v5->_userInfo, "objectForKey:", CFSTR("NSSupplementalIndexes"));
                  if (v72)
                  {
                    v73 = (const char *)objc_msgSend(v72, "UTF8String");
                    v74 = (void *)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v73, strlen(v73)), 0, 0);
                    if (v74)
                      -[NSEntityDescription _setIndexesFromJSONObject:supplemental:]((uint64_t)v5, v74, 1);
                  }
                  v5->_propertyMapping = 0;
                  v5->_propertyRanges = 0;
                  v5->_flattenedSubentities = 0;
                  v5->_kvcPropertyAccessors = 0;
                  v5->_modelsReferenceIDForEntity = -1;
                  goto LABEL_78;
                }
                objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4A610));

              }
              else
              {
                objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, &unk_1E1F4A570));

              }
            }
LABEL_77:
            v5 = 0;
LABEL_78:
            ((void (*)(_QWORD *))v90)(v89);
            return v5;
          }
          v15 = &unk_1E1F4A520;
        }
      }
      else
      {
        v15 = &unk_1E1F4A4A8;
      }
    }
    v20 = 4866;
LABEL_76:
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], v20, v15));

    goto LABEL_77;
  }
  return v5;
}

- (void)setRenamingIdentifier:(NSString *)renamingIdentifier
{
  _ExtraEntityIVars *extraIvars;
  uint64_t v6;
  _ExtraEntityIVars *v7;

  if (!renamingIdentifier
    || -[NSString isNSString](renamingIdentifier, "isNSString")
    && -[NSString isEqualToString:](-[NSEntityDescription name](self, "name"), "isEqualToString:", renamingIdentifier))
  {
    extraIvars = self->_extraIvars;
    if (extraIvars)
    {

      self->_extraIvars->var0 = 0;
    }
  }
  else
  {
    v6 = -[NSString copy](renamingIdentifier, "copy");
    v7 = self->_extraIvars;
    if (!v7)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      v7 = self->_extraIvars;
    }
    v7->var0 = (id)v6;
  }
}

void __37__NSEntityDescription_initWithCoder___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_nonatomic(v3, a2, *(id *)(a1 + 40), 16);
    v3 = *(void **)(a1 + 32);
  }

}

- (void)_setUniquenessConstraints:(uint64_t)a1
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  __CFString **v49;
  const __CFString **v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id obj;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __CFString *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  const __CFString *v82;
  id v83;
  _BYTE v84[128];
  const __CFString *v85;
  uint64_t v86;
  const __CFString *v87;
  uint64_t v88;
  const __CFString *v89;
  __CFString *v90;
  const __CFString *v91;
  __CFString *v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (_QWORD *)a1;
    v3 = *(_QWORD *)(a1 + 128);
    if (!v3)
    {
      v4 = a2;
      -[NSEntityDescription _initializeExtraIVars](a1);
      a2 = v4;
      v3 = v2[16];
    }
    if (*(void **)(v3 + 24) != a2)
    {
      v54 = v3;
      obj = a2;
      v56 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a2, "count"));
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
      if (!v58)
        goto LABEL_71;
      v57 = *(_QWORD *)v79;
      v61 = v2;
      while (1)
      {
        for (i = 0; i != v58; ++i)
        {
          if (*(_QWORD *)v79 != v57)
            objc_enumerationMutation(obj);
          v64 = *(id *)(*((_QWORD *)&v78 + 1) + 8 * i);
          if (!objc_msgSend(v64, "count"))
            continue;
          v59 = i;
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v64, "count"));
          objc_msgSend(v56, "addObject:", v6);
          v65 = v6;

          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v7 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v74, v94, 16);
          if (!v7)
            goto LABEL_56;
          v8 = v7;
          v9 = *(_QWORD *)v75;
          v62 = *(_QWORD *)v75;
          do
          {
            v10 = 0;
            v63 = v8;
            do
            {
              if (*(_QWORD *)v75 != v9)
                objc_enumerationMutation(v64);
              v11 = *(__CFString **)(*((_QWORD *)&v74 + 1) + 8 * v10);
              if (-[__CFString isNSString](v11, "isNSString"))
              {
                v12 = (void *)-[__CFString componentsSeparatedByString:](v11, "componentsSeparatedByString:", CFSTR("."));
                v60 = v11;
                if ((unint64_t)objc_msgSend(v12, "count") < 2)
                {
                  v13 = (__CFString *)objc_msgSend((id)objc_msgSend(v2, "propertiesByName"), "objectForKey:", v11);
                }
                else
                {
                  v13 = (__CFString *)objc_msgSend((id)objc_msgSend(v2, "propertiesByName"), "objectForKey:", objc_msgSend(v12, "objectAtIndex:", 0));
                  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
                  {
                    v14 = 1;
                    do
                    {
                      v15 = (void *)objc_msgSend(v12, "objectAtIndex:", v14);
                      v70 = 0u;
                      v71 = 0u;
                      v72 = 0u;
                      v73 = 0u;
                      v16 = (void *)-[__CFString elements](v13, "elements");
                      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v70, v93, 16);
                      if (v17)
                      {
                        v18 = v17;
                        v19 = *(_QWORD *)v71;
                        while (2)
                        {
                          for (j = 0; j != v18; ++j)
                          {
                            if (*(_QWORD *)v71 != v19)
                              objc_enumerationMutation(v16);
                            v21 = *(__CFString **)(*((_QWORD *)&v70 + 1) + 8 * j);
                            if ((objc_msgSend(v15, "isEqualToString:", -[__CFString name](v21, "name")) & 1) != 0)
                            {
                              v13 = v21;
                              goto LABEL_30;
                            }
                          }
                          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v70, v93, 16);
                          if (v18)
                            continue;
                          break;
                        }
                      }
LABEL_30:
                      ++v14;
                    }
                    while (objc_msgSend(v12, "count") > v14);
                  }
                }
                v2 = v61;
                v9 = v62;
                v8 = v63;
                if (!v13)
                {
                  v45 = (void *)MEMORY[0x1E0C99DA0];
                  v46 = *MEMORY[0x1E0C99778];
                  v47 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find property named %@"), v60);
                  v91 = CFSTR("Property name");
                  v92 = v60;
                  v48 = (void *)MEMORY[0x1E0C99D80];
                  v49 = &v92;
                  v50 = &v91;
LABEL_75:
                  v41 = objc_msgSend(v48, "dictionaryWithObjects:forKeys:count:", v49, v50, 1);
                  v43 = v45;
                  v44 = v46;
                  v42 = (const __CFString *)v47;
LABEL_76:
                  objc_exception_throw((id)objc_msgSend(v43, "exceptionWithName:reason:userInfo:", v44, v42, v41));
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!objc_msgSend((id)objc_msgSend(v2, "propertiesByName"), "objectForKey:", -[__CFString name](v11, "name")))
                  {
                    v23 = -[__CFString name](v11, "name");
                    objc_msgSend(v2, "name");
                    _NSCoreDataLog(1, (uint64_t)CFSTR("Can't find property description '%@' %@ while setting unique constraints on entity '%@'"), v24, v25, v26, v27, v28, v29, v23);
                  }
LABEL_42:
                  v13 = v11;
                  goto LABEL_43;
                }
                if (v11)
                {
                  if (-[__CFString superCompositeAttribute](v11, "superCompositeAttribute"))
                  {
                    v22 = -[NSPropertyDescription _rootName](v11);
                    if (!-[NSEntityDescription _attributeNamed:]((uint64_t)v2, (uint64_t)v22))
                    {
                      v45 = (void *)MEMORY[0x1E0C99DA0];
                      v46 = *MEMORY[0x1E0C99778];
                      v47 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find property named %@"), v11);
                      v89 = CFSTR("Property name");
                      v90 = v11;
                      v48 = (void *)MEMORY[0x1E0C99D80];
                      v49 = &v90;
                      v50 = &v89;
                      goto LABEL_75;
                    }
                  }
                  goto LABEL_42;
                }
                v13 = 0;
              }
LABEL_43:
              if (-[__CFString _propertyType](v13, "_propertyType") == 4)
              {
                if (-[__CFString isToMany](v13, "isToMany"))
                {
                  v39 = (void *)MEMORY[0x1E0C99DA0];
                  v40 = *MEMORY[0x1E0C99778];
                  v87 = CFSTR("Property name");
                  v88 = -[__CFString name](v13, "name");
                  v41 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
                  v42 = CFSTR("Cannot create unique constraints for to-many relationships.");
LABEL_74:
                  v43 = v39;
                  v44 = v40;
                  goto LABEL_76;
                }
              }
              else if (-[__CFString _propertyType](v13, "_propertyType") != 2)
              {
                v39 = (void *)MEMORY[0x1E0C99DA0];
                v40 = *MEMORY[0x1E0C99778];
                v85 = CFSTR("Property name");
                v86 = -[__CFString name](v13, "name");
                v41 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
                v42 = CFSTR("Property type is not valid for unique constraints.");
                goto LABEL_74;
              }
              if (-[__CFString _propertyType](v13, "_propertyType") == 2
                && v13
                && -[__CFString superCompositeAttribute](v13, "superCompositeAttribute"))
              {
                v30 = -[__CFString _qualifiedName](v13, "_qualifiedName");
              }
              else
              {
                v30 = -[__CFString name](v13, "name");
              }
              objc_msgSend(v65, "addObject:", v30);
              ++v10;
            }
            while (v10 != v8);
            v31 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v74, v94, 16);
            v8 = v31;
          }
          while (v31);
LABEL_56:
          v32 = (void *)v2[10];
          i = v59;
          if (v32)
          {
            v33 = (void *)objc_msgSend(v32, "propertiesByName");
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            v69 = 0u;
            v34 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
            if (v34)
            {
              v35 = v34;
              v36 = 0;
              v37 = *(_QWORD *)v67;
              do
              {
                for (k = 0; k != v35; ++k)
                {
                  if (*(_QWORD *)v67 != v37)
                    objc_enumerationMutation(v65);
                  if (objc_msgSend(v33, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k)))
                    ++v36;
                }
                v35 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
              }
              while (v35);
            }
            else
            {
              v36 = 0;
            }
            if (v36 == objc_msgSend(v65, "count"))
            {
              v51 = (void *)MEMORY[0x1E0C99DA0];
              v52 = *MEMORY[0x1E0C99778];
              v53 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Uniqueness constraints must be defined at the highest level possible. All properties in constraint %@ are defined on parent entity."), v65);
              v82 = CFSTR("Problem constraint");
              v83 = v64;
              v41 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
              v43 = v51;
              v44 = v52;
              v42 = (const __CFString *)v53;
              goto LABEL_76;
            }
          }
        }
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
        if (!v58)
        {
LABEL_71:

          *(_QWORD *)(v54 + 24) = v56;
          return;
        }
      }
    }
  }
}

- (NSDictionary)relationshipsByName
{
  _QWORD v3[5];

  if (self->_propertyRanges)
    return (NSDictionary *)*((_QWORD *)self->_kvcPropertyAccessors + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__NSEntityDescription__NSInternalMethods___propertiesOfType___block_invoke;
  v3[3] = &__block_descriptor_40_e31_B16__0__NSPropertyDescription_8l;
  v3[4] = 4;
  return (NSDictionary *)-[NSEntityDescription _propertiesMatchingBlock:]((uint64_t)self, (uint64_t)v3);
}

- (BOOL)_tryRetain
{
  int *p_cd_rc;
  uint64_t v3;
  BOOL v4;
  BOOL result;
  unsigned int v6;

  p_cd_rc = &self->_cd_rc;
  while (1)
  {
    v3 = *p_cd_rc;
    v4 = (v3 & 1) != 0 || v3 == 4294967294;
    result = !v4;
    if (v4)
      break;
    if ((int)v3 <= -3)
    {
      __break(1u);
      return result;
    }
    while (1)
    {
      v6 = __ldaxr((unsigned int *)p_cd_rc);
      if (v6 != (_DWORD)v3)
        break;
      if (!__stlxr(v3 + 2, (unsigned int *)p_cd_rc))
        return result;
    }
    __clrex();
  }
  return result;
}

- (unint64_t)hash
{
  return -[NSString hash](-[NSEntityDescription name](self, "name"), "hash");
}

- (NSData)versionHash
{
  return (NSData *)-[NSEntityDescription _versionHashInStyle:]((unint64_t *)self, 0);
}

- (uint64_t)_newVersionHashInStyle:(uint64_t)result
{
  uint64_t v3;
  __CFString *v4;
  const char *CStringPtr;
  CC_LONG v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const __CFString *v13;
  const char *v14;
  CC_LONG v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  __CFString *v27;
  const char *v28;
  CC_LONG v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char data;
  CC_SHA256_CTX c;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  unsigned __int8 v47[32];
  unsigned __int8 md[32];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  memset(&c, 0, sizeof(c));
  v4 = *(__CFString **)(result + 64);
  if (!v4)
    goto LABEL_5;
  CStringPtr = CFStringGetCStringPtr(v4, 0x8000100u);
  if (!CStringPtr)
  {
    v4 = *(__CFString **)(v3 + 64);
LABEL_5:
    CStringPtr = (const char *)-[__CFString UTF8String](v4, "UTF8String");
  }
  data = objc_msgSend((id)v3, "isAbstract");
  CC_SHA256_Init(&c);
  if (CStringPtr)
  {
    v6 = strlen(CStringPtr);
    CC_SHA256_Update(&c, CStringPtr, v6);
  }
  CC_SHA256_Update(&c, &data, 1u);
  if (objc_msgSend((id)v3, "superentity"))
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v3, "superentity"), "versionHash"), "getBytes:length:", v47, 32);
    CC_SHA256_Update(&c, v47, 0x20u);
  }
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)v3, "properties"), "sortedArrayUsingFunction:context:", _comparePropertiesByName, 0);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
        }
        if ((objc_msgSend(v12, "isTransient") & 1) == 0)
        {
          objc_msgSend(v12, "_versionHash:inStyle:", v47, a2);
          CC_SHA256_Update(&c, v47, 0x20u);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v9);
  }
  v13 = *(const __CFString **)(v3 + 24);
  if (v13)
  {
    v14 = CFStringGetCStringPtr(v13, 0x8000100u);
    if (!v14)
      v14 = (const char *)objc_msgSend(*(id *)(v3 + 24), "UTF8String");
    v15 = strlen(v14);
    CC_SHA256_Update(&c, v14, v15);
  }
  v16 = *(_QWORD *)(v3 + 128);
  if (v16 && *(_QWORD *)(v16 + 24))
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v18 = *(void **)(*(_QWORD *)(v3 + 128) + 24);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "componentsJoinedByString:", CFSTR(".")));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
      }
      while (v20);
    }
    objc_msgSend(v17, "sortUsingDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1)));
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v17);
          v27 = *(__CFString **)(*((_QWORD *)&v30 + 1) + 8 * k);
          if (-[__CFString length](v27, "length"))
          {
            v28 = CFStringGetCStringPtr(v27, 0x8000100u);
            if (!v28)
              v28 = (const char *)-[__CFString UTF8String](v27, "UTF8String");
            v29 = strlen(v28);
            CC_SHA256_Update(&c, v28, v29);
          }
        }
        v24 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
      }
      while (v24);
    }

  }
  CC_SHA256_Final(md, &c);
  return objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);
}

- (BOOL)isAbstract
{
  return *(_DWORD *)&self->_entityDescriptionFlags & 1;
}

- (void)_addIndexForProperty:(uint64_t)a1
{
  uint64_t v4;
  NSFetchIndexElementDescription *v5;
  NSFetchIndexDescription *v6;
  uint64_t v7;
  NSFetchIndexDescription *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 128);
    if (!v4)
    {
      -[NSEntityDescription _initializeExtraIVars](a1);
      v4 = *(_QWORD *)(a1 + 128);
    }
    if (!*(_QWORD *)(v4 + 40))
      *(_QWORD *)(v4 + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = -[NSFetchIndexElementDescription initWithProperty:collationType:]([NSFetchIndexElementDescription alloc], "initWithProperty:collationType:", a2, 0);
    v6 = [NSFetchIndexDescription alloc];
    v7 = objc_msgSend(a2, "name");
    v9[0] = v5;
    v8 = -[NSFetchIndexDescription initWithName:elements:](v6, "initWithName:elements:", v7, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1));

    objc_msgSend(*(id *)(v4 + 40), "addObject:", v8);
  }
}

- (void)_initializeExtraIVars
{
  malloc_zone_t *v2;
  void *v3;
  void *v4;
  unint64_t *v5;
  malloc_zone_t *v7;

  v2 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone)
    v2 = malloc_default_zone();
  v3 = malloc_type_zone_calloc(v2, 1uLL, 0x40uLL, 0x108004080E465BEuLL);
  v4 = v3;
  v5 = (unint64_t *)(a1 + 128);
  while (!__ldaxr(v5))
  {
    if (!__stlxr((unint64_t)v3, v5))
    {
      *(_DWORD *)(*v5 + 48) = 0;
      return;
    }
  }
  __clrex();
  v7 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone)
    v7 = malloc_default_zone();
  malloc_zone_free(v7, v4);
}

- (id)_initWithName:(id)a3
{
  NSEntityDescription *v4;
  NSEntityDescription *v5;
  uint64_t v6;
  NSMutableDictionary *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSEntityDescription;
  v4 = -[NSEntityDescription init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_model = 0;
    v4->_classNameForEntity = 0;
    v4->_instanceClass = 0;
    v6 = objc_msgSend(a3, "copy");
    v5->_rootentity = 0;
    v5->_superentity = 0;
    v5->_name = (NSString *)v6;
    v5->_subentities = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_propertyMapping = 0;
    v5->_propertyRanges = 0;
    v5->_properties = v7;
    *(_DWORD *)&v5->_entityDescriptionFlags &= 0xFFFFF988;
    v5->_userInfo = 0;
    v5->_flattenedSubentities = 0;
    v5->_kvcPropertyAccessors = 0;
    v5->_modelsReferenceIDForEntity = -1;
    v5->_versionHashModifier = 0;
    v5->_versionHash = 0;
    v5->_snapshotClass = 0;
  }
  return v5;
}

- (NSEntityDescription)init
{
  objc_opt_class();
  objc_opt_class();
  return (NSEntityDescription *)-[NSEntityDescription _initWithName:](self, "_initWithName:", 0);
}

- (void)_setIndexes:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 128);
  if (!v4)
  {
    -[NSEntityDescription _initializeExtraIVars](a1);
    v4 = *(_QWORD *)(a1 + 128);
  }
  v5 = *(void **)(v4 + 40);
  if (v5)
  {
    v6 = -[NSEntityDescription _propertiesOnlySubsetFromIndexes:](a1, v5);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(a2);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v11, "_setEntity:", a1);
          objc_msgSend(v6, "addObject:", v11);
        }
        v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v8);
    }

  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(a2);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "_setEntity:", a1);
        }
        v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v13);
    }
    v6 = (id)objc_msgSend(a2, "mutableCopy");
  }
  *(_QWORD *)(v4 + 40) = v6;
}

- (void)setCompoundIndexes:(NSArray *)compoundIndexes
{
  NSEntityDescription *v3;
  _ExtraEntityIVars *extraIvars;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  NSExpressionDescription *v13;
  NSFetchIndexElementDescription *v14;
  NSExpressionDescription *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSFetchIndexDescription *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _ExtraEntityIVars *v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
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
  _BYTE v63[128];
  _BYTE v64[128];
  const __CFString *v65;
  void *v66;
  _BYTE v67[128];
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v3 = self;
  v74 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    extraIvars = self->_extraIvars;
    if (!extraIvars)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      extraIvars = v3->_extraIvars;
    }
  }
  else
  {
    extraIvars = 0;
  }
  v34 = extraIvars;
  v42 = -[NSEntityDescription _propertiesOnlySubsetFromIndexes:]((uint64_t)v3, extraIvars->var5);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v38 = -[NSArray countByEnumeratingWithState:objects:count:](compoundIndexes, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v60;
    v40 = (uint64_t)v3;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v60 != v37)
          objc_enumerationMutation(compoundIndexes);
        v6 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v5);
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
        v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v39 = v5;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v56;
          v10 = 1;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v56 != v9)
                objc_enumerationMutation(v6);
              v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
              if ((v10 & 1) == 0)
                objc_msgSend(v7, "appendString:", CFSTR("_"));
              if (!objc_msgSend(v12, "isNSString", v34))
              {
                if ((unint64_t)objc_msgSend(v6, "count") <= 1
                  && (-[NSEntityDescription _hasIndexForProperty:](v40, v12) & 1) != 0)
                {
                  goto LABEL_44;
                }
                if (objc_msgSend(v12, "_propertyType") == 7 || objc_msgSend(v12, "superCompositeAttribute"))
                {
                  v28 = (void *)MEMORY[0x1E0C99DA0];
                  v65 = CFSTR("Property");
                  v66 = v12;
                  v29 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
                  objc_exception_throw((id)objc_msgSend(v28, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Composite property type is unsupported."), v29));
                }
                v14 = (NSFetchIndexElementDescription *)-[NSFetchIndexElementDescription initWithPropertyName:property:collationType:ascending:]([NSFetchIndexElementDescription alloc], (void *)objc_msgSend(v12, "name"), v12, 0, 1);
                objc_msgSend(v7, "appendString:", -[NSFetchIndexElementDescription propertyName](v14, "propertyName"));
                goto LABEL_42;
              }
              if (objc_msgSend(CFSTR("self"), "isEqualToString:", objc_msgSend(v12, "lowercaseString")))
              {
                objc_msgSend(v7, "appendString:", CFSTR("self"));
                v13 = objc_alloc_init(NSExpressionDescription);
                -[NSPropertyDescription setName:](v13, "setName:", CFSTR("self"));
                -[NSExpressionDescription setExpression:](v13, "setExpression:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject"));
                -[NSExpressionDescription setExpressionResultType:](v13, "setExpressionResultType:", 2000);
                v14 = -[NSFetchIndexElementDescription initWithProperty:collationType:]([NSFetchIndexElementDescription alloc], "initWithProperty:collationType:", v13, 0);

                goto LABEL_42;
              }
              if (objc_msgSend(CFSTR("entity"), "isEqualToString:", objc_msgSend(v12, "lowercaseString")))
              {
                objc_msgSend(v7, "appendString:", CFSTR("entity"));
                v15 = objc_alloc_init(NSExpressionDescription);
                -[NSPropertyDescription setName:](v15, "setName:", CFSTR("entity"));
                -[NSExpressionDescription setExpression:](v15, "setExpression:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("entity")));
                -[NSExpressionDescription setExpressionResultType:](v15, "setExpressionResultType:", 0);
                v14 = -[NSFetchIndexElementDescription initWithProperty:collationType:]([NSFetchIndexElementDescription alloc], "initWithProperty:collationType:", v15, 0);

                goto LABEL_42;
              }
              if (objc_msgSend(v12, "containsString:", CFSTR(".")))
              {
                if (objc_msgSend((id)objc_msgSend(*(id *)(v40 + 96), "objectForKey:", objc_msgSend((id)objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(".")), "firstObject")), "_propertyType") == 7)
                {
                  v30 = (void *)MEMORY[0x1E0C99DA0];
                  v70 = CFSTR("Property");
                  v71 = v12;
                  v31 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
                  objc_exception_throw((id)objc_msgSend(v30, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Composite property type is unsupported."), v31));
                }
              }
              else
              {
                if (objc_msgSend(v6, "count") != 1)
                  goto LABEL_41;
                if (objc_msgSend((id)objc_msgSend(*(id *)(v40 + 96), "objectForKey:", v12), "_propertyType") == 7)
                {
                  v32 = (void *)MEMORY[0x1E0C99DA0];
                  v68 = CFSTR("Property");
                  v69 = v12;
                  v33 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
                  objc_exception_throw((id)objc_msgSend(v32, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Composite property type is unsupported."), v33));
                }
                v53 = 0u;
                v54 = 0u;
                v51 = 0u;
                v52 = 0u;
                v16 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
                if (!v16)
                {
LABEL_41:
                  v14 = (NSFetchIndexElementDescription *)-[NSFetchIndexElementDescription initWithPropertyName:property:collationType:ascending:]([NSFetchIndexElementDescription alloc], v12, 0, 0, 1);
                  objc_msgSend(v7, "appendString:", v12);
LABEL_42:
                  if (v14)
                  {
                    objc_msgSend(v41, "addObject:", v14);

                  }
                  goto LABEL_44;
                }
                v17 = *(_QWORD *)v52;
LABEL_33:
                v18 = 0;
                while (1)
                {
                  if (*(_QWORD *)v52 != v17)
                    objc_enumerationMutation(v42);
                  v19 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v18), "elements"), "firstObject");
                  if (objc_msgSend(v12, "isEqual:", objc_msgSend(v19, "propertyName")))
                  {
                    if (!objc_msgSend(v19, "collationType") && (objc_msgSend(v19, "isAscending") & 1) != 0)
                      break;
                  }
                  if (v16 == ++v18)
                  {
                    v16 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
                    if (v16)
                      goto LABEL_33;
                    goto LABEL_41;
                  }
                }
              }
LABEL_44:
              v10 = 0;
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
            v10 = 0;
          }
          while (v8);
        }
        v3 = (NSEntityDescription *)v40;
        if (objc_msgSend(v41, "count", v34))
        {
          v20 = -[NSFetchIndexDescription initWithName:elements:]([NSFetchIndexDescription alloc], "initWithName:elements:", v7, v41);
          objc_msgSend(v42, "addObject:", v20);

        }
        v5 = v39 + 1;
      }
      while (v39 + 1 != v38);
      v38 = -[NSArray countByEnumeratingWithState:objects:count:](compoundIndexes, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
    }
    while (v38);
  }
  if (objc_msgSend(v42, "count", v34))
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v21 = *(void **)(v35 + 40);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v48 != v23)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "_setEntity:", 0);
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
      }
      while (v22);
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v25 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v44;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v44 != v26)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * k), "_setEntity:", v3);
        }
        v25 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
      }
      while (v25);
    }

    *(_QWORD *)(v35 + 40) = v42;
  }
  else
  {

    *(_QWORD *)(v35 + 40) = 0;
  }
}

- (uint64_t)_finalizeIndexes
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 128);
    if (v2)
    {
      v3 = *(void **)(v2 + 40);
      if (v3)
      {
        v9 = 0u;
        v10 = 0u;
        v7 = 0u;
        v8 = 0u;
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (result)
        {
          v4 = result;
          v5 = *(_QWORD *)v8;
          do
          {
            v6 = 0;
            do
            {
              if (*(_QWORD *)v8 != v5)
                objc_enumerationMutation(v3);
              objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_setEntity:", v1);
            }
            while (v4 != v6);
            result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
            v4 = result;
          }
          while (result);
        }
      }
    }
  }
  return result;
}

- (void)setProperties:(NSArray *)properties
{
  -[NSEntityDescription _setProperties:preserveIndices:]((uint64_t)self, properties, 0);
}

- (void)setName:(NSString *)name
{
  NSManagedObjectModel *v5;
  NSEntityDescription *v6;

  -[NSEntityDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self->_name != name)
  {
    v5 = -[NSEntityDescription managedObjectModel](self, "managedObjectModel");
    v6 = -[NSEntityDescription superentity](self, "superentity");
    if (v5 && -[NSMutableDictionary objectForKey:](v5->_entities, "objectForKey:", name)
      || v6
      && -[NSDictionary objectForKey:](-[NSEntityDescription subentitiesByName](v6, "subentitiesByName"), "objectForKey:", name))
    {
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't change name of entity from %@ to %@"), self->_name, name), 0));
    }
    -[NSEntityDescription _removeSubentity:]((uint64_t)v6, self);
    -[NSManagedObjectModel _removeEntity:]((uint64_t)v5, self);

    self->_name = (NSString *)-[NSString copy](name, "copy");
    -[NSManagedObjectModel _addEntity:](v5, "_addEntity:", self);
    -[NSEntityDescription _addSubentity:](v6, "_addSubentity:", self);
  }
}

- (void)_addFactoryToRetainList:(id)a3
{
  _ExtraEntityIVars *extraIvars;
  id var1;

  if (self)
  {
    extraIvars = self->_extraIvars;
    if (!extraIvars)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      extraIvars = self->_extraIvars;
    }
  }
  else
  {
    extraIvars = 0;
  }
  os_unfair_lock_lock_with_options();
  var1 = extraIvars->var1;
  if (!var1)
  {
    var1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    extraIvars->var1 = var1;
  }
  objc_msgSend(var1, "addObject:", a3);
  os_unfair_lock_unlock(&extraIvars->var6);
}

- (void)dealloc
{
  _ExtraEntityIVars *extraIvars;
  _ExtraEntityIVars *v4;
  _ExtraEntityIVars *v5;
  _ExtraEntityIVars *v6;
  _ExtraEntityIVars *v7;
  _ExtraEntityIVars *v8;
  _ExtraEntityIVars *v9;
  malloc_zone_t *v10;
  Class instanceClass;
  id snapshotClass;
  id propertyMapping;
  uint64_t v14;
  unint64_t v15;
  _NSRange *propertyRanges;
  malloc_zone_t *v17;
  uint64_t i;
  id *v19;
  uint64_t v20;
  unsigned int v21;
  id v22;
  malloc_zone_t *v24;
  malloc_zone_t *v25;
  objc_super v26;

  extraIvars = self->_extraIvars;
  if (extraIvars)
  {

    v4 = self->_extraIvars;
    v4->var0 = 0;

    v5 = self->_extraIvars;
    v5->var2 = 0;

    v6 = self->_extraIvars;
    v6->var3 = 0;

    v7 = self->_extraIvars;
    v7->var4 = 0;

    v8 = self->_extraIvars;
    v8->var5 = 0;
    if (v8->var1)
    {
      os_unfair_lock_lock_with_options();

      v9 = self->_extraIvars;
      v9->var1 = 0;
      os_unfair_lock_unlock(&v9->var6);
    }
    if ((*(_BYTE *)&self->_entityDescriptionFlags & 0x80) == 0)
    {
      v10 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone)
        v10 = malloc_default_zone();
      malloc_zone_free(v10, self->_extraIvars);
    }
    self->_extraIvars = 0;
  }
  instanceClass = self->_instanceClass;
  if (instanceClass)
  {
    -[objc_class _entityDeallocated](instanceClass, "_entityDeallocated");

    self->_instanceClass = 0;
  }
  snapshotClass = self->_snapshotClass;
  if (snapshotClass)
  {
    objc_msgSend(snapshotClass, "_entityDeallocated");

    self->_snapshotClass = 0;
  }
  propertyMapping = self->_propertyMapping;
  if (propertyMapping)
    v14 = objc_msgSend(propertyMapping, "length");
  else
    v14 = objc_msgSend((id)-[NSMutableDictionary allKeys](self->_properties, "allKeys"), "count");
  v15 = v14;
  propertyRanges = self->_propertyRanges;
  if (propertyRanges && (*(_BYTE *)&self->_entityDescriptionFlags & 0x80) == 0)
  {
    v17 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
    {
      v17 = malloc_default_zone();
      propertyRanges = self->_propertyRanges;
    }
    malloc_zone_free(v17, propertyRanges);
  }

  self->_model = 0;
  self->_classNameForEntity = 0;

  self->_properties = 0;
  self->_propertyMapping = 0;

  self->_name = 0;
  self->_superentity = 0;

  self->_subentities = 0;
  self->_userInfo = 0;

  self->_flattenedSubentities = 0;
  if (self->_kvcPropertyAccessors)
  {
    for (i = 0; i != 6; ++i)
    {
      v19 = self->_kvcPropertyAccessors[i];
      if (v19)
      {
        if (i != 4 && v15)
        {
          v20 = 0;
          v21 = 1;
          do
          {
            v22 = v19[v20];
            if (v22)

            v20 = v21;
          }
          while (v15 > v21++);
        }
        v24 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
        if (!_PF_Private_Malloc_Zone)
          v24 = malloc_default_zone();
        malloc_zone_free(v24, v19);
      }
    }

    PF_FREE_OBJECT_ARRAY(*((void **)self->_kvcPropertyAccessors + 9));
    v25 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v25 = malloc_default_zone();
    malloc_zone_free(v25, self->_kvcPropertyAccessors);
  }

  self->_versionHash = 0;
  self->_versionHashModifier = 0;
  v26.receiver = self;
  v26.super_class = (Class)NSEntityDescription;
  -[NSEntityDescription dealloc](&v26, sel_dealloc);
}

- (id)_relationshipNamed:(_QWORD *)a1
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *i;
  void *v12;
  void *v13;
  id v14;

  if (!a1)
    return 0;
  if (a1[14])
  {
    v4 = objc_msgSend((id)objc_msgSend(a1, "_propertySearchMapping"), "indexForKey:", a2);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = v4;
      v6 = a1[14];
      v7 = *(_QWORD *)(v6 + 32);
      v8 = *(_QWORD *)(v6 + 40);
      v9 = objc_msgSend((id)objc_msgSend(a1, "propertiesByName"), "values");
      if (v5 >= v7 && v5 - v7 < v8)
        return *(id *)(v9 + 8 * v5);
    }
    return 0;
  }
  v14 = (id)objc_msgSend(a1, "_localRelationshipNamed:", a2);
  if (!v14)
  {
    for (i = a1; ; i = v14)
    {
      v12 = (void *)objc_msgSend(i, "superentity");
      v14 = v12;
      if (!v12)
        break;
      v13 = (void *)objc_msgSend(v12, "_localRelationshipNamed:", a2);
      if (v13)
      {
        v14 = (id)objc_msgSend(v13, "copy");
        objc_msgSend(v14, "_setEntity:", a1);
        return v14;
      }
    }
  }
  return v14;
}

- (id)_localRelationshipNamed:(id)a3
{
  void *v3;

  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", a3);
  if (objc_msgSend(v3, "_propertyType") == 4)
    return v3;
  else
    return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  unsigned int v5;
  id v6;
  NSMutableDictionary *subentities;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  NSMutableDictionary *properties;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  _ExtraEntityIVars *extraIvars;
  id var3;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t m;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    *(_QWORD *)(v4 + 64) = -[NSString copy](self->_name, "copy");
    *(_QWORD *)(v4 + 48) = -[NSString copy](self->_classNameForEntity, "copy");
    v5 = *(_DWORD *)(v4 + 120) & 0xFFFFF9FA | *(_DWORD *)&self->_entityDescriptionFlags & 1;
    *(_DWORD *)(v4 + 120) = v5;
    *(_DWORD *)(v4 + 120) = v5 & 0xFFFFFF8F | *(_DWORD *)&self->_entityDescriptionFlags & 0x10;
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    subentities = self->_subentities;
    v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](subentities, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v48 != v10)
            objc_enumerationMutation(subentities);
          v12 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_subentities, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i)), "copy");
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](subentities, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      }
      while (v9);
    }
    -[NSEntityDescription _setSubentities:preserveIndices:](v4, v6, 1);

    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    properties = self->_properties;
    v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(properties);
          v19 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j)), "copy");
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v16);
    }
    -[NSEntityDescription _setProperties:preserveIndices:](v4, v13, 1);

    *(_QWORD *)(v4 + 136) = -[NSMutableDictionary copy](self->_userInfo, "copy");
    *(_QWORD *)(v4 + 24) = -[NSString copy](self->_versionHashModifier, "copy");
    *(_QWORD *)(v4 + 32) = 0;
    *(_QWORD *)(v4 + 160) = -1;
    objc_msgSend((id)v4, "setRenamingIdentifier:", -[NSEntityDescription renamingIdentifier](self, "renamingIdentifier"));
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v21 = -[NSEntityDescription indexes](self, "indexes");
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v21);
          v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "copy");
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      }
      while (v23);
      -[NSEntityDescription _setIndexes:](v4, v20);
      if (!self)
        goto LABEL_38;
    }
    else
    {
      -[NSEntityDescription _setIndexes:](v4, v20);
    }
    extraIvars = self->_extraIvars;
    if (extraIvars && (var3 = extraIvars->var3) != 0 || (var3 = (id)NSArray_EmptyArray) != 0)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v29 = objc_msgSend(var3, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
      if (v29)
      {
        v30 = v29;
        v31 = 0;
        v32 = *(_QWORD *)v36;
        do
        {
          for (m = 0; m != v30; ++m)
          {
            if (*(_QWORD *)v36 != v32)
              objc_enumerationMutation(var3);
            v31 += objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * m), "count");
          }
          v30 = objc_msgSend(var3, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
        }
        while (v30);
        if (v31)
          objc_msgSend((id)v4, "setUniquenessConstraints:", var3);
      }
    }
LABEL_38:
    objc_msgSend((id)v4, "setCoreSpotlightDisplayNameExpression:", -[NSEntityDescription coreSpotlightDisplayNameExpression](self, "coreSpotlightDisplayNameExpression"));
  }
  return (id)v4;
}

- (NSExpression)coreSpotlightDisplayNameExpression
{
  _ExtraEntityIVars *extraIvars;

  extraIvars = self->_extraIvars;
  if (extraIvars && (extraIvars = (_ExtraEntityIVars *)extraIvars->var4) == 0)
    return -[NSEntityDescription coreSpotlightDisplayNameExpression](self->_superentity, "coreSpotlightDisplayNameExpression");
  else
    return (NSExpression *)extraIvars;
}

- (void)setCoreSpotlightDisplayNameExpression:(NSExpression *)coreSpotlightDisplayNameExpression
{
  _ExtraEntityIVars *extraIvars;
  NSExpression *v6;

  -[NSEntityDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self)
  {
    extraIvars = self->_extraIvars;
    if (!extraIvars)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      extraIvars = self->_extraIvars;
    }
  }
  else
  {
    extraIvars = 0;
  }
  if (extraIvars->var4 != coreSpotlightDisplayNameExpression)
  {
    v6 = coreSpotlightDisplayNameExpression;

    extraIvars->var4 = coreSpotlightDisplayNameExpression;
  }
}

- (NSString)renamingIdentifier
{
  _ExtraEntityIVars *extraIvars;
  NSString *var0;

  extraIvars = self->_extraIvars;
  if (extraIvars && (var0 = (NSString *)extraIvars->var0) != 0)
    return var0;
  else
    return -[NSEntityDescription name](self, "name");
}

- (void)_setSubentities:(char)a3 preserveIndices:
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "_throwIfNotEditable");
    if ((a3 & 1) == 0)
    {
      if ((*(_BYTE *)(a1 + 120) & 4) != 0)
      {
        v7 = *(_QWORD *)(a1 + 72);
      }
      else
      {
        v6 = (void *)a1;
        do
        {
          v7 = (uint64_t)v6;
          v6 = (void *)objc_msgSend(v6, "superentity");
        }
        while (v6);
      }
      -[NSEntityDescription _dropIndexes](v7);
    }
    if ((+[_PFRoutines _doNameAndTypeCheck:]((uint64_t)_PFRoutines, a2) & 1) == 0)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't add a subentity to an entity (missing name or bad properties)."), 0));
    v8 = objc_msgSend(*(id *)(a1 + 88), "count");
    v9 = v8;
    if (v8 <= 1)
      v10 = 1;
    else
      v10 = v8;
    if (v8 >= 0x201)
      v11 = 1;
    else
      v11 = v10;
    v12 = (char *)v22 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v8 > 0x200)
      v12 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v22 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v10);
    objc_msgSend(*(id *)(a1 + 88), "getObjects:andKeys:count:", v12, 0, v9);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v12, v9);
    v14 = objc_msgSend(v13, "count");
    if (v14)
    {
      v15 = v14;
      for (i = 0; i != v15; ++i)
      {
        v17 = (void *)objc_msgSend(v13, "objectAtIndex:", i);
        if (objc_msgSend(a2, "indexOfObjectIdenticalTo:", v17) == 0x7FFFFFFFFFFFFFFFLL)
          -[NSEntityDescription _removeSubentity:](a1, v17);
      }
    }
    v18 = objc_msgSend(a2, "count");
    if (v18)
    {
      v19 = v18;
      for (j = 0; j != v19; ++j)
      {
        v21 = objc_msgSend(a2, "objectAtIndex:", j);
        if (objc_msgSend(v13, "indexOfObjectIdenticalTo:", v21) == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend((id)a1, "_addSubentity:", v21);
      }
    }
    if (v9 >= 0x201)
      NSZoneFree(0, v12);

  }
}

- (BOOL)isEqual:(id)a3
{
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSString *v9;
  uint64_t v10;
  NSData *v11;
  uint64_t v12;
  NSDictionary *v13;
  uint64_t v14;
  NSExpression *v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;

  if (a3 == self)
    goto LABEL_30;
  if (!a3)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  v5 = -[NSEntityDescription name](self, "name");
  v6 = objc_msgSend(a3, "name");
  if (v5 == (NSString *)v6
    || (v7 = v6, LOBYTE(v6) = 0, v5) && v7 && (LODWORD(v6) = -[NSString isEqual:](v5, "isEqual:"), (_DWORD)v6))
  {
    v8 = -[NSEntityDescription isAbstract](self, "isAbstract");
    if (v8 != objc_msgSend(a3, "isAbstract"))
    {
LABEL_9:
      LOBYTE(v6) = 0;
      return v6;
    }
    v9 = -[NSEntityDescription managedObjectClassName](self, "managedObjectClassName");
    v6 = objc_msgSend(a3, "managedObjectClassName");
    if (v9 == (NSString *)v6
      || (v10 = v6, LOBYTE(v6) = 0, v9) && v10 && (LODWORD(v6) = -[NSString isEqual:](v9, "isEqual:"), (_DWORD)v6))
    {
      v11 = -[NSEntityDescription versionHash](self, "versionHash");
      v6 = objc_msgSend(a3, "versionHash");
      if (v11 == (NSData *)v6
        || (v12 = v6, LOBYTE(v6) = 0, v11) && v12 && (LODWORD(v6) = -[NSData isEqual:](v11, "isEqual:"), (_DWORD)v6))
      {
        v13 = -[NSEntityDescription userInfo](self, "userInfo");
        v6 = objc_msgSend(a3, "userInfo");
        if (v13 == (NSDictionary *)v6
          || (v14 = v6, LOBYTE(v6) = 0, v13)
          && v14
          && (LODWORD(v6) = -[NSDictionary isEqual:](v13, "isEqual:"), (_DWORD)v6))
        {
          v15 = -[NSEntityDescription coreSpotlightDisplayNameExpression](self, "coreSpotlightDisplayNameExpression");
          v6 = objc_msgSend(a3, "coreSpotlightDisplayNameExpression");
          if (v15 == (NSExpression *)v6
            || (v16 = v6, LOBYTE(v6) = 0, v15)
            && v16
            && (LODWORD(v6) = -[NSExpression isEqual:](v15, "isEqual:"), (_DWORD)v6))
          {
            v17 = -[NSEntityDescription indexes](self, "indexes");
            v6 = objc_msgSend(a3, "indexes");
            if (v17 != (NSArray *)v6)
            {
              v18 = v6;
              LOBYTE(v6) = 0;
              if (v17 && v18)
                LOBYTE(v6) = -[NSArray isEqual:](v17, "isEqual:");
              return v6;
            }
LABEL_30:
            LOBYTE(v6) = 1;
          }
        }
      }
    }
  }
  return v6;
}

- (BOOL)_skipValidation
{
  return (*(_BYTE *)&self->_entityDescriptionFlags >> 4) & 1;
}

- (void)setUniquenessConstraints:(NSArray *)uniquenessConstraints
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[NSEntityDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](uniquenessConstraints, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(uniquenessConstraints);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "count");
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](uniquenessConstraints, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
    if (v7)
    {
      v10 = -[NSEntityDescription _checkForNonCascadeNoInverses](self);
      if (v10)
      {
        v11 = v10;
        -[NSEntityDescription name](self, "name");
        objc_msgSend(v11, "name");
        objc_msgSend((id)objc_msgSend(v11, "inverseRelationship"), "name");
        objc_msgSend(v11, "name");
        _NSCoreDataLog(1, (uint64_t)CFSTR("Cannot merge uniqueness constraints { %@ } on entity '%@' due to relationship '%@' having a mandatory to-one inverse relationship '%@' and not using a cascade delete rule on '%@'"), v12, v13, v14, v15, v16, v17, (uint64_t)uniquenessConstraints);
      }
    }
  }
  -[NSEntityDescription _setUniquenessConstraints:]((uint64_t)self, uniquenessConstraints);
}

- (void)_checkForNonCascadeNoInverses
{
  __CFSet *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = -[NSEntityDescription _collectSubentities](a1);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = -[__CFSet countByEnumeratingWithState:objects:count:](v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
LABEL_4:
    v4 = 0;
    while (1)
    {
      if (*(_QWORD *)v8 != v3)
        objc_enumerationMutation(v1);
      v5 = -[NSEntityDescription _checkSelfForNonCascadeNoInverses](*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v4));
      if (v5)
        break;
      if (v2 == ++v4)
      {
        v2 = -[__CFSet countByEnumeratingWithState:objects:count:](v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (v2)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v5 = 0;
  }

  return v5;
}

- (void)_checkSelfForNonCascadeNoInverses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(void **)(a1 + 96);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = *(_QWORD *)v12;
LABEL_4:
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v5)
      objc_enumerationMutation(v2);
    v7 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6));
    if (objc_msgSend(v7, "_isRelationship"))
    {
      if (objc_msgSend(v7, "deleteRule") != 2)
      {
        v8 = (void *)objc_msgSend(v7, "inverseRelationship");
        if (v8)
        {
          v9 = v8;
          if ((objc_msgSend(v8, "isToMany") & 1) == 0 && !objc_msgSend(v9, "isOptional"))
            return v7;
        }
      }
    }
    if (v4 == ++v6)
    {
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        goto LABEL_4;
      return 0;
    }
  }
}

- (unint64_t)_keypathsToPrefetchForDeletePropagation
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  id v6;
  void *v7;
  id v9;

  do
  {
    if (!a1)
      return 0;
    v1 = (_QWORD *)a1;
    v2 = *(_QWORD *)(a1 + 128);
    if (!v2)
    {
      -[NSEntityDescription _initializeExtraIVars](a1);
      v2 = v1[16];
    }
    a1 = objc_msgSend(v1, "superentity");
  }
  while (a1);
  v5 = *(_QWORD *)(v2 + 16);
  v4 = (unint64_t *)(v2 + 16);
  v3 = v5;
  __dmb(0xBu);
  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v7 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSEntityDescription _keypathsToPrefetchForDeletePropagationPrefixedWith:toDepth:processedEntities:](v1, 0, 1, (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set")), "allObjects"), "copy");
    while (!__ldaxr(v4))
    {
      if (!__stlxr((unint64_t)v7, v4))
        goto LABEL_11;
    }
    __clrex();

LABEL_11:
    v3 = *v4;
    objc_msgSend(v6, "drain");
    v9 = 0;
  }
  return v3;
}

- (uint64_t)_keypathsToPrefetchForDeletePropagationPrefixedWith:(uint64_t)a3 toDepth:(void *)a4 processedEntities:
{
  void *v4;
  void *v7;
  int v8;
  id v9;
  id v10;
  id v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  id v32;
  void *v33;
  uint64_t v35;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = a4;
  v7 = a1;
  v8 = objc_msgSend(a4, "containsObject:", objc_msgSend(a1, "name"));
  if (a3 < 0 || v8)
    return NSSet_EmptySet;
  v39 = a2;
  v37 = a3;
  v38 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v9, "addObject:", v7);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  while (1)
  {
    objc_msgSend(v10, "addObjectsFromArray:", objc_msgSend(v7, "subentities"));
    if (!objc_msgSend(v10, "count"))
      break;
    v7 = (void *)objc_msgSend(v10, "lastObject");
    objc_msgSend(v10, "removeLastObject");
    objc_msgSend(v9, "addObject:", v7);
  }

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v9;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v12)
  {
    v13 = v12;
    v41 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        v15 = v4;
        if (*(_QWORD *)v51 != v41)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v17 = (void *)objc_msgSend(v16, "relationshipsByName");
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v47 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(v11, "setObject:forKey:", objc_msgSend(v17, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j)), *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          }
          while (v19);
        }
        v4 = v15;
        objc_msgSend(v15, "addObject:", objc_msgSend(v16, "name"));
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v13);
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v22 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v43;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v43 != v24)
          objc_enumerationMutation(v11);
        v26 = (void *)objc_msgSend(v11, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v25));
        v27 = objc_msgSend(v26, "deleteRule");
        v28 = objc_msgSend(v26, "inverseRelationship");
        if (v27)
          v29 = v27 == 3;
        else
          v29 = 1;
        if (!v29)
        {
          v30 = v28;
          if (v27 != 1 || v28 != 0)
          {
            if (v39)
              v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), v39, objc_msgSend(v26, "name"));
            else
              v32 = (id)objc_msgSend(v26, "name");
            v33 = v32;
            if (v27 != 1 || v30 == 0)
            {
              if (v27 == 2)
              {
                objc_msgSend(v38, "addObject:", v32);
                if (v37 >= 1)
                  objc_msgSend(v38, "unionSet:", -[NSEntityDescription _keypathsToPrefetchForDeletePropagationPrefixedWith:toDepth:processedEntities:](objc_msgSend(v26, "destinationEntity"), v33, v37 - 1, v4));
              }
            }
            else
            {
              objc_msgSend(v38, "addObject:", v32);
            }

          }
        }
        ++v25;
      }
      while (v23 != v25);
      v35 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      v23 = v35;
    }
    while (v35);
  }

  return (uint64_t)v38;
}

- (uint64_t)_constraintIsExtension:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 128);
    if (v4)
    {
      v5 = *(void **)(v4 + 24);
      if (v5)
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v16;
          v14 = v3;
          while (2)
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v16 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
              v11 = objc_msgSend(v10, "count");
              if (objc_msgSend(a2, "count") > v11)
              {
                if (v11)
                {
                  v12 = 0;
                  v13 = 0;
                  do
                  {
                    v13 += objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v12), "isEqual:", objc_msgSend(a2, "objectAtIndex:", v12));
                    ++v12;
                  }
                  while (v11 != v12);
                }
                else
                {
                  v13 = 0;
                }
                if (v13 == v11)
                  return 1;
              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
            v3 = v14;
            if (v7)
              continue;
            break;
          }
        }
      }
    }
    result = *(_QWORD *)(v3 + 80);
    if (result)
      return -[NSEntityDescription _constraintIsExtension:](result, a2);
  }
  return result;
}

- (uint64_t)_removeProperty:(uint64_t)result
{
  id *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (result)
  {
    v3 = (id *)result;
    if (objc_msgSend(a2, "entity") != result)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't remove property '%@' - doesn't belong to this entity."), objc_msgSend(a2, "name")), 0));
    result = objc_msgSend(a2, "name");
    if (result)
    {
      v4 = result;
      result = objc_msgSend(v3[12], "objectForKey:", result);
      if (result)
      {
        v5 = (void *)result;
        objc_msgSend(v3, "_throwIfNotEditable");
        v6 = v5;
        objc_msgSend(v3[12], "removeObjectForKey:", v4);
        return objc_msgSend(v5, "_setEntityAndMaintainIndices:", 0);
      }
    }
  }
  return result;
}

- (void)_propertiesMatchingBlock:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((*(_BYTE *)(a1 + 120) & 8) == 0)
  {
    v5 = (void *)objc_msgSend((id)a1, "superentity");
    if (v5)
    {
      v6 = (void *)objc_msgSend(v5, "propertiesByName");
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v27 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
            v12 = (void *)objc_msgSend(v6, "objectForKey:", v11);
            if ((*(unsigned int (**)(uint64_t, void *))(a2 + 16))(a2, v12))
            {
              v13 = (void *)objc_msgSend(v12, "copy");
              objc_msgSend(v13, "_setEntity:", a1);
              objc_msgSend(v4, "setObject:forKey:", v13, v11);

            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v8);
      }
    }
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = *(void **)(a1 + 96);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        v20 = objc_msgSend(*(id *)(a1 + 96), "objectForKey:", v19);
        if ((*(unsigned int (**)(uint64_t, uint64_t))(a2 + 16))(a2, v20))
          objc_msgSend(v4, "setObject:forKey:", v20, v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }
  return v4;
}

uint64_t __39__NSEntityDescription_attributesByName__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isAttribute");
}

- (NSDictionary)attributesByName
{
  if (self->_propertyRanges)
    return (NSDictionary *)*((_QWORD *)self->_kvcPropertyAccessors + 7);
  else
    return (NSDictionary *)-[NSEntityDescription _propertiesMatchingBlock:]((uint64_t)self, (uint64_t)&__block_literal_global_7);
}

+ (NSManagedObject)insertNewObjectForEntityForName:(NSString *)entityName inManagedObjectContext:(NSManagedObjectContext *)context
{
  unint64_t *v6;

  v6 = (unint64_t *)objc_msgSend(a1, "entityForName:inManagedObjectContext:");
  if (!v6)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+entityForName: could not locate an entity named '%@' in this model."), entityName), 0));
  return (NSManagedObject *)(id)objc_msgSend((id)objc_msgSend(_PFFastEntityClass(v6), "allocWithEntity:", v6), "initWithEntity:insertIntoManagedObjectContext:", v6, context);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  NSDictionary *v9;
  uint64_t v10;
  NSArray *v11;

  if (!a3->var1)
  {
    v9 = -[NSEntityDescription propertiesByName](self, "propertiesByName");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = -[NSDictionary allValues](v9, "allValues");
      a3->var3[3] = 0;
      a3->var3[4] = v10;
    }
  }
  v11 = (NSArray *)a3->var3[4];
  if (!v11)
    return -[NSMutableDictionary _valueCountByEnumeratingWithState:objects:count:](self->_properties, "_valueCountByEnumeratingWithState:objects:count:", a3, a4, a5);
  if (!a3->var3[3])
    v11 = -[NSDictionary allValues](-[NSEntityDescription propertiesByName](self, "propertiesByName"), "allValues");
  return -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (BOOL)performPostDecodeValidationInModel:(id)a3 error:(id *)a4
{
  NSMutableDictionary *properties;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFSet *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id *v19;
  id *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id *v26;
  const __CFAllocator *v27;
  CFStringRef (__cdecl *v28)(const void *);
  __int128 v29;
  CFIndex v30;
  CFSetCallBacks callBacks;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  properties = self->_properties;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    v30 = *MEMORY[0x1E0C9B3B0];
    v29 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 8);
    v28 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3B0] + 24);
    v26 = a4;
    v27 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v25 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(properties);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x18D76B4E4]();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = (void *)objc_msgSend(v11, "destinationEntity");
          v14 = objc_msgSend(v13, "name");
          if (v13
            && (!v14
             || (void *)objc_msgSend((id)objc_msgSend(a3, "entitiesByName"), "objectForKeyedSubscript:", v14) != v13))
          {
            v21 = v26;
            if (v26)
            {
              v22 = (void *)MEMORY[0x1E0CB35C8];
              v23 = *MEMORY[0x1E0CB28A8];
              v24 = &unk_1E1F4A688;
LABEL_28:
              *v21 = (id)objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 4866, v24);
            }
LABEL_29:
            objc_autoreleasePoolPop(v12);
            return 0;
          }
          callBacks.version = v30;
          *(_OWORD *)&callBacks.retain = v29;
          callBacks.copyDescription = v28;
          callBacks.equal = 0;
          callBacks.hash = 0;
          v15 = CFSetCreateMutable(v27, 0, &callBacks);
          v16 = objc_msgSend(v11, "inverseRelationship");
          if (v16)
          {
            v17 = (void *)v16;
            while ((-[__CFSet containsObject:](v15, "containsObject:", v17) & 1) == 0)
            {
              v18 = objc_msgSend(v17, "entity");
              if (!v18
                || (v19 = (id *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                || !objc_msgSend(v17, "name")
                || (void *)objc_msgSend(v19[12], "objectForKeyedSubscript:", objc_msgSend(v17, "name")) != v17
                || !objc_msgSend(v19, "name")
                || (id *)objc_msgSend((id)objc_msgSend(a3, "entitiesByName"), "objectForKeyedSubscript:", objc_msgSend(v19, "name")) != v19)
              {
                v21 = v26;
                if (!v26)
                  goto LABEL_29;
                v22 = (void *)MEMORY[0x1E0CB35C8];
                v23 = *MEMORY[0x1E0CB28A8];
                v24 = &unk_1E1F4A6B0;
                goto LABEL_28;
              }
              -[__CFSet addObject:](v15, "addObject:", v17);
              v17 = (void *)objc_msgSend(v17, "inverseRelationship");
              if (!v17)
                break;
            }
          }
          v9 = v25;
        }
        objc_autoreleasePoolPop(v12);
      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      a4 = v26;
      if (v8)
        continue;
      break;
    }
  }
  if (a4)
    *a4 = 0;
  return 1;
}

+ (void)initialize
{
  objc_opt_self();
  if (!_MergedGlobals_72)
  {
    _MergedGlobals_72 = (uint64_t)objc_getClass("NSKeyValueUndefinedSetter");
    qword_1ECD8D9A0 = (uint64_t)objc_getClass("NSKeyValueUndefinedGetter");
  }
}

- (void)setIndexes:(NSArray *)indexes
{
  uint64_t i;
  void *v6;
  NSEntityDescription *v7;
  NSEntityDescription *rootentity;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  _ExtraEntityIVars *extraIvars;
  id var5;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSArray *obj;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  const __CFString *v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  -[NSEntityDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = indexes;
  v37 = -[NSArray countByEnumeratingWithState:objects:count:](indexes, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v44 != v36)
          objc_enumerationMutation(obj);
        if (self)
        {
          v6 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if ((*(_BYTE *)&self->_entityDescriptionFlags & 4) != 0)
          {
            rootentity = self->_rootentity;
          }
          else
          {
            v7 = self;
            do
            {
              rootentity = v7;
              v7 = -[NSEntityDescription superentity](v7, "superentity");
            }
            while (v7);
          }
          -[NSEntityDescription _validateIndexNameChangeFrom:to:]((uint64_t)rootentity, 0, objc_msgSend(v6, "name"));
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v38 = v6;
          v9 = (void *)objc_msgSend(v6, "elements");
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v48;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v48 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
                v15 = (__CFString *)objc_msgSend(v14, "property");
                v16 = -[__CFString _propertyType](v15, "_propertyType");
                v17 = (__CFString *)-[__CFString name](v15, "name");
                if (-[__CFString _isAttribute](v15, "_isAttribute"))
                {
                  if (v15 && -[__CFString superCompositeAttribute](v15, "superCompositeAttribute"))
                    v17 = -[NSPropertyDescription _rootName](v15);
                  if (!-[NSEntityDescription _attributeNamed:]((uint64_t)self, (uint64_t)v17))
                  {
                    v25 = (void *)MEMORY[0x1E0C99DA0];
                    v26 = *MEMORY[0x1E0C99778];
                    v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can't find attribute named %@"), v17);
                    goto LABEL_47;
                  }
                }
                else if (-[__CFString _isRelationship](v15, "_isRelationship"))
                {
                  if (!-[NSEntityDescription _relationshipNamed:](self, (uint64_t)v17))
                  {
                    v25 = (void *)MEMORY[0x1E0C99DA0];
                    v26 = *MEMORY[0x1E0C99778];
                    v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can't find relationship named %@"), v17);
LABEL_47:
                    v34 = v27;
                    v32 = v25;
                    v33 = v26;
                    v31 = 0;
                    goto LABEL_48;
                  }
                }
                else if (v16 != 5)
                {
                  v28 = (void *)MEMORY[0x1E0C99DA0];
                  v29 = *MEMORY[0x1E0C99778];
                  v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can't create index %@, unsupported index element property type"), objc_msgSend(v38, "name"));
                  v53 = CFSTR("element");
                  v54 = v14;
                  goto LABEL_46;
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            }
            while (v11);
          }
          if (!objc_msgSend((id)objc_msgSend(v38, "elements"), "count"))
          {
            v28 = (void *)MEMORY[0x1E0C99DA0];
            v29 = *MEMORY[0x1E0C99778];
            v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Indexes must be declared at the highest applicable level. All properties are declared on superentity."));
            v53 = CFSTR("index");
            v54 = v38;
LABEL_46:
            v31 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
            v32 = v28;
            v33 = v29;
            v34 = v30;
LABEL_48:
            objc_exception_throw((id)objc_msgSend(v32, "exceptionWithName:reason:userInfo:", v33, v34, v31));
          }
        }
      }
      v37 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v37);
  }
  v18 = (void *)-[NSArray mutableCopy](obj, "mutableCopy");
  if (self)
  {
    extraIvars = self->_extraIvars;
    if (!extraIvars)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      extraIvars = self->_extraIvars;
    }
  }
  else
  {
    extraIvars = 0;
  }
  var5 = extraIvars->var5;
  if (var5)
  {

    extraIvars->var5 = 0;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v40 != v23)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "_setEntity:", self);
      }
      v22 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v22);
  }
  extraIvars->var5 = v18;
}

- (uint64_t)_validateIndexNameChangeFrom:(uint64_t)a3 to:
{
  _QWORD *v3;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  const __CFString *v28;
  _QWORD *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (_QWORD *)result;
    if (*(_QWORD *)(result + 128))
    {
      result = objc_msgSend(a2, "isEqual:");
      if ((result & 1) == 0)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v6 = *(void **)(v3[16] + 40);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v24 != v9)
                objc_enumerationMutation(v6);
              v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "name");
              if ((objc_msgSend(v11, "isEqual:", a2) & 1) == 0 && objc_msgSend(v11, "isEqual:", a3))
              {
                v16 = (void *)MEMORY[0x1E0C99DA0];
                v17 = *MEMORY[0x1E0C99778];
                v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entity %@ already has an index with name %@"), objc_msgSend(v3, "name"), a3);
                v28 = CFSTR("Entity");
                v29 = v3;
                objc_exception_throw((id)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v18, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1)));
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
          }
          while (v8);
        }
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v12 = (void *)objc_msgSend(v3, "subentities");
        result = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (result)
        {
          v13 = result;
          v14 = *(_QWORD *)v20;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v12);
              -[NSEntityDescription _validateIndexNameChangeFrom:to:](*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15++), a2, a3);
            }
            while (v13 != v15);
            result = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            v13 = result;
          }
          while (result);
        }
      }
    }
  }
  return result;
}

- (uint64_t)_isPathologicalForConstraintMerging:(uint64_t)result
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  const __CFString **v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = (void *)result;
    if ((*(_BYTE *)(result + 121) & 0x20) != 0)
    {
      if (a2)
      {
        v4 = -[NSEntityDescription _checkForNonCascadeNoInverses]((const void *)result);
        v5 = (void *)MEMORY[0x1E0CB35C8];
        v6 = *MEMORY[0x1E0CB28A8];
        if (v4)
        {
          v7 = v4;
          v14[0] = CFSTR("Reason");
          v15[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entity '%@' has unique constraints { %@ } with relationship '%@' and mandatory to-one inverse '%@' but is not using a cascade delete rule ."), objc_msgSend(v2, "name"), objc_msgSend(v2, "uniquenessConstraints"), objc_msgSend(v7, "name"), objc_msgSend((id)objc_msgSend(v7, "inverseRelationship"), "name"));
          v15[1] = v7;
          v14[1] = CFSTR("relationship");
          v14[2] = CFSTR("inverse");
          v15[2] = objc_msgSend(v7, "inverseRelationship");
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v15;
          v10 = (const __CFString **)v14;
          v11 = 3;
        }
        else
        {
          v12 = CFSTR("Reason");
          v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entity '%@' has unique constraints { %@ } with a relationship and mandatory to-one inverse but is not using a cascade delete rule ."), objc_msgSend(v2, "name"), objc_msgSend(v2, "uniquenessConstraints"));
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = &v13;
          v10 = &v12;
          v11 = 1;
        }
        *a2 = objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 134111, objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, v11));
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (unint64_t)_entityClass
{
  if (result)
    return _PFFastEntityClass(result);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  _ExtraEntityIVars *extraIvars;
  id var3;
  id var4;
  id var5;
  _ExtraEntityIVars *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityDescription name](self, "name"), CFSTR("NSEntityName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_classNameForEntity, CFSTR("NSClassNameForEntity"));
  if (-[NSEntityDescription isAbstract](self, "isAbstract"))
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSIsAbstract"));
  objc_msgSend(a3, "encodeConditionalObject:forKey:", -[NSEntityDescription managedObjectModel](self, "managedObjectModel"), CFSTR("NSManagedObjectModel"));
  objc_msgSend(a3, "encodeConditionalObject:forKey:", -[NSEntityDescription superentity](self, "superentity"), CFSTR("NSSuperentity"));
  if (self->_subentities)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_subentities);
  else
    v6 = 0;
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NSSubentities"));

  if (self->_properties)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_properties);
  else
    v7 = 0;
  objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("NSProperties"));

  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityDescription userInfo](self, "userInfo"), CFSTR("NSUserInfo"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityDescription versionHashModifier](self, "versionHashModifier"), CFSTR("NSVersionHashModifier"));
  v8 = -[NSEntityDescription renamingIdentifier](self, "renamingIdentifier");
  if (v8)
    objc_msgSend(a3, "encodeObject:forKey:", v8, CFSTR("NSRenamingIdentifier"));
  extraIvars = self->_extraIvars;
  if (extraIvars)
  {
    var3 = extraIvars->var3;
    if (!var3
      || (objc_msgSend(a3, "encodeObject:forKey:", var3, CFSTR("NSUniqueTuples")),
          (extraIvars = self->_extraIvars) != 0))
    {
      var4 = extraIvars->var4;
      if (!var4
        || (objc_msgSend(a3, "encodeObject:forKey:", var4, CFSTR("NSCoreSpotlightDisplayName")),
            (extraIvars = self->_extraIvars) != 0))
      {
        var5 = extraIvars->var5;
        if (var5)
        {
          objc_msgSend(a3, "encodeObject:forKey:", var5, CFSTR("NSFetchIndexDescriptions"));
          v13 = self->_extraIvars;
          if (v13 && v13->var5)
          {
            v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v23 = 0u;
            v24 = 0u;
            v21 = 0u;
            v22 = 0u;
            v15 = self->_extraIvars->var5;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v22;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v22 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
                  if (-[NSFetchIndexDescription _compoundIndexRepresentation](v20))
                    objc_msgSend(v14, "addObject:", -[NSFetchIndexDescription _compoundIndexRepresentation](v20));
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
              }
              while (v17);
            }
          }
          else
          {
            v14 = 0;
          }
          objc_msgSend(a3, "encodeObject:forKey:", v14, CFSTR("NSCompoundIndexes"));
        }
      }
    }
  }
  objc_autoreleasePoolPop(v5);
}

- (void)_setIndexesFromJSONObject:(int)a3 supplemental:
{
  void *v3;
  uint64_t i;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _DWORD *v17;
  void *v18;
  NSFetchIndexDescription *v19;
  uint64_t v20;
  uint64_t v22;
  void *v23;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "isNSArray"))
    return;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v20)
    return;
  v3 = 0;
  v22 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v20; ++i)
    {
      v23 = v3;
      if (*(_QWORD *)v27 != v22)
        objc_enumerationMutation(a2);
      v5 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      if (!objc_msgSend(v5, "isNSArray", v20))
        return;
      v6 = objc_msgSend(v5, "count");
      if ((unint64_t)objc_msgSend(v5, "count") < 2)
        return;
      v7 = (void *)objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      if (!objc_msgSend(v7, "isNSString"))
        return;
      if (v6 >= 2)
      {
        v8 = 0;
        v9 = 1;
        while (1)
        {
          v10 = (void *)objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
          if (!objc_msgSend(v10, "isNSArray"))
            return;
          v11 = objc_msgSend(v10, "count");
          v12 = 1;
          if (v11 == 1)
            goto LABEL_26;
          if (v11 == 2)
            goto LABEL_22;
          v13 = 0;
          v14 = 0;
          if (v11 == 3)
            break;
LABEL_28:
          v17 = -[NSFetchIndexElementDescription initWithPropertyName:collationType:]([NSFetchIndexElementDescription alloc], v14, v13);
          if (!v17)
            return;
          v18 = v17;
          v17[10] = v17[10] & 0xFFFFFFFE | v12;
          if (!v8)
            v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          objc_msgSend(v8, "addObject:", v18);

          if (v6 == ++v9)
            goto LABEL_34;
        }
        v15 = (void *)objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
        if (!objc_msgSend(v15, "isNSString"))
          return;
        if (objc_msgSend(CFSTR("asc"), "caseInsensitiveCompare:", v15)
          && objc_msgSend(CFSTR("ascending"), "caseInsensitiveCompare:", v15))
        {
          if (objc_msgSend(CFSTR("desc"), "caseInsensitiveCompare:", v15)
            && objc_msgSend(CFSTR("descending"), "caseInsensitiveCompare:", v15))
          {
            return;
          }
          v12 = 0;
        }
LABEL_22:
        v16 = (void *)objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        if (!objc_msgSend(v16, "isNSString"))
          return;
        if (objc_msgSend(CFSTR("binary"), "caseInsensitiveCompare:", v16))
        {
          if (objc_msgSend(CFSTR("rtree"), "caseInsensitiveCompare:", v16))
            return;
          v13 = 1;
        }
        else
        {
LABEL_26:
          v13 = 0;
        }
        v14 = (void *)objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        if (!objc_msgSend(v14, "isNSString"))
          return;
        goto LABEL_28;
      }
      v8 = 0;
LABEL_34:
      v19 = -[NSFetchIndexDescription initWithName:elements:]([NSFetchIndexDescription alloc], "initWithName:elements:", v7, v8);
      -[NSFetchIndexDescription _setEntity:](v19, "_setEntity:", a1);
      if (!v19)
        return;
      v3 = v23;
      if (!v23)
        v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      objc_msgSend(v3, "addObject:", v19);

    }
    v20 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v20);
  if (v3 && objc_msgSend(v3, "count", 0))
  {
    if (a3)
      -[NSEntityDescription _addSupplementalIndexes:](a1, v3);
    else
      -[NSEntityDescription _setIndexes:](a1, v3);
  }
}

- (void)_addSupplementalIndexes:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 128);
  if (!v4)
  {
    -[NSEntityDescription _initializeExtraIVars](a1);
    v4 = *(_QWORD *)(a1 + 128);
  }
  v5 = *(void **)(v4 + 40);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(a2);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v11, "_setEntity:", a1);
          objc_msgSend(v6, "addObject:", v11);
        }
        v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v8);
    }

  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(a2);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "_setEntity:", a1);
        }
        v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v13);
    }
    v6 = (void *)objc_msgSend(a2, "mutableCopy");
  }
  *(_QWORD *)(v4 + 40) = v6;
}

- (id)description
{
  id v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  _BOOL4 v7;
  NSString *v8;
  NSDictionary *v9;
  NSDictionary *v10;
  NSDictionary *v11;
  NSString *v12;
  _ExtraEntityIVars *extraIvars;
  uint64_t var3;
  void *v16;
  objc_super v17;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)NSEntityDescription;
  v3 = -[NSEntityDescription description](&v17, sel_description);
  v4 = -[NSEntityDescription name](self, "name");
  v5 = -[NSEntityDescription managedObjectClassName](self, "managedObjectClassName");
  v6 = -[NSEntityDescription renamingIdentifier](self, "renamingIdentifier");
  v7 = -[NSEntityDescription isAbstract](self, "isAbstract");
  v8 = -[NSEntityDescription name](-[NSEntityDescription superentity](self, "superentity"), "name");
  v9 = -[NSEntityDescription propertiesByName](self, "propertiesByName");
  v10 = -[NSEntityDescription subentitiesByName](self, "subentitiesByName");
  v11 = -[NSEntityDescription userInfo](self, "userInfo");
  v12 = -[NSEntityDescription versionHashModifier](self, "versionHashModifier");
  if (self)
  {
    extraIvars = self->_extraIvars;
    if (!extraIvars || (var3 = (uint64_t)extraIvars->var3) == 0)
      var3 = NSArray_EmptyArray;
  }
  else
  {
    var3 = 0;
  }
  return (id)objc_msgSend(v16, "stringWithFormat:", CFSTR("(%@) name %@, managedObjectClassName %@, renamingIdentifier %@, isAbstract %u, superentity name %@, properties %@, subentities %@, userInfo %@, versionHashModifier %@, uniquenessConstraints %@"), v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, var3);
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  NSMutableDictionary *v5;

  objc_sync_enter(self);
  v5 = self->_userInfo;
  if (v5 != (NSMutableDictionary *)userInfo)
  {

    self->_userInfo = (NSMutableDictionary *)-[NSDictionary copy](userInfo, "copy");
  }
  objc_sync_exit(self);
}

- (uint64_t)_removeSubentity:(uint64_t)result
{
  id *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (result)
  {
    v2 = (id *)result;
    result = objc_msgSend(a2, "name");
    if (result)
    {
      v3 = result;
      result = objc_msgSend(v2[11], "objectForKey:", result);
      if (result)
      {
        v4 = (void *)result;
        objc_msgSend(v2, "_throwIfNotEditable");
        v5 = v4;
        objc_msgSend(v2[11], "removeObjectForKey:", v3);
        return -[NSEntityDescription _setSuperentity:]((uint64_t)v4, 0);
      }
    }
  }
  return result;
}

- (void)setSubentities:(NSArray *)subentities
{
  -[NSEntityDescription _setSubentities:preserveIndices:]((uint64_t)self, subentities, 0);
}

- (NSArray)relationshipsWithDestinationEntity:(NSEntityDescription *)entity
{
  NSArray *v5;
  uint64_t v6;
  _NSRange *propertyRanges;
  NSUInteger location;
  NSUInteger length;
  id *v10;
  id v11;
  NSDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (self->_propertyRanges)
  {
    v6 = -[NSDictionary values](-[NSEntityDescription propertiesByName](self, "propertiesByName"), "values");
    propertyRanges = self->_propertyRanges;
    location = propertyRanges[2].location;
    length = propertyRanges[2].length;
    if (location < length + location)
    {
      v10 = (id *)(v6 + 8 * location);
      do
      {
        v11 = *v10;
        if ((NSEntityDescription *)objc_msgSend(*v10, "destinationEntity") == entity)
          -[NSArray addObject:](v5, "addObject:", v11);
        ++v10;
        --length;
      }
      while (length);
    }
  }
  else
  {
    v12 = -[NSEntityDescription relationshipsByName](self, "relationshipsByName");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = -[NSDictionary objectForKey:](v12, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16));
          if ((NSEntityDescription *)objc_msgSend(v17, "destinationEntity") == entity)
            -[NSArray addObject:](v5, "addObject:", v17);
          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }
  }
  return v5;
}

- (void)setManagedObjectClassName:(NSString *)managedObjectClassName
{
  NSString *classNameForEntity;

  -[NSEntityDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (-[NSString isEqualToString:](managedObjectClassName, "isEqualToString:", +[NSEntityDescription _MOClassName](NSEntityDescription, "_MOClassName")))
  {
    managedObjectClassName = 0;
  }
  classNameForEntity = self->_classNameForEntity;
  if (classNameForEntity != managedObjectClassName)
  {

    self->_classNameForEntity = (NSString *)-[NSString copy](managedObjectClassName, "copy");
  }
  self->_instanceClass = 0;
}

- (void)setAbstract:(BOOL)abstract
{
  _BOOL4 v3;

  v3 = abstract;
  -[NSEntityDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_entityDescriptionFlags = (__entityDescriptionFlags)(*(_DWORD *)&self->_entityDescriptionFlags & 0xFFFFFFFE | v3);
}

- (NSString)versionHashModifier
{
  return self->_versionHashModifier;
}

- (void)setVersionHashModifier:(NSString *)versionHashModifier
{
  NSString *v5;

  -[NSEntityDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_versionHashModifier;
  if (v5 != versionHashModifier)
  {

    self->_versionHashModifier = (NSString *)-[NSString copy](versionHashModifier, "copy");
  }
}

- (NSArray)compoundIndexes
{
  id v3;
  id var5;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self->_extraIvars)
    return (NSArray *)NSArray_EmptyArray;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  var5 = self->_extraIvars->var5;
  v5 = objc_msgSend(var5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(var5);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((-[NSFetchIndexDescription _isMappedSinglePropertyIndex]((uint64_t)v9) & 1) == 0)
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(v9, "elements"), "count"));
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v11 = (void *)objc_msgSend(v9, "elements", 0);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v18;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v18 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "property"));
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v13);
          }
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(var5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (uint64_t)_hasIndexForProperty:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 128);
    if (v4)
    {
      v5 = *(void **)(v4 + 40);
      if (v5)
      {
        v12 = 0u;
        v13 = 0u;
        v10 = 0u;
        v11 = 0u;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v11;
          while (2)
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v11 != v8)
                objc_enumerationMutation(v5);
              if ((-[NSFetchIndexDescription _isIndexForProperty:](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), a2) & 1) != 0)
                return 1;
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
            if (v7)
              continue;
            break;
          }
        }
      }
    }
    return -[NSEntityDescription _hasIndexForProperty:](*(_QWORD *)(v3 + 80), a2);
  }
  return result;
}

- (NSArray)uniquenessConstraints
{
  id v3;
  NSEntityDescription *superentity;
  uint64_t v5;
  _ExtraEntityIVars *extraIvars;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  superentity = self->_superentity;
  if (superentity)
  {
    v5 = -[NSEntityDescription uniquenessConstraints](superentity, "uniquenessConstraints");
    if (v5)
      objc_msgSend(v3, "addObjectsFromArray:", v5);
  }
  extraIvars = self->_extraIvars;
  if (extraIvars && extraIvars->var3)
    objc_msgSend(v3, "addObjectsFromArray:");
  return (NSArray *)v3;
}

- (unint64_t)retainCount
{
  return (unint64_t)(self->_cd_rc + 2) >> 1;
}

- (void)_addSubentity:(id)a3
{
  NSEntityDescription *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;

  -[NSEntityDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = (NSEntityDescription *)objc_msgSend(a3, "superentity");
  if (v5 != self)
  {
    if (v5)
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      v11 = CFSTR("Can't add an entity to multiple superentities.");
    }
    else
    {
      v6 = objc_msgSend(a3, "name");
      if (v6)
      {
        v7 = v6;
        v8 = (id)-[NSMutableDictionary objectForKey:](self->_subentities, "objectForKey:", v6);
        if (!v8 || v8 == a3)
        {
          -[NSMutableDictionary setObject:forKey:](self->_subentities, "setObject:forKey:", a3, v7);
          -[NSEntityDescription _setSuperentity:]((uint64_t)a3, (uint64_t)self);
          return;
        }
        v9 = (void *)MEMORY[0x1E0C99DA0];
        v10 = *MEMORY[0x1E0C99768];
        v11 = CFSTR("Can't add multiple entities with duplicate names.");
      }
      else
      {
        v9 = (void *)MEMORY[0x1E0C99DA0];
        v10 = *MEMORY[0x1E0C99768];
        v11 = CFSTR("Can't add unnamed subentity.");
      }
    }
    objc_exception_throw((id)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0));
  }
}

- (uint64_t)_setSuperentity:(uint64_t)result
{
  if (result && *(_QWORD *)(result + 80) != a2)
  {
    if (result == a2)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't set superentity of self to self."), 0));
    *(_QWORD *)(result + 80) = a2;
  }
  return result;
}

- (id)_uniquenessConstraintsAsFetchIndexes
{
  _ExtraEntityIVars *extraIvars;
  id var3;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSFetchIndexElementDescription *v19;
  NSFetchIndexDescription *v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  NSEntityDescription *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  const __CFString *v50;
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = self;
  extraIvars = self->_extraIvars;
  if (extraIvars)
  {
    var3 = extraIvars->var3;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = var3;
    v28 = objc_msgSend(var3, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v28)
    {
      v26 = *(_QWORD *)v38;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(obj);
          v29 = v5;
          v6 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v5);
          v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v34 = (void *)objc_msgSend(CFSTR("UNIQUE"), "mutableCopy");
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v30 = v6;
          v36 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          if (v36)
          {
            v33 = *(_QWORD *)v46;
            do
            {
              for (i = 0; i != v36; ++i)
              {
                if (*(_QWORD *)v46 != v33)
                  objc_enumerationMutation(v30);
                v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                v9 = (void *)objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
                v31 = v8;
                if ((unint64_t)objc_msgSend(v9, "count") < 2)
                {
                  v10 = -[NSDictionary objectForKey:](-[NSEntityDescription propertiesByName](v32, "propertiesByName"), "objectForKey:", v8);
                }
                else
                {
                  v10 = -[NSDictionary objectForKey:](-[NSEntityDescription propertiesByName](v32, "propertiesByName"), "objectForKey:", objc_msgSend(v9, "objectAtIndex:", 0));
                  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
                  {
                    v11 = 1;
                    do
                    {
                      v12 = (void *)objc_msgSend(v9, "objectAtIndex:", v11);
                      v41 = 0u;
                      v42 = 0u;
                      v43 = 0u;
                      v44 = 0u;
                      v13 = (void *)objc_msgSend(v10, "elements");
                      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
                      if (v14)
                      {
                        v15 = v14;
                        v16 = *(_QWORD *)v42;
                        while (2)
                        {
                          for (j = 0; j != v15; ++j)
                          {
                            if (*(_QWORD *)v42 != v16)
                              objc_enumerationMutation(v13);
                            v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                            if ((objc_msgSend(v12, "isEqualToString:", objc_msgSend(v18, "name")) & 1) != 0)
                            {
                              v10 = v18;
                              goto LABEL_25;
                            }
                          }
                          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
                          if (v15)
                            continue;
                          break;
                        }
                      }
LABEL_25:
                      ++v11;
                    }
                    while (objc_msgSend(v9, "count") > v11);
                  }
                }
                if (!v10)
                {
                  v22 = (void *)MEMORY[0x1E0C99DA0];
                  v23 = *MEMORY[0x1E0C99778];
                  v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find property named %@"), v31);
                  v50 = CFSTR("Property name");
                  v51 = v31;
                  objc_exception_throw((id)objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v23, v24, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1)));
                }
                v19 = -[NSFetchIndexElementDescription initWithProperty:collationType:]([NSFetchIndexElementDescription alloc], "initWithProperty:collationType:", v10, 0);
                objc_msgSend(v34, "appendFormat:", CFSTR("_%@"), objc_msgSend(v10, "name"));
                objc_msgSend(v35, "addObject:", v19);

              }
              v36 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
            }
            while (v36);
          }
          v20 = -[NSFetchIndexDescription initWithName:elements:]([NSFetchIndexDescription alloc], "initWithName:elements:", v34, v35);
          -[NSFetchIndexDescription _setIsUnique:]((uint64_t)v20, 1);

          objc_msgSend(v27, "addObject:", v20);
          v5 = v29 + 1;
        }
        while (v29 + 1 != v28);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v28);
    }
  }
  return v27;
}

- (id)_propertyWithRenamingIdentifier:(id)a3
{
  NSDictionary *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = -[NSEntityDescription propertiesByName](self, "propertiesByName");
  v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", a3);
  if ((objc_msgSend((id)objc_msgSend(v5, "renamingIdentifier"), "isEqualToString:", a3) & 1) == 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        if ((objc_msgSend((id)objc_msgSend(v5, "renamingIdentifier"), "isEqualToString:", a3) & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          v5 = 0;
          if (v7)
            goto LABEL_4;
          return v5;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

+ (id)_MOClassName
{
  id result;
  objc_class *v3;

  result = (id)_MOClassName__NSManagedObjectClassName;
  if (!_MOClassName__NSManagedObjectClassName)
  {
    v3 = (objc_class *)objc_opt_class();
    result = (id)-[NSString copy](NSStringFromClass(v3), "copy");
    _MOClassName__NSManagedObjectClassName = (uint64_t)result;
  }
  return result;
}

BOOL __61__NSEntityDescription__NSInternalMethods___propertiesOfType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  return v2 == objc_msgSend(a2, "_propertyType");
}

- (uint64_t)_propertyKeys:(uint64_t)a3 matchingBlock:
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    v16 = 0;
    if ((*(_BYTE *)(result + 120) & 8) == 0)
    {
      v6 = objc_msgSend((id)result, "superentity");
      if (v6)
      {
        v16 = -[NSEntityDescription _propertyKeys:matchingBlock:](v6, a2, a3);
        if ((v16 & 1) != 0)
          return 1;
      }
    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = *(void **)(v5 + 96);
    result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (result)
    {
      v8 = result;
      v9 = *(_QWORD *)v13;
LABEL_8:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((*(unsigned int (**)(uint64_t, uint64_t, char *))(a3 + 16))(a3, objc_msgSend(*(id *)(v5 + 96), "objectForKey:", v11), &v16))
        {
          objc_msgSend(a2, "addObject:", v11);
        }
        if (v16)
          return 1;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
          if (v8)
            goto LABEL_8;
          return v16 != 0;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_relationshipNamesByType:(uint64_t)result
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  char v7;

  if (result)
  {
    v3 = result;
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__NSEntityDescription__NSInternalMethods___relationshipNamesByType___block_invoke;
    v6[3] = &__block_descriptor_33_e35_B24__0__NSPropertyDescription_8_B16l;
    v7 = a2;
    -[NSEntityDescription _propertyKeys:matchingBlock:](v3, v4, (uint64_t)v6);
    v5 = objc_msgSend(v4, "allObjects");

    return v5;
  }
  return result;
}

uint64_t __68__NSEntityDescription__NSInternalMethods___relationshipNamesByType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;

  result = objc_msgSend(a2, "_isRelationship");
  if ((_DWORD)result)
  {
    v5 = objc_msgSend(a2, "maxCount");
    if (*(_BYTE *)(a1 + 32))
    {
      if (v5 == 1)
        return 1;
    }
    else if (v5 != 1)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t __56__NSEntityDescription__NSInternalMethods__attributeKeys__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isAttribute");
}

- (id)toManyRelationshipKeys
{
  uint64_t v3;
  _NSRange *propertyRanges;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!self->_propertyRanges)
    return (id)-[NSEntityDescription _relationshipNamesByType:]((uint64_t)self, 0);
  v3 = objc_msgSend(-[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"), "keys");
  propertyRanges = self->_propertyRanges;
  location = propertyRanges[9].location;
  length = propertyRanges[9].length;
  v8 = propertyRanges[13].location;
  v7 = propertyRanges[13].length;
  v9 = v7 + length;
  if (v7 + length <= 1)
    v10 = 1;
  else
    v10 = v7 + length;
  if (v9 >= 0x201)
    v11 = 1;
  else
    v11 = v10;
  v12 = (char *)v15 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v9 <= 0x200)
  {
    bzero((char *)v15 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v10);
    if (!length)
      goto LABEL_14;
    goto LABEL_13;
  }
  v12 = (char *)NSAllocateScannedUncollectable();
  if (length)
LABEL_13:
    memcpy(v12, (const void *)(v3 + 8 * location), 8 * length);
LABEL_14:
  if (v7)
    memcpy(&v12[8 * length], (const void *)(v3 + 8 * v8), 8 * v7);
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, v7 + length);
  if (v9 >= 0x201)
    NSZoneFree(0, v12);
  return v14;
}

- (id)toOneRelationshipKeys
{
  uint64_t v3;
  _NSRange *propertyRanges;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!self->_propertyRanges)
    return (id)-[NSEntityDescription _relationshipNamesByType:]((uint64_t)self, 1);
  v3 = objc_msgSend(-[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"), "keys");
  propertyRanges = self->_propertyRanges;
  location = propertyRanges[6].location;
  length = propertyRanges[6].length;
  v8 = propertyRanges[10].location;
  v7 = propertyRanges[10].length;
  v9 = v7 + length;
  if (v7 + length <= 1)
    v10 = 1;
  else
    v10 = v7 + length;
  if (v9 >= 0x201)
    v11 = 1;
  else
    v11 = v10;
  v12 = (char *)v15 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v9 <= 0x200)
  {
    bzero((char *)v15 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v10);
    if (!length)
      goto LABEL_14;
    goto LABEL_13;
  }
  v12 = (char *)NSAllocateScannedUncollectable();
  if (length)
LABEL_13:
    memcpy(v12, (const void *)(v3 + 8 * location), 8 * length);
LABEL_14:
  if (v7)
    memcpy(&v12[8 * length], (const void *)(v3 + 8 * v8), 8 * v7);
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, v7 + length);
  if (v9 >= 0x201)
    NSZoneFree(0, v12);
  return v14;
}

- (id)inverseForRelationshipKey:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  if (self->_propertyRanges)
  {
    v5 = -[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping");
    v6 = -[NSDictionary values](-[NSEntityDescription propertiesByName](self, "propertiesByName"), "values");
    v7 = objc_msgSend(v5, "indexForKey:", a3);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = (void *)objc_msgSend(*(id *)(v6 + 8 * v7), "inverseRelationship");
    return (id)objc_msgSend(v8, "name");
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3052000000;
    v16 = __Block_byref_object_copy__10;
    v17 = __Block_byref_object_dispose__10;
    v18 = 0;
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__NSEntityDescription__NSInternalMethods__inverseForRelationshipKey___block_invoke;
    v12[3] = &unk_1E1EDDD60;
    v12[4] = a3;
    v12[5] = &v13;
    -[NSEntityDescription _propertyKeys:matchingBlock:]((uint64_t)self, v9, (uint64_t)v12);

    v10 = (void *)v14[5];
    _Block_object_dispose(&v13, 8);
    return v10;
  }
}

uint64_t __69__NSEntityDescription__NSInternalMethods__inverseForRelationshipKey___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  if (objc_msgSend(a2, "_isRelationship")
    && objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "inverseRelationship"), "name");
    *a3 = 1;
  }
  return 0;
}

uint64_t __59__NSEntityDescription__NSInternalMethods___attributeNamed___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "_isAttribute");
  if ((_DWORD)result)
  {
    result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", *(_QWORD *)(a1 + 32));
    if ((_DWORD)result)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
      *a3 = 0;
      return 1;
    }
  }
  return result;
}

- (void)_setIsEditable:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  __entityDescriptionFlags entityDescriptionFlags;
  NSManagedObjectModel *model;

  v3 = a3;
  v5 = objc_sync_enter(self);
  v6 = (void *)MEMORY[0x18D76B4E4](v5);
  entityDescriptionFlags = self->_entityDescriptionFlags;
  if (v3)
  {
    if ((*(_BYTE *)&entityDescriptionFlags & 4) != 0)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Cannot make an immutable entity editable again."), 0));
  }
  else if ((*(_BYTE *)&entityDescriptionFlags & 4) == 0)
  {
    model = self->_model;
    if (model)
    {
      -[NSManagedObjectModel _setIsEditable:](model, "_setIsEditable:", 0);
    }
    else
    {
      self->_modelsReferenceIDForEntity = 0;
      -[NSEntityDescription _flattenProperties](self, "_flattenProperties");
      -[NSEntityDescription _createCachesAndOptimizeState](self, "_createCachesAndOptimizeState");
      -[NSEntityDescription versionHash](self, "versionHash");
      __dmb(0xBu);
    }
  }
  objc_autoreleasePoolPop(v6);
  objc_sync_exit(self);
}

- (uint64_t)_hasPotentialHashSkew
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 88), "count");
    if (result)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v2 = *(void **)(v1 + 96);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (result)
      {
        v3 = result;
        v4 = *(_QWORD *)v10;
        while (2)
        {
          v5 = 0;
          do
          {
            if (*(_QWORD *)v10 != v4)
              objc_enumerationMutation(v2);
            v6 = (void *)objc_msgSend(*(id *)(v1 + 96), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v5));
            if (objc_msgSend(v6, "_propertyType") == 4)
            {
              v7 = objc_msgSend(v6, "inverseRelationship");
              if (v7 && v6 == (void *)v7)
                return 1;
            }
            ++v5;
          }
          while (v3 != v5);
          result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          v3 = result;
          if (result)
            continue;
          break;
        }
      }
    }
  }
  return result;
}

- (unint64_t)_offsetRelationshipIndex:(unint64_t)a3 fromSuperEntity:(id)a4 andIsToMany:(BOOL)a5
{
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v5 = (_QWORD *)*((_QWORD *)a4 + 14);
  v6 = v5[8];
  v8 = a3 >= v6;
  v7 = a3 - v6;
  v8 = !v8 || v7 >= v5[9];
  if (v8)
  {
    v9 = v5[4];
    v8 = a3 >= v9;
    v10 = a3 - v9;
    if (!v8 || v10 >= v5[5])
      return a3;
    v12 = v5[24];
    v13 = v5[25];
    v14 = a3 - v12;
    v15 = !a5;
    v16 = 10;
    v17 = 13;
  }
  else
  {
    v12 = v5[16];
    v13 = v5[17];
    v14 = a3 - v12;
    v15 = !a5;
    v16 = 6;
    v17 = 9;
  }
  if (!v15)
    v16 = v17;
  v18 = v14 < v13 && a3 >= v12;
  v19 = 8;
  if (!v18)
    v19 = v16;
  return self->_propertyRanges[v19].location + a3 - v5[2 * v19];
}

- (void)_checkAttributeMembership:(void *)a1 hashes:(void *)a2
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x18D76B4E4]();
  v5 = objc_msgSend(a1, "_qualifiedName");
  if (objc_msgSend(a2, "objectForKey:", v5))
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v18[0] = CFSTR("attributeName");
    v18[1] = CFSTR("compositeName");
    v19[0] = objc_msgSend(a1, "name");
    v19[1] = objc_msgSend((id)objc_msgSend(a1, "superCompositeAttribute"), "name");
    objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, CFSTR("An attribute cannot be part of multiple composite attributes."), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2)));
  }
  objc_msgSend(a2, "setObject:forKey:", a1, v5);
  if (objc_msgSend(a1, "attributeType") == 2100)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = (void *)objc_msgSend(a1, "elements", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[NSEntityDescription _checkAttributeMembership:hashes:](*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), a2);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
  }
  objc_autoreleasePoolPop(v4);
}

- (void)_newSnowLeopardStyleDictionaryContainingPropertiesOfType:(unint64_t)a3
{
  return (void *)_PF_SnowLeopard_CFDictionaryCreateWithObjectsAndKeys((uint64_t *)(-[NSDictionary values](-[NSEntityDescription propertiesByName](self, "propertiesByName"), "values")+ 8 * self->_propertyRanges[a3].location), (__CFString **)(objc_msgSend(-[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"), "keys")+ 8 * self->_propertyRanges[a3].location), self->_propertyRanges[a3].length);
}

- (void)_stripForMigration
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSEntityDescription setManagedObjectClassName:](self, "setManagedObjectClassName:", 0);
  *(_DWORD *)&self->_entityDescriptionFlags |= 0x10u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSEntityDescription properties](self, "properties", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_stripForMigration");
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)_restoreValidation
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)&self->_entityDescriptionFlags &= ~0x10u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[NSEntityDescription properties](self, "properties", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_restoreValidation");
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (uint64_t)_hasDerivedAttributes
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)result;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v2 = (void *)objc_msgSend((id)result, "attributesByName");
    result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (result)
    {
      v3 = result;
      v4 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v17 != v4)
            objc_enumerationMutation(v2);
          v6 = (void *)objc_msgSend((id)objc_msgSend(v1, "attributesByName"), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          if (objc_msgSend(v6, "_propertyType") == 7)
          {
            v7 = (void *)objc_msgSend(v6, "_flattenedElements");
            v12 = 0u;
            v13 = 0u;
            v14 = 0u;
            v15 = 0u;
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
            if (v8)
            {
              v9 = v8;
              v10 = *(_QWORD *)v13;
LABEL_10:
              v11 = 0;
              while (1)
              {
                if (*(_QWORD *)v13 != v10)
                  objc_enumerationMutation(v7);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11), "_propertyType") == 6)
                  return 1;
                if (v9 == ++v11)
                {
                  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
                  if (v9)
                    goto LABEL_10;
                  break;
                }
              }
            }
          }
          else if (objc_msgSend(v6, "_propertyType") == 6)
          {
            return 1;
          }
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        result = 0;
        if (v3)
          continue;
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_removeIndexForProperty:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 128);
    if (v3)
    {
      v4 = *(void **)(v3 + 40);
      if (v4)
      {
        v12 = 0u;
        v13 = 0u;
        v10 = 0u;
        v11 = 0u;
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (result)
        {
          v6 = result;
          v7 = *(_QWORD *)v11;
          while (2)
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v11 != v7)
                objc_enumerationMutation(v4);
              v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
              result = -[NSFetchIndexDescription _isIndexForProperty:](v9, a2);
              if ((result & 1) != 0)
              {
                if (v9)
                  return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 128) + 40), "removeObject:", v9);
                return result;
              }
              ++v8;
            }
            while (v6 != v8);
            result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
            v6 = result;
            if (result)
              continue;
            break;
          }
        }
      }
    }
  }
  return result;
}

- (BOOL)_isSchemaEqual:(id)a3
{
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  NSEntityDescription *v8;
  uint64_t v9;
  NSDictionary *v10;
  void *v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_26;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_26;
  v5 = -[NSEntityDescription name](self, "name");
  v6 = objc_msgSend(a3, "name");
  if (v5 != (NSString *)v6)
  {
    v7 = v6;
    LOBYTE(v6) = 0;
    if (!v5)
      return v6;
    if (!v7)
      return v6;
    LODWORD(v6) = -[NSString isEqual:](v5, "isEqual:");
    if (!(_DWORD)v6)
      return v6;
  }
  v8 = -[NSEntityDescription superentity](self, "superentity");
  v6 = objc_msgSend(a3, "superentity");
  if (v8 != (NSEntityDescription *)v6)
  {
    v9 = v6;
    LOBYTE(v6) = 0;
    if (!v8)
      return v6;
    if (!v9)
      return v6;
    LODWORD(v6) = -[NSEntityDescription _isSchemaEqual:](v8, sel__isSchemaEqual_);
    if (!(_DWORD)v6)
      return v6;
  }
  v10 = -[NSEntityDescription propertiesByName](self, "propertiesByName");
  v11 = (void *)objc_msgSend(a3, "propertiesByName");
  v12 = -[NSDictionary count](v10, "count");
  if (v12 != objc_msgSend(v11, "count"))
  {
LABEL_26:
    LOBYTE(v6) = 0;
    return v6;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = -[NSDictionary allKeys](v10, "allKeys", 0);
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = -[NSDictionary objectForKey:](v10, "objectForKey:", v18);
        v20 = objc_msgSend(v11, "objectForKey:", v18);
        if (v19 != (id)v20)
        {
          if (v19)
            v21 = v20 == 0;
          else
            v21 = 1;
          if (v21)
            goto LABEL_26;
          LODWORD(v6) = objc_msgSend(v19, sel__isSchemaEqual_, v20);
          if (!(_DWORD)v6)
            return v6;
        }
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      LOBYTE(v6) = 1;
    }
    while (v15);
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 uniquedMappings:(id)a8 entities:(id)a9
{
  void *v16;
  NSMutableDictionary *subentities;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  uint64_t i;
  int v30;
  unint64_t v31;
  unint64_t v32;
  NSArray *v33;
  unint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unint64_t v46;
  _ExtraEntityIVars *extraIvars;
  id var3;
  uint64_t v49;
  void *v50;
  unsigned int v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  unsigned int v56;
  unsigned int v57;
  void *v58;
  unsigned int v59;
  id v60;
  id v61;
  unsigned int v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (!_writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass)
    _writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass = objc_opt_class();
  v16 = (void *)objc_msgSend(a9, "mapping");
  _writeInt32IntoData(a3, 0xDAEDFEEB);
  v59 = objc_msgSend(a3, "length");
  _writeInt32IntoData(a3, 0);
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a6, "objectForKey:", self->_versionHashModifier), "unsignedIntegerValue"));
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a7, "objectForKey:", self->_versionHash), "unsignedIntegerValue"));
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", self->_classNameForEntity), "unsignedIntegerValue"));
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", self->_name), "unsignedIntegerValue"));
  if (self->_superentity)
  {
    LOBYTE(v62) = 1;
    objc_msgSend(a3, "appendBytes:length:", &v62, 1);
    _writeInt32IntoData(a3, objc_msgSend(v16, "indexForKey:", -[NSEntityDescription name](self->_superentity, "name")));
  }
  else
  {
    LOBYTE(v62) = 0;
    objc_msgSend(a3, "appendBytes:length:", &v62, 1);
  }
  v61 = a7;
  _writeInt32IntoData(a3, objc_msgSend(v16, "indexForKey:", -[NSEntityDescription name](self->_rootentity, "name")));
  subentities = self->_subentities;
  if (subentities && -[NSMutableDictionary count](subentities, "count"))
  {
    LOBYTE(v62) = 1;
    objc_msgSend(a3, "appendBytes:length:", &v62, 1);
    v18 = (void *)-[NSMutableDictionary mapping](self->_subentities, "mapping");
    _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a8, "objectForKey:", v18), "unsignedIntegerValue"));
    LODWORD(v20) = objc_msgSend(v18, "length");
    _writeInt32IntoData(a3, v20);
    v19 = objc_msgSend(v18, "keys");
    v20 = v20;
    if ((_DWORD)v20)
    {
      v21 = (uint64_t *)v19;
      do
      {
        v22 = *v21++;
        _writeInt64IntoData(a3, objc_msgSend(v16, "indexForKey:", v22));
        --v20;
      }
      while (v20);
    }
  }
  else
  {
    LOBYTE(v62) = 0;
    objc_msgSend(a3, "appendBytes:length:", &v62, 1);
  }
  v58 = v16;
  v60 = a8;
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a8, "objectForKey:", self->_propertyMapping), "unsignedIntegerValue"));
  v23 = -[NSMutableDictionary count](self->_properties, "count");
  if (v23)
  {
    v24 = v23;
    v25 = (_QWORD *)objc_msgSend(self->_propertyMapping, "keys");
    v26 = v24;
    do
    {
      _writeInt64IntoData(a3, 0);
      --v26;
    }
    while (v26);
    do
    {
      v27 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", *v25);
      v28 = (objc_class *)_writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass;
      if (v28 == object_getClass(v27))
      {
        _writeInt32IntoData(a3, 1u);
        _writeNSPropertyProxyIntoData(a3, v27, a4);
      }
      else
      {
        _writeInt32IntoData(a3, 0);
        _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a4, "objectForKey:", v27), "unsignedIntegerValue"));
      }
      ++v25;
      --v24;
    }
    while (v24);
  }
  for (i = 0; i != 18; ++i)
  {
    _writeInt64IntoData(a3, LODWORD(self->_propertyRanges[i].location));
    _writeInt64IntoData(a3, LODWORD(self->_propertyRanges[i].length));
  }
  _writeInt32IntoData(a3, *(_DWORD *)&self->_entityDescriptionFlags);
  v30 = 8;
  do
  {
    _writeInt64IntoData(a3, 0);
    --v30;
  }
  while (v30);
  if (-[NSEntityDescription renamingIdentifier](self, "renamingIdentifier"))
    v31 = objc_msgSend((id)objc_msgSend(a6, "objectForKey:", -[NSEntityDescription renamingIdentifier](self, "renamingIdentifier")), "unsignedIntegerValue");
  else
    v31 = 0;
  _writeInt64IntoData(a3, v31);
  if (-[NSEntityDescription coreSpotlightDisplayNameExpression](self, "coreSpotlightDisplayNameExpression"))
    v32 = objc_msgSend((id)objc_msgSend(v61, "objectForKey:", -[NSEntityDescription coreSpotlightDisplayNameExpression](self, "coreSpotlightDisplayNameExpression")), "unsignedIntegerValue");
  else
    v32 = 0;
  _writeInt64IntoData(a3, v32);
  v33 = -[NSEntityDescription indexes](self, "indexes");
  v34 = -[NSArray count](v33, "count");
  if (v33 && v34)
  {
    _writeInt64IntoData(a3, v34);
    if (-[NSArray count](v33, "count"))
    {
      v35 = 0;
      while (1)
      {
        v36 = -[NSArray objectAtIndex:](v33, "objectAtIndex:", v35);
        _writeInt64IntoData(a3, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", objc_msgSend(v36, "name")), "unsignedIntegerValue"));
        v37 = objc_msgSend(v36, "partialIndexPredicate");
        if (v37)
        {
          v38 = v37;
          _writeInt64IntoData(a3, 1uLL);
          v39 = objc_msgSend((id)objc_msgSend(v61, "objectForKey:", v38), "unsignedIntegerValue");
        }
        else
        {
          v39 = 0;
        }
        _writeInt64IntoData(a3, v39);
        v40 = (void *)objc_msgSend(v36, "elements");
        v41 = objc_msgSend(v40, "count");
        v42 = v41;
        if (v40)
        {
          if (v41)
            break;
        }
        _writeInt64IntoData(a3, 0);
        if (v42)
          goto LABEL_41;
LABEL_46:
        if (++v35 >= -[NSArray count](v33, "count"))
          goto LABEL_49;
      }
      _writeInt64IntoData(a3, v41);
LABEL_41:
      v43 = 0;
      do
      {
        v44 = (void *)objc_msgSend(v40, "objectAtIndex:", v43);
        _writeInt64IntoData(a3, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", objc_msgSend(v44, "propertyName")), "unsignedIntegerValue"));
        _writeInt64IntoData(a3, objc_msgSend(v44, "collationType"));
        _writeInt64IntoData(a3, objc_msgSend(v44, "isAscending"));
        v45 = (void *)objc_msgSend(v44, "property");
        if (objc_msgSend(v45, "_propertyType") == 5)
        {
          _writeInt64IntoData(a3, 1uLL);
          v46 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", v45), "unsignedIntegerValue");
        }
        else
        {
          v46 = 0;
        }
        _writeInt64IntoData(a3, v46);
        ++v43;
      }
      while (v42 != v43);
      goto LABEL_46;
    }
  }
  else
  {
    _writeInt64IntoData(a3, 0);
  }
LABEL_49:
  if (self
    && ((extraIvars = self->_extraIvars) != 0 && (var3 = extraIvars->var3) != 0
     || (var3 = (id)NSArray_EmptyArray) != 0)
    && objc_msgSend(var3, "count"))
  {
    _writeInt64IntoData(a3, objc_msgSend(var3, "count"));
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v49 = objc_msgSend(var3, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    v51 = v59;
    v50 = v60;
    v52 = v58;
    if (v49)
    {
      v53 = v49;
      v54 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v53; ++j)
        {
          if (*(_QWORD *)v64 != v54)
            objc_enumerationMutation(var3);
          _writePFEncodedArrayShapeIntoData(a3, *(void **)(*((_QWORD *)&v63 + 1) + 8 * j), a5, 0);
        }
        v53 = objc_msgSend(var3, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      }
      while (v53);
    }
  }
  else
  {
    _writeInt64IntoData(a3, 0);
    v51 = v59;
    v50 = v60;
    v52 = v58;
  }
  if (self->_userInfo)
    v56 = objc_msgSend((id)objc_msgSend(v61, "objectForKey:"), "unsignedIntegerValue");
  else
    v56 = 0;
  _writeInt32IntoData(a3, v56);
  v57 = objc_msgSend(self->_flattenedSubentities, "count");
  _writeInt32IntoData(a3, v57);
  if (v57)
    _writePFEncodedArrayShapeIntoData(a3, self->_flattenedSubentities, v52, 0);
  _writeInt32IntoData(a3, self->_modelsReferenceIDForEntity);
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(v50, "objectForKey:", -[NSDictionary mapping](-[NSEntityDescription attributesByName](self, "attributesByName"), "mapping")), "unsignedIntegerValue"));
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(v50, "objectForKey:", -[NSDictionary mapping](-[NSEntityDescription relationshipsByName](self, "relationshipsByName"), "mapping")), "unsignedIntegerValue"));
  _writeInt32IntoData(a3, 0xDAEDFEEB);
  v62 = bswap32(objc_msgSend(a3, "length") - v51);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v51, 4, &v62);
}

@end
