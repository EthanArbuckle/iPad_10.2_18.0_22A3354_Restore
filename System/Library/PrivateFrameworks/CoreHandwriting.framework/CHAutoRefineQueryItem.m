@implementation CHAutoRefineQueryItem

- (CHAutoRefineQueryItem)initWithAutoRefineResult:(id)a3
{
  id v5;
  CHAutoRefineQueryItem *v6;
  CHAutoRefineQueryItem *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSIndexSet *refinedTokenColumns;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CHAutoRefineQueryItem;
  v6 = -[CHAutoRefineQueryItem init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_autoRefineResult, a3);
    objc_msgSend_refinedTokenColumns(v5, v8, v9, v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    refinedTokenColumns = v7->_refinedTokenColumns;
    v7->_refinedTokenColumns = (NSIndexSet *)v13;

  }
  return v7;
}

- (CHTokenizedTextResult)textResult
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return (CHTokenizedTextResult *)objc_msgSend_textResult(self->_autoRefineResult, a2, v2, v3, v4, v5);
}

- (NSArray)strokeIdentifiers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return (NSArray *)objc_msgSend_strokeIdentifiers(self->_autoRefineResult, a2, v2, v3, v4, v5);
}

- (BOOL)q_doesQueryResultDependOnDeclaredVariables
{
  return 0;
}

- (id)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;

  objc_msgSend_strokeIdentifiers(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_msgSend_count(v7, v9, v10, v11, v12, v13);
  objc_msgSend_textResult(self, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topTranscription(v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textResult(self, v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_tokenColumnCount(v32, v33, v34, v35, v36, v37);
  objc_msgSend_stringWithFormat_(v8, v39, (uint64_t)CFSTR("AutoRefineItem with %ld strokes, transcription = %@ across %ld token columns"), v40, v41, v42, v14, v26, v38);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (NSIndexSet)refinedTokenColumns
{
  return self->_refinedTokenColumns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinedTokenColumns, 0);
  objc_storeStrong((id *)&self->_autoRefineResult, 0);
}

@end
