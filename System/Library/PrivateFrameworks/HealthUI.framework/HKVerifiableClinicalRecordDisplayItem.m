@implementation HKVerifiableClinicalRecordDisplayItem

+ (id)subtitleItemWithTitleText:(id)a3 detailText:(id)a4 style:(int64_t)a5
{
  id v7;
  id v8;
  HKVerifiableClinicalRecordDisplayItem *v9;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length") && objc_msgSend(v8, "length"))
  {
    v9 = objc_alloc_init(HKVerifiableClinicalRecordDisplayItem);
    -[HKVerifiableClinicalRecordDisplayItem setType:](v9, "setType:", 0);
    -[HKVerifiableClinicalRecordDisplayItem setSubtitleStyle:](v9, "setSubtitleStyle:", a5);
    -[HKVerifiableClinicalRecordDisplayItem setTitleText:](v9, "setTitleText:", v7);
    -[HKVerifiableClinicalRecordDisplayItem setDetailText:](v9, "setDetailText:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)valueItemWithTitleText:(id)a3 detailText:(id)a4
{
  id v5;
  id v6;
  HKVerifiableClinicalRecordDisplayItem *v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc_init(HKVerifiableClinicalRecordDisplayItem);
    -[HKVerifiableClinicalRecordDisplayItem setType:](v7, "setType:", 1);
    -[HKVerifiableClinicalRecordDisplayItem setTitleText:](v7, "setTitleText:", v5);
    -[HKVerifiableClinicalRecordDisplayItem setDetailText:](v7, "setDetailText:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)valueItemWithTitleText:(id)a3 attributedDetailText:(id)a4
{
  id v5;
  id v6;
  HKVerifiableClinicalRecordDisplayItem *v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc_init(HKVerifiableClinicalRecordDisplayItem);
    -[HKVerifiableClinicalRecordDisplayItem setType:](v7, "setType:", 1);
    -[HKVerifiableClinicalRecordDisplayItem setTitleText:](v7, "setTitleText:", v5);
    -[HKVerifiableClinicalRecordDisplayItem setAttributedDetailText:](v7, "setAttributedDetailText:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)subtitleStyle
{
  return self->_subtitleStyle;
}

- (void)setSubtitleStyle:(int64_t)a3
{
  self->_subtitleStyle = a3;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_storeStrong((id *)&self->_detailText, a3);
}

- (NSAttributedString)attributedDetailText
{
  return self->_attributedDetailText;
}

- (void)setAttributedDetailText:(id)a3
{
  objc_storeStrong((id *)&self->_attributedDetailText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedDetailText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
