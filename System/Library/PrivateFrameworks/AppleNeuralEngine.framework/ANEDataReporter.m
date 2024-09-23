@implementation ANEDataReporter

id __42___ANEDataReporter_addValue_forScalarKey___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __50___ANEDataReporter_reportTelemetryToPPS_playload___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reportTelemetryToPPS_playload__ppsIDMapping;
  reportTelemetryToPPS_playload__ppsIDMapping = v0;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  +[_ANEStrings ppsCategoryForANE](_ANEStrings, "ppsCategoryForANE");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v18;
    *(_QWORD *)&v4 = 138412290;
    v15 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend((id)reportTelemetryToPPS_playload__ppsIDMapping, "objectForKey:", v8, v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[_ANELog common](_ANELog, "common");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v15;
          v22 = v8;
          _os_log_debug_impl(&dword_1D3352000, v10, OS_LOG_TYPE_DEBUG, "Telemetry: add identifier %@.", buf, 0xCu);
        }

        v16 = 0;
        +[_ANEStrings ppsSubsystemForANE](_ANEStrings, "ppsSubsystemForANE");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = PPSCreateTelemetryIdentifier();

        v16 = v12;
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v16, "^{PPSTelemetryIdentifier=}");
          v13 = objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)reportTelemetryToPPS_playload__ppsIDMapping, "setObject:forKeyedSubscript:", v13, v8);
          v9 = (void *)v13;
        }
        else
        {
          +[_ANELog common](_ANELog, "common");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            v22 = v8;
            _os_log_error_impl(&dword_1D3352000, v14, OS_LOG_TYPE_ERROR, "Telemetry: could not create ppsId for %@!", buf, 0xCu);
          }

        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v5);
  }

}

@end
