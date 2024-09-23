@implementation AHFPencilPatternLibrary

- (AHFPencilPatternLibrary)init
{
  AHFPencilPatternLibrary *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSDictionary *library;
  AHFPencilPatternLibrary *v25;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)AHFPencilPatternLibrary;
  v2 = -[AHFPencilPatternLibrary init](&v32, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLsForResourcesWithExtension:subdirectory:", CFSTR("pattern"), CFSTR("Patterns/Pencil"));
    v4 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v4;
    -[AHFPencilPatternLibrary createPatternsLibraryFrom:](v2, "createPatternsLibraryFrom:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LoggingFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v5, "count");
      objc_msgSend(v5, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v34 = "-[AHFPencilPatternLibrary init]";
      v35 = 2048;
      v36 = v7;
      v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_236442000, v6, OS_LOG_TYPE_DEFAULT, "%s Loaded %lu haptics patterns: %@", buf, 0x20u);

    }
    if (isInternalBuild())
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/AppleInternal/Library/Application Support/AppleHIDFeedback/Patterns/Pencil"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, 0, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("pathExtension == %@"), CFSTR("pattern"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "filteredArrayUsingPredicate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AHFPencilPatternLibrary createPatternsLibraryFrom:](v2, "createPatternsLibraryFrom:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __31__AHFPencilPatternLibrary_init__block_invoke;
      v30[3] = &unk_2507CAA28;
      v14 = v13;
      v31 = v14;
      objc_msgSend(v5, "keysOfEntriesPassingTest:", v30);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        LoggingFramework();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[AHFPencilPatternLibrary init].cold.1((uint64_t)v15, v16);

      }
      LoggingFramework();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v12;
        v19 = v11;
        v20 = v9;
        v21 = objc_msgSend(v14, "count");
        objc_msgSend(v14, "allKeys");
        v27 = v10;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v34 = "-[AHFPencilPatternLibrary init]";
        v35 = 2048;
        v36 = v21;
        v9 = v20;
        v11 = v19;
        v12 = v18;
        v37 = 2112;
        v38 = v22;
        _os_log_impl(&dword_236442000, v17, OS_LOG_TYPE_DEFAULT, "%s Loaded %lu internal haptics patterns: %@", buf, 0x20u);

        v10 = v27;
      }

      objc_msgSend(v5, "addEntriesFromDictionary:", v14);
    }
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v5);
    v23 = objc_claimAutoreleasedReturnValue();
    library = v2->_library;
    v2->_library = (NSDictionary *)v23;

    v25 = v2;
  }

  return v2;
}

BOOL __31__AHFPencilPatternLibrary_init__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)waveformIndexWithType:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MicroTap")) & 1) != 0)
  {
    v4 = &unk_2507CBA28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MiniTap")) & 1) != 0)
  {
    v4 = &unk_2507CBA40;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WideTap")))
  {
    v4 = &unk_2507CBA58;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)createPatternsLibraryFrom:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  __int128 v50;
  id v51;
  void *v52;
  uint64_t v53;
  int v54;
  uint64_t v56;
  uint64_t v57;
  NSObject *obj;
  uint64_t v59;
  NSObject *v60;
  NSObject *log;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _OWORD v67[3];
  _QWORD v68[2];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  _BYTE v76[18];
  __int16 v77;
  NSObject *v78;
  __int16 v79;
  NSObject *v80;
  __int16 v81;
  NSObject *v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
  if (v6)
  {
    v8 = v6;
    v62 = *(_QWORD *)v70;
    *(_QWORD *)&v7 = 136316418;
    v50 = v7;
    v51 = v5;
    v52 = v4;
    do
    {
      v9 = 0;
      v59 = v8;
      do
      {
        if (*(_QWORD *)v70 != v62)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v9);
        objc_msgSend(v10, "lastPathComponent", v50);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByDeletingPathExtension");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          LoggingFramework();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
            v75 = 2112;
            *(_QWORD *)v76 = v10;
            _os_log_error_impl(&dword_236442000, v16, OS_LOG_TYPE_ERROR, "%s Could not find a name for pattern in %@", buf, 0x16u);
          }
          goto LABEL_34;
        }
        objc_msgSend(v4, "valueForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          LoggingFramework();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
            v75 = 2112;
            *(_QWORD *)v76 = v12;
            _os_log_impl(&dword_236442000, v14, OS_LOG_TYPE_DEFAULT, "%s Pattern '%@' already exists in library. Overriding", buf, 0x16u);
          }

        }
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v10);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v15)
        {
          LoggingFramework();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
            v75 = 2112;
            *(_QWORD *)v76 = v10;
            _os_log_error_impl(&dword_236442000, v17, OS_LOG_TYPE_ERROR, "%s Could load %@", buf, 0x16u);
          }
          goto LABEL_33;
        }
        -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("Priority"));
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          LoggingFramework();
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
            v75 = 2112;
            *(_QWORD *)v76 = v10;
            _os_log_error_impl(&dword_236442000, log, OS_LOG_TYPE_ERROR, "%s Could not find a 'Priority' in %@", buf, 0x16u);
          }
          goto LABEL_32;
        }
        -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("Timeout"));
        log = objc_claimAutoreleasedReturnValue();
        if (!log)
        {
          LoggingFramework();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
            v75 = 2112;
            *(_QWORD *)v76 = v10;
            _os_log_error_impl(&dword_236442000, v20, OS_LOG_TYPE_ERROR, "%s Could not find a 'Timeout' in %@", buf, 0x16u);
          }
          goto LABEL_31;
        }
        -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("Pattern"));
        v18 = objc_claimAutoreleasedReturnValue();
        v60 = v17;
        if (!v18)
        {
          v20 = 0;
          LoggingFramework();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
            v75 = 2112;
            *(_QWORD *)v76 = v10;
            v22 = v21;
            v23 = "%s Could not find a 'Pattern' in %@";
            goto LABEL_63;
          }
LABEL_30:

          v17 = v60;
          goto LABEL_31;
        }
        v19 = v18;
        if (!-[NSObject count](v18, "count"))
        {
          v20 = v19;
          LoggingFramework();
          v21 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            goto LABEL_30;
LABEL_62:
          *(_DWORD *)buf = 136315394;
          v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
          v75 = 2112;
          *(_QWORD *)v76 = v10;
          v22 = v21;
          v23 = "%s \\Array 'Pattern' is empty in %@";
LABEL_63:
          _os_log_error_impl(&dword_236442000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
          goto LABEL_30;
        }
        if ((unint64_t)-[NSObject count](v19, "count") >= 9)
        {
          v20 = v19;
          LoggingFramework();
          v21 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            goto LABEL_30;
          goto LABEL_62;
        }
        v24 = -[NSObject count](v19, "count");
        memset(v68, 0, 14);
        memset(v67, 0, 47);
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        obj = v19;
        v53 = v24;
        v56 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
        if (!v56)
        {
          v38 = 0;
          goto LABEL_71;
        }
        v25 = 0;
        v57 = *(_QWORD *)v64;
        while (2)
        {
          v26 = 0;
          v54 = v25;
          do
          {
            if (*(_QWORD *)v64 != v57)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v26);
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Type"));
            v28 = objc_claimAutoreleasedReturnValue();
            if (!v28)
            {
              LoggingFramework();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
                v75 = 1024;
                *(_DWORD *)v76 = v54 + v26;
                *(_WORD *)&v76[4] = 2112;
                *(_QWORD *)&v76[6] = v10;
                _os_log_error_impl(&dword_236442000, v29, OS_LOG_TYPE_ERROR, "%s Could not find a 'Type' in asset %u in %@", buf, 0x1Cu);
              }
              goto LABEL_69;
            }
            v29 = v28;
            -[AHFPencilPatternLibrary waveformIndexWithType:](self, "waveformIndexWithType:", v28);
            v30 = objc_claimAutoreleasedReturnValue();
            if (!v30)
            {
              LoggingFramework();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
                v75 = 1024;
                *(_DWORD *)v76 = v54 + v26;
                *(_WORD *)&v76[4] = 2112;
                *(_QWORD *)&v76[6] = v10;
                _os_log_error_impl(&dword_236442000, v39, OS_LOG_TYPE_ERROR, "%s Could not understand 'Type' in asset %u in %@", buf, 0x1Cu);
              }

              goto LABEL_68;
            }
            v31 = (void *)v30;
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Gain"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v32;
            if (!v32)
            {
              LoggingFramework();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
                v75 = 1024;
                *(_DWORD *)v76 = v54 + v26;
                *(_WORD *)&v76[4] = 2112;
                *(_QWORD *)&v76[6] = v10;
                v41 = v40;
                v42 = "%s Could not find a 'Gain' in asset %u in %@";
                goto LABEL_66;
              }
LABEL_67:

LABEL_68:
              v8 = v59;
LABEL_69:

              v38 = (v54 + v26);
              goto LABEL_70;
            }
            if (objc_msgSend(v32, "unsignedIntValue") >= 0x65)
            {
              LoggingFramework();
              v40 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                goto LABEL_67;
              *(_DWORD *)buf = 136315650;
              v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
              v75 = 1024;
              *(_DWORD *)v76 = v54 + v26;
              *(_WORD *)&v76[4] = 2112;
              *(_QWORD *)&v76[6] = v10;
              v41 = v40;
              v42 = "%s Invalid value for 'Gain' in asset %u in %@";
LABEL_66:
              _os_log_error_impl(&dword_236442000, v41, OS_LOG_TYPE_ERROR, v42, buf, 0x1Cu);
              goto LABEL_67;
            }
            if (v24 == 1)
            {
              BYTE4(v68[1]) = objc_msgSend(v31, "unsignedIntValue");
              BYTE5(v68[1]) = objc_msgSend(v33, "unsignedIntValue");
            }
            else
            {
              objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Spacing"));
              v34 = objc_claimAutoreleasedReturnValue();
              if (!v34)
              {
                LoggingFramework();
                v40 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  goto LABEL_67;
                *(_DWORD *)buf = 136315650;
                v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
                v75 = 1024;
                *(_DWORD *)v76 = v54 + v26;
                *(_WORD *)&v76[4] = 2112;
                *(_QWORD *)&v76[6] = v10;
                v41 = v40;
                v42 = "%s Could not find a 'Spacing' in asset %u in %@";
                goto LABEL_66;
              }
              v35 = (void *)v34;
              v36 = (char *)v67 + 4 * (v54 + v26);
              v36[15] = objc_msgSend(v31, "unsignedIntValue");
              v36[16] = objc_msgSend(v33, "unsignedIntValue");
              *(_WORD *)(v36 + 17) = objc_msgSend(v35, "unsignedIntValue");
              v24 = v53;

            }
            ++v26;
            v8 = v59;
          }
          while (v56 != v26);
          v37 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
          v25 = v54 + v26;
          v56 = v37;
          if (v37)
            continue;
          break;
        }
        v38 = (v54 + v26);
LABEL_70:
        v5 = v51;
        v4 = v52;
LABEL_71:

        if (-[NSObject count](obj, "count") == v38)
        {
          if (v53 == 1)
          {
            LOBYTE(v68[0]) = 16;
            *(_QWORD *)((char *)v68 + 1) = 0;
            BYTE1(v68[1]) = -[NSObject unsignedIntValue](v60, "unsignedIntValue");
            WORD1(v68[1]) = -[NSObject unsignedIntValue](log, "unsignedIntValue");
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v68, 14);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_77;
          }
          -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("Num Loops"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v44;
          if (v44 && objc_msgSend(v44, "unsignedIntValue"))
          {
            LOBYTE(v67[0]) = 17;
            *(_QWORD *)((char *)v67 + 1) = 0;
            BYTE9(v67[0]) = -[NSObject unsignedIntValue](v60, "unsignedIntValue");
            WORD5(v67[0]) = -[NSObject unsignedIntValue](log, "unsignedIntValue");
            BYTE12(v67[0]) = -[NSObject count](obj, "count");
            *(_WORD *)((char *)v67 + 13) = objc_msgSend(v43, "unsignedIntValue");
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v67, 47);
            v45 = objc_claimAutoreleasedReturnValue();

            v43 = (void *)v45;
LABEL_77:
            LoggingFramework();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v50;
              v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
              v75 = 2112;
              *(_QWORD *)v76 = v12;
              *(_WORD *)&v76[8] = 2112;
              *(_QWORD *)&v76[10] = v43;
              v77 = 2112;
              v78 = v60;
              v79 = 2112;
              v80 = log;
              v81 = 2112;
              v82 = v16;
              _os_log_debug_impl(&dword_236442000, v46, OS_LOG_TYPE_DEBUG, "%s Correctly added pattern '%@' (%@) to library (priority=%@, timeout=%@): %@", buf, 0x3Eu);
            }

            objc_msgSend(v4, "setValue:forKey:", v43, v12);
          }
          else
          {
            LoggingFramework();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
              v75 = 2112;
              *(_QWORD *)v76 = v10;
              _os_log_error_impl(&dword_236442000, v47, OS_LOG_TYPE_ERROR, "%s Could not find a 'Num Loops' in %@ or number of loops invalid (0)", buf, 0x16u);
            }

            v8 = v59;
          }

        }
        v17 = v60;
        v20 = obj;
LABEL_31:

LABEL_32:
LABEL_33:

LABEL_34:
        ++v9;
      }
      while (v9 != v8);
      v48 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
      v8 = v48;
    }
    while (v48);
  }

  return v4;
}

- (id)getReportForPattern:(id)a3 timestampUs:(unint64_t)a4 prevTimestampUs:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  -[NSDictionary valueForKey:](self->_library, "valueForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    || isInternalBuild()
    && (-[AHFPencilPatternLibrary maybeGetExploratoryPayload:](self, "maybeGetExploratoryPayload:", v10),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = objc_retainAutorelease((id)objc_msgSend(v11, "mutableCopy"));
    v13 = objc_msgSend(v12, "mutableBytes");
    v14 = a4 - a5;
    if ((a4 - a5) >> 3 <= 0x752 && *(_WORD *)(v13 + 10))
    {
      if (a6)
      {
        v15 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Too soon after previous haptic (delta %lluus)"), v14, *MEMORY[0x24BDD0FC8]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.hid.AppleHIDFeedback"), -536870184, v17);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v18 = 0;
    }
    else
    {
      *(_QWORD *)(v13 + 1) = a4;
      v12 = v12;
      v18 = v12;
    }
  }
  else
  {
    if (!a6)
    {
      v18 = 0;
      goto LABEL_13;
    }
    v19 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find pattern %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.hid.AppleHIDFeedback"), -536870206, v12);
    v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_13:
  return v18;
}

- (id)allPatterns
{
  return -[NSDictionary allKeys](self->_library, "allKeys");
}

- (BOOL)isReport:(id)a3 equalTo:(id)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  id v11;

  v6 = a3;
  -[NSDictionary valueForKey:](self->_library, "valueForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (unint64_t)objc_msgSend(v6, "length") >= 0xC)
  {
    v9 = objc_retainAutorelease(v6);
    v10 = objc_msgSend(v9, "bytes");
    v11 = objc_retainAutorelease((id)objc_msgSend(v7, "mutableCopy"));
    *(_QWORD *)(objc_msgSend(v11, "mutableBytes") + 1) = *(_QWORD *)(v10 + 1);
    v8 = objc_msgSend(v9, "isEqualToData:", v11);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)maybeGetExploratoryPayload:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  char v18;
  uint64_t v19;
  char v20;
  __int16 v21;
  char v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = objc_msgSend(&unk_2507CBBF8, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(&unk_2507CBBF8);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "lowercaseString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "hasPrefix:", v10))
        {
          objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v10, "length"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "integerValue");
          if ((unint64_t)(v12 - 101) > 0xFFFFFFFFFFFFFF9BLL)
          {
            v14 = v12;
            -[AHFPencilPatternLibrary waveformIndexWithType:](self, "waveformIndexWithType:", v9);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = 16;
            v19 = 0;
            v20 = 1;
            v21 = 0;
            v22 = objc_msgSend(v15, "unsignedIntValue");
            v23 = v14;
            LoggingFramework();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315906;
              v29 = "-[AHFPencilPatternLibrary maybeGetExploratoryPayload:]";
              v30 = 2112;
              v31 = v4;
              v32 = 2112;
              v33 = v9;
              v34 = 1024;
              v35 = v14;
              _os_log_debug_impl(&dword_236442000, v16, OS_LOG_TYPE_DEBUG, "%s Pattern '%@' is a exploratory '%@' with gain %u", buf, 0x26u);
            }

            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v18, 14);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_15;
          }

        }
      }
      v6 = objc_msgSend(&unk_2507CBBF8, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (NSDictionary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_library, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
}

- (void)init
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[AHFPencilPatternLibrary init]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_236442000, a2, OS_LOG_TYPE_ERROR, "%s The following haptics patterns are being overriden: %@", (uint8_t *)&v2, 0x16u);
}

@end
