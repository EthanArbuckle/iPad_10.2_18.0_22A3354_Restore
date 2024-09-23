@implementation CHStyleEncoderModelE5MLExecutionContext

- (id)predictionFromFeatureProvider:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend_createInputSurfacesForFeatureProvider_(CHE5MLUtilities, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_functionDescriptor(self, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_newInputsForFunctionDescriptor_surfaces_error_(CHE5MLUtilities, v15, (uint64_t)v14, (uint64_t)v8, (uint64_t)a4, v16);

  v48 = (void *)v17;
  objc_msgSend_predictionFromInputObjects_error_(self, v18, v17, (uint64_t)a4, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v22 = v8;
    v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v49, (uint64_t)v53, 16, v24);
    if (v29)
    {
      v30 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v50 != v30)
            objc_enumerationMutation(v22);
          objc_msgSend_objectForKeyedSubscript_(v22, v25, *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i), v26, v27, v28);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (const void *)objc_msgSend_pointerValue(v32, v33, v34, v35, v36, v37);

          CFRelease(v38);
        }
        v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v49, (uint64_t)v53, 16, v28);
      }
      while (v29);
    }

    objc_msgSend_functionDescriptor(self, v39, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_featureProviderForE5RTOutputs_functionDescriptor_dataType_error_(CHE5MLUtilities, v45, (uint64_t)v21, (uint64_t)v44, 65568, (uint64_t)a4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v46 = 0;
  }

  return v46;
}

@end
