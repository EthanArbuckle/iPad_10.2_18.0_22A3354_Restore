@implementation AMSRatingsStorefrontResult

- (AMSRatingsStorefrontResult)initWithURLResult:(id)a3 mediaType:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  AMSRatingsStorefrontResult *v9;

  objc_msgSend(a3, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
    goto LABEL_5;
  }
  v8 = v7;

  if (!v8)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  self = -[AMSRatingsStorefrontResult initWithDictionaries:mediaType:](self, "initWithDictionaries:mediaType:", v8, a4);
  v9 = self;
LABEL_6:

  return v9;
}

- (AMSRatingsStorefrontResult)initWithData:(id)a3 mediaType:(unint64_t)a4
{
  void *v6;
  void *v7;
  AMSRatingsStorefrontResult *v8;
  id v9;
  uint64_t v11;

  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v11)
    goto LABEL_2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    goto LABEL_7;
  }
  v9 = v9;

  if (v9)
  {
    self = -[AMSRatingsStorefrontResult initWithDictionaries:mediaType:](self, "initWithDictionaries:mediaType:", v9, a4);
    v8 = self;
LABEL_7:

    goto LABEL_8;
  }
LABEL_2:
  v8 = 0;
LABEL_8:

  return v8;
}

- (AMSRatingsStorefrontResult)initWithDictionaries:(id)a3 mediaType:(unint64_t)a4
{
  id v6;
  AMSRatingsStorefrontResult *v7;
  AMSRatingsStorefrontResult *v8;
  uint64_t v9;
  NSArray *ratingsStoreFronts;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSRatingsStorefrontResult;
  v7 = -[AMSRatingsStorefrontResult init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    -[AMSRatingsStorefrontResult _mapRatingsDictionaries:withMediaType:](v7, "_mapRatingsDictionaries:withMediaType:", v6, a4);
    v9 = objc_claimAutoreleasedReturnValue();
    ratingsStoreFronts = v8->_ratingsStoreFronts;
    v8->_ratingsStoreFronts = (NSArray *)v9;

  }
  return v8;
}

- (id)_mapRatingsDictionaries:(id)a3 withMediaType:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  _QWORD v10[5];

  v6 = a3;
  v7 = -[AMSRatingsStorefrontResult _ratingInfoMediaTypeForTaskMediaType:](self, "_ratingInfoMediaTypeForTaskMediaType:", a4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__AMSRatingsStorefrontResult__mapRatingsDictionaries_withMediaType___block_invoke;
  v10[3] = &__block_descriptor_40_e44___AMSRatingsStoreFront_16__0__NSDictionary_8l;
  v10[4] = v7;
  objc_msgSend(v6, "ams_mapWithTransformIgnoresNil:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

AMSRatingsStoreFront *__68__AMSRatingsStorefrontResult__mapRatingsDictionaries_withMediaType___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AMSRatingsStoreFront storeFrontWithDictionary:mediaType:](AMSRatingsStoreFront, "storeFrontWithDictionary:mediaType:", a2, *(_QWORD *)(a1 + 32));
}

- (unint64_t)_ratingInfoMediaTypeForTaskMediaType:(unint64_t)a3
{
  return a3 == 1;
}

- (NSArray)ratingsStoreFronts
{
  return self->_ratingsStoreFronts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingsStoreFronts, 0);
}

@end
