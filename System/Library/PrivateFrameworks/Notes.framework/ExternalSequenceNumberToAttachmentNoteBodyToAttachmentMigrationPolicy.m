@implementation ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy

- (id)unarchiveObjectWithExternalRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA366B8]();
  v22 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v22);
  v6 = v22;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy unarchiveObjectWithExternalRepresentation:].cold.1((uint64_t)v6, v7);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(MEMORY[0x1E0D460C0], "supportedArchivedClassNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v5, "setClass:forClassName:", objc_opt_class(), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v10);
  }

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, *MEMORY[0x1E0CB2CD0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "finishDecoding");
  objc_autoreleasePoolPop(v4);

  return v16;
}

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  char **v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  IMP MethodImplementation;
  int v34;
  BOOL v35;
  void *v36;
  uint64_t v38;
  id v39;
  id obj;
  id v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v42 = a4;
  v43 = a5;
  v44 = v9;
  objc_msgSend(v9, "valueForKey:", CFSTR("externalRepresentation"));
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy unarchiveObjectWithExternalRepresentation:](self, "unarchiveObjectWithExternalRepresentation:", v38);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EF8FD580)
      && objc_msgSend(v11, "conformsToProtocol:", &unk_1EF905F60))
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v50 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v16, "contentID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "length") == 0;

              if (!v18)
                objc_msgSend(v10, "addObject:", v16);
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        }
        while (v13);
      }

    }
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v43, "destinationContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      obj = v10;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v20)
      {
        v21 = &selRef_hasMultipleEnabledStores;
        v22 = *(_QWORD *)v46;
        while (2)
        {
          v23 = 0;
          v24 = v21[37];
          do
          {
            if (*(_QWORD *)v46 != v22)
              objc_enumerationMutation(obj);
            v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v23);
            objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("NoteAttachment"), v19, v38);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "contentID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setValue:forKey:", v27, CFSTR("contentID"));

            objc_msgSend(v25, "preferredFilename");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              objc_msgSend(v26, "setValue:forKey:", v28, CFSTR("filename"));
            }
            else
            {
              objc_msgSend(v25, "filename");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setValue:forKey:", v29, CFSTR("filename"));

            }
            objc_msgSend(v25, "mimeType");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setValue:forKey:", v30, CFSTR("mimeType"));

            objc_msgSend(v25, "regularFileContents");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (objc_class *)objc_opt_class();
            MethodImplementation = class_getMethodImplementation(v32, v24);
            if ((((uint64_t (*)(void *, const char *, void *, id *))MethodImplementation)(v26, v24, v31, a6) & 1) == 0)
            {

              v34 = 0;
              goto LABEL_30;
            }
            objc_msgSend(v43, "associateSourceInstance:withDestinationInstance:forEntityMapping:", v44, v26, v42);

            ++v23;
          }
          while (v20 != v23);
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          v21 = &selRef_hasMultipleEnabledStores;
          if (v20)
            continue;
          break;
        }
      }
      v34 = 1;
LABEL_30:

    }
    else
    {
      v34 = 1;
    }

    v35 = v34 != 0;
  }
  else
  {
    v35 = 1;
  }
  objc_msgSend(v44, "managedObjectContext", v38);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "refreshObject:mergeChanges:", v44, 0);

  return v35;
}

- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(a4, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceInstancesForEntityMappingNamed:destinationInstances:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "valueForKey:", CFSTR("owner"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destinationInstancesForEntityMappingNamed:sourceInstances:", CFSTR("NoteToNote"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v9, "setValue:forKey:", v18, CFSTR("note"));
  }
  else if (a6)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "valueForKey:", CFSTR("contentID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Can't find destination note for attachment with CID: %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0D64170];
    v26 = *MEMORY[0x1E0D64178];
    v27 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 100, v24);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v18 != 0;
}

- (BOOL)endEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  id v30;
  id v31;
  id obj;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *context;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  objc_super v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v55.receiver = self;
  v55.super_class = (Class)ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy;
  v30 = a3;
  v31 = a4;
  v29 = a5;
  if (-[NSEntityMigrationPolicy endEntityMapping:manager:error:](&v55, sel_endEntityMapping_manager_error_, v30))
  {
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy_;
    v53 = __Block_byref_object_dispose_;
    v54 = 0;
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __104__ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy_endEntityMapping_manager_error___block_invoke;
    v48[3] = &unk_1E81EACE0;
    v48[4] = &v49;
    v26 = (void *)MEMORY[0x1CAA36838](v48);
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("NoteAttachment"));
    objc_msgSend(v31, "destinationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executeFetchRequest:error:", v28, a5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
      goto LABEL_34;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v27;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    if (v8)
    {
      v34 = *(_QWORD *)v45;
      do
      {
        v9 = 0;
        v35 = v8;
        do
        {
          if (*(_QWORD *)v45 != v34)
            objc_enumerationMutation(obj);
          v38 = v9;
          v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v9);
          context = (void *)MEMORY[0x1CAA366B8]();
          objc_msgSend(v10, "valueForKeyPath:", CFSTR("note.body.externalRepresentation"));
          v11 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v11;
          if (v11)
          {
            -[ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy unarchiveObjectWithExternalRepresentation:](self, "unarchiveObjectWithExternalRepresentation:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)objc_msgSend(v12, "mutableCopy");
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v13 = v12;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
            if (v14)
            {
              v15 = 0;
              v16 = *(_QWORD *)v41;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v41 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v18, "contentID");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v10, "valueForKey:", CFSTR("contentID"));
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = objc_msgSend(v19, "isEqual:", v20);

                    if (v21)
                    {
                      objc_msgSend(v39, "removeObject:", v18);
                      v15 = 1;
                    }
                  }
                }
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
              }
              while (v14);

              if ((v15 & 1) != 0)
              {
                if (objc_msgSend(v39, "count"))
                {
                  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v39, 1, 0);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v22 = 0;
                }
                objc_msgSend(v10, "setValue:forKeyPath:", v22, CFSTR("note.body.externalRepresentation"));

              }
            }
            else
            {

            }
          }

          objc_autoreleasePoolPop(context);
          v9 = v38 + 1;
        }
        while (v38 + 1 != v35);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      }
      while (v8);
    }

    v23 = (void *)v50[5];
    if (!v23)
    {
      v24 = 1;
      goto LABEL_36;
    }
    if (v29)
    {
      v24 = 0;
      *v29 = objc_retainAutorelease(v23);
    }
    else
    {
LABEL_34:
      v24 = 0;
    }
LABEL_36:

    _Block_object_dispose(&v49, 8);
    goto LABEL_37;
  }
  v24 = 0;
LABEL_37:

  return v24;
}

void __104__ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy_endEntityMapping_manager_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0D64170];
  v11 = *MEMORY[0x1E0D64178];
  v12[0] = a2;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a2;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 100, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)unarchiveObjectWithExternalRepresentation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C88D8000, a2, OS_LOG_TYPE_ERROR, "Error creating unarchiver: %@", (uint8_t *)&v2, 0xCu);
}

@end
