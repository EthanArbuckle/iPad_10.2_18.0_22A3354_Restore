@implementation NoteAttachmentObject

+ (id)attachmentDirectoryURLForAttachmentObjectID:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "attachmentDirectoryPathForAttachmentObjectID:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)attachmentDirectoryPathForAttachmentObjectID:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;

  v4 = a3;
  NoteContextRootDirectoryPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("attachments"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URIRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "absoluteString");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v9 = (__CFString *)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8, 0, CFSTR("/"), 0x8000100u);
  objc_msgSend(v6, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)persistAttachmentData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  char v15;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  NoteAttachmentObjectDataBasePath(self, (uint64_t)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && ((objc_msgSend(v7, "fileExistsAtPath:", v8) & 1) != 0
     || objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, a4)))
  {
    NoteAttachmentObjectDataPath(self, (uint64_t)a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      && (!objc_msgSend(v7, "fileExistsAtPath:", v9)
       || objc_msgSend(v7, "removeItemAtPath:error:", v9, a4)))
    {
      +[NoteContext fileProtectionOption](NoteContext, "fileProtectionOption");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = DataWritingOptionForFileProtectionOption(v10);
      v12 = objc_alloc(MEMORY[0x1E0C99D50]);
      v13 = objc_retainAutorelease(v6);
      v14 = (void *)objc_msgSend(v12, "initWithBytes:length:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
      v15 = objc_msgSend(v14, "writeToFile:options:error:", v9, v11, a4);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)attachmentDataFileURLWithError:(id *)a3
{
  void *v3;
  void *v4;

  NoteAttachmentObjectDataPath(self, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)attachmentDataWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[NoteAttachmentObject attachmentDataFileURLWithError:](self, "attachmentDataFileURLWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 0, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)prepareForDeletion
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id v11;
  objc_super v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v16 = 0;
  NoteAttachmentObjectDataPath(self, (uint64_t)&v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  v15 = v5;
  NoteAttachmentObjectDataBasePath(self, (uint64_t)&v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;

  if (v4)
  {
    v14 = v7;
    v8 = objc_msgSend(v3, "removeItemAtPath:error:", v4, &v14);
    v9 = v14;

    v7 = v9;
    if ((v8 & 1) != 0)
    {
      if (v6)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else
  {
    v9 = v7;
  }
  NSLog(CFSTR("Can't remove attachment data at path: %@, error: %@"), v4, v7);
  if (v6)
  {
LABEL_4:
    v13 = v9;
    v10 = objc_msgSend(v3, "removeItemAtPath:error:", v6, &v13);
    v11 = v13;

    v9 = v11;
    if ((v10 & 1) != 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_8:
  v11 = v9;
LABEL_9:
  NSLog(CFSTR("Can't remove attachment folder at path: %@, error: %@"), v6, v9);
LABEL_10:
  v12.receiver = self;
  v12.super_class = (Class)NoteAttachmentObject;
  -[NoteAttachmentObject prepareForDeletion](&v12, sel_prepareForDeletion);

}

+ (BOOL)migrateAttachmentRelatedFilesInContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("NoteAttachment"));
  objc_msgSend(v6, "executeFetchRequest:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (!objc_msgSend(a1, "migrateFileForAttachment:toCurrentAttachmentPathWithError:", v15, a4, (_QWORD)v18)|| !objc_msgSend(a1, "applyFileAttributesForAttachment:error:", v15, a4))
          {
            v16 = 0;
            goto LABEL_15;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v16 = 1;
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v16 = 1;
    }
LABEL_15:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)migrateFileForAttachment:(id)a3 toCurrentAttachmentPathWithError:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v17;

  v5 = a3;
  NoteAttachmentObjectDataPathBetween12A173And12A189(v5, (uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v17 = 0;
    v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    if (objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v6, &v17))
      v8 = v17 == 0;
    else
      v8 = 0;
    if (!v8)
    {
LABEL_6:
      LOBYTE(v9) = 1;
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "moveItemAtPath:toPath:error:", v6, v13, a4) & 1) != 0)
    {
      NoteAttachmentObjectDataBasePath(v5, (uint64_t)a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14
        && objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, a4))
      {
        NoteAttachmentObjectDataPath(v5, (uint64_t)a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v9 = objc_msgSend(v7, "moveItemAtPath:toPath:error:", v13, v15, a4);

          if (!v9)
            goto LABEL_17;
          goto LABEL_6;
        }
        v14 = 0;
      }

    }
    LOBYTE(v9) = 0;
    goto LABEL_17;
  }
  LOBYTE(v9) = 0;
LABEL_18:

  return v9;
}

+ (BOOL)applyFileAttributesForAttachment:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  char v14;
  id v15;
  void *v16;
  id v18;
  id v19;
  id v20;
  id v21;

  v21 = 0;
  NoteAttachmentObjectDataPath(a3, (uint64_t)&v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;
  if (!v5)
  {
    v13 = 0;
    if (!a4)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v8 = *MEMORY[0x1E0C99938];
  v19 = 0;
  v9 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v20, v8, &v19);
  v10 = v20;
  v11 = v19;

  if (v9)
  {
    +[NoteContext fileURLProtectionOption](NoteContext, "fileURLProtectionOption");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_msgSend(v10, "isEqualToString:", v12) & 1) == 0)
    {
      v18 = v11;
      v14 = objc_msgSend(v7, "setResourceValue:forKey:error:", v12, v8, &v18);
      v15 = v18;

      if ((v14 & 1) != 0)
      {
        v13 = 1;
      }
      else
      {
        objc_msgSend(v7, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Can't set data protection class for attachment at path: %@, error: %@"), v16, v15);

        v13 = 0;
      }
      v11 = v15;
    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    objc_msgSend(v7, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Can't get data protection class for attachment at path: %@, error: %@"), v12, v11);
    v13 = 0;
  }

  v6 = v11;
  if (a4)
LABEL_14:
    *a4 = objc_retainAutorelease(v6);
LABEL_15:

  return v13;
}

@end
