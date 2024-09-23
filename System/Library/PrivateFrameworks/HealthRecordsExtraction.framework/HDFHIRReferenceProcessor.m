@implementation HDFHIRReferenceProcessor

+ (id)newResourceFromResource:(id)a3 containingResource:(id)a4 reference:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  id *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  char v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  id v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v70 = a4;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDFHIRReferenceProcessor.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parent"));

  }
  if (v70)
  {
    if (v12)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDFHIRReferenceProcessor.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

    if (v12)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDFHIRReferenceProcessor.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reference"));

LABEL_5:
  objc_msgSend(v11, "FHIRVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "FHIRVersion");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v13 == (void *)v14)
  {

  }
  else
  {
    v15 = (void *)v14;
    v67 = a1;
    objc_msgSend(v70, "FHIRVersion");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {

LABEL_19:
      objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("You can only contain a resource in another resource with the same FHIR version"));
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        if (a6)
          *a6 = objc_retainAutorelease(v30);
        else
          _HKLogDroppedError();
      }

LABEL_43:
      v57 = 0;
      goto LABEL_52;
    }
    v17 = (void *)v16;
    objc_msgSend(v11, "FHIRVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "FHIRVersion");
    v19 = a6;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "isEqual:", v20);

    a6 = v19;
    a1 = v67;
    if ((v21 & 1) == 0)
      goto LABEL_19;
  }
  objc_msgSend(v70, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(a1, "reference:matchesIdentifier:", v12, v22);

  if ((v23 & 1) == 0)
  {
    v27 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v70, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "resourceType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("Resource %@ cannot be contained with a reference of %@"), v29, v12);
    v30 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, v30);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v31);
      else
        _HKLogDroppedError();
    }

    goto LABEL_43;
  }
  objc_msgSend(v70, "JSONObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("contained"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, CFSTR("You can not contain a resource in another resource that has contained resources itself"));
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v26);
      else
        _HKLogDroppedError();
    }

    v57 = 0;
  }
  else
  {
    v64 = a6;
    v68 = a1;
    v65 = v11;
    v66 = v12;
    objc_msgSend(v11, "JSONObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("contained"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v34 = v33;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v73;
      v38 = 0x24BE48000uLL;
      while (2)
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v73 != v37)
            objc_enumerationMutation(v34);
          v40 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
          v41 = *(void **)(v38 + 2424);
          v71 = 0;
          objc_msgSend(v41, "identifierDetectedInJSONObject:error:", v40, &v71);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v71;
          if (v42)
          {
            objc_msgSend(v70, "identifier");
            v44 = objc_claimAutoreleasedReturnValue();
            if (v42 == (void *)v44)
            {

LABEL_47:
              v11 = v65;
              v57 = (void *)objc_msgSend(v65, "copy");

              v58 = v34;
              v12 = v66;
              v25 = 0;
              goto LABEL_50;
            }
            v45 = (void *)v44;
            objc_msgSend(v70, "identifier");
            v46 = objc_claimAutoreleasedReturnValue();
            if (v46)
            {
              v47 = (void *)v46;
              objc_msgSend(v70, "identifier");
              v48 = v36;
              v49 = v38;
              v50 = v37;
              v51 = v34;
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = objc_msgSend(v42, "isEqual:", v52);

              v34 = v51;
              v37 = v50;
              v38 = v49;
              v36 = v48;

              if ((v69 & 1) != 0)
                goto LABEL_47;
            }
            else
            {

            }
          }
          else
          {
            _HKInitializeLogging();
            v53 = *MEMORY[0x24BDD2FF8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v77 = v43;
              _os_log_impl(&dword_224DAC000, v53, OS_LOG_TYPE_DEFAULT, "invalid resource contained, ignoring: %{public}@", buf, 0xCu);
            }
          }

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
        if (v36)
          continue;
        break;
      }
    }

    v54 = (void *)objc_msgSend(v34, "mutableCopy");
    v55 = v54;
    if (v54)
      v56 = v54;
    else
      v56 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    v58 = v56;
    v25 = 0;
    v11 = v65;

    objc_msgSend(v70, "JSONObject");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addObject:", v59);

    v57 = (void *)objc_msgSend(v68, "newResourceFromResource:containingOnlyResources:error:", v65, v58, v64);
    v12 = v66;
LABEL_50:

  }
LABEL_52:

  return v57;
}

+ (id)newResourceFromResource:(id)a3 containingOnlyResources:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "JSONObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (objc_msgSend(v7, "count"))
  {
    v11 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("contained"));

  }
  else
  {
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("contained"));
  }
  v12 = (void *)MEMORY[0x24BE48978];
  objc_msgSend(v8, "sourceURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "FHIRVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "receivedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v8, "extractionHints");

  objc_msgSend(v12, "resourceObjectWithJSONObject:sourceURL:FHIRVersion:receivedDate:extractionHints:error:", v10, v13, v14, v15, v16, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)resourcesContainedInResource:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "JSONObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("contained"));

  if (v7)
  {
    objc_msgSend(v5, "JSONObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_safeArrayForKeyPath:error:", CFSTR("contained"), a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

+ (id)resourceContainedInResource:(id)a3 reference:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v24;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v26 = a4;
  objc_msgSend(a1, "resourcesContainedInResource:error:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v9;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      v24 = v10;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x24BE48978];
          objc_msgSend(v8, "FHIRVersion");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "receivedDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "resourceObjectWithJSONObject:sourceURL:FHIRVersion:receivedDate:extractionHints:error:", v15, 0, v17, v18, 0, a5);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
            goto LABEL_15;
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(a1, "reference:matchesIdentifier:", v26, v20);

          if (v21)
          {
            v22 = v19;
LABEL_15:

            v10 = v24;
            goto LABEL_16;
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        v19 = 0;
        v10 = v24;
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v19 = 0;
    }
LABEL_16:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)referencesAtKeyPath:(id)a3 resourceDictionary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "hk_hasValueForKeyPath:", v8))
  {
    v20 = 0;
    objc_msgSend(v9, "hk_safeValueForKeyPath:class:error:", v8, objc_opt_class(), &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
    if (v10)
    {
      objc_msgSend(a1, "resourceReferenceInReference:error:", v10, a5);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
      {
        v21[0] = v12;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(v9, "hk_safeArrayForKeyPath:error:", v8, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15;
      if (v15)
      {
        v18[0] = 0;
        v18[1] = v18;
        v18[2] = 0x3032000000;
        v18[3] = __Block_byref_object_copy__5;
        v18[4] = __Block_byref_object_dispose__5;
        v19 = 0;
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __73__HDFHIRReferenceProcessor_referencesAtKeyPath_resourceDictionary_error___block_invoke;
        v17[3] = &unk_24ECF5968;
        v17[4] = v18;
        v17[5] = a1;
        objc_msgSend(v15, "hk_map:", v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        _Block_object_dispose(v18, 8);

        goto LABEL_9;
      }
    }
    v14 = 0;
    goto LABEL_9;
  }
  v14 = (void *)MEMORY[0x24BDBD1A8];
LABEL_10:

  return v14;
}

id __73__HDFHIRReferenceProcessor_referencesAtKeyPath_resourceDictionary_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id obj;

  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "resourceReferenceInReference:error:", a2, &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  return v4;
}

+ (id)resourceReferenceInReference:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a3, "hk_safeStringForKeyPath:error:", CFSTR("reference"), a4);
}

+ (BOOL)reference:(id)a3 matchesIdentifier:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("#")))
  {
    v8 = 1;
    objc_msgSend(v6, "substringFromIndex:", 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v10)
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v6, "substringFromIndex:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "isEqualToString:", v13);

    }
    else
    {
      v8 = 0;
    }
LABEL_12:

    goto LABEL_14;
  }
  if (objc_msgSend(a1, "referenceIsAbsolute:", v6))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v6);
    objc_msgSend(a1, "identifierFromAbsoluteReferenceURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v16 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v16;
  }
  objc_msgSend(v7, "stringValue");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v9)
  {
    objc_msgSend(v7, "stringValue");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v8 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v7, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v11);
    goto LABEL_12;
  }
  v8 = 1;
LABEL_15:

  return v8;
}

+ (BOOL)referenceRequiresContaining:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("#"));
}

+ (BOOL)referenceIsAbsolute:(id)a3
{
  return objc_msgSend(a3, "containsString:", CFSTR("://"));
}

+ (id)identifierForResource:(id)a3 containedInResource:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a3;
  objc_msgSend(a4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifierForContainedResourceWithIdentifier:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)identifierFromAbsoluteReferenceURL:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "pathComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v5 = objc_alloc(MEMORY[0x24BDD3B88]);
    objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v3, "count") - 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "initWithResourceType:identifier:", v6, v7);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
