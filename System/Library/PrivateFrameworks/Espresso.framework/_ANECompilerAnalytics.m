@implementation _ANECompilerAnalytics

+ (id)new
{
  return 0;
}

+ (id)objectWithBuffer:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBuffer:", v4);

  return v5;
}

- (id)stringForAnalyticsType:(unsigned int)a3
{
  if (a3 > 0x10)
    return CFSTR("Invalid");
  else
    return (id)*((_QWORD *)&off_1E2DD7D08 + a3);
}

- (unint64_t)offsetTableAt:(unint64_t)a3 count:(unsigned int)a4
{
  void *v7;
  unint64_t v8;
  id v10;
  uint64_t v11;

  -[_ANECompilerAnalytics bufferSizeInBytes](self, "bufferSizeInBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongValue");

  if (a3 + 8 * a4 > v8)
    return 0;
  -[_ANECompilerAnalytics analyticsBuffer](self, "analyticsBuffer");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "bytes");

  return (unint64_t *)(v11 + a3);
}

- (_AnalyticsProcedureInfo)procedureInfoAt:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  id v8;
  uint64_t v9;

  -[_ANECompilerAnalytics bufferSizeInBytes](self, "bufferSizeInBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongValue");

  if (a3 + 48 > v6)
    return 0;
  -[_ANECompilerAnalytics analyticsBuffer](self, "analyticsBuffer");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "bytes");

  return (_AnalyticsProcedureInfo *)(v9 + a3);
}

- (_AnalyticsGroupInfo)groupInfoAt:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  id v8;
  uint64_t v9;

  -[_ANECompilerAnalytics bufferSizeInBytes](self, "bufferSizeInBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongValue");

  if (a3 + 32 > v6)
    return 0;
  -[_ANECompilerAnalytics analyticsBuffer](self, "analyticsBuffer");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "bytes");

  return (_AnalyticsGroupInfo *)(v9 + a3);
}

- (_AnalyticsLayerInfo)layerInfoAt:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  id v8;
  uint64_t v9;

  -[_ANECompilerAnalytics bufferSizeInBytes](self, "bufferSizeInBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongValue");

  if (a3 + 132 > v6)
    return 0;
  -[_ANECompilerAnalytics analyticsBuffer](self, "analyticsBuffer");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "bytes");

  return (_AnalyticsLayerInfo *)(v9 + a3);
}

- (_AnalyticsTaskInfo)taskInfoAt:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  id v8;
  uint64_t v9;

  -[_ANECompilerAnalytics bufferSizeInBytes](self, "bufferSizeInBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongValue");

  if (a3 + 16 > v6)
    return 0;
  -[_ANECompilerAnalytics analyticsBuffer](self, "analyticsBuffer");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "bytes");

  return (_AnalyticsTaskInfo *)(v9 + a3);
}

- (_AnalyticsData)dataInfoAt:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  id v8;
  uint64_t v9;

  -[_ANECompilerAnalytics bufferSizeInBytes](self, "bufferSizeInBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongValue");

  if (a3 + 8 > v6)
    return 0;
  -[_ANECompilerAnalytics analyticsBuffer](self, "analyticsBuffer");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "bytes");

  return (_AnalyticsData *)(v9 + a3);
}

- (unint64_t)getDataValueAt:(unint64_t)a3
{
  id v4;
  uint64_t v5;

  -[_ANECompilerAnalytics analyticsBuffer](self, "analyticsBuffer");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "bytes");

  return *(_QWORD *)(v5 + a3 + 8);
}

- (BOOL)getBOOLDataValueAt:(unint64_t)a3
{
  id v4;
  uint64_t v5;

  -[_ANECompilerAnalytics analyticsBuffer](self, "analyticsBuffer");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "bytes");

  return *(_BYTE *)(v5 + a3 + 8) & 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANECompilerAnalytics analyticsBuffer](self, "analyticsBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANECompilerAnalytics bufferSizeInBytes](self, "bufferSizeInBytes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { analyticsBuffer={%@} : bufferSizeInBytes=%llu }"), v5, v7, objc_msgSend(v8, "unsignedLongLongValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (_ANECompilerAnalytics)init
{

  return 0;
}

- (BOOL)populateAnalytics
{
  char *v3;
  _AnalyticsProcedureInfo *v4;
  const char *v5;
  NSObject *v6;
  unint64_t *v7;
  Espresso *v8;
  const char *v9;
  uint64_t v10;
  _AnalyticsData *v11;
  const char *v12;
  _AnalyticsData *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t var0;
  unint64_t v21;
  void *v22;
  void *v23;
  unsigned int var1;
  NSObject *v25;
  Espresso *v26;
  const char *v27;
  __int128 v28;
  NSObject *v29;
  _AnalyticsGroupInfo *v30;
  _AnalyticsGroupInfo *v31;
  unint64_t *v32;
  unint64_t v33;
  _AnalyticsLayerInfo *v34;
  const char *v35;
  _AnalyticsLayerInfo *v36;
  NSObject *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  double var2;
  uint64_t v43;
  _AnalyticsTaskInfo *v44;
  unint64_t *v45;
  const char *v46;
  unint64_t *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  _AnalyticsData *v51;
  unint64_t v52;
  unint64_t v53;
  const char *v54;
  unint64_t v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  unsigned int v60;
  void *v61;
  void *v62;
  void *v63;
  BOOL v64;
  uint64_t v65;
  void *v66;
  void *v67;
  __int128 v69;
  unint64_t *v70;
  NSObject *v71;
  void *v72;
  os_log_t log;
  uint64_t v74;
  _AnalyticsProcedureInfo *v75;
  unint64_t *v76;
  void *v77;
  void *v78;
  _AnalyticsGroupInfo *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint8_t buf[4];
  _BYTE v84[18];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v3 = getenv("ESPRESSO_VERBOSE_ANE_ANALYTICS_PRINTING");
  v4 = -[_ANECompilerAnalytics procedureInfoAt:](self, "procedureInfoAt:", 0);
  v75 = v4;
  if (v4)
  {
    if (v3)
    {
      Espresso::espresso_os_log_subsystem((Espresso *)v4, v5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_190DAF000, v6, OS_LOG_TYPE_DEBUG, "== Network Analytics ==", buf, 2u);
      }

    }
    v7 = -[_ANECompilerAnalytics offsetTableAt:count:](self, "offsetTableAt:count:", v75->var7, 0);
    log = (os_log_t)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    v8 = (Espresso *)objc_msgSend(CFSTR("unknown"), "mutableCopy");
    v72 = v8;
    if (v75->var6)
    {
      v10 = 0;
      while (1)
      {
        v11 = -[_ANECompilerAnalytics dataInfoAt:](self, "dataInfoAt:", v7[v10]);
        v13 = v11;
        if (!v11)
          break;
        if (v11->var0 == 15)
        {
          -[_ANECompilerAnalytics analyticsBuffer](self, "analyticsBuffer");
          v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v15 = objc_msgSend(v14, "bytes");

          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15 + v7[v10] + 8, v13->var1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v16, 4);
          v18 = objc_msgSend(v17, "mutableCopy");

          v72 = (void *)v18;
        }
        if (v3)
        {
          Espresso::espresso_os_log_subsystem((Espresso *)v11, v12);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            var1 = v13->var1;
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v84 = var1;
            _os_log_debug_impl(&dword_190DAF000, v19, OS_LOG_TYPE_DEBUG, "Data %u", buf, 8u);
          }

        }
        var0 = v13->var0;
        v21 = -[_ANECompilerAnalytics getDataValueAt:](self, "getDataValueAt:", v7[v10]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ANECompilerAnalytics stringForAnalyticsType:](self, "stringForAnalyticsType:", var0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v22, v23);

        if (++v10 >= (unint64_t)v75->var6)
          goto LABEL_16;
      }
      Espresso::espresso_os_log_subsystem(0, v12);
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v84 = v10;
        _os_log_debug_impl(&dword_190DAF000, v71, OS_LOG_TYPE_DEBUG, "populateAnalytics failed to read procedure level analytics at index %u", buf, 8u);
      }
      v64 = 0;
    }
    else
    {
LABEL_16:
      if (v3)
      {
        Espresso::espresso_os_log_subsystem(v8, v9);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_190DAF000, v25, OS_LOG_TYPE_DEBUG, "== Layer Analytics ==", buf, 2u);
        }

      }
      v70 = -[_ANECompilerAnalytics offsetTableAt:count:](self, "offsetTableAt:count:", v75->var5, 0);
      v26 = (Espresso *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      v71 = v26;
      if (v75->var4)
      {
        v74 = 0;
        *(_QWORD *)&v28 = 136315394;
        v69 = v28;
        while (1)
        {
          if (v3)
          {
            Espresso::espresso_os_log_subsystem(v26, v27);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v84 = v74;
              _os_log_debug_impl(&dword_190DAF000, v29, OS_LOG_TYPE_DEBUG, "Group # %u ", buf, 8u);
            }

          }
          v30 = -[_ANECompilerAnalytics groupInfoAt:](self, "groupInfoAt:", v70[v74], v69);
          v31 = v30;
          if (!v30)
            break;
          v32 = -[_ANECompilerAnalytics offsetTableAt:count:](self, "offsetTableAt:count:", v30->var1, 0);
          if (!v32)
            break;
          v78 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          v79 = v31;
          if (v31->var0)
          {
            v33 = 0;
            do
            {
              v34 = -[_ANECompilerAnalytics layerInfoAt:](self, "layerInfoAt:", v32[v33]);
              v36 = v34;
              if (v3)
              {
                Espresso::espresso_os_log_subsystem((Espresso *)v34, v35);
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  var2 = v36->var2;
                  *(_DWORD *)buf = v69;
                  *(_QWORD *)v84 = v36;
                  *(_WORD *)&v84[8] = 2048;
                  *(double *)&v84[10] = var2;
                  _os_log_debug_impl(&dword_190DAF000, v37, OS_LOG_TYPE_DEBUG, "  Layer Name: %s Weight: %f", buf, 0x16u);
                }

              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(float *)&v39 = v36->var2;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              +[_ANEAnalyticsLayer objectWithName:weight:](_ANEAnalyticsLayer, "objectWithName:weight:", v38, v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v78, "addObject:", v41);
              ++v33;
              v31 = v79;
            }
            while (v33 < v79->var0);
          }
          v76 = -[_ANECompilerAnalytics offsetTableAt:count:](self, "offsetTableAt:count:", v31->var3, 0);
          v77 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          if (v31->var2)
          {
            v43 = 0;
            while (1)
            {
              v44 = -[_ANECompilerAnalytics taskInfoAt:](self, "taskInfoAt:", v76[v43]);
              v45 = -[_ANECompilerAnalytics offsetTableAt:count:](self, "offsetTableAt:count:", v44->var1, 0);
              v47 = v45;
              if (v3)
              {
                Espresso::espresso_os_log_subsystem((Espresso *)v45, v46);
                v48 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v84 = v43;
                  _os_log_debug_impl(&dword_190DAF000, v48, OS_LOG_TYPE_DEBUG, "  Task %u ", buf, 8u);
                }

              }
              v49 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
              if (v44->var0)
                break;
LABEL_51:
              +[_ANEAnalyticsTask objectWithMetrics:](_ANEAnalyticsTask, "objectWithMetrics:", v49);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "addObject:", v61);

              if (++v43 >= (unint64_t)v79->var2)
                goto LABEL_52;
            }
            v50 = 0;
            while (2)
            {
              v51 = -[_ANECompilerAnalytics dataInfoAt:](self, "dataInfoAt:", v47[v50]);
              v52 = v47[v50];
              if (v51->var0 == 11)
              {
                v53 = -[_ANECompilerAnalytics getBOOLDataValueAt:](self, "getBOOLDataValueAt:", v52);
                v55 = v53;
                if (!v3)
                  goto LABEL_50;
              }
              else
              {
                v53 = -[_ANECompilerAnalytics getDataValueAt:](self, "getDataValueAt:", v52);
                v55 = v53;
                if (!v3)
                  goto LABEL_50;
              }
              Espresso::espresso_os_log_subsystem((Espresso *)v53, v54);
              v56 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                v60 = v51->var1;
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v84 = v60;
                *(_WORD *)&v84[4] = 2048;
                *(_QWORD *)&v84[6] = v55;
                _os_log_debug_impl(&dword_190DAF000, v56, OS_LOG_TYPE_DEBUG, "  Size: %u \t Value %llu  ", buf, 0x12u);
              }

LABEL_50:
              -[_ANECompilerAnalytics stringForAnalyticsType:](self, "stringForAnalyticsType:", v51->var0);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v55);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = v57;
              v82 = v58;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "addEntriesFromDictionary:", v59);

              if (++v50 >= (unint64_t)v44->var0)
                goto LABEL_51;
              continue;
            }
          }
LABEL_52:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v74);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          +[_ANEAnalyticsGroup objectWithID:layers:tasks:](_ANEAnalyticsGroup, "objectWithID:layers:tasks:", v62, v78, v77);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject addObject:](v71, "addObject:", v63);
          if (++v74 >= (unint64_t)v75->var4)
            goto LABEL_58;
        }
        v64 = 0;
      }
      else
      {
LABEL_58:
        v64 = 1;
      }
      +[_ANEAnalyticsProcedure objectWithGroups:procedureMetrics:indentifier:](_ANEAnalyticsProcedure, "objectWithGroups:procedureMetrics:indentifier:", v71, log, v72);
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = (void *)v65;
      if (!v65)
        v64 = 0;
      v80 = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ANECompilerAnalytics setProcedureAnalytics:](self, "setProcedureAnalytics:", v67);

    }
  }
  else
  {
    if (!v3)
      return 0;
    Espresso::espresso_os_log_subsystem(0, v5);
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_190DAF000, log, OS_LOG_TYPE_DEBUG, "No procedure found", buf, 2u);
    }
    v64 = 0;
  }

  return v64;
}

- (id)serialize
{
  void *v2;
  void *v3;
  void *v4;

  -[_ANECompilerAnalytics procedureAnalytics](self, "procedureAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_ANECompilerAnalytics)initWithBuffer:(id)a3
{
  id v5;
  NSNumber *v6;
  NSNumber *bufferSizeInBytes;
  _ANECompilerAnalytics *v8;

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_analyticsBuffer, a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v5, "length"));
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    bufferSizeInBytes = self->_bufferSizeInBytes;
    self->_bufferSizeInBytes = v6;

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)procedureAnalytics
{
  return self->_procedureAnalytics;
}

- (void)setProcedureAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_procedureAnalytics, a3);
}

- (NSData)analyticsBuffer
{
  return self->_analyticsBuffer;
}

- (NSNumber)bufferSizeInBytes
{
  return self->_bufferSizeInBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferSizeInBytes, 0);
  objc_storeStrong((id *)&self->_analyticsBuffer, 0);
  objc_storeStrong((id *)&self->_procedureAnalytics, 0);
}

@end
