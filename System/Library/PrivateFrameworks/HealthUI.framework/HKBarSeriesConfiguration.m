@implementation HKBarSeriesConfiguration

- (void)setIsIncludedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setUnselectedFillStyle:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedFillStyle, a3);
}

- (HKFillStyle)unselectedFillStyle
{
  return self->_unselectedFillStyle;
}

- (HKFillStyle)selectedFillStyle
{
  return self->_selectedFillStyle;
}

- (void)setSelectedFillStyle:(id)a3
{
  objc_storeStrong((id *)&self->_selectedFillStyle, a3);
}

- (HKFillStyle)inactiveFillStyle
{
  return self->_inactiveFillStyle;
}

- (void)setInactiveFillStyle:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveFillStyle, a3);
}

- (id)isIncludedBlock
{
  return self->_isIncludedBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isIncludedBlock, 0);
  objc_storeStrong((id *)&self->_inactiveFillStyle, 0);
  objc_storeStrong((id *)&self->_selectedFillStyle, 0);
  objc_storeStrong((id *)&self->_unselectedFillStyle, 0);
}

@end
