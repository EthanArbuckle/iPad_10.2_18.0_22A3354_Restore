@implementation MSASPendingChanges

- (MSASPendingChanges)initWithSyncedKeyValueChangesForAlbumGUIDS:(id)a3 albumChanges:(id)a4 accessControlChangesForAlbumGUIDS:(id)a5
{
  id v8;
  id v9;
  id v10;
  MSASPendingChanges *v11;
  uint64_t v12;
  NSMutableSet *pendingAlbumGUIDsWithKeyValueChanges;
  uint64_t v14;
  NSMutableSet *pendingAlbumChanges;
  uint64_t v16;
  NSMutableDictionary *pendingAlbumGUIDToAssetCollections;
  uint64_t v18;
  NSMutableSet *pendingAlbumGUIDsWithSharingInfoChanges;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MSASPendingChanges;
  v11 = -[MSASPendingChanges init](&v21, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    pendingAlbumGUIDsWithKeyValueChanges = v11->_pendingAlbumGUIDsWithKeyValueChanges;
    v11->_pendingAlbumGUIDsWithKeyValueChanges = (NSMutableSet *)v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v9, "count"));
    v14 = objc_claimAutoreleasedReturnValue();
    pendingAlbumChanges = v11->_pendingAlbumChanges;
    v11->_pendingAlbumChanges = (NSMutableSet *)v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
    v16 = objc_claimAutoreleasedReturnValue();
    pendingAlbumGUIDToAssetCollections = v11->_pendingAlbumGUIDToAssetCollections;
    v11->_pendingAlbumGUIDToAssetCollections = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v10);
    v18 = objc_claimAutoreleasedReturnValue();
    pendingAlbumGUIDsWithSharingInfoChanges = v11->_pendingAlbumGUIDsWithSharingInfoChanges;
    v11->_pendingAlbumGUIDsWithSharingInfoChanges = (NSMutableSet *)v18;

  }
  return v11;
}

- (void)removePendingKeyValueChangesForAlbumGUID:(id)a3
{
  id v4;
  int v5;
  MSASPendingChanges *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSMutableSet removeObject:](self->_pendingAlbumGUIDsWithKeyValueChanges, "removeObject:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not remove pending key value changes for album with nil GUID.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)addPendingChangesForAlbumGUID:(id)a3
{
  id v4;
  int v5;
  MSASPendingChanges *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSMutableSet addObject:](self->_pendingAlbumChanges, "addObject:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not add pending changes for album with nil GUID.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)removePendingChangesForAlbumGUID:(id)a3
{
  id v4;
  int v5;
  MSASPendingChanges *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSMutableSet removeObject:](self->_pendingAlbumChanges, "removeObject:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not remove pending changes for album with nil GUID.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)addPendingAssetCollectionChanges:(id)a3 forAlbumGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  MSASPendingChanges *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_pendingAlbumGUIDToAssetCollections, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__MSASPendingChanges_addPendingAssetCollectionChanges_forAlbumGUID___block_invoke;
  v10[3] = &unk_1E95BCFE8;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  if (v7)
  {
    -[NSMutableDictionary setObject:forKey:](self->_pendingAlbumGUIDToAssetCollections, "setObject:forKey:", v9, v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not add pending asset collection changes for album with nil GUID.", buf, 0xCu);
  }

}

- (void)removePendingAssetCollection:(id)a3 forAlbumGUID:(id)a4
{
  id v6;
  NSMutableDictionary *pendingAlbumGUIDToAssetCollections;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  int v13;
  MSASPendingChanges *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  pendingAlbumGUIDToAssetCollections = self->_pendingAlbumGUIDToAssetCollections;
  v8 = a3;
  -[NSMutableDictionary objectForKey:](pendingAlbumGUIDToAssetCollections, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "GUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = 138543362;
      v14 = self;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not remove pending asset collection with nil GUID.", (uint8_t *)&v13, 0xCu);
      if (!v6)
        goto LABEL_10;
    }
    else if (!v6)
    {
      goto LABEL_10;
    }
LABEL_6:
    v11 = objc_msgSend(v9, "count");
    v12 = self->_pendingAlbumGUIDToAssetCollections;
    if (v11)
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v9, v6);
    else
      -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v6);
    goto LABEL_12;
  }
  objc_msgSend(v9, "removeObject:", v10);
  if (v6)
    goto LABEL_6;
LABEL_10:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = 138543362;
    v14 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not remove pending asset collections for album with nil GUID.", (uint8_t *)&v13, 0xCu);
  }
LABEL_12:

}

- (void)removePendingSharingInfoChangesForAlbumGUID:(id)a3
{
  id v4;
  int v5;
  MSASPendingChanges *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSMutableSet removeObject:](self->_pendingAlbumGUIDsWithSharingInfoChanges, "removeObject:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not remove pending sharing info changes for album with nil GUID.", (uint8_t *)&v5, 0xCu);
  }

}

- (BOOL)hasPendingChanges
{
  return -[NSMutableSet count](self->_pendingAlbumGUIDsWithKeyValueChanges, "count")
      || -[NSMutableSet count](self->_pendingAlbumChanges, "count")
      || -[NSMutableSet count](self->_pendingAlbumGUIDsWithSharingInfoChanges, "count")
      || -[NSMutableDictionary count](self->_pendingAlbumGUIDToAssetCollections, "count") != 0;
}

- (NSMutableSet)pendingAlbumGUIDsWithKeyValueChanges
{
  return self->_pendingAlbumGUIDsWithKeyValueChanges;
}

- (void)setPendingAlbumGUIDsWithKeyValueChanges:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAlbumGUIDsWithKeyValueChanges, a3);
}

- (NSMutableSet)pendingAlbumChanges
{
  return self->_pendingAlbumChanges;
}

- (void)setPendingAlbumChanges:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAlbumChanges, a3);
}

- (NSMutableSet)pendingAlbumGUIDsWithSharingInfoChanges
{
  return self->_pendingAlbumGUIDsWithSharingInfoChanges;
}

- (void)setPendingAlbumGUIDsWithSharingInfoChanges:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAlbumGUIDsWithSharingInfoChanges, a3);
}

- (NSMutableDictionary)pendingAlbumGUIDToAssetCollections
{
  return self->_pendingAlbumGUIDToAssetCollections;
}

- (void)setPendingAlbumGUIDToAssetCollections:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAlbumGUIDToAssetCollections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAlbumGUIDToAssetCollections, 0);
  objc_storeStrong((id *)&self->_pendingAlbumGUIDsWithSharingInfoChanges, 0);
  objc_storeStrong((id *)&self->_pendingAlbumChanges, 0);
  objc_storeStrong((id *)&self->_pendingAlbumGUIDsWithKeyValueChanges, 0);
}

void __68__MSASPendingChanges_addPendingAssetCollectionChanges_forAlbumGUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "GUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
