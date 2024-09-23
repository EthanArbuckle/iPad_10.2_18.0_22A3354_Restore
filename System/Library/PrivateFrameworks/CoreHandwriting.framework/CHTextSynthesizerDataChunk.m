@implementation CHTextSynthesizerDataChunk

- (CHTextSynthesizerDataChunk)initWithChunkValueForSynthesis:(id)a3 originalValue:(id)a4 range:(_NSRange)a5 isNotDef:(BOOL)a6 synthesisSuggestion:(int64_t)a7
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  CHTextSynthesizerDataChunk *v16;
  CHTextSynthesizerDataChunk *v17;
  objc_super v19;

  length = a5.length;
  location = a5.location;
  v14 = a3;
  v15 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CHTextSynthesizerDataChunk;
  v16 = -[CHTextSynthesizerDataChunk init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_chunkValueForSynthesis, a3);
    objc_storeStrong((id *)&v17->_chunkValueOriginal, a4);
    v17->_rangeInOriginalString.location = location;
    v17->_rangeInOriginalString.length = length;
    v17->_isNotDef = a6;
    v17->_synthesisSuggestion = a7;
  }

  return v17;
}

- (int64_t)compareByRangeWithDataChunk:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger location;
  unint64_t v7;

  location = self->_rangeInOriginalString.location;
  v7 = objc_msgSend_rangeInOriginalString(a3, a2, (uint64_t)a3, v3, v4, v5);
  if (location < v7)
    return -1;
  else
    return location > v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  int isNotDef;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend_chunkValueOriginal(self, v6, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_chunkValueOriginal(v5, v12, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqualToString_(v11, v18, (uint64_t)v17, v19, v20, v21))
    {
      v55 = 0;
      goto LABEL_11;
    }
    objc_msgSend_chunkValueForSynthesis(self, v22, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_chunkValueForSynthesis(v5, v28, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqualToString_(v27, v34, (uint64_t)v33, v35, v36, v37))
      goto LABEL_7;
    v43 = objc_msgSend_rangeInOriginalString(self, v38, v39, v40, v41, v42);
    v45 = v44;
    v55 = 0;
    if (v43 != objc_msgSend_rangeInOriginalString(v5, v44, v46, v47, v48, v49) || v45 != v50)
      goto LABEL_8;
    isNotDef = objc_msgSend_isNotDef(self, v50, v51, v52, v53, v54);
    if (isNotDef == objc_msgSend_isNotDef(v5, v57, v58, v59, v60, v61))
    {
      v68 = objc_msgSend_synthesisSuggestion(self, v62, v63, v64, v65, v66);
      v55 = v68 == objc_msgSend_synthesisSuggestion(v5, v69, v70, v71, v72, v73);
    }
    else
    {
LABEL_7:
      v55 = 0;
    }
LABEL_8:

LABEL_11:
    goto LABEL_12;
  }
  v55 = 0;
LABEL_12:

  return v55;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int isNotDef;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSRange v41;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_chunkValueForSynthesis(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_chunkValueOriginal(self, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41.location = objc_msgSend_rangeInOriginalString(self, v17, v18, v19, v20, v21);
  NSStringFromRange(v41);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  isNotDef = objc_msgSend_isNotDef(self, v23, v24, v25, v26, v27);
  v34 = objc_msgSend_synthesisSuggestion(self, v29, v30, v31, v32, v33);
  if (isNotDef)
    objc_msgSend_stringWithFormat_(v3, v35, (uint64_t)CFSTR("%@ valueSynthesis:%@, valueOriginal:%@, range:%@, isNotDef:%@, synthesisSuggestion:%d"), v36, v37, v38, v4, v10, v16, v22, CFSTR("YES"), v34);
  else
    objc_msgSend_stringWithFormat_(v3, v35, (uint64_t)CFSTR("%@ valueSynthesis:%@, valueOriginal:%@, range:%@, isNotDef:%@, synthesisSuggestion:%d"), v36, v37, v38, v4, v10, v16, v22, CFSTR("NO"), v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (_NSRange)rangeInOriginalString
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeInOriginalString.length;
  location = self->_rangeInOriginalString.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeInOriginalString:(_NSRange)a3
{
  self->_rangeInOriginalString = a3;
}

- (NSString)chunkValueOriginal
{
  return self->_chunkValueOriginal;
}

- (void)setChunkValueOriginal:(id)a3
{
  objc_storeStrong((id *)&self->_chunkValueOriginal, a3);
}

- (NSString)chunkValueForSynthesis
{
  return self->_chunkValueForSynthesis;
}

- (BOOL)isNotDef
{
  return self->_isNotDef;
}

- (int64_t)synthesisSuggestion
{
  return self->_synthesisSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chunkValueForSynthesis, 0);
  objc_storeStrong((id *)&self->_chunkValueOriginal, 0);
}

@end
