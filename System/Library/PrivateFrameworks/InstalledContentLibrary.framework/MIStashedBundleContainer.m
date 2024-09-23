@implementation MIStashedBundleContainer

- (NSURL)stashMetadataURL
{
  void *v2;
  void *v3;

  -[MIContainer containerURL](self, "containerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("StashMetadata.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)newStashMetadata
{
  MIStashMetadata *v3;

  v3 = objc_alloc_init(MIStashMetadata);
  -[MIStashedBundleContainer setStashMetadata:](self, "setStashMetadata:", v3);

  -[MIStashedBundleContainer stashMetadata](self, "stashMetadata");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stashMetadataWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  MIStashMetadata *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  id v14;

  -[MIStashedBundleContainer stashMetadata](self, "stashMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIStashedBundleContainer stashMetadata](self, "stashMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = 0;
LABEL_5:
    v10 = (void *)objc_msgSend(v5, "copy");
    v8 = v5;
    goto LABEL_6;
  }
  -[MIStashedBundleContainer stashMetadataURL](self, "stashMetadataURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  +[MIStashMetadata metadataFromURL:error:](MIStashMetadata, "metadataFromURL:error:", v8, &v14);
  v9 = (MIStashMetadata *)objc_claimAutoreleasedReturnValue();
  v7 = v14;

  if (v9)
  {
LABEL_4:
    -[MIStashedBundleContainer setStashMetadata:](self, "setStashMetadata:", v9);

    v5 = v9;
    goto LABEL_5;
  }
  objc_msgSend(v7, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v13 = objc_msgSend(v7, "code");

    if (v13 == 260)
    {
      v9 = objc_alloc_init(MIStashMetadata);
      goto LABEL_4;
    }
  }
  else
  {

  }
  if (a3)
  {
    v7 = objc_retainAutorelease(v7);
    v10 = 0;
    *a3 = v7;
  }
  else
  {
    v10 = 0;
  }
LABEL_6:

  return v10;
}

- (BOOL)saveStashMetadata:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v12;

  v6 = a3;
  -[MIStashedBundleContainer stashMetadataURL](self, "stashMetadataURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v6, "serializeToURL:error:", v7, &v12);
  v9 = v12;
  v10 = v9;
  if (v8)
  {
    -[MIStashedBundleContainer setStashMetadata:](self, "setStashMetadata:", v6);
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease(v9);
  }

  return v8;
}

- (MIStashMetadata)stashMetadata
{
  return self->_stashMetadata;
}

- (void)setStashMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_stashMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stashMetadata, 0);
}

@end
