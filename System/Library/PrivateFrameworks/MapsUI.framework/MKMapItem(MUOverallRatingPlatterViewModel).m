@implementation MKMapItem(MUOverallRatingPlatterViewModel)

- (double)rating
{
  float v1;

  objc_msgSend(a1, "_normalizedUserRatingScore");
  return v1;
}

- (uint64_t)numberOfVotes
{
  return objc_msgSend(a1, "_sampleSizeForUserRatingScore");
}

- (id)attributionText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_reviewsAttribution");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle attributionTintColor](MUInfoCardStyle, "attributionTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_attributionFor:sourceStringFormat:moreSourceStringFormat:imageTintColor:", v2, &stru_1E2E05448, &stru_1E2E05448, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v4);
  v14[0] = *MEMORY[0x1E0DC1140];
  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC1108];
  v15[0] = v6;
  v15[1] = &unk_1E2E55188;
  v8 = *MEMORY[0x1E0DC1138];
  v14[1] = v7;
  v14[2] = v8;
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "smallAttributionFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttributes:range:", v11, 0, objc_msgSend(v5, "length"));

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

@end
