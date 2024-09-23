@implementation EMContentRepresentation(EDMessagePersistence)

- (id)requestRepresentationForItemWithObjectID:()EDMessagePersistence options:delegate:completionHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(a1, "contentMessage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v10, "isEqual:", v15);

  v17 = MEMORY[0x1E0C809B0];
  if (v16)
  {
    objc_msgSend(a1, "contentMessage");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
      goto LABEL_4;
  }
  objc_msgSend(a1, "relatedContentItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __125__EMContentRepresentation_EDMessagePersistence__requestRepresentationForItemWithObjectID_options_delegate_completionHandler___block_invoke;
  v26[3] = &unk_1E949C3A0;
  v20 = v10;
  v27 = v20;
  objc_msgSend(v19, "ef_firstObjectPassingTest:", v26);
  v18 = objc_claimAutoreleasedReturnValue();

  if (v18)
  {
LABEL_4:
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __125__EMContentRepresentation_EDMessagePersistence__requestRepresentationForItemWithObjectID_options_delegate_completionHandler___block_invoke_1;
    v24[3] = &unk_1E949C3C8;
    v25 = v13;
    -[NSObject requestRepresentationWithOptions:delegate:completionHandler:](v18, "requestRepresentationWithOptions:delegate:completionHandler:", v11, v12, v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v22);

    EMLogCategoryMessageLoading();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[EMContentRepresentation(EDMessagePersistence) requestRepresentationForItemWithObjectID:options:delegate:completionHandler:].cold.1((uint64_t)v20, v18);
    v21 = 0;
  }

  return v21;
}

- (id)requestUpdatedRepresentationWithCompletion:()EDMessagePersistence
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "requestMoreContentBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)requestRepresentationForItemWithObjectID:()EDMessagePersistence options:delegate:completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2F2C000, a2, OS_LOG_TYPE_ERROR, "Failed to find contentItem for objectID: %@", (uint8_t *)&v2, 0xCu);
}

@end
