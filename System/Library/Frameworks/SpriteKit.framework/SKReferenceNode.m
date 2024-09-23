@implementation SKReferenceNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKReferenceNode)init
{
  return -[SKReferenceNode initWithFileNamed:](self, "initWithFileNamed:", &stru_1EA5021F8);
}

- (SKReferenceNode)initWithURL:(NSURL *)url
{
  NSURL *v4;
  SKReferenceNode *v5;
  SKReferenceNode *v6;
  NSURL *referenceURL;
  NSString *referenceFileName;
  SKNode *resolvedNode;
  objc_super v11;

  v4 = url;
  v11.receiver = self;
  v11.super_class = (Class)SKReferenceNode;
  v5 = -[SKNode init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    referenceURL = v5->_referenceURL;
    v5->_referenceURL = 0;

    referenceFileName = v6->_referenceFileName;
    v6->_referenceFileName = 0;

    resolvedNode = v6->_resolvedNode;
    v6->_resolvedNode = 0;

    v6->_hasResolvedURL = 0;
    -[SKReferenceNode setReferenceURL:](v6, "setReferenceURL:", v4);
  }

  return v6;
}

- (SKReferenceNode)initWithFileNamed:(NSString *)fileName
{
  NSString *v4;
  SKReferenceNode *v5;
  SKReferenceNode *v6;
  NSURL *referenceURL;
  NSString *referenceFileName;
  SKNode *resolvedNode;
  objc_super v11;

  v4 = fileName;
  v11.receiver = self;
  v11.super_class = (Class)SKReferenceNode;
  v5 = -[SKNode init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    referenceURL = v5->_referenceURL;
    v5->_referenceURL = 0;

    referenceFileName = v6->_referenceFileName;
    v6->_referenceFileName = 0;

    resolvedNode = v6->_resolvedNode;
    v6->_resolvedNode = 0;

    v6->_hasResolvedURL = 0;
    -[SKReferenceNode setReferenceFileName:](v6, "setReferenceFileName:", v4);
  }

  return v6;
}

- (void)setReferenceFileName:(id)a3
{
  void *v4;
  char v5;
  NSString *v6;
  NSString *referenceFileName;
  SKNode *resolvedNode;
  SKNode *v9;
  id v10;

  v10 = a3;
  -[SKReferenceNode referenceFileName](self, "referenceFileName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (NSString *)objc_msgSend(v10, "copy");
    referenceFileName = self->_referenceFileName;
    self->_referenceFileName = v6;

    resolvedNode = self->_resolvedNode;
    if (resolvedNode)
    {
      -[SKNode removeFromParent](resolvedNode, "removeFromParent");
      v9 = self->_resolvedNode;
      self->_resolvedNode = 0;

    }
    self->_hasResolvedURL = 0;
    -[SKReferenceNode resolveReferenceNode](self, "resolveReferenceNode");
  }

}

- (NSString)referenceFileName
{
  return self->_referenceFileName;
}

- (void)setReferenceURL:(id)a3
{
  void *v4;
  char v5;
  NSURL *v6;
  NSURL *referenceURL;
  SKNode *resolvedNode;
  SKNode *v9;
  id v10;

  v10 = a3;
  -[SKReferenceNode referenceURL](self, "referenceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (NSURL *)objc_msgSend(v10, "copy");
    referenceURL = self->_referenceURL;
    self->_referenceURL = v6;

    resolvedNode = self->_resolvedNode;
    if (resolvedNode)
    {
      -[SKNode removeFromParent](resolvedNode, "removeFromParent");
      v9 = self->_resolvedNode;
      self->_resolvedNode = 0;

    }
    self->_hasResolvedURL = 0;
    -[SKReferenceNode resolveReferenceNode](self, "resolveReferenceNode");
  }

}

- (NSURL)referenceURL
{
  return self->_referenceURL;
}

+ (SKReferenceNode)referenceNodeWithURL:(NSURL *)referenceURL
{
  NSURL *v3;
  void *v4;

  v3 = referenceURL;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:", v3);

  return (SKReferenceNode *)v4;
}

+ (SKReferenceNode)referenceNodeWithFileNamed:(NSString *)fileName
{
  NSString *v3;
  void *v4;

  v3 = fileName;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFileNamed:", v3);

  return (SKReferenceNode *)v4;
}

+ (SKReferenceNode)nodeWithFileNamed:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFileNamed:", v3);

  return (SKReferenceNode *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SKNode *resolvedNode;
  objc_super v6;

  v4 = a3;
  resolvedNode = self->_resolvedNode;
  if (resolvedNode)
    -[SKNode removeFromParent](resolvedNode, "removeFromParent");
  v6.receiver = self;
  v6.super_class = (Class)SKReferenceNode;
  -[SKNode encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_referenceURL, CFSTR("_referenceURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_referenceFileName, CFSTR("_referenceFileName"));
  if (self->_resolvedNode)
    -[SKNode addChild:](self, "addChild:");

}

- (SKReferenceNode)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  SKReferenceNode *v5;
  uint64_t v6;
  NSURL *referenceURL;
  uint64_t v8;
  NSString *referenceFileName;
  SKNode *resolvedNode;
  void *v11;
  objc_super v13;

  v4 = aDecoder;
  v13.receiver = self;
  v13.super_class = (Class)SKReferenceNode;
  v5 = -[SKNode initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_referenceURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    referenceURL = v5->_referenceURL;
    v5->_referenceURL = (NSURL *)v6;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_referenceFileName"));
    v8 = objc_claimAutoreleasedReturnValue();
    referenceFileName = v5->_referenceFileName;
    v5->_referenceFileName = (NSString *)v8;

    resolvedNode = v5->_resolvedNode;
    v5->_resolvedNode = 0;

    v5->_hasResolvedURL = 0;
    if (v5->_referenceFileName || v5->_referenceURL)
    {
      -[SKNode scene](v5, "scene");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        -[SKReferenceNode resolveReferenceNode](v5, "resolveReferenceNode");
    }
  }

  return v5;
}

- (id)_resolveReferenceNode
{
  id *p_resolvedNode;
  id v4;
  NSURL *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSString *referenceFileName;
  NSString *v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  p_resolvedNode = (id *)&self->_resolvedNode;
  if (self->_resolvedNode)
  {
    -[SKNode removeChild:](self, "removeChild:");
    v4 = *p_resolvedNode;
    *p_resolvedNode = 0;

  }
  v5 = self->_referenceURL;
  if (v5)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 1, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v31 = 0;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v6, &v31);
      v8 = v31;
      objc_msgSend(v7, "setRequiresSecureCoding:", 0);
      objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *p_resolvedNode;
      *p_resolvedNode = (id)v9;

      objc_msgSend(v7, "finishDecoding");
      v11 = (void *)v6;
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  referenceFileName = self->_referenceFileName;
  if (referenceFileName)
  {
    if (-[NSString isAbsolutePath](referenceFileName, "isAbsolutePath"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self->_referenceFileName);
      v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_4;
      goto LABEL_15;
    }
    v13 = self->_referenceFileName;
    if (v13 && -[NSString length](v13, "length"))
    {
      v14 = self->_referenceFileName;
      -[NSString pathExtension](v14, "pathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      if (!v16)
      {
        -[NSString stringByAppendingPathExtension:](v14, "stringByAppendingPathExtension:", CFSTR("sks"));
        v17 = objc_claimAutoreleasedReturnValue();

        v14 = (NSString *)v17;
      }
      SKGetResourceBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URLForResource:withExtension:", v14, 0);
      v5 = (NSURL *)objc_claimAutoreleasedReturnValue();

      if (v5)
        goto LABEL_4;
LABEL_15:
      v11 = 0;
      goto LABEL_17;
    }
  }
  v11 = 0;
  v5 = 0;
LABEL_17:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (void *)objc_opt_new();
    objc_msgSend(*p_resolvedNode, "children");
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v24, "removeFromParent", (_QWORD)v27);
          objc_msgSend(v19, "addChild:", v24);
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v21);
    }

    objc_storeStrong(p_resolvedNode, v19);
    -[SKNode addChild:](self, "addChild:", *p_resolvedNode);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SKNode addChild:](self, "addChild:", *p_resolvedNode);
  }
  self->_hasResolvedURL = 1;
  -[SKReferenceNode didLoadReferenceNode:](self, "didLoadReferenceNode:", *p_resolvedNode, (_QWORD)v27);
  v25 = *p_resolvedNode;

  return v25;
}

- (void)resolveReferenceNode
{
  id v2;

  v2 = -[SKReferenceNode _resolveReferenceNode](self, "_resolveReferenceNode");
}

- (void)resolveNodeFromArchiveData:(id)a3
{
  id v4;
  id *p_resolvedNode;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_resolvedNode = (id *)&self->_resolvedNode;
  if (self->_resolvedNode)
  {
    -[SKNode removeChild:](self, "removeChild:");
    v6 = *p_resolvedNode;
    *p_resolvedNode = 0;

  }
  if (v4)
  {
    v21 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, &v21);
    v8 = v21;
    objc_msgSend(v7, "setRequiresSecureCoding:", 0);
    objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *p_resolvedNode;
    *p_resolvedNode = (id)v9;

    objc_msgSend(v7, "finishDecoding");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(*p_resolvedNode, "children");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v16, "removeFromParent", (_QWORD)v17);
          objc_msgSend(v11, "addChild:", v16);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v13);
    }

    objc_storeStrong((id *)&self->_resolvedNode, v11);
    -[SKNode addChild:](self, "addChild:", *p_resolvedNode);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SKNode addChild:](self, "addChild:", *p_resolvedNode);
  }
  self->_hasResolvedURL = 1;
  -[SKReferenceNode didLoadReferenceNode:](self, "didLoadReferenceNode:", *p_resolvedNode, (_QWORD)v17);

}

- (id)resolvedNode
{
  id v3;

  if (!self->_hasResolvedURL)
    v3 = -[SKReferenceNode _resolveReferenceNode](self, "_resolveReferenceNode");
  return self->_resolvedNode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SKNode *resolvedNode;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  resolvedNode = self->_resolvedNode;
  if (resolvedNode)
    -[SKNode removeFromParent](resolvedNode, "removeFromParent");
  v10.receiver = self;
  v10.super_class = (Class)SKReferenceNode;
  v6 = -[SKNode copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SKReferenceNode referenceURL](self, "referenceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReferenceURL:", v7);

  -[SKReferenceNode referenceFileName](self, "referenceFileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReferenceFileName:", v8);

  if (self->_resolvedNode)
    -[SKNode addChild:](self, "addChild:");
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedNode, 0);
  objc_storeStrong((id *)&self->_referenceFileName, 0);
  objc_storeStrong((id *)&self->_referenceURL, 0);
}

@end
