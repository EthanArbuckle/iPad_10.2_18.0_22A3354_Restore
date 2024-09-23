@implementation CHReflowableSynthesisResultToken

- (CHReflowableSynthesisResultToken)initWithSynthesisResult:(id)a3 principalLines:(id *)a4 bounds:(CGRect)a5 hasPrecedingSpace:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  CGPoint var1;
  CGPoint v27;
  CGPoint v28;
  CGPoint v29;
  const char *v30;
  CHReflowableSynthesisResultToken *hasPrecedingSpace;
  _OWORD v33[8];

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  objc_msgSend_drawing(v13, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_content(v13, v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  var1 = a4->var2.var1;
  v33[4] = a4->var2.var0;
  v33[5] = var1;
  v27 = a4->var3.var1;
  v33[6] = a4->var3.var0;
  v33[7] = v27;
  v28 = a4->var0.var1;
  v33[0] = a4->var0.var0;
  v33[1] = v28;
  v29 = a4->var1.var1;
  v33[2] = a4->var1.var0;
  v33[3] = v29;
  hasPrecedingSpace = (CHReflowableSynthesisResultToken *)objc_msgSend_initWithDrawing_string_principalLines_bounds_hasPrecedingSpace_(self, v30, (uint64_t)v19, (uint64_t)v25, (uint64_t)v33, v6, x, y, width, height);

  return hasPrecedingSpace;
}

- (CHReflowableSynthesisResultToken)initWithDrawing:(id)a3 string:(id)a4 principalLines:(id *)a5 bounds:(CGRect)a6 hasPrecedingSpace:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  CGPoint var1;
  CGPoint v18;
  CGPoint v19;
  CGPoint v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CHReflowableSynthesisResultToken *v26;
  uint64_t v27;
  CHDrawing *drawing;
  objc_super v30;
  _OWORD v31[8];

  v7 = a7;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v15 = a3;
  v16 = a4;
  var1 = a5->var2.var1;
  v31[4] = a5->var2.var0;
  v31[5] = var1;
  v18 = a5->var3.var1;
  v31[6] = a5->var3.var0;
  v31[7] = v18;
  v19 = a5->var0.var1;
  v31[0] = a5->var0.var0;
  v31[1] = v19;
  v20 = a5->var1.var1;
  v31[2] = a5->var1.var0;
  v31[3] = v20;
  v30.receiver = self;
  v30.super_class = (Class)CHReflowableSynthesisResultToken;
  v26 = -[CHReflowableTextToken initWithString:principalLines:bounds:hasPrecedingSpace:](&v30, sel_initWithString_principalLines_bounds_hasPrecedingSpace_, v16, v31, v7, x, y, width, height);
  if (v26)
  {
    v27 = objc_msgSend_copy(v15, v21, v22, v23, v24, v25);
    drawing = v26->_drawing;
    v26->_drawing = (CHDrawing *)v27;

  }
  return v26;
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
}

@end
