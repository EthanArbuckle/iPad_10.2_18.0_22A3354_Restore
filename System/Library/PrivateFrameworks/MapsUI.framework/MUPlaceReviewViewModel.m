@implementation MUPlaceReviewViewModel

- (MUPlaceReviewViewModel)initWithRatingSnippet:(id)a3 avatarGenerator:(id)a4
{
  id v7;
  id v8;
  MUPlaceReviewViewModel *v9;
  MUPlaceReviewViewModel *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUPlaceReviewViewModel;
  v9 = -[MUPlaceReviewViewModel init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ratingSnippet, a3);
    objc_storeStrong((id *)&v10->_avatarGenerator, a4);
  }

  return v10;
}

- (double)normalizedScore
{
  double result;

  -[MKMapItemProviderRatingSnippet _normalizedScore](self->_ratingSnippet, "_normalizedScore");
  return result;
}

- (NSString)authorText
{
  return (NSString *)-[MKMapItemProviderRatingSnippet _reviewerName](self->_ratingSnippet, "_reviewerName");
}

- (NSDate)reviewDate
{
  return (NSDate *)-[MKMapItemProviderRatingSnippet _date](self->_ratingSnippet, "_date");
}

- (NSString)reviewText
{
  return (NSString *)-[MKMapItemProviderRatingSnippet _localizedSnippet](self->_ratingSnippet, "_localizedSnippet");
}

- (void)loadUserIconWithPointSize:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  id v7;
  MKMapItemProviderRatingSnippet *ratingSnippet;
  MKMapItemProviderRatingSnippet *v9;
  MKMapItemProviderRatingSnippet **p_ratingSnippet;
  id v11;
  _QWORD v12[4];
  id v13;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  p_ratingSnippet = &self->_ratingSnippet;
  ratingSnippet = self->_ratingSnippet;
  v9 = p_ratingSnippet[1];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__MUPlaceReviewViewModel_loadUserIconWithPointSize_completion___block_invoke;
  v12[3] = &unk_1E2E03DC8;
  v13 = v7;
  v11 = v7;
  -[MKMapItemProviderRatingSnippet avatarForReview:pointSize:completion:](v9, "avatarForReview:pointSize:completion:", ratingSnippet, v12, width, height);

}

void __63__MUPlaceReviewViewModel_loadUserIconWithPointSize_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__MUPlaceReviewViewModel_loadUserIconWithPointSize_completion___block_invoke_2;
  v6[3] = &unk_1E2E03198;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __63__MUPlaceReviewViewModel_loadUserIconWithPointSize_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_ratingSnippet, 0);
}

@end
