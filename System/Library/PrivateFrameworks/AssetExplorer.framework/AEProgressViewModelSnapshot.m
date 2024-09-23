@implementation AEProgressViewModelSnapshot

- (AEProgressViewModelSnapshot)initWithProgressByIndexPath:(id)a3 dataSourceIdenfitier:(int64_t)a4
{
  id v7;
  AEProgressViewModelSnapshot *v8;
  AEProgressViewModelSnapshot *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PXIndexPathSet *pathsWithProgress;
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AEProgressViewModelSnapshot;
  v8 = -[AEProgressViewModelSnapshot init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_correspondingDataSourceIdentifier = a4;
    if (v7)
    {
      objc_storeStrong((id *)&v8->__progressByIndexPath, a3);
      v10 = objc_alloc_init(MEMORY[0x24BE72758]);
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[NSDictionary keyEnumerator](v9->__progressByIndexPath, "keyEnumerator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            v19 = 0u;
            v20 = 0u;
            PXSimpleIndexPathFromIndexPath();
            v18[0] = v19;
            v18[1] = v20;
            objc_msgSend(v10, "addIndexPath:", v18);
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v13);
      }

      pathsWithProgress = v9->__pathsWithProgress;
      v9->__pathsWithProgress = (PXIndexPathSet *)v10;

    }
  }

  return v9;
}

- (BOOL)hasProgressForIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  __int128 v5;
  _OWORD v7[2];

  -[AEProgressViewModelSnapshot _pathsWithProgress](self, "_pathsWithProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v5;
  LOBYTE(a3) = objc_msgSend(v4, "containsIndexPath:", v7);

  return (char)a3;
}

- (id)progressForIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  void *v5;
  void *v6;
  PXSimpleIndexPath v8;

  -[AEProgressViewModelSnapshot _progressByIndexPath](self, "_progressByIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  PXIndexPathFromSimpleIndexPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5, *(_OWORD *)&v8.dataSourceIdentifier, *(_OWORD *)&v8.item);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)correspondingDataSourceIdentifier
{
  return self->_correspondingDataSourceIdentifier;
}

- (NSDictionary)_progressByIndexPath
{
  return self->__progressByIndexPath;
}

- (PXIndexPathSet)_pathsWithProgress
{
  return self->__pathsWithProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pathsWithProgress, 0);
  objc_storeStrong((id *)&self->__progressByIndexPath, 0);
}

@end
