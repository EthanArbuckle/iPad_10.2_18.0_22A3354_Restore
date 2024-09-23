@implementation NTKEditOptionPickerView

- (NTKEditOptionPickerView)initWithOptions:(id)a3 selectedOption:(id)a4
{
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKEditOptionPickerView;
  v8 = -[NTKEditOptionPickerView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v8)
  {
    if ((objc_msgSend(v6, "containsObject:", v7) & 1) == 0)
    {
      objc_msgSend(v6, "arrayByAddingObject:", v7);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v9;
    }
    objc_storeStrong((id *)v8 + 52, v6);
    *((_QWORD *)v8 + 56) = objc_msgSend(*((id *)v8 + 52), "count");
    *((_QWORD *)v8 + 57) = objc_msgSend(v6, "indexOfObject:", v7);
    v10 = MEMORY[0x1E0C9BAA8];
    v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)(v8 + 504) = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(v8 + 520) = v11;
    *(_OWORD *)(v8 + 536) = *(_OWORD *)(v10 + 32);
    v12 = (void *)objc_msgSend(v8, "_newContainerView");
    objc_msgSend(v8, "setContainerView:", v12);

  }
  return (NTKEditOptionPickerView *)v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; selectedOption = %d; numberOfOptions = %d>"),
               objc_opt_class(),
               self,
               self->_selectedOptionIndex,
               self->_numberOfOptions);
}

- (void)setContainerView:(id)a3
{
  NTKEditOptionContainerView *v5;
  NTKEditOptionContainerView *containerView;
  NTKEditOptionContainerView *v7;

  v5 = (NTKEditOptionContainerView *)a3;
  containerView = self->_containerView;
  if (containerView != v5)
  {
    v7 = v5;
    -[NTKEditOptionContainerView removeFromSuperview](containerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_containerView, a3);
    -[NTKEditOptionPickerView addSubview:](self, "addSubview:", self->_containerView);
    -[NTKEditOptionPickerView _updateContainer](self, "_updateContainer");
    v5 = v7;
  }

}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_contentTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_contentTransform.c = v4;
  *(_OWORD *)&self->_contentTransform.tx = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__NTKEditOptionPickerView_setContentTransform___block_invoke;
  v6[3] = &__block_descriptor_80_e37_v16__0__NTKEditOptionPickerSideView_8l;
  v5 = *(_OWORD *)&a3->c;
  v7 = *(_OWORD *)&a3->a;
  v8 = v5;
  v9 = *(_OWORD *)&a3->tx;
  -[NTKEditOptionPickerView _enumerateSideViewsWithBlock:](self, "_enumerateSideViewsWithBlock:", v6);
}

uint64_t __47__NTKEditOptionPickerView_setContentTransform___block_invoke(_OWORD *a1, void *a2)
{
  __int128 v2;
  _OWORD v4[3];

  v2 = a1[3];
  v4[0] = a1[2];
  v4[1] = v2;
  v4[2] = a1[4];
  return objc_msgSend(a2, "applyContentTransform:", v4);
}

- (void)_updateContainer
{
  unint64_t v3;
  id v4;

  self->_visibleOptionBufferSize = -[NTKEditOptionContainerView numberOfVisibleSides](self->_containerView, "numberOfVisibleSides");
  if (-[NTKEditOptionContainerView numberOfSides](self->_containerView, "numberOfSides"))
  {
    v3 = 0;
    do
    {
      v4 = objc_alloc_init(-[NTKEditOptionPickerView _sideViewClass](self, "_sideViewClass"));
      -[NTKEditOptionPickerView _willDisplaySideView:](self, "_willDisplaySideView:", v4);
      -[NTKEditOptionContainerView setView:forSideAtIndex:](self->_containerView, "setView:forSideAtIndex:", v4, v3);

      ++v3;
    }
    while (v3 < -[NTKEditOptionContainerView numberOfSides](self->_containerView, "numberOfSides"));
  }
  -[NTKEditOptionPickerView _tileContainerForTransitionDirection:](self, "_tileContainerForTransitionDirection:", 0);
  -[NTKEditOptionPickerView _transitionToSelectedOption](self, "_transitionToSelectedOption");
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
      -[NTKEditOptionPickerView _tileContainerForTransitionDirection:](self, "_tileContainerForTransitionDirection:", 0);
  }
}

- (void)setNumberOfSides:(unint64_t)a3
{
  if (-[NTKEditOptionContainerView numberOfSides](self->_containerView, "numberOfSides") != a3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NTKEditOptionContainerView setNumberOfSides:](self->_containerView, "setNumberOfSides:", a3);
    -[NTKEditOptionPickerView _updateContainer](self, "_updateContainer");
    -[NTKEditOptionPickerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (unint64_t)numberOfSides
{
  return -[NTKEditOptionContainerView numberOfSides](self->_containerView, "numberOfSides");
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
  -[NTKEditOptionPickerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)incrementSelection
{
  if (self->_selectedOptionIndex + 1 < self->_numberOfOptions)
  {
    -[NTKEditOptionPickerView _tileContainerForTransitionDirection:](self, "_tileContainerForTransitionDirection:", 1);
    ++self->_selectedOptionIndex;
    -[NTKEditOptionPickerView _transitionAnimatedToSelectedOptionFromIndex:](self, "_transitionAnimatedToSelectedOptionFromIndex:");
  }
}

- (void)decrementSelection
{
  if (self->_selectedOptionIndex)
  {
    -[NTKEditOptionPickerView _tileContainerForTransitionDirection:](self, "_tileContainerForTransitionDirection:", 2);
    --self->_selectedOptionIndex;
    -[NTKEditOptionPickerView _transitionAnimatedToSelectedOptionFromIndex:](self, "_transitionAnimatedToSelectedOptionFromIndex:");
  }
}

- (id)selectedOption
{
  return -[NTKEditOptionPickerView optionAtIndex:](self, "optionAtIndex:", self->_selectedOptionIndex);
}

- (id)optionAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_options, "objectAtIndexedSubscript:", a3);
}

- (void)setSelectedOptionIndex:(unint64_t)a3
{
  -[NTKEditOptionPickerView setSelectedOptionIndex:animated:](self, "setSelectedOptionIndex:animated:", a3, 0);
}

- (void)setSelectedOptionIndex:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t selectedOptionIndex;

  if (a4)
  {
    selectedOptionIndex = self->_selectedOptionIndex;
    if (selectedOptionIndex <= a3)
    {
      if (selectedOptionIndex < a3)
      {
        do
          -[NTKEditOptionPickerView incrementSelection](self, "incrementSelection");
        while (self->_selectedOptionIndex < a3);
      }
    }
    else
    {
      do
        -[NTKEditOptionPickerView decrementSelection](self, "decrementSelection");
      while (self->_selectedOptionIndex > a3);
    }
  }
  else
  {
    self->_selectedOptionIndex = a3;
    -[NTKEditOptionPickerView _tileContainerForTransitionDirection:](self, "_tileContainerForTransitionDirection:", 0);
    -[NTKEditOptionPickerView _transitionToSelectedOption](self, "_transitionToSelectedOption");
  }
}

- (void)setTransitionFraction:(double)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  unint64_t selectedOptionIndex;
  unint64_t v10;
  unint64_t v11;

  selectedOptionIndex = self->_selectedOptionIndex;
  if (a3 > 0.5)
  {
    v10 = a5;
    if (selectedOptionIndex == a5)
      goto LABEL_6;
    goto LABEL_5;
  }
  v10 = a4;
  if (selectedOptionIndex != a4)
  {
LABEL_5:
    self->_selectedOptionIndex = v10;
    -[NTKEditOptionPickerView _tileContainerForTransitionDirection:](self, "_tileContainerForTransitionDirection:", 0);
  }
LABEL_6:
  v11 = -[NTKEditOptionContainerView numberOfSides](self->_containerView, "numberOfSides");
  -[NTKEditOptionContainerView transitionToFraction:fromSideAtIndex:toSideAtIndex:](self->_containerView, "transitionToFraction:fromSideAtIndex:toSideAtIndex:", a4 % v11, a5 % v11, a3);
}

- (void)layoutSubviews
{
  NTKEditOptionContainerView *containerView;

  containerView = self->_containerView;
  -[NTKEditOptionPickerView _frameForContainerView](self, "_frameForContainerView");
  -[NTKEditOptionContainerView setFrame:](containerView, "setFrame:");
}

- (void)applyBreathingScale:(double)a3
{
  __int128 v4;
  _QWORD v5[4];
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  memset(&v8, 0, sizeof(v8));
  v4 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&v7.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&v7.c = v4;
  *(_OWORD *)&v7.tx = *(_OWORD *)&self->_contentTransform.tx;
  CGAffineTransformScale(&v8, &v7, a3, a3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__NTKEditOptionPickerView_applyBreathingScale___block_invoke;
  v5[3] = &__block_descriptor_80_e37_v16__0__NTKEditOptionPickerSideView_8l;
  v6 = v8;
  -[NTKEditOptionPickerView _enumerateSideViewsWithBlock:](self, "_enumerateSideViewsWithBlock:", v5);
}

uint64_t __47__NTKEditOptionPickerView_applyBreathingScale___block_invoke(_OWORD *a1, void *a2)
{
  __int128 v2;
  _OWORD v4[3];

  v2 = a1[3];
  v4[0] = a1[2];
  v4[1] = v2;
  v4[2] = a1[4];
  return objc_msgSend(a2, "applyContentTransform:", v4);
}

- (void)applyRubberBandingFraction:(double)a3
{
  double v5;
  __int128 v6;
  double v7;
  _QWORD v8[4];
  CGAffineTransform v9;
  double v10;
  CGAffineTransform v11;
  CGAffineTransform v12;

  v5 = NTKScaleForRubberBandingFraction(a3);
  memset(&v12, 0, sizeof(v12));
  v6 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&v11.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&v11.c = v6;
  *(_OWORD *)&v11.tx = *(_OWORD *)&self->_contentTransform.tx;
  CGAffineTransformScale(&v12, &v11, v5, v5);
  v7 = NTKAlphaForRubberBandingFraction(a3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__NTKEditOptionPickerView_applyRubberBandingFraction___block_invoke;
  v8[3] = &__block_descriptor_88_e37_v16__0__NTKEditOptionPickerSideView_8l;
  v9 = v12;
  v10 = v7;
  -[NTKEditOptionPickerView _enumerateSideViewsWithBlock:](self, "_enumerateSideViewsWithBlock:", v8);
}

void __54__NTKEditOptionPickerView_applyRubberBandingFraction___block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  id v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 32);
  v6 = v3;
  v7 = *(_OWORD *)(a1 + 64);
  v4 = a2;
  objc_msgSend(v4, "applyContentTransform:", &v5);
  objc_msgSend(v4, "setAlpha:", *(double *)(a1 + 80), v5, v6, v7);

}

- (CGRect)_frameForContainerView
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[NTKEditOptionPickerView bounds](self, "bounds");
  top = self->_padding.top;
  left = self->_padding.left;
  v6 = v5 + left;
  v8 = v7 + top;
  v10 = v9 - (left + self->_padding.right);
  v12 = v11 - (top + self->_padding.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (id)_sideViewAtIndex:(unint64_t)a3
{
  return (id)-[NTKEditOptionContainerView viewForSideAtIndex:](self->_containerView, "viewForSideAtIndex:", a3);
}

- (id)_selectedSideView
{
  unint64_t selectedOptionIndex;
  unint64_t v4;

  if (-[NTKEditOptionContainerView numberOfSides](self->_containerView, "numberOfSides"))
  {
    selectedOptionIndex = self->_selectedOptionIndex;
    v4 = selectedOptionIndex % -[NTKEditOptionContainerView numberOfSides](self->_containerView, "numberOfSides");
  }
  else
  {
    v4 = 0;
  }
  return -[NTKEditOptionPickerView _sideViewAtIndex:](self, "_sideViewAtIndex:", v4);
}

- (void)_tileContainerForTransitionDirection:(int64_t)a3
{
  uint64_t v5;
  unint64_t selectedOptionIndex;
  unint64_t visibleOptionBufferSize;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = -[NTKEditOptionContainerView numberOfSides](self->_containerView, "numberOfSides");
  if (v5)
  {
    selectedOptionIndex = self->_selectedOptionIndex;
    visibleOptionBufferSize = self->_visibleOptionBufferSize;
    v8 = a3 == 2 ? -1 : 0;
    v9 = selectedOptionIndex - (a3 == 2) - visibleOptionBufferSize;
    v10 = a3 == 1 ? selectedOptionIndex + 1 : self->_selectedOptionIndex;
    v11 = v10 + visibleOptionBufferSize;
    v12 = self->_active ? 0x7FFFFFFFFFFFFFFFLL : self->_selectedOptionIndex;
    if ((uint64_t)v9 <= v11)
    {
      v13 = v5;
      v14 = ((a3 == 1) | (2 * visibleOptionBufferSize)) - v8 + 1;
      do
      {
        -[NTKEditOptionPickerView _sideViewAtIndex:](self, "_sideViewAtIndex:", (uint64_t)(v13 + v9) % v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v17 = 0;
        }
        else if (v12 == v9)
        {
          v17 = 0;
        }
        else
        {
          v17 = 0;
          if (v9 < self->_numberOfOptions)
          {
            -[NSArray objectAtIndex:](self->_options, "objectAtIndex:", v9);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(void))self->_optionToViewMapper + 2))();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        objc_msgSend(v15, "setOptionView:", v17);
        -[NTKEditOptionPickerView _configureSideView:forOption:](self, "_configureSideView:forOption:", v15, v16);

        ++v9;
        --v14;
      }
      while (v14);
    }
  }
}

- (id)_newContainerView
{
  return (id)objc_opt_new();
}

- (Class)_sideViewClass
{
  return (Class)objc_opt_class();
}

- (void)_transitionToSelectedOption
{
  unint64_t selectedOptionIndex;
  unint64_t v4;

  if (-[NTKEditOptionContainerView numberOfSides](self->_containerView, "numberOfSides"))
  {
    selectedOptionIndex = self->_selectedOptionIndex;
    v4 = selectedOptionIndex % -[NTKEditOptionContainerView numberOfSides](self->_containerView, "numberOfSides");
  }
  else
  {
    v4 = 0;
  }
  -[NTKEditOptionContainerView transitionToSideAtIndex:](self->_containerView, "transitionToSideAtIndex:", v4);
}

- (void)_enumerateSideViewsWithBlock:(id)a3
{
  unint64_t v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  if (-[NTKEditOptionContainerView numberOfSides](self->_containerView, "numberOfSides"))
  {
    v4 = 0;
    do
    {
      -[NTKEditOptionPickerView _sideViewAtIndex:](self, "_sideViewAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v5);

      ++v4;
    }
    while (v4 < -[NTKEditOptionContainerView numberOfSides](self->_containerView, "numberOfSides"));
  }

}

- (unint64_t)numberOfOptions
{
  return self->_numberOfOptions;
}

- (id)optionToViewMapper
{
  return self->_optionToViewMapper;
}

- (void)setOptionToViewMapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGAffineTransform)contentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[10].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].b;
  return self;
}

- (unint64_t)selectedOptionIndex
{
  return self->_selectedOptionIndex;
}

- (BOOL)active
{
  return self->_active;
}

- (NTKEditOptionContainerView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong(&self->_optionToViewMapper, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
