@implementation CertUIItemDetail

+ (id)itemDetailWithDetailTitle:(id)a3 detail:(id)a4
{
  id v5;
  id v6;
  CertUIItemDetail *v7;
  uint64_t v9;

  v5 = a4;
  v6 = a3;
  LOBYTE(v9) = 0;
  v7 = -[CertUIItemDetail initWithDetailTitle:detail:detailHighlightColor:showCheckmarkView:checkmarkText:checkmarkHighlightColor:showCheckmark:]([CertUIItemDetail alloc], "initWithDetailTitle:detail:detailHighlightColor:showCheckmarkView:checkmarkText:checkmarkHighlightColor:showCheckmark:", v6, v5, 0, 0, 0, 0, v9);

  return v7;
}

+ (id)itemDetailWithDetailTitle:(id)a3 detail:(id)a4 detailHighlightColor:(id)a5
{
  id v7;
  id v8;
  id v9;
  CertUIItemDetail *v10;
  uint64_t v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  LOBYTE(v12) = 0;
  v10 = -[CertUIItemDetail initWithDetailTitle:detail:detailHighlightColor:showCheckmarkView:checkmarkText:checkmarkHighlightColor:showCheckmark:]([CertUIItemDetail alloc], "initWithDetailTitle:detail:detailHighlightColor:showCheckmarkView:checkmarkText:checkmarkHighlightColor:showCheckmark:", v9, v8, v7, 0, 0, 0, v12);

  return v10;
}

+ (id)itemDetailWithDetailTitle:(id)a3 detail:(id)a4 detailHighlightColor:(id)a5 showCheckmarkView:(BOOL)a6 checkmarkText:(id)a7 checkmarkHighlightColor:(id)a8 showCheckmark:(BOOL)a9
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  CertUIItemDetail *v19;
  uint64_t v21;

  v10 = a6;
  v14 = a8;
  v15 = a7;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  LOBYTE(v21) = a9;
  v19 = -[CertUIItemDetail initWithDetailTitle:detail:detailHighlightColor:showCheckmarkView:checkmarkText:checkmarkHighlightColor:showCheckmark:]([CertUIItemDetail alloc], "initWithDetailTitle:detail:detailHighlightColor:showCheckmarkView:checkmarkText:checkmarkHighlightColor:showCheckmark:", v18, v17, v16, v10, v15, v14, v21);

  return v19;
}

- (CertUIItemDetail)initWithDetailTitle:(id)a3 detail:(id)a4 detailHighlightColor:(id)a5 showCheckmarkView:(BOOL)a6 checkmarkText:(id)a7 checkmarkHighlightColor:(id)a8 showCheckmark:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  CertUIItemDetail *v19;
  CertUIItemDetail *v20;
  id v23;
  objc_super v24;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v23 = a7;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CertUIItemDetail;
  v19 = -[CertUIItemDetail init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_detailTitle, a3);
    objc_storeStrong((id *)&v20->_detail, a4);
    objc_storeStrong((id *)&v20->_detailHighlightColor, a5);
    v20->_showCheckmarkView = a6;
    objc_storeStrong((id *)&v20->_checkmarkText, a7);
    objc_storeStrong((id *)&v20->_checkmarkHighlightColor, a8);
    v20->_showCheckmark = a9;
  }

  return v20;
}

- (NSString)detailTitle
{
  return self->_detailTitle;
}

- (void)setDetailTitle:(id)a3
{
  objc_storeStrong((id *)&self->_detailTitle, a3);
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
  objc_storeStrong((id *)&self->_detail, a3);
}

- (UIColor)detailHighlightColor
{
  return self->_detailHighlightColor;
}

- (void)setDetailHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_detailHighlightColor, a3);
}

- (BOOL)showCheckmarkView
{
  return self->_showCheckmarkView;
}

- (void)setShowCheckmarkView:(BOOL)a3
{
  self->_showCheckmarkView = a3;
}

- (NSString)checkmarkText
{
  return self->_checkmarkText;
}

- (void)setCheckmarkText:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkText, a3);
}

- (UIColor)checkmarkHighlightColor
{
  return self->_checkmarkHighlightColor;
}

- (void)setCheckmarkHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkHighlightColor, a3);
}

- (BOOL)showCheckmark
{
  return self->_showCheckmark;
}

- (void)setShowCheckmark:(BOOL)a3
{
  self->_showCheckmark = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkHighlightColor, 0);
  objc_storeStrong((id *)&self->_checkmarkText, 0);
  objc_storeStrong((id *)&self->_detailHighlightColor, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_detailTitle, 0);
}

@end
