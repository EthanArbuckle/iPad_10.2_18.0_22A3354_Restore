@implementation INDataImage

void __98___INDataImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = a2;
  objc_msgSend(v7, "imageData");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, id, double, double))(v6 + 16))(v6, v9, 0, v8, a3, a4);

}

@end
