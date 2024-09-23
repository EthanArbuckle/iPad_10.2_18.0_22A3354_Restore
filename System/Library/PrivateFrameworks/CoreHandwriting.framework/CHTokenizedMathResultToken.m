@implementation CHTokenizedMathResultToken

- (CHTokenizedMathResultToken)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  CHTokenizedMathResultToken *v10;

  objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (CHTokenizedMathResultToken *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(self, v8, (uint64_t)&stru_1E77F6F28, (uint64_t)v7, 0, v9, 0.0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

  return v10;
}

- (CHTokenizedMathResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 score:(double)a5 bounds:(CGRect)a6 properties:(unint64_t)a7
{
  return (CHTokenizedMathResultToken *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_(self, a2, (uint64_t)a3, (uint64_t)a4, a7, 0, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, 0.0);
}

- (CHTokenizedMathResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 score:(double)a5 bounds:(CGRect)a6 properties:(unint64_t)a7 maskedAlternative:(id)a8 maskedAlternativeScore:(double)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  CHTokenizedMathResultToken *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CHTokenizedMathResultToken *v26;
  uint64_t v27;
  NSString *maskedAlternative;
  objc_super v30;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)CHTokenizedMathResultToken;
  v20 = -[CHTokenizedResultToken initWithString:strokeIndexes:bounds:](&v30, sel_initWithString_strokeIndexes_bounds_, a3, a4, x, y, width, height);
  v26 = v20;
  if (v20)
  {
    v20->_score = a5;
    v20->_properties = a7;
    v27 = objc_msgSend_copy(v19, v21, v22, v23, v24, v25);
    maskedAlternative = v26->_maskedAlternative;
    v26->_maskedAlternative = (NSString *)v27;

    v26->_maskedAlternativeScore = a9;
  }

  return v26;
}

+ (id)updatedToken:(id)a3 withString:(id)a4
{
  id v5;
  id v6;
  CHTokenizedMathResultToken *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  const char *v53;
  void *v54;

  v5 = a4;
  v6 = a3;
  v7 = [CHTokenizedMathResultToken alloc];
  objc_msgSend_strokeIndexes(v6, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_score(v6, v14, v15, v16, v17, v18);
  v20 = v19;
  objc_msgSend_bounds(v6, v21, v22, v23, v24, v25);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v39 = objc_msgSend_properties(v6, v34, v35, v36, v37, v38);
  objc_msgSend_maskedAlternative(v6, v40, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_maskedAlternativeScore(v6, v46, v47, v48, v49, v50);
  v52 = v51;

  v54 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_(v7, v53, (uint64_t)v5, (uint64_t)v13, v39, (uint64_t)v45, v20, v27, v29, v31, v33, v52);
  return v54;
}

- (CHTokenizedMathResultToken)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  objc_super v48;
  objc_super v49;
  objc_super v50;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)CHTokenizedMathResultToken;
  v9 = -[CHTokenizedResultToken initWithCoder:](&v51, sel_initWithCoder_, v4);
  if (v9)
  {
    objc_msgSend_decodeDoubleForKey_(v4, v5, (uint64_t)CFSTR("score"), v6, v7, v8);
    *(_QWORD *)(v9 + 56) = v10;
    *(_QWORD *)(v9 + 64) = objc_msgSend_decodeIntegerForKey_(v4, v11, (uint64_t)CFSTR("properties"), v12, v13, v14);
    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("maskedAlternative"), v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(v9 + 72);
    *(_QWORD *)(v9 + 72) = v19;

    objc_msgSend_decodeDoubleForKey_(v4, v21, (uint64_t)CFSTR("maskedAlternativeScore"), v22, v23, v24);
    *(_QWORD *)(v9 + 80) = v25;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v50.receiver = (id)v9;
      v50.super_class = (Class)CHTokenizedMathResultToken;
      v26 = (id)v9;
      -[CHTokenizedResultToken string](&v50, sel_string);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setString_(v26, v28, (uint64_t)v27, v29, v30, v31);

      v49.receiver = v26;
      v49.super_class = (Class)CHTokenizedMathResultToken;
      -[CHTokenizedResultToken strokeIndexes](&v49, sel_strokeIndexes);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setStrokeIndexes_(v26, v33, (uint64_t)v32, v34, v35, v36);

      v48.receiver = v26;
      v48.super_class = (Class)CHTokenizedMathResultToken;
      -[CHTokenizedResultToken bounds](&v48, sel_bounds);
      objc_msgSend_setBounds_(v26, v37, v38, v39, v40, v41);
      v9 = objc_msgSend_copy(v26, v42, v43, v44, v45, v46);

    }
  }

  return (CHTokenizedMathResultToken *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CHTokenizedMathResultToken;
  v4 = a3;
  -[CHTokenizedResultToken encodeWithCoder:](&v19, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeDouble_forKey_(v4, v5, (uint64_t)CFSTR("score"), v6, v7, v8, self->_score, v19.receiver, v19.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v9, self->_properties, (uint64_t)CFSTR("properties"), v10, v11);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)self->_maskedAlternative, (uint64_t)CFSTR("maskedAlternative"), v13, v14);
  objc_msgSend_encodeDouble_forKey_(v4, v15, (uint64_t)CFSTR("maskedAlternativeScore"), v16, v17, v18, self->_maskedAlternativeScore);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CHMutableTokenizedMathResultToken *v4;
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
  double score;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  double v49;
  void *v50;

  v4 = [CHMutableTokenizedMathResultToken alloc];
  objc_msgSend_string(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIndexes(self, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  score = self->_score;
  objc_msgSend_bounds(self, v18, v19, v20, v21, v22);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v36 = objc_msgSend_properties(self, v31, v32, v33, v34, v35);
  objc_msgSend_maskedAlternative(self, v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_maskedAlternativeScore(self, v43, v44, v45, v46, v47);
  v50 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_(v4, v48, (uint64_t)v10, (uint64_t)v16, v36, (uint64_t)v42, score, v24, v26, v28, v30, v49);

  return v50;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CHTokenizedMathResultToken;
  -[CHTokenizedResultToken description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v4, (uint64_t)CFSTR(", score: %0.4f"), v5, v6, v7, *(_QWORD *)&self->_score);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_description(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v7, v8, (uint64_t)CFSTR(", masked_alternative: %@, alternative_skore: %0.4f"), v9, v10, v11, self->_maskedAlternative, *(_QWORD *)&self->_maskedAlternativeScore);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqualToTokenizedMathResultToken:(id)a3
{
  CHTokenizedMathResultToken *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double score;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  unint64_t properties;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSString *maskedAlternative;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSString *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  double maskedAlternativeScore;
  double v51;
  objc_super v52;

  v4 = (CHTokenizedMathResultToken *)a3;
  if (self == v4)
  {
    v48 = 1;
    goto LABEL_10;
  }
  v52.receiver = self;
  v52.super_class = (Class)CHTokenizedMathResultToken;
  if (-[CHTokenizedResultToken isEqualToTokenizedResultToken:](&v52, sel_isEqualToTokenizedResultToken_, v4))
  {
    score = self->_score;
    objc_msgSend_score(v4, v5, v6, v7, v8, v9);
    if (vabdd_f64(score, v16) < 2.22044605e-16)
    {
      properties = self->_properties;
      if (properties == objc_msgSend_properties(v4, v11, v12, v13, v14, v15))
      {
        v23 = self->_properties;
        if (v23 == objc_msgSend_properties(v4, v18, v19, v20, v21, v22))
        {
          maskedAlternative = self->_maskedAlternative;
          objc_msgSend_maskedAlternative(v4, v24, v25, v26, v27, v28);
          v30 = objc_claimAutoreleasedReturnValue();
          if (maskedAlternative == (NSString *)v30)
          {

          }
          else
          {
            v36 = (void *)v30;
            v37 = self->_maskedAlternative;
            objc_msgSend_maskedAlternative(v4, v31, v32, v33, v34, v35);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v37) = objc_msgSend_isEqualToString_(v37, v39, (uint64_t)v38, v40, v41, v42);

            if (!(_DWORD)v37)
              goto LABEL_8;
          }
          maskedAlternativeScore = self->_maskedAlternativeScore;
          objc_msgSend_maskedAlternativeScore(v4, v43, v44, v45, v46, v47);
          v48 = vabdd_f64(maskedAlternativeScore, v51) < 2.22044605e-16;
          goto LABEL_10;
        }
      }
    }
  }
LABEL_8:
  v48 = 0;
LABEL_10:

  return v48;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToTokenizedMathResultToken;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToTokenizedMathResultToken = objc_msgSend_isEqualToTokenizedMathResultToken_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTokenizedMathResultToken;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CHTokenizedMathResultToken;
  v3 = -[CHTokenizedResultToken hash](&v12, sel_hash);
  v4 = (unint64_t)(self->_score * 1000.0);
  v5 = v3 ^ self->_properties;
  return v5 ^ objc_msgSend_hash(self->_maskedAlternative, v6, v7, v8, v9, v10) ^ v4 ^ (unint64_t)(self->_maskedAlternativeScore * 100000.0);
}

- (BOOL)isEquivalentToToken:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)CHTokenizedMathResultToken;
    v5 = -[CHTokenizedResultToken isEquivalentToToken:](&v7, sel_isEquivalentToToken_, v4);

    return v5;
  }
  else
  {

    return 0;
  }
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskedAlternative, 0);
}

- (unint64_t)properties
{
  return self->_properties;
}

- (NSString)maskedAlternative
{
  return self->_maskedAlternative;
}

- (double)maskedAlternativeScore
{
  return self->_maskedAlternativeScore;
}

@end
