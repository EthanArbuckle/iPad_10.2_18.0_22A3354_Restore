@implementation MUPlaceCallToActionRibbonViewModel

- (MUPlaceCallToActionRibbonViewModel)initWithSubmissionStatus:(id)a3
{
  id v5;
  MUPlaceCallToActionRibbonViewModel *v6;
  MUPlaceCallToActionRibbonViewModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceCallToActionRibbonViewModel;
  v6 = -[MUPlaceCallToActionRibbonViewModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_submissionStatus, a3);
    -[MUPlaceCallToActionRibbonViewModel _updateInternalState](v7, "_updateInternalState");
  }

  return v7;
}

- (void)setSubmissionStatus:(id)a3
{
  id v5;
  MUPlaceCallToActionAppearance *submissionStatus;
  id v7;
  void *v8;
  char v9;
  unint64_t v10;

  v5 = a3;
  submissionStatus = self->_submissionStatus;
  v10 = (unint64_t)v5;
  v7 = submissionStatus;
  v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    v9 = objc_msgSend((id)v10, "isEqual:", v7);

    v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_submissionStatus, a3);
      -[MUPlaceCallToActionRibbonViewModel _updateInternalState](self, "_updateInternalState");
      v8 = (void *)v10;
    }
  }

}

- (void)_updateInternalState
{
  MUPlaceRibbonItemViewModel *v3;
  MUPlaceRibbonItemViewModel *callToActionViewModel;
  void *v5;
  id v6;

  +[MUPlaceRibbonItemViewModel ratingSubmissionStatusViewModelForRatingState:](MUPlaceRibbonItemViewModel, "ratingSubmissionStatusViewModelForRatingState:", -[MKUGCCallToActionViewAppearance ratingState](self->_submissionStatus, "ratingState"));
  v3 = (MUPlaceRibbonItemViewModel *)objc_claimAutoreleasedReturnValue();
  callToActionViewModel = self->_callToActionViewModel;
  self->_callToActionViewModel = v3;

  -[MUPlaceRibbonItemViewModel updateDelegate](self, "updateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ribbonItemViewModelDidUpdate:", self);

  -[MUPlaceRibbonItemViewModel typeStringForAX](self->_callToActionViewModel, "typeStringForAX");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRibbonItemViewModel setTypeStringForAX:](self, "setTypeStringForAX:", v6);

}

- (id)titleStringProvider
{
  void *v2;
  void *v3;

  -[MUPlaceRibbonItemViewModel titleStringProvider](self->_callToActionViewModel, "titleStringProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)valueStringProvider
{
  void *v2;
  void *v3;

  -[MUPlaceRibbonItemViewModel valueStringProvider](self->_callToActionViewModel, "valueStringProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (BOOL)isTappable
{
  return -[MUPlaceRibbonItemViewModel isTappable](self->_callToActionViewModel, "isTappable");
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_callToActionViewModel, 0);
}

@end
