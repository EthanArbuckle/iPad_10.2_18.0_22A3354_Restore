@implementation MUPlaceReviewAvatarGenerator

- (MUPlaceReviewAvatarGenerator)init
{
  MUPlaceReviewAvatarGenerator *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *workQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPlaceReviewAvatarGenerator;
  v2 = -[MUPlaceReviewAvatarGenerator init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MapsUI.monogram", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)monogramForReviewerName:(id)a3 pointSize:(CGSize)a4 completion:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  NSObject *workQueue;
  id v24;
  __CFString *v25;
  _QWORD v26[4];
  __CFString *v27;
  id v28;
  id v29[3];
  id location;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  v14 = 2;
  if (v13 < 2)
    v14 = v13;
  if (v14)
  {
    v15 = 0;
    v16 = &stru_1E2E05448;
    do
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length"))
      {
        objc_msgSend(v17, "substringWithRange:", 0, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v16 = (__CFString *)v19;
      }

      v20 = v15 + 1;
      v21 = objc_msgSend(v12, "count");
      if (v21 >= 2)
        v22 = 2;
      else
        v22 = v21;
      v15 = 1;
    }
    while (v20 < v22);
  }
  else
  {
    v16 = &stru_1E2E05448;
  }
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __77__MUPlaceReviewAvatarGenerator_monogramForReviewerName_pointSize_completion___block_invoke;
  v26[3] = &unk_1E2E03DF0;
  objc_copyWeak(v29, &location);
  v29[1] = *(id *)&width;
  v29[2] = *(id *)&height;
  v27 = v16;
  v28 = v10;
  v24 = v10;
  v25 = v16;
  dispatch_async(workQueue, v26);

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);

}

void __77__MUPlaceReviewAvatarGenerator_monogramForReviewerName_pointSize_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  _QWORD v17[4];
  id v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "monogrammer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C97450]);
      objc_msgSend(v3, "setMonogrammer:", v5);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "length"))
    {
      v6 = (void *)MEMORY[0x1E0C97460];
      objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "screenScale");
      objc_msgSend(v6, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, *(double *)(a1 + 56), *(double *)(a1 + 64), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "monogrammer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __77__MUPlaceReviewAvatarGenerator_monogramForReviewerName_pointSize_completion___block_invoke_2;
      v17[3] = &unk_1E2E03DC8;
      v11 = *(_QWORD *)(a1 + 32);
      v18 = *(id *)(a1 + 40);
      v12 = (id)objc_msgSend(v10, "renderMonogramForString:scope:imageHandler:", v11, v9, v17);

    }
    else
    {
      objc_msgSend(v3, "monogrammer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "placeholderImageProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "screenScale");
      objc_msgSend(v14, "imageForSize:scale:", *(double *)(a1 + 56), *(double *)(a1 + 64), v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

uint64_t __77__MUPlaceReviewAvatarGenerator_monogramForReviewerName_pointSize_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)avatarForReview:(id)a3 pointSize:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[3];
  id location;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "_reviewerImageURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CC1750], "sharedImageManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__MUPlaceReviewAvatarGenerator_avatarForReview_pointSize_completion___block_invoke;
    v14[3] = &unk_1E2E03E18;
    objc_copyWeak(v17, &location);
    v15 = v9;
    v17[1] = *(id *)&width;
    v17[2] = *(id *)&height;
    v16 = v10;
    objc_msgSend(v12, "loadAppImageAtURL:completionHandler:", v11, v14);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v9, "_reviewerName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceReviewAvatarGenerator monogramForReviewerName:pointSize:completion:](self, "monogramForReviewerName:pointSize:completion:", v13, v10, width, height);

  }
}

void __69__MUPlaceReviewAvatarGenerator_avatarForReview_pointSize_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v9 || a5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_reviewerName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "monogramForReviewerName:pointSize:completion:", v8, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

- (CNAvatarImageRenderer)monogrammer
{
  return self->_monogrammer;
}

- (void)setMonogrammer:(id)a3
{
  objc_storeStrong((id *)&self->_monogrammer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogrammer, 0);
  objc_storeStrong((id *)&self->_cachedMaskedImages, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
