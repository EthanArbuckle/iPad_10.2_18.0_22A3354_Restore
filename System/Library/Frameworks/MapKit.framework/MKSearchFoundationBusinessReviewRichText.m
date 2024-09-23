@implementation MKSearchFoundationBusinessReviewRichText

- (void)resolveReviewStringWithProviderNameByMapItem:(id)a3 lines:(id)a4 temporaryReviewString:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a3;
  _MKLocalizedStringFromThisBundle(CFSTR("Place_Reviews_On_Provider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "_sampleSizeForUserRatingScore");
  objc_msgSend(v10, "_reviewsDisplayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localizedStringWithFormat:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "addObject:", v14);
    if (!v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v16, "insertObject:atIndex:", v14, 0);
  if (v8)
LABEL_3:
    objc_msgSend(v16, "removeObject:", v8);
LABEL_4:
  -[MKSearchFoundationBusinessReviewRichText setReviewResolved:](self, "setReviewResolved:", 1);
  +[MKSearchFoundationResult styledStringFromStringArray:](MKSearchFoundationResult, "styledStringFromStringArray:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKSearchFoundationRichText setText:](self, "setText:", v15);

}

- (void)resolveReviewStringWithProviderNameNotFoundByMapItem:(id)a3 lines:(id)a4 temporaryReviewString:(id)a5
{
  void *v7;
  id v8;

  v8 = a4;
  if (a5)
    objc_msgSend(v8, "removeObject:", a5);
  -[MKSearchFoundationBusinessReviewRichText setReviewResolved:](self, "setReviewResolved:", 1);
  +[MKSearchFoundationResult styledStringFromStringArray:](MKSearchFoundationResult, "styledStringFromStringArray:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKSearchFoundationRichText setText:](self, "setText:", v7);

}

- (BOOL)isReviewResolved
{
  return self->_reviewResolved;
}

- (void)setReviewResolved:(BOOL)a3
{
  self->_reviewResolved = a3;
}

@end
