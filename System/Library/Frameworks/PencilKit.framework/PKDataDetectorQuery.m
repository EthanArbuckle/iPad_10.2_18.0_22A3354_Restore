@implementation PKDataDetectorQuery

- (PKDataDetectorQuery)initWithRecognitionSessionManager:(id)a3
{
  id v4;
  PKDataDetectorQuery *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDataDetectorQuery;
  v5 = -[PKQuery initWithRecognitionSessionManager:](&v11, sel_initWithRecognitionSessionManager_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D167F8]);
    -[PKRecognitionSessionManager session](v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithRecognitionSession:", v7);
    -[PKDetectionQuery setQuery:](v5, "setQuery:", v8);

    -[PKDetectionQuery query](v5, "query");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v5);

  }
  return v5;
}

- (void)queryDidUpdateResult:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id DDDetectionControllerClass;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  PKDataDetectorQueryItem *v21;
  PKDataDetectorQueryItem *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "foundItems");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__11;
    v45 = __Block_byref_object_dispose__11;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __FilteredFoundItems_block_invoke;
    v40[3] = &unk_1E7779D50;
    v40[4] = &v41;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v40);
    DDDetectionControllerClass = getDDDetectionControllerClass();
    v8 = v42[5];
    v9 = objc_msgSend(getDDDetectionControllerClass(), "allPublicTypes");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(DDDetectionControllerClass, "filterResults:forTypes:referenceDate:referenceTimeZone:", v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "count");
    if (v13 >= objc_msgSend((id)v42[5], "count"))
    {
      v14 = v5;
    }
    else
    {
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__11;
      v38 = __Block_byref_object_dispose__11;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v31[0] = v6;
      v31[1] = 3221225472;
      v31[2] = __FilteredFoundItems_block_invoke_2;
      v31[3] = &unk_1E7779D78;
      v32 = v12;
      v33 = &v34;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v31);
      v14 = (id)v35[5];

      _Block_object_dispose(&v34, 8);
    }

    _Block_object_dispose(&v41, 8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v47, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v28;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v16);
          v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v19);
          v21 = [PKDataDetectorQueryItem alloc];
          v22 = -[PKDataDetectorQueryItem initWithCoreHandwritingDataDetectorQueryItem:](v21, "initWithCoreHandwritingDataDetectorQueryItem:", v20, (_QWORD)v27);
          objc_msgSend(v15, "addObject:", v22);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v47, 16);
      }
      while (v17);
    }

    -[PKQuery delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      -[PKQuery delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v15, "copy");
      objc_msgSend(v25, "dataDetectorQuery:foundItems:", self, v26);

    }
  }

}

@end
