@implementation CAMTimelapseDiskUtilities

+ (BOOL)hasPendingWork
{
  void *v2;
  void *v3;
  int v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "timelapseDirectoryPathCreateIfNeeded:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  v5 = 0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v2, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;

    if (v8)
    {
      v9 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v13 = v2;
        v14 = 2114;
        v15 = v8;
        _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get contents of %{public}@: %{public}@", buf, 0x16u);
      }

    }
    v5 = objc_msgSend(v7, "count") != 0;

  }
  return v5;
}

+ (id)timelapseDirectoryPathCreateIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D73138], "photoDCIMDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR(".MISC/Timelapse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

  }
  return v5;
}

+ (id)stateFileName
{
  return CFSTR("STATE.TML");
}

+ (id)secondaryStateFileName
{
  return CFSTR("SECONDARY_STATE.TLS");
}

+ (id)timelapseDirectoryPath
{
  return (id)objc_msgSend(a1, "timelapseDirectoryPathCreateIfNeeded:", 1);
}

+ (id)directoryPathForTimelapseUUID:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
    +[CAMTimelapseDiskUtilities timelapseDirectoryPath](CAMTimelapseDiskUtilities, "timelapseDirectoryPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)fileNameForImageFrameIndex:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%ld%@"), CFSTR("FRAME_"), a3, CFSTR(".JPG"));
}

+ (id)fileNameForImageVISIndex:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%ld%@"), CFSTR("FRAME_"), a3, CFSTR(".tvis"));
}

+ (int64_t)frameIndexFromImageFileName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  int64_t v11;
  uint64_t v13;

  v13 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = (void *)MEMORY[0x1DF0B55E8](a1, a2);
  objc_msgSend(a3, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("FRAME_"), "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "scanString:intoString:", v7, 0);

  if (!v8
    || !objc_msgSend(v6, "scanInteger:", &v13)
    || (objc_msgSend(CFSTR(".JPG"), "lowercaseString"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v6, "scanString:intoString:", v9, 0),
        v9,
        !v10)
    || (objc_msgSend(v6, "isAtEnd") & 1) == 0)
  {
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  objc_autoreleasePoolPop(v4);
  v11 = v13;

  return v11;
}

+ (id)timelapseUUIDsOnDisk
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  BOOL v15;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMTimelapseDiskUtilities timelapseDirectoryPath](CAMTimelapseDiskUtilities, "timelapseDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  if (v6)
  {
    v7 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CAMTimelapseDiskUtilities timelapseUUIDsOnDisk].cold.1();

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3, "stringByAppendingPathComponent:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        if (objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v14, &v17))
          v15 = v17 == 0;
        else
          v15 = 1;
        if (!v15)
          objc_msgSend(v2, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v10);
  }

  return v2;
}

+ (id)stateFilePathForTimelapseUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "stateFileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "directoryPathForTimelapseUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readStateForTimelapseUUID:(id)a3 mergeSecondaryState:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "stateFilePathForTimelapseUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMTimelapseState stateWithContentsOfFile:](CAMTimelapseState, "stateWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "readSecondaryStateForTimelapseUUID:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mergeSecondaryState:", v9);

  }
  return v8;
}

+ (BOOL)writeStateToDisk:(id)a3 createDirectoryIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "timelapseUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stateFilePathForTimelapseUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v7, "writeToFile:createDirectoryIfNeeded:", v9, v4);
    if ((v10 & 1) == 0)
    {
      v11 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[CAMTimelapseDiskUtilities writeStateToDisk:createDirectoryIfNeeded:].cold.1();

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)secondaryStateFilePathForTimelapseUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "secondaryStateFileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "directoryPathForTimelapseUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readSecondaryStateForTimelapseUUID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "secondaryStateFilePathForTimelapseUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMNebulaSecondaryState secondaryStateWithContentsOfFile:](CAMNebulaSecondaryState, "secondaryStateWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)writeSecondaryStateToDisk:(id)a3 forTimelapseUUID:(id)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "secondaryStateFilePathForTimelapseUUID:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "writeToFile:", v7);
    if ((v8 & 1) == 0)
    {
      v9 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[CAMTimelapseDiskUtilities writeSecondaryStateToDisk:forTimelapseUUID:].cold.1();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)updateSecondaryStateForTimelapseUUID:(id)a3 withStopReasons:(int64_t)a4 stopTime:(id)a5
{
  id v8;
  id v9;
  CAMNebulaSecondaryState *v10;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "readSecondaryStateForTimelapseUUID:", v9);
  v10 = (CAMNebulaSecondaryState *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    v10 = objc_alloc_init(CAMNebulaSecondaryState);
  -[CAMNebulaSecondaryState addStopReasons:stopTime:](v10, "addStopReasons:stopTime:", a4, v8);
  objc_msgSend(a1, "writeSecondaryStateToDisk:forTimelapseUUID:", v10, v9);

  return v10;
}

+ (id)updateSecondaryStateForMovieWriteAttemptForTimelapseUUID:(id)a3
{
  id v4;
  CAMNebulaSecondaryState *v5;

  v4 = a3;
  objc_msgSend(a1, "readSecondaryStateForTimelapseUUID:", v4);
  v5 = (CAMNebulaSecondaryState *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = objc_alloc_init(CAMNebulaSecondaryState);
  -[CAMNebulaSecondaryState notifyWillAttemptToWriteMovie](v5, "notifyWillAttemptToWriteMovie");
  objc_msgSend(a1, "writeSecondaryStateToDisk:forTimelapseUUID:", v5, v4);

  return v5;
}

+ (id)updateSecondaryStateForTimelapseUUID:(id)a3 forStateReadSuccessfully:(BOOL)a4
{
  id v6;
  CAMNebulaSecondaryState *v7;
  uint64_t v8;

  v6 = a3;
  objc_msgSend(a1, "readSecondaryStateForTimelapseUUID:", v6);
  v7 = (CAMNebulaSecondaryState *)objc_claimAutoreleasedReturnValue();
  if (!v7 && !a4)
    v7 = objc_alloc_init(CAMNebulaSecondaryState);
  if (v7)
  {
    if (a4)
      v8 = 0;
    else
      v8 = -[CAMNebulaSecondaryState failedStateReadAttemptsCount](v7, "failedStateReadAttemptsCount") + 1;
    -[CAMNebulaSecondaryState setFailedStateReadAttemptsCount:](v7, "setFailedStateReadAttemptsCount:", v8);
    objc_msgSend(a1, "writeSecondaryStateToDisk:forTimelapseUUID:", v7, v6);
  }

  return v7;
}

+ (id)readSortedStatesFromDiskMergeSecondaryState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timelapseUUIDsOnDisk");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "readStateForTimelapseUUID:mergeSecondaryState:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_48);

  return v5;
}

uint64_t __73__CAMTimelapseDiskUtilities_readSortedStatesFromDiskMergeSecondaryState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)readFrameFilePathsForTimelapseUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMTimelapseDiskUtilities directoryPathForTimelapseUUID:](CAMTimelapseDiskUtilities, "directoryPathForTimelapseUUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v5, &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  if (v7)
  {
    v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CAMTimelapseDiskUtilities readFrameFilePathsForTimelapseUUID:].cold.1();
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v6;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = v9;
      v19 = v4;
      v20 = v3;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v14 = +[CAMTimelapseDiskUtilities frameIndexFromImageFileName:](CAMTimelapseDiskUtilities, "frameIndexFromImageFileName:", v13);
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v15 = v14;
            objc_msgSend(v5, "stringByAppendingPathComponent:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKey:", v16, v17);

          }
        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v10);
      v4 = v19;
      v3 = v20;
    }
  }

  return v21;
}

+ (id)sortedArrayFromFilePathDictionary:(id)a3 reverse:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  BOOL v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__CAMTimelapseDiskUtilities_sortedArrayFromFilePathDictionary_reverse___block_invoke;
  v20[3] = &__block_descriptor_33_e11_q24__0_8_16l;
  v21 = a4;
  objc_msgSend(v7, "sortedArrayUsingComparator:", v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v11);
  }

  return v6;
}

uint64_t __71__CAMTimelapseDiskUtilities_sortedArrayFromFilePathDictionary_reverse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;

  if (*(_BYTE *)(a1 + 32))
  {
    v3 = a3;
    a3 = a2;
  }
  else
  {
    v3 = a2;
  }
  return objc_msgSend(v3, "compare:", a3);
}

+ (id)dummyFileName
{
  return CFSTR("RESERVED_SPACE.BIN");
}

+ (id)dummyFilePathForTimelapseUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "dummyFileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "directoryPathForTimelapseUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)reserveDummyFileForTimelapseUUID:(id)a3 width:(int64_t)a4 height:(int64_t)a5 useHEVC:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  int v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  FILE *v26;
  FILE *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  id v44;
  id v45;
  char __ptr;
  id v47;
  uint8_t buf[4];
  NSObject *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v6 = a6;
  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  +[CAMTimelapseSettings sharedInstance](CAMTimelapseSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "maxMovieFileLengthForWidth:height:useHEVC:", a4, a5, v6);

  v13 = (void *)MEMORY[0x1E0D731D8];
  NSHomeDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "diskSpaceAvailableForPath:", v14);

  if (v15 < 0 || v12 <= v15)
  {
    objc_msgSend(a1, "dummyFilePathForTimelapseUUID:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "fileExistsAtPath:", v16);

    if (v19)
    {
      v20 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v49 = v16;
        _os_log_impl(&dword_1DB760000, v20, OS_LOG_TYPE_DEFAULT, "Cannot reserve disk space. File already exists at %{public}@", buf, 0xCu);
      }
      v17 = 0;
    }
    else
    {
      objc_msgSend(a1, "directoryPathForTimelapseUUID:", v10);
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      v22 = objc_msgSend(v21, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v20, 1, 0, &v47);
      v23 = v47;

      if (!v22 || v23)
      {
        v24 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v49 = v20;
          _os_log_impl(&dword_1DB760000, v24, OS_LOG_TYPE_DEFAULT, "Failed to create directory %{public}@", buf, 0xCu);
        }

      }
      v25 = objc_retainAutorelease(v16);
      v26 = fopen((const char *)-[NSObject fileSystemRepresentation](v25, "fileSystemRepresentation"), "wb");
      if (v26)
      {
        v27 = v26;
        if (fseek(v26, v12 - 1, 0))
        {
          v28 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v49 = v25;
            _os_log_impl(&dword_1DB760000, v28, OS_LOG_TYPE_DEFAULT, "Failed to seek to end of file %{public}@", buf, 0xCu);
          }

        }
        __ptr = 0;
        if (fwrite(&__ptr, 1uLL, 1uLL, v27) != 1)
        {
          v29 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v49 = v25;
            _os_log_impl(&dword_1DB760000, v29, OS_LOG_TYPE_DEFAULT, "Failed to write byte at end of file %{public}@", buf, 0xCu);
          }

        }
        if (fclose(v27))
        {
          v30 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v49 = v25;
            _os_log_impl(&dword_1DB760000, v30, OS_LOG_TYPE_DEFAULT, "Failed to close file %{public}@", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0;
        objc_msgSend(v31, "attributesOfItemAtPath:error:", v25, &v45);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v45;

        if (!v32 || v23)
        {
          v33 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v49 = v25;
            v50 = 2114;
            v51 = (uint64_t)v23;
            _os_log_impl(&dword_1DB760000, v33, OS_LOG_TYPE_DEFAULT, "Failed to get attribures for file %{public}@ with error %{public}@", buf, 0x16u);
          }

        }
        objc_msgSend(v32, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "longLongValue");
        v17 = v35 == v12;
        if (v35 != v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "fileExistsAtPath:", v25);

          if (v37)
          {

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = 0;
            v39 = objc_msgSend(v38, "removeItemAtPath:error:", v25, &v44);
            v40 = v44;

            if (!v39 || (v23 = 0, v40))
            {
              v41 = os_log_create("com.apple.camera", "Nebula");
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v49 = v25;
                _os_log_impl(&dword_1DB760000, v41, OS_LOG_TYPE_DEFAULT, "Failed to remove file %{public}@", buf, 0xCu);
              }

              v23 = v40;
            }
          }
        }

      }
      else
      {
        v42 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          +[CAMTimelapseDiskUtilities reserveDummyFileForTimelapseUUID:width:height:useHEVC:].cold.1((uint64_t)v25, v42);

        v17 = 0;
      }

    }
  }
  else
  {
    v16 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v49 = v12;
      v50 = 2048;
      v51 = v15;
      _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, "Cannot reserve disk space. %lld bytes needed, %lld available", buf, 0x16u);
    }
    v17 = 0;
  }

  return v17;
}

+ (BOOL)removeDummyFileForTimelapseUUID:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dummyFilePathForTimelapseUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v7 = objc_msgSend(v6, "removeItemAtPath:error:", v3, &v12);
    v8 = v12;

    if (v7)
      v9 = v8 == 0;
    else
      v9 = 0;
    if (!v9)
    {
      v10 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v14 = v3;
        v15 = 2114;
        v16 = v8;
        _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Failed to remove file %{public}@ with error %{public}@", buf, 0x16u);
      }

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (void)timelapseUUIDsOnDisk
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Failed to get contents of directory %{public}@: %{public}@");
  OUTLINED_FUNCTION_1_0();
}

+ (void)writeStateToDisk:createDirectoryIfNeeded:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Failed to write state to disk at path %{public}@ (state %{public}@)");
  OUTLINED_FUNCTION_1_0();
}

+ (void)writeSecondaryStateToDisk:forTimelapseUUID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Failed to write secondary state to disk at path %{public}@ (state %{public}@)");
  OUTLINED_FUNCTION_1_0();
}

+ (void)readFrameFilePathsForTimelapseUUID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Failed to read frame file paths for timelapseUUID %{public}@: %{public}@");
  OUTLINED_FUNCTION_1_0();
}

+ (void)reserveDummyFileForTimelapseUUID:(uint64_t)a1 width:(NSObject *)a2 height:useHEVC:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Cannot open file at %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
