@implementation CHMutableTokenizedTextResultToken

- (id)initWithString:(double)a3 strokeIndexes:(double)a4 wordID:(double)a5 modelScore:(double)a6 recognitionScore:(double)a7 combinedScore:(double)a8 alignmentScore:(double)a9 properties:(uint64_t)a10 recognizerSourceLocale:(void *)a11 inputSources:(void *)a12 substrokeCount:(uint64_t)a13 bounds:(uint64_t)a14 originalBounds:(uint64_t)a15 principalLines:(uint64_t)a16
{
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id *v39;
  id *v40;
  objc_super v45;
  _OWORD v46[9];

  v33 = a11;
  v34 = a12;
  v35 = a21[5];
  v46[4] = a21[4];
  v46[5] = v35;
  v36 = a21[7];
  v46[6] = a21[6];
  v46[7] = v36;
  v37 = a21[1];
  v46[0] = *a21;
  v46[1] = v37;
  v38 = a21[3];
  v46[2] = a21[2];
  v46[3] = v38;
  v45.receiver = a1;
  v45.super_class = (Class)CHMutableTokenizedTextResultToken;
  v39 = (id *)objc_msgSendSuper2(&v45, sel_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_, v33, v34, a13, a14, a15, a16, a2, a3, a4, a5, a6, a7, a8, a9, a17, a18, a19,
                a20,
                v46);
  v40 = v39;
  if (v39)
  {
    objc_storeStrong(v39 + 37, a11);
    objc_storeStrong(v40 + 38, a12);
    *((double *)v40 + 39) = a6;
    *((double *)v40 + 40) = a7;
    *((double *)v40 + 41) = a8;
    *((double *)v40 + 42) = a9;
  }

  return v40;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CHTokenizedTextResultToken *v4;
  NSString *string;
  NSIndexSet *strokeIndexes;
  uint64_t wordID;
  double modelScore;
  double recognitionScore;
  double combinedScore;
  double alignmentScore;
  unint64_t properties;
  NSLocale *recognizerSourceLocale;
  unint64_t inputSources;
  int64_t substrokeCount;
  double x;
  double y;
  double width;
  double height;
  CGFloat v20;
  __int128 v21;
  CGFloat v22;
  CGPoint end;
  CGPoint v24;
  CGPoint v25;
  CGPoint v26;
  const char *v27;
  _OWORD v29[8];

  v4 = [CHTokenizedTextResultToken alloc];
  string = self->_string;
  strokeIndexes = self->_strokeIndexes;
  wordID = self->super._wordID;
  modelScore = self->super._modelScore;
  recognitionScore = self->super._recognitionScore;
  combinedScore = self->super._combinedScore;
  alignmentScore = self->super._alignmentScore;
  properties = self->super._properties;
  recognizerSourceLocale = self->super._recognizerSourceLocale;
  inputSources = self->super._inputSources;
  substrokeCount = self->super._substrokeCount;
  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  v20 = self->super._originalBounds.origin.x;
  v21 = *(_OWORD *)&self->super._originalBounds.origin.y;
  v22 = self->super._originalBounds.size.height;
  end = self->super._principalLines.median.end;
  v29[4] = self->super._principalLines.median.start;
  v29[5] = end;
  v24 = self->super._principalLines.top.end;
  v29[6] = self->super._principalLines.top.start;
  v29[7] = v24;
  v25 = self->super._principalLines.descender.end;
  v29[0] = self->super._principalLines.descender.start;
  v29[1] = v25;
  v26 = self->super._principalLines.base.end;
  v29[2] = self->super._principalLines.base.start;
  v29[3] = v26;
  return (id)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v4, v27, (uint64_t)string, (uint64_t)strokeIndexes, wordID, properties, recognizerSourceLocale, inputSources, modelScore, recognitionScore, combinedScore, alignmentScore, x, y, width, height, substrokeCount, *(_QWORD *)&v20, v21,
               *(_QWORD *)&v22,
               v29);
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend_string(self, v5, v6, v7, v8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11 = v12;
  if (v10 != v12)
  {
    objc_storeStrong((id *)&self->_string, a3);
    v11 = v12;
  }

}

- (NSIndexSet)strokeIndexes
{
  return self->_strokeIndexes;
}

- (void)setStrokeIndexes:(id)a3
{
  NSIndexSet *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSIndexSet *v10;
  NSIndexSet *strokeIndexes;
  NSIndexSet *v12;

  v4 = (NSIndexSet *)a3;
  if (self->_strokeIndexes != v4)
  {
    v12 = v4;
    v10 = (NSIndexSet *)objc_msgSend_copy(v4, v5, v6, v7, v8, v9);
    strokeIndexes = self->_strokeIndexes;
    self->_strokeIndexes = v10;

    v4 = v12;
  }

}

- (void)setWordID:(unsigned int)a3
{
  self->super._wordID = a3;
}

- (void)setModelScore:(double)a3
{
  self->super._modelScore = a3;
}

- (void)setRecognitionScore:(double)a3
{
  self->super._recognitionScore = a3;
}

- (void)setCombinedScore:(double)a3
{
  self->super._combinedScore = a3;
}

- (void)setAlignmentScore:(double)a3
{
  self->super._alignmentScore = a3;
}

- (void)setProperties:(unint64_t)a3
{
  self->super._properties = a3;
}

- (void)setRecognizerSourceLocale:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSLocale *v9;
  NSLocale *recognizerSourceLocale;
  id v11;

  v11 = a3;
  v9 = (NSLocale *)objc_msgSend_copy(v11, v4, v5, v6, v7, v8);
  recognizerSourceLocale = self->super._recognizerSourceLocale;
  self->super._recognizerSourceLocale = v9;

}

- (void)setInputSources:(unint64_t)a3
{
  self->super._inputSources = a3;
}

- (void)setSubstrokeCount:(int64_t)a3
{
  self->super._substrokeCount = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIndexes, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
