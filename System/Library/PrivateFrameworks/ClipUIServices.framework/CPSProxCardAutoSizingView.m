@implementation CPSProxCardAutoSizingView

- (CPSProxCardAutoSizingView)init
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v12 = getPRXCardPreferredSizeClassForContainerBoundsSymbolLoc_ptr;
  v26 = getPRXCardPreferredSizeClassForContainerBoundsSymbolLoc_ptr;
  if (!getPRXCardPreferredSizeClassForContainerBoundsSymbolLoc_ptr)
  {
    v13 = (void *)ProxCardKitLibrary();
    v12 = dlsym(v13, "PRXCardPreferredSizeClassForContainerBounds");
    v24[3] = (uint64_t)v12;
    getPRXCardPreferredSizeClassForContainerBoundsSymbolLoc_ptr = v12;
  }
  _Block_object_dispose(&v23, 8);
  if (!v12)
    -[CPSProxCardAutoSizingView init].cold.1();
  v14 = ((uint64_t (*)(double, double, double, double))v12)(v5, v7, v9, v11);

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v15 = getPRXCardPreferredSizeSymbolLoc_ptr;
  v26 = getPRXCardPreferredSizeSymbolLoc_ptr;
  if (!getPRXCardPreferredSizeSymbolLoc_ptr)
  {
    v16 = (void *)ProxCardKitLibrary();
    v15 = dlsym(v16, "PRXCardPreferredSize");
    v24[3] = (uint64_t)v15;
    getPRXCardPreferredSizeSymbolLoc_ptr = v15;
  }
  _Block_object_dispose(&v23, 8);
  if (!v15)
    -[CPSProxCardAutoSizingView init].cold.2();
  v17 = *MEMORY[0x1E0C9D648];
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v19 = ((double (*)(_QWORD, uint64_t))v15)(0, v14);
  v22.receiver = self;
  v22.super_class = (Class)CPSProxCardAutoSizingView;
  return -[CPSProxCardAutoSizingView initWithFrame:](&v22, sel_initWithFrame_, v17, v18, v19, v20);
}

- (void)init
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGSize _PRXCardPreferredSize(PRXCardStyle, PRXCardSizeClass)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSProxCardAutoSizingView.m"), 11, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
