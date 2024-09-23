@implementation CHReflowableTextToken

- (CHReflowableTextToken)initWithString:(id)a3 principalLines:(id *)a4 bounds:(CGRect)a5 hasPrecedingSpace:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CHReflowableTextToken *v19;
  uint64_t v20;
  NSString *string;
  CGPoint var0;
  CGPoint var1;
  CGPoint v24;
  CGPoint v25;
  CGPoint v26;
  CGPoint v27;
  objc_super v29;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CHReflowableTextToken;
  v19 = -[CHReflowableTextToken init](&v29, sel_init);
  if (v19)
  {
    v20 = objc_msgSend_copy(v13, v14, v15, v16, v17, v18);
    string = v19->_string;
    v19->_string = (NSString *)v20;

    var0 = a4->var0.var0;
    var1 = a4->var0.var1;
    v24 = a4->var1.var0;
    v19->_principalLines.base.end = a4->var1.var1;
    v19->_principalLines.base.start = v24;
    v19->_principalLines.descender.end = var1;
    v19->_principalLines.descender.start = var0;
    v25 = a4->var2.var0;
    v26 = a4->var2.var1;
    v27 = a4->var3.var0;
    v19->_principalLines.top.end = a4->var3.var1;
    v19->_principalLines.top.start = v27;
    v19->_principalLines.median.end = v26;
    v19->_principalLines.median.start = v25;
    v19->_bounds.origin.x = x;
    v19->_bounds.origin.y = y;
    v19->_bounds.size.width = width;
    v19->_bounds.size.height = height;
    v19->_hasPrecedingSpace = a6;
  }

  return v19;
}

- (id)asFullTextResultWithStrokeIdentifiers:(id)a3 strokeProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE v69[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  objc_msgSend_string(self, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB36B8];
  v21 = objc_msgSend_count(v6, v16, v17, v18, v19, v20);
  objc_msgSend_indexSetWithIndexesInRange_(v15, v22, 0, v21, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(self, v26, v27, v28, v29, v30);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  objc_msgSend_bounds(self, v39, v40, v41, v42, v43);
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  objc_msgSend_principalLines(self, v52, v53, v54, v55, v56);
  objc_msgSend_tokenizedTextResultWithString_strokeIndexes_bounds_trailingSeparator_recognizerGenerationIdentifier_defaultTokenScores_originalBounds_principalLines_(v8, v57, (uint64_t)v14, (uint64_t)v25, (uint64_t)&stru_1E77F6F28, 0, v69, v32, v34, v36, v38, 1.0, v45, v47, v49, v51);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = (void *)objc_opt_class();
  objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(v59, v60, (uint64_t)v6, (uint64_t)v7, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputStrokeIdentifiers_(v58, v64, (uint64_t)v63, v65, v66, v67);

  return v58;
}

- (NSString)string
{
  return self->_string;
}

- ($6DEFAE59D8B0B490C28D581BBA01C329)principalLines
{
  CGPoint v3;
  CGPoint v4;
  CGPoint v5;
  CGPoint v6;

  v3 = *(CGPoint *)&self[1].var0.var0.y;
  retstr->var2.var0 = *(CGPoint *)&self->var3.var1.y;
  retstr->var2.var1 = v3;
  v4 = *(CGPoint *)&self[1].var1.var0.y;
  retstr->var3.var0 = *(CGPoint *)&self[1].var0.var1.y;
  retstr->var3.var1 = v4;
  v5 = *(CGPoint *)&self->var2.var0.y;
  retstr->var0.var0 = *(CGPoint *)&self->var1.var1.y;
  retstr->var0.var1 = v5;
  v6 = *(CGPoint *)&self->var3.var0.y;
  retstr->var1.var0 = *(CGPoint *)&self->var2.var1.y;
  retstr->var1.var1 = v6;
  return self;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (BOOL)hasPrecedingSpace
{
  return self->_hasPrecedingSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
