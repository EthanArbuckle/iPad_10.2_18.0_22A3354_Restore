@implementation NSURLSessionTaskDependencyTree

- (void)dealloc
{
  const char *v3;
  SEL v4;
  objc_super v5;

  -[NSURLSessionTaskDependencyTree setMainDocumentURL:](self, "setMainDocumentURL:", 0);
  if (self)
  {
    objc_setProperty_nonatomic(self, v3, 0, 16);
    objc_setProperty_nonatomic(self, v4, 0, 24);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSURLSessionTaskDependencyTree;
  -[NSURLSessionTaskDependencyTree dealloc](&v5, sel_dealloc);
}

- (NSURL)mainDocumentURL
{
  return self->_mainDocumentURL;
}

- (void)setMainDocumentURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

+ (id)dependencyTreeDefaultWeb
{
  return 0;
}

+ (NSURLSessionTaskDependencyTree)dependencyTreeWithJSONData:(id)a3 error:(id *)a4
{
  return 0;
}

+ (NSURLSessionTaskDependencyTree)dependencyTreeWithMainDocumentURL:(id)a3 dependencyDescriptions:(id)a4
{
  NSURLSessionTaskDependencyTree *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *dependencies;
  uint64_t v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __NSCFURLSessionTaskDependencyTreeNode *v40;
  void *v41;
  void *v42;
  const char *v43;
  SEL v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSMutableDictionary *v51;
  uint64_t v52;
  uint64_t v53;
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
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(NSURLSessionTaskDependencyTree);
  -[NSURLSessionTaskDependencyTree setMainDocumentURL:](v6, "setMainDocumentURL:", a3);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v6)
    objc_setProperty_nonatomic(v6, v8, v7, 16);
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v68;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v68 != v11)
          objc_enumerationMutation(a4);
        v13 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v12);
        if (v6)
        {
          dependencies = v6->_dependencies;
          if (v13)
            goto LABEL_10;
        }
        else
        {
          dependencies = 0;
          if (v13)
          {
LABEL_10:
            v15 = *(_QWORD *)(v13 + 16);
            goto LABEL_11;
          }
        }
        v15 = 0;
LABEL_11:
        if (-[NSMutableDictionary objectForKeyedSubscript:](dependencies, "objectForKeyedSubscript:", v15))
          goto LABEL_16;
        if (v6)
        {
          v16 = v6->_dependencies;
          if (!v13)
            goto LABEL_21;
        }
        else
        {
          v16 = 0;
          if (!v13)
          {
LABEL_21:
            v17 = 0;
            goto LABEL_15;
          }
        }
        v17 = *(_QWORD *)(v13 + 16);
LABEL_15:
        -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v13, v17);
LABEL_16:
        ++v12;
      }
      while (v10 != v12);
      v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      v10 = v18;
    }
    while (v18);
  }
  if (v6)
    v19 = v6->_dependencies;
  else
    v19 = 0;
  v20 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", -[NSMutableDictionary allValues](v19, "allValues"));
  v21 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v64;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v64 != v24)
          objc_enumerationMutation(v20);
        v26 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v25);
        if (v26)
          v27 = *(_QWORD *)(v26 + 24);
        else
          v27 = 0;
        objc_msgSend(v21, "setObject:forKey:", v26, v27);
        ++v25;
      }
      while (v23 != v25);
      v28 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      v23 = v28;
    }
    while (v28);
  }
  v29 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v30 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v60;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v60 != v32)
          objc_enumerationMutation(v20);
        v34 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v33);
        if (v34)
          v35 = *(_QWORD *)(v34 + 24);
        else
          v35 = 0;
        v36 = (void *)objc_msgSend(v29, "objectForKeyedSubscript:", v35);
        if (!v36)
        {
          v36 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          if (v34)
            v37 = *(_QWORD *)(v34 + 24);
          else
            v37 = 0;
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v36, v37);
        }
        if (v34)
          v38 = *(_QWORD *)(v34 + 16);
        else
          v38 = 0;
        objc_msgSend(v36, "addObject:", v38);
        ++v33;
      }
      while (v31 != v33);
      v39 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      v31 = v39;
    }
    while (v39);
  }
  v40 = objc_alloc_init(__NSCFURLSessionTaskDependencyTreeNode);
  v41 = -[__NSURLSessionTaskDependencyResourceIdentifier initWitURLPath:mimeType:]([__NSURLSessionTaskDependencyResourceIdentifier alloc], CFSTR("/"), 0);
  v42 = (void *)objc_msgSend(v29, "objectForKey:", v41);
  if (v40)
    objc_setProperty_nonatomic(v40, v43, v42, 24);
  objc_msgSend(v21, "removeObjectForKey:", v41);
  if (v6)
  {
    -[__NSCFURLSessionTaskDependencyTreeNode buildTree:parentsToDependencies:parentsToChildren:]((uint64_t)v40, v6->_dependencies, v21, v29);
    objc_setProperty_nonatomic(v6, v44, v40, 24);
  }
  else
  {
    -[__NSCFURLSessionTaskDependencyTreeNode buildTree:parentsToDependencies:parentsToChildren:]((uint64_t)v40, 0, v21, v29);
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v45 = (void *)objc_msgSend(v21, "allValues", 0);
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v56;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v56 != v48)
          objc_enumerationMutation(v45);
        v50 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v49);
        if (v6)
        {
          v51 = v6->_dependencies;
          if (v50)
            goto LABEL_66;
        }
        else
        {
          v51 = 0;
          if (v50)
          {
LABEL_66:
            v52 = *(_QWORD *)(v50 + 16);
            goto LABEL_67;
          }
        }
        v52 = 0;
LABEL_67:
        -[NSMutableDictionary removeObjectForKey:](v51, "removeObjectForKey:", v52);
        ++v49;
      }
      while (v47 != v49);
      v53 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
      v47 = v53;
    }
    while (v53);
  }
  return v6;
}

+ (uint64_t)mimeTypeForURLString:(uint64_t)a1
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  uint64_t v6;

  objc_opt_self();
  v3 = (const __CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a2), "pathExtension");
  if (!v3)
    return 0;
  v4 = copyMIMETypeForExtension(v3);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
  CFRelease(v5);
  return v6;
}

@end
