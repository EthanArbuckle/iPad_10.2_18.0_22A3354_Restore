@implementation HTMLStringForAnnotatedSnapshotImageWithMapItems

void __HTMLStringForAnnotatedSnapshotImageWithMapItems_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  UIImage *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v8, "image");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
