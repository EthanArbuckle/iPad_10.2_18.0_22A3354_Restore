@implementation CHMutableTokenizedMathResultToken

- (CHMutableTokenizedMathResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 score:(double)a5 bounds:(CGRect)a6 properties:(unint64_t)a7 maskedAlternative:(id)a8 maskedAlternativeScore:(double)a9
{
  double height;
  double width;
  double y;
  double x;
  id v20;
  id v21;
  CHMutableTokenizedMathResultToken *v22;
  CHMutableTokenizedMathResultToken *v23;
  objc_super v25;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v20 = a3;
  v21 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CHMutableTokenizedMathResultToken;
  v22 = -[CHTokenizedMathResultToken initWithString:strokeIndexes:score:bounds:properties:maskedAlternative:maskedAlternativeScore:](&v25, sel_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_, v20, v21, a7, a8, a5, x, y, width, height, a9);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_string, a3);
    objc_storeStrong((id *)&v23->_strokeIndexes, a4);
    v23->_bounds.origin.x = x;
    v23->_bounds.origin.y = y;
    v23->_bounds.size.width = width;
    v23->_bounds.size.height = height;
  }

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CHTokenizedMathResultToken *v4;
  const char *v5;

  v4 = [CHTokenizedMathResultToken alloc];
  return (id)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_(v4, v5, (uint64_t)self->_string, (uint64_t)self->_strokeIndexes, self->super._properties, (uint64_t)self->super._maskedAlternative, self->super._score, self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height, self->super._maskedAlternativeScore);
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
  id v11;

  v11 = a3;
  objc_msgSend_string(self, v5, v6, v7, v8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v11)
    objc_storeStrong((id *)&self->_string, a3);

}

- (NSIndexSet)strokeIndexes
{
  return self->_strokeIndexes;
}

- (void)setStrokeIndexes:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSIndexSet *v7;
  NSIndexSet *strokeIndexes;

  if (self->_strokeIndexes != a3)
  {
    v7 = (NSIndexSet *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4, v5);
    strokeIndexes = self->_strokeIndexes;
    self->_strokeIndexes = v7;

  }
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

- (void)setScore:(double)a3
{
  self->super._score = a3;
}

- (void)setProperties:(unint64_t)a3
{
  self->super._properties = a3;
}

- (void)setMaskedAlternative:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSString *v7;
  NSString *maskedAlternative;

  v7 = (NSString *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4, v5);
  maskedAlternative = self->super._maskedAlternative;
  self->super._maskedAlternative = v7;

}

- (void)setMaskedAlternativeScore:(double)a3
{
  self->super._maskedAlternativeScore = a3;
}

- (void)appendToken:(id)a3
{
  NSString *string;
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
  NSString *v15;
  NSString *v16;
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
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  double v60;
  double v61;
  double maskedAlternativeScore;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSString *v74;
  NSString *maskedAlternative;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  id v82;
  CGRect v83;

  v82 = a3;
  string = self->_string;
  objc_msgSend_string(v82, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(string, v11, (uint64_t)v10, v12, v13, v14);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = self->_string;
  self->_string = v15;

  v22 = (void *)objc_msgSend_mutableCopy(self->_strokeIndexes, v17, v18, v19, v20, v21);
  objc_msgSend_strokeIndexes(v82, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addIndexes_(v22, v29, (uint64_t)v28, v30, v31, v32);

  objc_storeStrong((id *)&self->_strokeIndexes, v22);
  objc_msgSend_score(v82, v33, v34, v35, v36, v37);
  self->super._score = v38 * self->super._score;
  objc_msgSend_bounds(v82, v39, v40, v41, v42, v43);
  v83.origin.x = v44;
  v83.origin.y = v45;
  v83.size.width = v46;
  v83.size.height = v47;
  self->_bounds = CGRectUnion(self->_bounds, v83);
  objc_msgSend_maskedAlternative(v82, v48, v49, v50, v51, v52);
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v59 = (void *)v53;
    objc_msgSend_maskedAlternativeScore(v82, v54, v55, v56, v57, v58);
    v61 = v60;
    maskedAlternativeScore = self->super._maskedAlternativeScore;

    if (v61 > maskedAlternativeScore)
    {
      objc_msgSend_maskedAlternative(v82, v63, v64, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (NSString *)objc_msgSend_copy(v68, v69, v70, v71, v72, v73);
      maskedAlternative = self->super._maskedAlternative;
      self->super._maskedAlternative = v74;

      objc_msgSend_maskedAlternativeScore(v82, v76, v77, v78, v79, v80);
      self->super._maskedAlternativeScore = v81;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIndexes, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
