@implementation SWPendingCollaboration

void __62___SWPendingCollaboration_NSItemProvider__processSigningQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.SharedWithYouCore.SWPendingCollaborationProcessSigning", v2);
  v1 = (void *)processSigningQueue_internalQueue;
  processSigningQueue_internalQueue = (uint64_t)v0;

}

void __103___SWPendingCollaboration_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "collaborationMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSourceProcessData:", v4);

  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("com.apple.SharedWithYou.SWPendingCollaboration")))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(a1 + 32), 1, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = (void *)objc_msgSend(v8, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

@end
