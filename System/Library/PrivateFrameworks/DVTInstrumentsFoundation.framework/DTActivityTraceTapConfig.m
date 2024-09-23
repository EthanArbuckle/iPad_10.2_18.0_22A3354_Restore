@implementation DTActivityTraceTapConfig

- (DTActivityTraceTapConfig)init
{
  DTActivityTraceTapConfig *v2;
  DTActivityTraceTapConfig *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DTActivityTraceTapConfig;
  v2 = -[DTTapConfig init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[DTTapConfig _setSerializableObject:forKey:](v2, "_setSerializableObject:forKey:", &stru_24EB2CF78, CFSTR("predicate"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DTActivityTraceTapConfig;
  v4 = -[DTTapConfig copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = _Block_copy(self->_memoHandler);
  v6 = (void *)*((_QWORD *)v4 + 13);
  *((_QWORD *)v4 + 13) = v5;

  v7 = _Block_copy(self->_processDetectionCallback);
  v8 = (void *)*((_QWORD *)v4 + 14);
  *((_QWORD *)v4 + 14) = v7;

  objc_storeStrong((id *)v4 + 10, self->_importedFileURL);
  objc_storeStrong((id *)v4 + 11, self->_importForcedStartDate);
  objc_storeStrong((id *)v4 + 12, self->_importForcedEndDate);
  return v4;
}

- (void)setPredicateString:(id)a3
{
  if (a3)
    -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", a3, CFSTR("predicate"));
}

- (NSString)predicateString
{
  return (NSString *)-[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("predicate"));
}

- (void)setMode:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("mode"));

}

- (unint64_t)mode
{
  void *v2;
  unint64_t v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("mode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (void)setOnlySignposts:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v5, CFSTR("onlySignposts"));

  if (v3)
    -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("signpostsAndLogs"));
}

- (BOOL)onlySignposts
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("onlySignposts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setSignpostsAndLogs:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v5, CFSTR("signpostsAndLogs"));

  if (v3)
    -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("onlySignposts"));
}

- (BOOL)signpostsAndLogs
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("signpostsAndLogs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setTrackExpiredPIDs:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("trackExpiredPIDs"));

}

- (BOOL)trackExpiredPIDs
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("trackExpiredPIDs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setExcludeInfo:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("excludeInfo"));

}

- (BOOL)excludeInfo
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("excludeInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setExcludeDebug:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("excludeDebug"));

}

- (BOOL)excludeDebug
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("excludeDebug"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setIncludeSenderInfo:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("includeSenderInfo"));

}

- (BOOL)includeSenderInfo
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("includeSenderInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setIncludeWallTime:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("includeWallTime"));

}

- (BOOL)includeWallTime
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("includeWallTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setEnableHTTPArchiveLogging:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("enableHTTPArchiveLogging"));

}

- (BOOL)enableHTTPArchiveLogging
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("enableHTTPArchiveLogging"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setEnableBacktraceReplacement:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("enableBacktraceReplacement"));

}

- (BOOL)enableBacktraceReplacement
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("enableBacktraceReplacement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setEnablePowerLog:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("enablePowerlogLogging"));

}

- (BOOL)enablePowerLog
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("enablePowerlogLogging"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setTargetPID:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("targetPID"));

}

- (int)targetPID
{
  void *v2;
  int v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("targetPID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)trackPIDToExecNameMapping
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("trackPidToExecNameMapping"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setTrackPIDToExecNameMapping:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("trackPidToExecNameMapping"));

}

- (NSArray)dynamicTracingEnabledSubsystems
{
  return (NSArray *)-[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("dynamicTracingEnabledSubsystems"));
}

- (void)setDynamicTracingEnabledSubsystems:(id)a3
{
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", a3, CFSTR("dynamicTracingEnabledSubsystems"));
}

- (NSDictionary)loggingSubsystemCategoryPairsToEnable
{
  return (NSDictionary *)-[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("logSubsystemsCategoryPairsToEnableV2"));
}

- (void)setLoggingSubsystemCategoryPairsToEnable:(id)a3
{
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", a3, CFSTR("logSubsystemsCategoryPairsToEnableV2"));
}

- (NSDictionary)signpostSubsystemCategoryPairsToEnable
{
  return (NSDictionary *)-[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("logSubsystemsCategoryPairsToEnableV2"));
}

- (void)setSignpostSubsystemCategoryPairsToEnable:(id)a3
{
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", a3, CFSTR("logSubsystemsCategoryPairsToEnableV2"));
}

- (void)setMachTimebase:(mach_timebase_info)a3
{
  uint64_t denom;
  void *v5;
  id v6;

  denom = a3.denom;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v5, CFSTR("machTimebaseNumer"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", denom);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v6, CFSTR("machTimebaseDenom"));

}

- (mach_timebase_info)machTimebase
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("machTimebaseNumer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("machTimebaseDenom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  return (mach_timebase_info)(v4 | (unint64_t)(v6 << 32));
}

- (void)setMachContinuousStart:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("machContinuousStart"));

}

- (unint64_t)machContinuousStart
{
  void *v2;
  unint64_t v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("machContinuousStart"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (void)setMemoHandler:(id)a3
{
  void *v4;
  id memoHandler;

  v4 = _Block_copy(a3);
  memoHandler = self->_memoHandler;
  self->_memoHandler = v4;

}

- (BOOL)isTargetAllProcesses
{
  return -[DTActivityTraceTapConfig targetPID](self, "targetPID") == -3;
}

- (NSURL)importedFileURL
{
  return self->_importedFileURL;
}

- (void)setImportedFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_importedFileURL, a3);
}

- (NSDate)importForcedStartDate
{
  return self->_importForcedStartDate;
}

- (void)setImportForcedStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_importForcedStartDate, a3);
}

- (NSDate)importForcedEndDate
{
  return self->_importForcedEndDate;
}

- (void)setImportForcedEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_importForcedEndDate, a3);
}

- (id)memoHandler
{
  return self->_memoHandler;
}

- (id)processDetectionCallback
{
  return self->_processDetectionCallback;
}

- (void)setProcessDetectionCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processDetectionCallback, 0);
  objc_storeStrong(&self->_memoHandler, 0);
  objc_storeStrong((id *)&self->_importForcedEndDate, 0);
  objc_storeStrong((id *)&self->_importForcedStartDate, 0);
  objc_storeStrong((id *)&self->_importedFileURL, 0);
}

@end
