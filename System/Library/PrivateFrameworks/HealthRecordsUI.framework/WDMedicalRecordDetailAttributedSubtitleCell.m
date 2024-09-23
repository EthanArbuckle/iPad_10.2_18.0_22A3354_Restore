@implementation WDMedicalRecordDetailAttributedSubtitleCell

- (void)setSubtitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDMedicalRecordDetailSubtitleCell subtitleLabel](self, "subtitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (NSAttributedString)attributedSubtitle
{
  void *v2;
  void *v3;

  -[WDMedicalRecordDetailSubtitleCell subtitleLabel](self, "subtitleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setAttributedSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
}

@end
