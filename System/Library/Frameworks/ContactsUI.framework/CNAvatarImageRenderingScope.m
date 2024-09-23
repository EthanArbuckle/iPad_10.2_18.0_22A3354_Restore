@implementation CNAvatarImageRenderingScope

+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(id)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 backgroundStyle:(unint64_t)a9 color:(id)a10 maskedAvatarIndices:(id)a11
{
  _BOOL8 v15;
  double height;
  double width;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;

  v15 = a7;
  height = a3.height;
  width = a3.width;
  v20 = (void *)MEMORY[0x1E0D13D30];
  v21 = objc_retainAutorelease(a6);
  v22 = a11;
  v23 = a10;
  v24 = objc_msgSend(v21, "CGColor");
  if (a9 - 1 >= 4)
    v25 = 0;
  else
    v25 = a9;
  objc_msgSend(v20, "renderingScopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", v24, v15, a8 == 1, v25, v23, v22, width, height, a4, a5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6
{
  return (id)objc_msgSend(a1, "scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:", 0, a5, a6, a3.width, a3.height, a4, 0.0);
}

+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(id)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8
{
  return (id)objc_msgSend(MEMORY[0x1E0D13D30], "renderingScopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:color:", objc_msgSend(objc_retainAutorelease(a6), "CGColor"), a7, a8 == 1, 0, a3.width, a3.height, a4, a5);
}

+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6 backgroundStyle:(unint64_t)a7
{
  _BOOL8 v9;
  double height;
  double width;
  void *v14;
  void *v15;

  v9 = a5;
  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", 0, v9, a6, a7, 0, v14, width, height, a4, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6 color:(id)a7
{
  return (id)objc_msgSend(a1, "scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:color:", 0, a5, a6, a7, a3.width, a3.height, a4, 0.0);
}

+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(id)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 color:(id)a9
{
  _BOOL8 v11;
  double height;
  double width;
  void *v16;
  id v17;
  id v18;
  void *v19;

  v11 = a7;
  height = a3.height;
  width = a3.width;
  v16 = (void *)MEMORY[0x1E0D13D30];
  v17 = objc_retainAutorelease(a6);
  v18 = a9;
  objc_msgSend(v16, "renderingScopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:color:", objc_msgSend(v17, "CGColor"), v11, a8 == 1, v18, width, height, a4, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
