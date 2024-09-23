@implementation EspressoDataFrame

- (EspressoDataFrame)init
{
  EspressoDataFrame *v2;
  uint64_t v3;
  NSMutableDictionary *inputAttachments;
  uint64_t v5;
  NSMutableDictionary *outputAttachments;
  uint64_t v7;
  NSMutableDictionary *groundTruthAttachments;
  uint64_t v9;
  NSString *function_name;
  EspressoDataFrame *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)EspressoDataFrame;
  v2 = -[EspressoDataFrame init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    inputAttachments = v2->_inputAttachments;
    v2->_inputAttachments = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    outputAttachments = v2->_outputAttachments;
    v2->_outputAttachments = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    groundTruthAttachments = v2->_groundTruthAttachments;
    v2->_groundTruthAttachments = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    function_name = v2->_function_name;
    v2->_function_name = (NSString *)v9;

    v11 = v2;
  }

  return v2;
}

- (id)getInputAttachment:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_inputAttachments, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getOutputAttachment:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_outputAttachments, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getGroundTruthAttachment:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_groundTruthAttachments, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getFunctionName
{
  return self->_function_name;
}

- (NSArray)inputAttachmentNames
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_inputAttachments, "allKeys");
}

- (NSArray)groundTruthAttachmentNames
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_groundTruthAttachments, "allKeys");
}

- (NSArray)outputAttachmentNames
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_outputAttachments, "allKeys");
}

- (void)loadFromDict:(id)a3 frameStorage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSString *v29;
  NSString *function_name;
  id obj;
  id obja;
  id objb;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inputs"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v43;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v10);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inputs"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[EspressoDataFrameAttachment fromDict:frameStorage:](EspressoDataFrameAttachment, "fromDict:frameStorage:", v13, v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_inputAttachments, "setObject:forKeyedSubscript:", v14, v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v8);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outputs"));
  obja = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v39;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(obja);
        v18 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v17);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outputs"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[EspressoDataFrameAttachment fromDict:frameStorage:](EspressoDataFrameAttachment, "fromDict:frameStorage:", v20, v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outputAttachments, "setObject:forKeyedSubscript:", v21, v18);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v15);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ground_truths"));
  objb = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(objb);
        v25 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v24);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ground_truths"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[EspressoDataFrameAttachment fromDict:frameStorage:](EspressoDataFrameAttachment, "fromDict:frameStorage:", v27, v7);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groundTruthAttachments, "setObject:forKeyedSubscript:", v28, v25);
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v22);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("function_name"));
  v29 = (NSString *)objc_claimAutoreleasedReturnValue();
  function_name = self->_function_name;
  self->_function_name = v29;

}

- (NSMutableDictionary)inputAttachments
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInputAttachments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)outputAttachments
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOutputAttachments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)groundTruthAttachments
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setGroundTruthAttachments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)function_name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFunction_name:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_function_name, 0);
  objc_storeStrong((id *)&self->_groundTruthAttachments, 0);
  objc_storeStrong((id *)&self->_outputAttachments, 0);
  objc_storeStrong((id *)&self->_inputAttachments, 0);
}

@end
