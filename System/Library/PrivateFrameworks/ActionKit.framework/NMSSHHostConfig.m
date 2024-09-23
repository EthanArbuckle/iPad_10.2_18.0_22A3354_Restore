@implementation NMSSHHostConfig

- (NMSSHHostConfig)init
{
  NMSSHHostConfig *v2;
  NMSSHHostConfig *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NMSSHHostConfig;
  v2 = -[NMSSHHostConfig init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = MEMORY[0x24BDBD1A8];
    -[NMSSHHostConfig setHostPatterns:](v2, "setHostPatterns:", MEMORY[0x24BDBD1A8]);
    -[NMSSHHostConfig setIdentityFiles:](v3, "setIdentityFiles:", v4);
  }
  return v3;
}

- (id)arrayByRemovingDuplicateElementsFromArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v10, (_QWORD)v13) & 1) == 0)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (id)mergedArray:(id)a3 withArray:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "arrayByAddingObjectsFromArray:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSSHHostConfig arrayByRemovingDuplicateElementsFromArray:](self, "arrayByRemovingDuplicateElementsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[NMSSHHostConfig hostPatterns](self, "hostPatterns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hostPatterns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSSHHostConfig mergedArray:withArray:](self, "mergedArray:withArray:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSSHHostConfig setHostPatterns:](self, "setHostPatterns:", v6);

  -[NMSSHHostConfig hostname](self, "hostname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v16, "hostname");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSSHHostConfig setHostname:](self, "setHostname:", v8);

  }
  -[NMSSHHostConfig user](self, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v16, "user");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSSHHostConfig setUser:](self, "setUser:", v10);

  }
  -[NMSSHHostConfig port](self, "port");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v16, "port");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSSHHostConfig setPort:](self, "setPort:", v12);

  }
  -[NMSSHHostConfig identityFiles](self, "identityFiles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identityFiles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSSHHostConfig mergedArray:withArray:](self, "mergedArray:withArray:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSSHHostConfig setIdentityFiles:](self, "setIdentityFiles:", v15);

}

- (NSArray)hostPatterns
{
  return self->_hostPatterns;
}

- (void)setHostPatterns:(id)a3
{
  objc_storeStrong((id *)&self->_hostPatterns, a3);
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
  objc_storeStrong((id *)&self->_hostname, a3);
}

- (NSString)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_storeStrong((id *)&self->_user, a3);
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
  objc_storeStrong((id *)&self->_port, a3);
}

- (NSArray)identityFiles
{
  return self->_identityFiles;
}

- (void)setIdentityFiles:(id)a3
{
  objc_storeStrong((id *)&self->_identityFiles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityFiles, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_hostPatterns, 0);
}

@end
