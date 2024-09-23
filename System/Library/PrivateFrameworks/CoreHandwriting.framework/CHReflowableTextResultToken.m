@implementation CHReflowableTextResultToken

- (CHReflowableTextResultToken)initWithString:(id)a3 strokeIdentifiers:(id)a4 nonTextStrokeIdentifiers:(id)a5 principalLines:(id *)a6 bounds:(CGRect)a7 hasPrecedingSpace:(BOOL)a8
{
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  CGPoint var1;
  CGPoint v21;
  CGPoint v22;
  CGPoint v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CHReflowableTextResultToken *v29;
  uint64_t v30;
  NSArray *strokeIdentifiers;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSArray *nonTextStrokeIdentifiers;
  objc_super v40;
  _OWORD v41[8];

  v8 = a8;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  var1 = a6->var2.var1;
  v41[4] = a6->var2.var0;
  v41[5] = var1;
  v21 = a6->var3.var1;
  v41[6] = a6->var3.var0;
  v41[7] = v21;
  v22 = a6->var0.var1;
  v41[0] = a6->var0.var0;
  v41[1] = v22;
  v23 = a6->var1.var1;
  v41[2] = a6->var1.var0;
  v41[3] = v23;
  v40.receiver = self;
  v40.super_class = (Class)CHReflowableTextResultToken;
  v29 = -[CHReflowableTextToken initWithString:principalLines:bounds:hasPrecedingSpace:](&v40, sel_initWithString_principalLines_bounds_hasPrecedingSpace_, v17, v41, v8, x, y, width, height);
  if (v29)
  {
    v30 = objc_msgSend_copy(v18, v24, v25, v26, v27, v28);
    strokeIdentifiers = v29->_strokeIdentifiers;
    v29->_strokeIdentifiers = (NSArray *)v30;

    v37 = objc_msgSend_copy(v19, v32, v33, v34, v35, v36);
    nonTextStrokeIdentifiers = v29->_nonTextStrokeIdentifiers;
    v29->_nonTextStrokeIdentifiers = (NSArray *)v37;

  }
  return v29;
}

- (id)description
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
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_strokeIdentifiers(self, a2, v2, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_count(v8, v9, v10, v11, v12, v13);
  objc_msgSend_nonTextStrokeIdentifiers(self, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_count(v20, v21, v22, v23, v24, v25);
  objc_msgSend_stringWithFormat_(v7, v27, (uint64_t)CFSTR("(ReflowableToken Text:%lu, NonText:%lu), "), v28, v29, v30, v14, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (NSArray)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (NSArray)nonTextStrokeIdentifiers
{
  return self->_nonTextStrokeIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonTextStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
}

@end
