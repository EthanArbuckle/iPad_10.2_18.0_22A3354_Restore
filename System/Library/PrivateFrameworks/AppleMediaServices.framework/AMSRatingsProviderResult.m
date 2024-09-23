@implementation AMSRatingsProviderResult

- (AMSRatingsProviderResult)initWithURLResult:(id)a3 mediaType:(unint64_t)a4 andStoreFront:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  AMSRatingsProviderResult *v12;

  v8 = a5;
  objc_msgSend(a3, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0;
    goto LABEL_5;
  }
  v11 = v10;

  if (!v11)
  {
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  self = -[AMSRatingsProviderResult initWithDictionaries:mediaType:andStoreFront:](self, "initWithDictionaries:mediaType:andStoreFront:", v11, a4, v8);
  v12 = self;
LABEL_6:

  return v12;
}

- (AMSRatingsProviderResult)initWithData:(id)a3 mediaType:(unint64_t)a4 andStoreFront:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  AMSRatingsProviderResult *v11;
  id v12;
  uint64_t v14;

  v8 = a5;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v14)
    goto LABEL_2;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("data"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_7;
  }
  v12 = v12;

  if (v12)
  {
    self = -[AMSRatingsProviderResult initWithDictionaries:mediaType:andStoreFront:](self, "initWithDictionaries:mediaType:andStoreFront:", v12, a4, v8);
    v11 = self;
LABEL_7:

    goto LABEL_8;
  }
LABEL_2:
  v11 = 0;
LABEL_8:

  return v11;
}

- (AMSRatingsProviderResult)initWithDictionaries:(id)a3 mediaType:(unint64_t)a4 andStoreFront:(id)a5
{
  id v8;
  id v9;
  AMSRatingsProviderResult *v10;
  AMSRatingsProviderResult *v11;
  uint64_t v12;
  NSArray *ratingsStoreFronts;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSRatingsProviderResult;
  v10 = -[AMSRatingsProviderResult init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    -[AMSRatingsProviderResult _mapRatingsDictionaries:withMediaType:andStoreFront:](v10, "_mapRatingsDictionaries:withMediaType:andStoreFront:", v8, a4, v9);
    v12 = objc_claimAutoreleasedReturnValue();
    ratingsStoreFronts = v11->_ratingsStoreFronts;
    v11->_ratingsStoreFronts = (NSArray *)v12;

  }
  return v11;
}

- (id)_mapRatingsDictionaries:(id)a3 withMediaType:(unint64_t)a4 andStoreFront:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  unint64_t v16;

  v8 = a5;
  v9 = a3;
  v10 = -[AMSRatingsProviderResult _ratingInfoMediaTypeForTaskMediaType:](self, "_ratingInfoMediaTypeForTaskMediaType:", a4);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__AMSRatingsProviderResult__mapRatingsDictionaries_withMediaType_andStoreFront___block_invoke;
  v14[3] = &unk_1E25454A8;
  v15 = v8;
  v16 = v10;
  v11 = v8;
  objc_msgSend(v9, "ams_mapWithTransformIgnoresNil:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

AMSRatingsStoreFront *__80__AMSRatingsProviderResult__mapRatingsDictionaries_withMediaType_andStoreFront___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AMSRatingsStoreFront storeFrontWithDictionary:mediaType:andStoreFront:](AMSRatingsStoreFront, "storeFrontWithDictionary:mediaType:andStoreFront:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
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
