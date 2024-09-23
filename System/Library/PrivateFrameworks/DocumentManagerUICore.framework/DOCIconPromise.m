@implementation DOCIconPromise

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

- (DOCIconPromise)initWithRequest:(id)a3
{
  id v6;
  DOCIconPromise *v7;
  DOCIconPromise *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnail.m"), 423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  v11.receiver = self;
  v11.super_class = (Class)DOCIconPromise;
  v7 = -[DOCIconPromise init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_request, a3);

  return v8;
}

- (BOOL)isRepresentativeIcon
{
  return 0;
}

void __27__DOCIconPromise_thumbnail__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a2;
  if (a3)
    __27__DOCIconPromise_thumbnail__block_invoke_cold_1();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (UIImage)thumbnail
{
  DOCIconPromise *v2;
  UIImage *icon;
  DOCThumbnailRequest *request;
  UIImage *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v2 = self;
  objc_sync_enter(v2);
  icon = v2->_icon;
  if (!icon)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy_;
    v12 = __Block_byref_object_dispose_;
    v13 = 0;
    request = v2->_request;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __27__DOCIconPromise_thumbnail__block_invoke;
    v7[3] = &unk_24D72AC18;
    v7[4] = &v14;
    v7[5] = &v8;
    -[DOCThumbnailRequest generateThumbnailWithCompletionHandler:](request, "generateThumbnailWithCompletionHandler:", v7);
    if (!*((_BYTE *)v15 + 24))
      __assert_rtn("-[DOCIconPromise thumbnail]", "DOCThumbnail.m", 445, "blockWasCalled");
    objc_storeStrong((id *)&v2->_icon, (id)v9[5]);
    _Block_object_dispose(&v8, 8);

    _Block_object_dispose(&v14, 8);
    icon = v2->_icon;
  }
  v5 = icon;
  objc_sync_exit(v2);

  return v5;
}

- (BOOL)hasFinishedTryingToFetchCorrectThumbnail
{
  return 1;
}

- (BOOL)registerGenerationCompletionHandler:(id)a3
{
  return 0;
}

- (BOOL)isLoading
{
  return 0;
}

- (id)averageColorInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[DOCIconPromise isRepresentativeIcon](self, "isRepresentativeIcon"))
  {
    -[DOCIconPromise thumbnail](self, "thumbnail");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doc_averageColorInRect:", x, y, width, height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

void __27__DOCIconPromise_thumbnail__block_invoke_cold_1()
{
  __assert_rtn("-[DOCIconPromise thumbnail]_block_invoke", "DOCThumbnail.m", 440, "error == nil");
}

@end
