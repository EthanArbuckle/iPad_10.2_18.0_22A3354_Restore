@implementation PKAutoRefineQueryItem

- (id)initWithQueryItem:(void *)a3 usingStrokeProvider:
{
  id v5;
  id *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  double *v23;
  __int128 v24;
  id v25;
  void *v26;
  void *v27;
  double x;
  double y;
  double width;
  double height;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  id v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  _BYTE v70[128];
  uint64_t v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v71 = *MEMORY[0x1E0C80C00];
  v52 = a2;
  v5 = a3;
  if (a1)
  {
    v62.receiver = a1;
    v62.super_class = (Class)PKAutoRefineQueryItem;
    v6 = (id *)objc_msgSendSuper2(&v62, sel_init);
    if (v6)
    {
      objc_msgSend(v52, "textResult");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v6[2];
      v6[2] = (id)v7;

      objc_msgSend(v52, "strokeIdentifiers");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v6[4];
      v6[4] = (id)v9;

      v11 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v52, "strokeIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v14 = v6[4];
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v59 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            if (objc_msgSend(v5, "isValidStrokeIdentifier:", v18))
            {
              v19 = v18;
              objc_msgSend(v19, "strokeUUID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v20);

            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
        }
        while (v15);
      }

      objc_storeStrong(v6 + 5, v13);
      v21 = os_log_create("com.apple.pencilkit", "AutoRefine");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6[2], "topTranscription");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v6[4], "count");
        v50 = objc_msgSend(v6[2], "tokenColumnCount");
        *(_DWORD *)buf = 138740483;
        v65 = (uint64_t)v48;
        v66 = 2048;
        v67 = v49;
        v68 = 2048;
        v69 = v50;
        _os_log_debug_impl(&dword_1BE213000, v21, OS_LOG_TYPE_DEBUG, "AutoRefine Creating PKAutoRefineQueryItem transcription _%{sensitive}@_, %ld strokes and %ld token columns", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6[2], "tokenColumnCount"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v23 = (double *)MEMORY[0x1E0C9D628];
      *(_QWORD *)&v24 = 138412290;
      v51 = v24;
      while (v22 < objc_msgSend(v6[2], "tokenColumnCount", v51))
      {
        v25 = v6[4];
        objc_msgSend(v6[2], "strokeIndexesForColumnsInRange:", v22, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectsAtIndexes:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        x = *v23;
        y = v23[1];
        width = v23[2];
        height = v23[3];
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v32 = v27;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v55;
          while (2)
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v55 != v34)
                objc_enumerationMutation(v32);
              v36 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
              if (!objc_msgSend(v5, "isValidStrokeIdentifier:", v36))
              {
                v42 = os_log_create("com.apple.pencilkit", "AutoRefine");
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = v51;
                  v65 = (uint64_t)v36;
                  _os_log_debug_impl(&dword_1BE213000, v42, OS_LOG_TYPE_DEBUG, "AutoRefine Unexpected issue while creating PKAutoRefineQueryItem, stroke with Identifier %@ not found in stroke provider.", buf, 0xCu);
                }

                x = *v23;
                y = v23[1];
                width = v23[2];
                height = v23[3];
                goto LABEL_28;
              }
              objc_msgSend(v5, "strokeForIdentifier:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "bounds");
              v75.origin.x = v38;
              v75.origin.y = v39;
              v75.size.width = v40;
              v75.size.height = v41;
              v72.origin.x = x;
              v72.origin.y = y;
              v72.size.width = width;
              v72.size.height = height;
              v73 = CGRectUnion(v72, v75);
              x = v73.origin.x;
              y = v73.origin.y;
              width = v73.size.width;
              height = v73.size.height;

            }
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
            if (v33)
              continue;
            break;
          }
        }
LABEL_28:

        v43 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v74.origin.x = x;
          v74.origin.y = y;
          v74.size.width = width;
          v74.size.height = height;
          NSStringFromCGRect(v74);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v65 = v22;
          v66 = 2112;
          v67 = (uint64_t)v45;
          _os_log_debug_impl(&dword_1BE213000, v43, OS_LOG_TYPE_DEBUG, "AutoRefine PKAutoRefineQueryItem bounds for token column %ld = %@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "addObject:", v44);

        ++v22;
      }
      objc_storeStrong(v6 + 1, obj);
      objc_msgSend(v52, "refinedTokenColumns");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRefinedTokenColumns:", v46);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)boundsForTextResultsColumnAtIndex:(uint64_t)a1
{
  void *v2;
  double v3;
  double v4;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CGRectValue");
  v4 = v3;

  return v4;
}

- (void)setRefinedTokenColumns:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinableStrokes, 0);
  objc_storeStrong((id *)&self->_strokesUUIDs, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_refinedTokenColumns, 0);
  objc_storeStrong((id *)&self->_textResult, 0);
  objc_storeStrong((id *)&self->_boundingBoxForTokenColumn, 0);
}

@end
