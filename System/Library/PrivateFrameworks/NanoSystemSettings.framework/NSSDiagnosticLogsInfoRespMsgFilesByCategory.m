@implementation NSSDiagnosticLogsInfoRespMsgFilesByCategory

- (id)filesTypeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_24CB9F5B8[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFilesType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FilesTypeDiagnosticLogs")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FilesTypeSysdiagnoseLogs")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FilesTypeScreenshots")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FilesTypeScreenCaptures")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)clearFilePaths
{
  -[NSMutableArray removeAllObjects](self->_filePaths, "removeAllObjects");
}

- (void)addFilePaths:(id)a3
{
  id v4;
  NSMutableArray *filePaths;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  filePaths = self->_filePaths;
  v8 = v4;
  if (!filePaths)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_filePaths;
    self->_filePaths = v6;

    v4 = v8;
    filePaths = self->_filePaths;
  }
  -[NSMutableArray addObject:](filePaths, "addObject:", v4);

}

- (unint64_t)filePathsCount
{
  return -[NSMutableArray count](self->_filePaths, "count");
}

- (id)filePathsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_filePaths, "objectAtIndex:", a3);
}

+ (Class)filePathsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NSSDiagnosticLogsInfoRespMsgFilesByCategory;
  -[NSSDiagnosticLogsInfoRespMsgFilesByCategory description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSDiagnosticLogsInfoRespMsgFilesByCategory dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  NSString *directoryPath;
  NSMutableArray *filePaths;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_filesType - 1;
  if (v4 >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_filesType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24CB9F5B8[v4];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("filesType"));

  directoryPath = self->_directoryPath;
  if (directoryPath)
    objc_msgSend(v3, "setObject:forKey:", directoryPath, CFSTR("directoryPath"));
  filePaths = self->_filePaths;
  if (filePaths)
    objc_msgSend(v3, "setObject:forKey:", filePaths, CFSTR("filePaths"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSSDiagnosticLogsInfoRespMsgFilesByCategoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_filePaths;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  v4[6] = self->_filesType;
  v9 = v4;
  objc_msgSend(v4, "setDirectoryPath:", self->_directoryPath);
  if (-[NSSDiagnosticLogsInfoRespMsgFilesByCategory filePathsCount](self, "filePathsCount"))
  {
    objc_msgSend(v9, "clearFilePaths");
    v5 = -[NSSDiagnosticLogsInfoRespMsgFilesByCategory filePathsCount](self, "filePathsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NSSDiagnosticLogsInfoRespMsgFilesByCategory filePathsAtIndex:](self, "filePathsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addFilePaths:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_filesType;
  v6 = -[NSString copyWithZone:](self->_directoryPath, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_filePaths;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v5, "addFilePaths:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *directoryPath;
  NSMutableArray *filePaths;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_filesType == *((_DWORD *)v4 + 6)
    && ((directoryPath = self->_directoryPath, !((unint64_t)directoryPath | v4[1]))
     || -[NSString isEqual:](directoryPath, "isEqual:")))
  {
    filePaths = self->_filePaths;
    if ((unint64_t)filePaths | v4[2])
      v7 = -[NSMutableArray isEqual:](filePaths, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = 2654435761 * self->_filesType;
  v4 = -[NSString hash](self->_directoryPath, "hash");
  return v4 ^ -[NSMutableArray hash](self->_filePaths, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_filesType = *((_DWORD *)v4 + 6);
  if (*((_QWORD *)v4 + 1))
    -[NSSDiagnosticLogsInfoRespMsgFilesByCategory setDirectoryPath:](self, "setDirectoryPath:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NSSDiagnosticLogsInfoRespMsgFilesByCategory addFilePaths:](self, "addFilePaths:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (int)filesType
{
  return self->_filesType;
}

- (void)setFilesType:(int)a3
{
  self->_filesType = a3;
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

- (void)setDirectoryPath:(id)a3
{
  objc_storeStrong((id *)&self->_directoryPath, a3);
}

- (NSMutableArray)filePaths
{
  return self->_filePaths;
}

- (void)setFilePaths:(id)a3
{
  objc_storeStrong((id *)&self->_filePaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePaths, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
}

@end
