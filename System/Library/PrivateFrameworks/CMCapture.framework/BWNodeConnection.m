@implementation BWNodeConnection

- (uint64_t)_resolveCommonVideoBufferFormatForAttachedMediaKey:(uint64_t)result
{
  void *v2;
  uint64_t v3;
  BWNodeOutputMediaProperties *v4;
  BWNodeInputMediaProperties *v5;
  uint64_t v6;
  uint64_t v7;
  BWNodeInputMediaProperties *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  BWNodeInputMediaProperties *v49;
  void *v50;
  BWNodeOutputMediaProperties *v51;
  uint64_t v52;
  id obj;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  _QWORD v82[2];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = a2;
    v3 = result;
    v4 = (BWNodeOutputMediaProperties *)objc_msgSend(*(id *)(result + 16), "mediaPropertiesForAttachedMediaKey:", a2);
    if (!v4)
    {
      if (objc_msgSend(v2, "isEqualToString:", CFSTR("PrimaryFormat")))
      {
        v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Output primary format has no requirements BWNodeOutput %p node: %@"), *(_QWORD *)(v3 + 16), objc_msgSend(*(id *)(v3 + 16), "node"), v46, v47);
        goto LABEL_51;
      }
      v4 = objc_alloc_init(BWNodeOutputMediaProperties);
      objc_msgSend(*(id *)(v3 + 16), "_setMediaProperties:forAttachedMediaKey:", v4, v2);
    }
    v5 = (BWNodeInputMediaProperties *)objc_msgSend(*(id *)(v3 + 8), "mediaPropertiesForAttachedMediaKey:", v2);
    if (v5)
      goto LABEL_8;
    if (!objc_msgSend(v2, "isEqualToString:", CFSTR("PrimaryFormat")))
    {
      v5 = objc_alloc_init(BWNodeInputMediaProperties);
      objc_msgSend(*(id *)(v3 + 8), "_setMediaProperties:forAttachedMediaKey:", v5, v2);
LABEL_8:
      if (objc_msgSend(*(id *)(v3 + 16), "_passthroughModeForAttachedMediaKey:", v2))
      {
        v6 = -[BWNodeOutputMediaProperties resolvedFormat](v4, "resolvedFormat");
        if (v6)
        {
          v7 = v6;
          v8 = v5;
LABEL_11:
          -[BWNodeInputMediaProperties setResolvedFormat:](v8, "setResolvedFormat:", v7);
          return 1;
        }
        v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Passthrough outputs are supposed to have a non-nil format (since its the same as their upstream input's format).  BWNodeOutput %p node: %@ forAttachedMediaKey: %@"), *(_QWORD *)(v3 + 16), objc_msgSend(*(id *)(v3 + 16), "node"), v2, v47);
        goto LABEL_51;
      }
      v9 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "mediaConfigurationForAttachedMediaKey:", v2), "formatRequirements");
      if (!v9)
      {
        if (objc_msgSend(v2, "isEqualToString:", CFSTR("PrimaryFormat")))
        {
          v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing output requirements for the primary format.  BWNodeOutput %p node: %@"), *(_QWORD *)(v3 + 16), objc_msgSend(*(id *)(v3 + 16), "node"), v46, v47);
          goto LABEL_51;
        }
        return 1;
      }
      v10 = (void *)v9;
      if (objc_msgSend(*(id *)(v3 + 8), "_passthroughModeForAttachedMediaKey:", v2))
      {
        v11 = 0x1E0C99000uLL;
        while (1)
        {
          v63 = 0;
          v64 = 0;
          v12 = *(void **)(v3 + 8);
          objc_opt_self();
          v13 = (void *)objc_msgSend(*(id *)(v11 + 3560), "array");
          nc_addRequirementsForInputToMutableArray(v12, v2, v13, 0, &v64, &v63);
          v14 = (void *)objc_msgSend(*(id *)(v11 + 3560), "arrayWithObject:", v10);
          objc_msgSend(v14, "addObjectsFromArray:", v13);
          v15 = (void *)objc_msgSend(v10, "formatClass");
          v16 = objc_msgSend(v15, "formatByResolvingRequirements:printErrors:", v14, v64 == 0);
          if (v16)
          {
            v40 = v16;
            goto LABEL_62;
          }
          v17 = v64;
          if (!v64)
            break;
          v18 = v63;
          v19 = (void *)objc_msgSend(v64, "node");
          v62 = v17;
          objc_msgSend((id)objc_msgSend(v17, "mediaConfigurationForAttachedMediaKey:", v18), "setPassthroughMode:", 0);
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          v56 = v19;
          obj = (id)objc_msgSend(v19, "outputs");
          v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
          if (v55)
          {
            v54 = *(_QWORD *)v74;
            v51 = v4;
            v52 = v3;
            v49 = v5;
            v50 = v2;
            v48 = v10;
            do
            {
              v20 = 0;
              v21 = v62;
              do
              {
                if (*(_QWORD *)v74 != v54)
                  objc_enumerationMutation(obj);
                v57 = v20;
                v22 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v20);
                v23 = (void *)objc_msgSend(v22, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", v18, objc_msgSend(v21, "index"));
                if (v23)
                  objc_msgSend((id)objc_msgSend(v22, "mediaConfigurationForAttachedMediaKey:", v23), "setPassthroughMode:", 0);
                v71 = 0u;
                v72 = 0u;
                v69 = 0u;
                v70 = 0u;
                v58 = (id)objc_msgSend(v56, "inputs");
                v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
                if (v60)
                {
                  v59 = *(_QWORD *)v70;
                  do
                  {
                    v24 = 0;
                    do
                    {
                      if (*(_QWORD *)v70 != v59)
                        objc_enumerationMutation(v58);
                      v61 = v24;
                      v25 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v24);
                      if (v25 != v21)
                      {
                        v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", CFSTR("PrimaryFormat"));
                        objc_msgSend(v26, "addObjectsFromArray:", objc_msgSend(v25, "specifiedAttachedMediaKeys"));
                        v67 = 0u;
                        v68 = 0u;
                        v65 = 0u;
                        v66 = 0u;
                        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v83, 16);
                        if (v27)
                        {
                          v28 = v27;
                          v29 = *(_QWORD *)v66;
                          do
                          {
                            for (i = 0; i != v28; ++i)
                            {
                              if (*(_QWORD *)v66 != v29)
                                objc_enumerationMutation(v26);
                              v31 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
                              if (objc_msgSend(v25, "_passthroughModeForAttachedMediaKey:", v18)
                                && objc_msgSend(v23, "isEqualToString:", objc_msgSend(v22, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", v31, objc_msgSend(v25, "index"))))
                              {
                                v32 = (void *)objc_msgSend(v21, "mediaConfigurationForAttachedMediaKey:", v18);
                                if ((objc_msgSend(v32, "conversionToPassthroughModeNeverAllowed") & 1) == 0)
                                {
                                  v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input %@[%@] is not marked as passthroughOptional while input %@[%@] is and both drive the same output"), objc_msgSend(v62, "name"), v18, v25, v31);
                                  goto LABEL_51;
                                }
                                objc_msgSend(v32, "setPassthroughMode:", 0);
                                v21 = v62;
                              }
                            }
                            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v83, 16);
                          }
                          while (v28);
                        }
                      }
                      v24 = v61 + 1;
                    }
                    while (v61 + 1 != v60);
                    v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
                  }
                  while (v60);
                }
                v20 = v57 + 1;
              }
              while (v57 + 1 != v55);
              v4 = v51;
              v3 = v52;
              v5 = v49;
              v2 = v50;
              v10 = v48;
              v11 = 0x1E0C99000;
              v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
            }
            while (v55);
          }
        }
        v44 = *(void **)(v3 + 8);
        objc_opt_self();
        v45 = (void *)objc_msgSend(*(id *)(v11 + 3560), "array");
        nc_addRequirementsForInputToMutableArray(v44, v2, v45, 1, 0, 0);
        objc_msgSend(v45, "insertObject:atIndex:", v10, 0);
        objc_msgSend(v45, "insertObject:atIndex:", *(_QWORD *)(v3 + 16), 0);
        return 0;
      }
      v37 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 8), "mediaConfigurationForAttachedMediaKey:", v2), "formatRequirements");
      if (v37)
      {
        v38 = v37;
        v39 = (void *)objc_msgSend(v10, "formatClass");
        v82[0] = v10;
        v82[1] = v38;
        v40 = objc_msgSend(v39, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2));
        if (!v40)
        {
          v41 = *(_QWORD *)(v3 + 8);
          v77 = *(_QWORD *)(v3 + 16);
          v78 = v10;
          v79 = v41;
LABEL_59:
          v80 = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 4);
          return 0;
        }
      }
      else
      {
        if (objc_msgSend(v2, "isEqualToString:", CFSTR("PrimaryFormat")))
        {
          v35 = (void *)MEMORY[0x1E0C99DA0];
          v36 = *MEMORY[0x1E0C99768];
          v34 = CFSTR("No primary input requirements");
LABEL_52:
          objc_exception_throw((id)objc_msgSend(v35, "exceptionWithName:reason:userInfo:", v36, v34, 0));
        }
        v42 = (void *)objc_msgSend(v10, "formatClass");
        v81 = v10;
        v40 = objc_msgSend(v42, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1));
        if (!v40)
        {
          v43 = *(_QWORD *)(v3 + 8);
          v77 = *(_QWORD *)(v3 + 16);
          v78 = v10;
          v79 = v43;
          v38 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
          goto LABEL_59;
        }
      }
LABEL_62:
      -[BWNodeOutputMediaProperties setResolvedFormat:](v4, "setResolvedFormat:", v40);
      v8 = v5;
      v7 = v40;
      goto LABEL_11;
    }
    v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input primary format has no requirements BWNodeInput %p node: %@"), *(_QWORD *)(v3 + 8), objc_msgSend(*(id *)(v3 + 8), "node"), v46, v47);
LABEL_51:
    v34 = (const __CFString *)v33;
    v35 = (void *)MEMORY[0x1E0C99DA0];
    v36 = *MEMORY[0x1E0C99768];
    goto LABEL_52;
  }
  return result;
}

- (BWNodeInput)input
{
  return self->_input;
}

- (BWPipelineStage)pipelineStage
{
  return self->_pipelineStage;
}

- (BOOL)resolveCommonBufferFormat
{
  int v3;
  int v6;
  int v8;
  NSArray *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = -[BWNodeOutput mediaType](self->_output, "mediaType");
  if (v3 <= 1885564003)
  {
    if (v3 != 1667326820 && v3 != 1835365473 && v3 != 1836016234)
      goto LABEL_48;
LABEL_10:
    if (!-[BWNodeOutput format](self->_output, "format"))
    {
      v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No format for node output %@, this is required for outputs"), self->_output);
LABEL_51:
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v27, 0));
    }
    -[BWNodeInput setFormat:](self->_input, "setFormat:", -[BWNodeOutput format](self->_output, "format"));
    goto LABEL_12;
  }
  if (v3 != 1885564004 && v3 != 1986618469)
  {
    if (v3 != 1936684398)
    {
LABEL_48:
      v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid mediatype for node output %@"), self->_output);
      goto LABEL_51;
    }
    goto LABEL_10;
  }
  v8 = -[BWNodeConnection _resolveCommonVideoBufferFormatForAttachedMediaKey:]((uint64_t)self, CFSTR("PrimaryFormat"));
  v9 = -[BWNodeOutput specifiedAttachedMediaKeys](self->_output, "specifiedAttachedMediaKeys");
  if (v8)
  {
    v10 = v9;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v38;
LABEL_22:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v10);
        v6 = -[BWNodeConnection _resolveCommonVideoBufferFormatForAttachedMediaKey:]((uint64_t)self, *(void **)(*((_QWORD *)&v37 + 1) + 8 * v14));
        if (!v6)
          break;
        if (v12 == ++v14)
        {
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
          if (v12)
            goto LABEL_22;
          goto LABEL_28;
        }
      }
    }
    else
    {
LABEL_28:
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v15 = -[BWNodeOutput resolvedAttachedMediaKeys](self->_output, "resolvedAttachedMediaKeys");
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v34;
LABEL_30:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v19);
          if (!-[NSArray containsObject:](v10, "containsObject:", v20))
          {
            v6 = -[BWNodeConnection _resolveCommonVideoBufferFormatForAttachedMediaKey:]((uint64_t)self, v20);
            if (!v6)
              break;
          }
          if (v17 == ++v19)
          {
            v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
            if (v17)
              goto LABEL_30;
            goto LABEL_37;
          }
        }
      }
      else
      {
LABEL_37:
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v21 = -[BWNodeInput specifiedAttachedMediaKeys](self->_input, "specifiedAttachedMediaKeys");
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (!v22)
        {
LABEL_12:
          LOBYTE(v6) = 1;
          return v6;
        }
        v23 = v22;
        v24 = *(_QWORD *)v30;
LABEL_39:
        v25 = 0;
        while (1)
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v25);
          if (!-[NSArray containsObject:](v10, "containsObject:", v26))
          {
            v6 = -[BWNodeConnection _resolveCommonVideoBufferFormatForAttachedMediaKey:]((uint64_t)self, v26);
            if (!v6)
              break;
          }
          if (v23 == ++v25)
          {
            v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
            LOBYTE(v6) = 1;
            if (v23)
              goto LABEL_39;
            return v6;
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BWNodeOutput)output
{
  return self->_output;
}

- (BOOL)attach
{
  BWNode *v3;
  BWNode *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BWNodeInput *v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  void *output;
  BWNodeInput *input;
  BWPipelineStage *pipelineStage;
  BWNodeInput *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[BWNodeOutput consumer](self->_output, "consumer"))
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    output = self->_output;
    input = (BWNodeInput *)objc_msgSend(output, "consumer");
    v15 = CFSTR("output %@ already has a consumer %@");
LABEL_22:
    v14 = v17;
LABEL_19:
    v16 = objc_msgSend(v14, "stringWithFormat:", v15, output, input, pipelineStage, v21, v22);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0));
  }
  if (-[BWNodeInput connection](self->_input, "connection"))
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    output = self->_input;
    input = (BWNodeInput *)objc_msgSend(output, "connection");
    v15 = CFSTR("input %@ already has a connection %@");
    goto LABEL_22;
  }
  -[BWNodeOutput setConsumer:](self->_output, "setConsumer:", self);
  -[BWNodeInput setConnection:](self->_input, "setConnection:", self);
  if (self->_pipelineStage)
  {
    v3 = -[BWNodeInput node](self->_input, "node");
    if (v3)
    {
      v4 = v3;
      if (!-[BWNode supportsConcurrentLiveInputCallbacks](v3, "supportsConcurrentLiveInputCallbacks"))
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v5 = -[BWNode inputs](v4, "inputs");
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v24 != v8)
                objc_enumerationMutation(v5);
              v10 = *(BWNodeInput **)(*((_QWORD *)&v23 + 1) + 8 * i);
              if (v10 != self->_input)
              {
                v11 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "connection");
                if (v11)
                {
                  v12 = *(_QWORD *)(v11 + 32);
                  if (v12)
                  {
                    if ((objc_msgSend(*(id *)(v11 + 32), "isEqual:", self->_pipelineStage) & 1) == 0)
                    {
                      v14 = (void *)MEMORY[0x1E0CB3940];
                      v21 = v10;
                      v22 = v12;
                      input = self->_input;
                      pipelineStage = self->_pipelineStage;
                      output = self;
                      v15 = CFSTR("Attempting to attach connection '%@' to input '%@' with pipeline stage '%@' but node doesn't support concurrent input callbacks (node input '%@' has pipeline stage '%@')");
                      goto LABEL_19;
                    }
                  }
                }
              }
            }
            v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v7);
        }
      }
    }
  }
  return 1;
}

- (void)consumeMessage:(id)a3 fromOutput:(id)a4
{
  BWPipelineStage *pipelineStage;
  BWNodeInput *input;
  int v8;

  if (!a3)
    return;
  if (!self->_suspended)
    goto LABEL_8;
  os_unfair_lock_lock(&self->_suspensionLock);
  if (!self->_suspended)
  {
    os_unfair_lock_unlock(&self->_suspensionLock);
LABEL_8:
    if (!self->_resumedForEventsOnly || *((_DWORD *)a3 + 2) == 1)
    {
      pipelineStage = self->_pipelineStage;
      input = self->_input;
      if (!pipelineStage)
      {
        -[BWNodeInput handleMessage:](self->_input, "handleMessage:", a3);
        return;
      }
      goto LABEL_19;
    }
    return;
  }
  if (self->_bypassed)
  {
    if (*((_DWORD *)a3 + 3) == 3)
    {
      -[NSMutableArray addObject:](self->_messagesToPropagate, "addObject:", a3);
      os_unfair_lock_unlock(&self->_suspensionLock);
LABEL_18:
      pipelineStage = self->_bypassPipelineStage;
      input = self->_bypassInput;
LABEL_19:
      -[BWPipelineStage sendMessage:toInput:](pipelineStage, "sendMessage:toInput:", a3, input);
      return;
    }
    v8 = *((_DWORD *)a3 + 2);
    os_unfair_lock_unlock(&self->_suspensionLock);
    if (v8 != 1)
      goto LABEL_18;
  }
  else
  {
    if (self->_messageCachingEnabled || *((_DWORD *)a3 + 3) == 3)
      -[NSMutableArray addObject:](self->_messagesToPropagate, "addObject:", a3);
    os_unfair_lock_unlock(&self->_suspensionLock);
  }
}

id __40__BWNodeConnection_resumeForEventsOnly___block_invoke(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 52));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  if (*(_BYTE *)(a1 + 40))
    v2 = (id)objc_msgSend(v2, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_90));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 58) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 52));
  return v2;
}

- (BWNodeConnection)initWithOutput:(id)a3 input:(id)a4 pipelineStage:(id)a5
{
  BWNodeConnection *v8;
  BWNodeConnection *v9;
  objc_super v11;

  if (a3 && a4)
  {
    v11.receiver = self;
    v11.super_class = (Class)BWNodeConnection;
    v8 = -[BWNodeConnection init](&v11, sel_init);
    v9 = v8;
    if (v8)
    {
      v8->_input = (BWNodeInput *)a4;
      v8->_output = (BWNodeOutput *)a3;
      v8->_pipelineStage = (BWPipelineStage *)a5;
      v9->_suspensionLock._os_unfair_lock_opaque = 0;
      v9->_messagesToPropagate = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
  }
  else
  {

    return 0;
  }
  return v9;
}

- (void)setWantsMessageCachingWhileSuspended:(BOOL)a3
{
  self->_wantsMessageCachingWhileSuspended = a3;
}

- (void)resumeForEventsOnly:(BOOL)a3
{
  BWPipelineStage *pipelineStage;
  BWNodeInput *input;
  _QWORD v7[5];
  BOOL v8;

  if (self->_suspended && !self->_resuming)
  {
    if (self->_waitingForDeferredAttach)
    {
      self->_waitingForDeferredResume = 1;
      self->_waitingForDeferredResumeForEventsOnly = a3;
    }
    else
    {
      os_unfair_lock_lock(&self->_suspensionLock);
      self->_resumedForEventsOnly = a3;
      self->_resuming = 1;
      pipelineStage = self->_pipelineStage;
      input = self->_input;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __40__BWNodeConnection_resumeForEventsOnly___block_invoke;
      v7[3] = &unk_1E49256B0;
      v7[4] = self;
      v8 = a3;
      -[BWPipelineStage sendMessagesToInput:messageProvider:](pipelineStage, "sendMessagesToInput:messageProvider:", input, v7);
      os_unfair_lock_unlock(&self->_suspensionLock);
    }
  }
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNodeConnection;
  -[BWNodeConnection dealloc](&v3, sel_dealloc);
}

- (BOOL)deferredAttach
{
  BWNode *v3;
  BWNode *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BWNodeInput *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[BWNodeOutput setConsumer:](self->_output, "setConsumer:", self);
  -[BWNodeInput setConnection:](self->_input, "setConnection:", self);
  self->_waitingForDeferredAttach = 1;
  if (self->_pipelineStage)
  {
    v3 = -[BWNodeInput node](self->_input, "node");
    if (v3)
    {
      v4 = v3;
      if (!-[BWNode supportsConcurrentLiveInputCallbacks](v3, "supportsConcurrentLiveInputCallbacks"))
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v5 = -[BWNode inputs](v4, "inputs");
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v16;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v16 != v8)
                objc_enumerationMutation(v5);
              v10 = *(BWNodeInput **)(*((_QWORD *)&v15 + 1) + 8 * v9);
              if (v10 != self->_input)
              {
                v11 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "connection");
                if (v11)
                {
                  v12 = *(_QWORD *)(v11 + 32);
                  if (v12)
                  {
                    if ((objc_msgSend(*(id *)(v11 + 32), "isEqual:", self->_pipelineStage) & 1) == 0)
                    {
                      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempting to attach connection '%@' to input '%@' with pipeline stage '%@' but node doesn't support concurrent input callbacks (node input '%@' has pipeline stage '%@')"), self, self->_input, self->_pipelineStage, v10, v12);
                      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0));
                    }
                  }
                }
              }
              ++v9;
            }
            while (v7 != v9);
            v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v7);
        }
      }
    }
  }
  return 1;
}

- (void)attachNow
{
  NSObject *global_queue;
  _QWORD block[5];

  if (self->_waitingForDeferredAttach)
  {
    self->_waitingForDeferredAttach = 0;
    if (self->_waitingForDeferredResume)
    {
      global_queue = dispatch_get_global_queue(33, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __29__BWNodeConnection_attachNow__block_invoke;
      block[3] = &unk_1E491E720;
      block[4] = self;
      dispatch_async(global_queue, block);
    }
  }
}

uint64_t __29__BWNodeConnection_attachNow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumeForEventsOnly:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 50));
}

- (BOOL)detach
{
  -[BWNodeOutput setConsumer:](self->_output, "setConsumer:", 0);
  -[BWNodeInput setConnection:](self->_input, "setConnection:", 0);
  return 1;
}

- (void)suspendWithMessageCachingAllowed:(BOOL)a3 bypassed:(BOOL)a4
{
  BOOL v4;

  if (!self->_pipelineStage)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't suspend a connection without a pipeline stage"), 0));
  self->_suspended = 1;
  v4 = a3 && self->_wantsMessageCachingWhileSuspended || self->_waitingForDeferredAttach;
  self->_messageCachingEnabled = v4;
  self->_bypassed = a4;
}

- (void)connectBypassInput
{
  BWNodeInput *i;
  BWNode *v4;
  BWPipelineStage *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;

  if (!self->_bypassed)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("Can't connect a bypass on a connection that is not marked as bypassed");
    goto LABEL_9;
  }
  for (i = self->_input;
        ;
        i = -[BWNodeConnection input](-[BWNodeOutput connection](-[BWNode output](v4, "output"), "connection"), "input"))
  {
    v4 = -[BWNodeInput node](i, "node");
    if (!(_BYTE)-[BWNodeOutput connection](-[BWNode output](v4, "output"), "connection")[58])
      break;
  }
  self->_bypassInput = -[BWNode input](-[BWNodeInput node](-[BWNodeConnection input](-[BWNodeOutput connection](-[BWNode output](v4, "output"), "connection"), "input"), "node"), "input");
  v5 = -[BWNodeConnection pipelineStage](-[BWNodeOutput connection](-[BWNode output](v4, "output"), "connection"), "pipelineStage");
  self->_bypassPipelineStage = v5;
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("Bypassed node's output does not have a pipeline stage");
LABEL_9:
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0));
  }
}

BOOL __40__BWNodeConnection_resumeForEventsOnly___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a2 + 8) == 1;
}

- (BOOL)wantsMessageCachingWhileSuspended
{
  return self->_wantsMessageCachingWhileSuspended;
}

@end
