@implementation SWCollaborationMetadata

void __62__SWCollaborationMetadata_NSItemProvider__processSigningQueue__block_invoke()
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

void __103__SWCollaborationMetadata_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setSourceProcessData:", a2);
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("com.apple.SharedWithYou.SWCollaborationMetadata")))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(a1 + 32), 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    v7 = v3;
    v5 = (void *)objc_msgSend(v3, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, 0);

  }
  else if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x1E0CD74A8]))
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD7428]), "initWithMetadata:", *(_QWORD *)(a1 + 32));
    v6 = (id)objc_msgSend(v8, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

@end
