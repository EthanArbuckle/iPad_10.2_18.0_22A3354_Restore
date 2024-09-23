@implementation CHTokenizedResultToken

- (CHTokenizedResultToken)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CHTokenizedResultToken *v11;

  objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (CHTokenizedResultToken *)objc_msgSend_initWithString_strokeIndexes_bounds_(self, v8, (uint64_t)&stru_1E77F6F28, (uint64_t)v7, v9, v10, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

  return v11;
}

- (CHTokenizedResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 bounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CHTokenizedResultToken *v28;
  uint64_t v29;
  NSString *string;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSIndexSet *strokeIndexes;
  objc_super v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend_characterSetWithRange_(MEMORY[0x1E0CB3500], v13, 57440, 1024, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_rangeOfCharacterFromSet_(v11, v17, (uint64_t)v16, v18, v19, v20);

  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v22 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v11;
      _os_log_impl(&dword_1BE607000, v22, OS_LOG_TYPE_FAULT, "The input string (%@) contains one or more ligature private code points", buf, 0xCu);
    }

  }
  v39.receiver = self;
  v39.super_class = (Class)CHTokenizedResultToken;
  v28 = -[CHTokenizedResultToken init](&v39, sel_init);
  if (v28)
  {
    v29 = objc_msgSend_copy(v11, v23, v24, v25, v26, v27);
    string = v28->_string;
    v28->_string = (NSString *)v29;

    v36 = objc_msgSend_copy(v12, v31, v32, v33, v34, v35);
    strokeIndexes = v28->_strokeIndexes;
    v28->_strokeIndexes = (NSIndexSet *)v36;

    v28->_bounds.origin.x = x;
    v28->_bounds.origin.y = y;
    v28->_bounds.size.width = width;
    v28->_bounds.size.height = height;
  }

  return v28;
}

- (CHTokenizedResultToken)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  id v18;
  char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("string"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("strokeIndexes"), v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v9)
    v16 = v14 == 0;
  else
    v16 = 1;
  if (v16)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v17 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = (id)objc_opt_class();
      v18 = v33;
      _os_log_impl(&dword_1BE607000, v17, OS_LOG_TYPE_ERROR, "%@ decoding failed. Token string and stroke indexes are required to be nonnull when constructing a result token", buf, 0xCu);

    }
    v19 = 0;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)CHTokenizedResultToken;
    v19 = -[CHTokenizedResultToken init](&v31, sel_init);
    objc_storeStrong((id *)v19 + 1, v9);
    objc_storeStrong((id *)v19 + 2, v15);
    v29 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v30 = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v19 + 24) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v19 + 40) = v29;
    v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, (uint64_t)CFSTR("bounds"), v22, v23);
    self = (CHTokenizedResultToken *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getValue_size_(self, v24, (uint64_t)(v19 + 24), 32, v25, v26);
    if (CGRectEqualToRect(*(CGRect *)(v19 + 24), *MEMORY[0x1E0C9D648]))
    {
      *(_OWORD *)(v19 + 24) = v30;
      *(_OWORD *)(v19 + 40) = v29;
    }
  }

  return (CHTokenizedResultToken *)v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *string;
  id v5;
  const char *v6;
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
  id v18;

  string = self->_string;
  v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)string, (uint64_t)CFSTR("string"), v7, v8);
  objc_msgSend_encodeObject_forKey_(v5, v9, (uint64_t)self->_strokeIndexes, (uint64_t)CFSTR("strokeIndexes"), v10, v11);
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v12, (uint64_t)&self->_bounds, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v13, v14);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)v18, (uint64_t)CFSTR("bounds"), v16, v17);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  v10.super_class = (Class)CHTokenizedResultToken;
  -[CHTokenizedResultToken description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v4, (uint64_t)CFSTR(" '%@', strokes: %@, bounds: [%0.4f, %0.4f, %0.4f, %0.4f]"), v5, v6, v7, self->_string, self->_strokeIndexes, *(_QWORD *)&self->_bounds.origin.x, *(_QWORD *)&self->_bounds.origin.y, *(_QWORD *)&self->_bounds.size.width, *(_QWORD *)&self->_bounds.size.height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqualToTokenizedResultToken:(id)a3
{
  CHTokenizedResultToken *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHTokenizedResultToken *v10;
  NSString *string;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSIndexSet *strokeIndexes;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSIndexSet *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGRect v60;

  v4 = (CHTokenizedResultToken *)a3;
  v10 = v4;
  if (self == v4)
  {
    v49 = 1;
    goto LABEL_11;
  }
  string = self->_string;
  objc_msgSend_string(v4, v5, v6, v7, v8, v9);
  v12 = objc_claimAutoreleasedReturnValue();
  if (string == (NSString *)v12)
  {

    strokeIndexes = self->_strokeIndexes;
    objc_msgSend_strokeIndexes(v10, v50, v51, v52, v53, v54);
    v31 = objc_claimAutoreleasedReturnValue();
    if (strokeIndexes != (NSIndexSet *)v31)
    {
LABEL_5:
      v37 = (void *)v31;
      v38 = self->_strokeIndexes;
      objc_msgSend_strokeIndexes(v10, v32, v33, v34, v35, v36);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v38) = objc_msgSend_isEqualToIndexSet_(v38, v40, (uint64_t)v39, v41, v42, v43);

      if (!(_DWORD)v38)
        goto LABEL_6;
LABEL_10:
      objc_msgSend_bounds(v10, v44, v45, v46, v47, v48);
      v60.origin.x = v55;
      v60.origin.y = v56;
      v60.size.width = v57;
      v60.size.height = v58;
      v49 = CGRectEqualToRect(self->_bounds, v60);
      goto LABEL_11;
    }
LABEL_9:

    goto LABEL_10;
  }
  v18 = (void *)v12;
  v19 = self->_string;
  objc_msgSend_string(v10, v13, v14, v15, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = objc_msgSend_isEqualToString_(v19, v21, (uint64_t)v20, v22, v23, v24);

  if ((_DWORD)v19)
  {
    strokeIndexes = self->_strokeIndexes;
    objc_msgSend_strokeIndexes(v10, v25, v26, v27, v28, v29);
    v31 = objc_claimAutoreleasedReturnValue();
    if (strokeIndexes != (NSIndexSet *)v31)
      goto LABEL_5;
    goto LABEL_9;
  }
LABEL_6:
  v49 = 0;
LABEL_11:

  return v49;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToTokenizedResultToken;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToTokenizedResultToken = objc_msgSend_isEqualToTokenizedResultToken_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTokenizedResultToken;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = objc_msgSend_hash(self->_string, a2, v2, v3, v4, v5);
  return objc_msgSend_hash(self->_strokeIndexes, v8, v9, v10, v11, v12) ^ v7;
}

- (BOOL)isEquivalentToToken:(id)a3
{
  id v4;
  NSString *string;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char isEqualToIndexSet;
  NSIndexSet *strokeIndexes;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSIndexSet *v36;
  NSIndexSet *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a3;
  string = self->_string;
  objc_msgSend_string(v4, v6, v7, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (string == (NSString *)v11)
  {

  }
  else
  {
    v17 = (void *)v11;
    v18 = self->_string;
    objc_msgSend_string(v4, v12, v13, v14, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend_isEqualToString_(v18, v20, (uint64_t)v19, v21, v22, v23);

    if (!(_DWORD)v18)
    {
      isEqualToIndexSet = 0;
      goto LABEL_9;
    }
  }
  strokeIndexes = self->_strokeIndexes;
  objc_msgSend_strokeIndexes(v4, v24, v25, v26, v27, v28);
  v36 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
  if (strokeIndexes == v36)
  {
    isEqualToIndexSet = 1;
  }
  else
  {
    v37 = self->_strokeIndexes;
    objc_msgSend_strokeIndexes(v4, v31, v32, v33, v34, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToIndexSet = objc_msgSend_isEqualToIndexSet_(v37, v39, (uint64_t)v38, v40, v41, v42);

  }
LABEL_9:

  return isEqualToIndexSet;
}

- (NSString)string
{
  return self->_string;
}

- (NSIndexSet)strokeIndexes
{
  return self->_strokeIndexes;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIndexes, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
