@implementation CRBasicCardSectionViewDisappearanceFeedback

- (CRCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_cardSection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSection, 0);
}

@end
