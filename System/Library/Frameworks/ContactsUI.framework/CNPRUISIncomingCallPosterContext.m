@implementation CNPRUISIncomingCallPosterContext

- (CNPRUISIncomingCallPosterContext)initWithNameVariations:(id)a3 preferredNameStyle:(unint64_t)a4 horizontalTitleBoundingRect:(CGRect)a5 verticalTitleBoundingRect:(CGRect)a6 imageAssetID:(id)a7 personalPoster:(BOOL)a8
{
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  id v20;
  id v21;
  CNPRUISIncomingCallPosterContext *v22;
  id v23;
  void *v24;
  uint64_t v25;
  PRUISIncomingCallPosterContext *wrappedIncomingCallPosterContext;
  objc_super v28;

  v8 = a8;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v14 = a5.size.height;
  v15 = a5.size.width;
  v16 = a5.origin.y;
  v17 = a5.origin.x;
  v20 = a3;
  v21 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CNPRUISIncomingCallPosterContext;
  v22 = -[CNPRUISIncomingCallPosterContext init](&v28, sel_init);
  if (v22)
  {
    v23 = objc_alloc((Class)getPRUISIncomingCallPosterContextClass[0]());
    objc_msgSend(v20, "wrappedNameVariations");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", v24, a4 == 1, v21, v8, v17, v16, v15, v14, x, y, width, height);
    wrappedIncomingCallPosterContext = v22->_wrappedIncomingCallPosterContext;
    v22->_wrappedIncomingCallPosterContext = (PRUISIncomingCallPosterContext *)v25;

  }
  return v22;
}

- (CNPRUISIncomingCallPosterContext)initWithContact:(id)a3 showName:(BOOL)a4
{
  id v5;
  void *v6;
  CNPRUISIncomingCallPosterContext *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CNPRUISIncomingCallPosterContextNameVariations *v29;

  v5 = a3;
  objc_msgSend(v5, "posterName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    +[CNPRUISIncomingCallPosterContext emptyContext](CNPRUISIncomingCallPosterContext, "emptyContext");
    v7 = (CNPRUISIncomingCallPosterContext *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13D40], "unifiedMeContactMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isMeContact:", v5);

    v10 = objc_alloc(MEMORY[0x1E0DC3F98]);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v12 = (void *)objc_msgSend(v10, "initWithFrame:");

    +[CNIncomingCallSnapshotViewController horizontalNameLabelBoundingRectForName:window:](CNIncomingCallSnapshotViewController, "horizontalNameLabelBoundingRectForName:window:", v6, v12);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    +[CNIncomingCallSnapshotViewController verticalNameLabelBoundingRectForName:window:](CNIncomingCallSnapshotViewController, "verticalNameLabelBoundingRectForName:window:", v6, v12);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v29 = -[CNPRUISIncomingCallPosterContextNameVariations initWithShortName:fullName:]([CNPRUISIncomingCallPosterContextNameVariations alloc], "initWithShortName:fullName:", v6, 0);
    self = -[CNPRUISIncomingCallPosterContext initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:](self, "initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", v29, 0, 0, v9, v14, v16, v18, v20, v22, v24, v26, v28);

    v7 = self;
  }

  return v7;
}

- (NSString)preferredTitleString
{
  return (NSString *)-[PRUISIncomingCallPosterContext preferredTitleString](self->_wrappedIncomingCallPosterContext, "preferredTitleString");
}

- (NSString)titleString
{
  return (NSString *)-[PRUISIncomingCallPosterContext titleString](self->_wrappedIncomingCallPosterContext, "titleString");
}

- (PRUISIncomingCallPosterContext)wrappedIncomingCallPosterContext
{
  return self->_wrappedIncomingCallPosterContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedIncomingCallPosterContext, 0);
}

+ (id)emptyContext
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", 0, 0, 0, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

@end
